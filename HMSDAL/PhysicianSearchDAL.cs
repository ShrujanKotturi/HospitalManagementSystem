using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using HMSBO;


namespace HMSDAL
{
    public class PhysicianSearchDAL
    {
        PhysicianDetails addPhysician = new PhysicianDetails();
        DatabaseObject databaseObject = new DatabaseObject();
        

        public DataSet GetPhysicianDetailsBy(string PhysicianStateId, string InsurancePlan, string DepartmentId)
        {
            databaseObject.DBDataTable = new DataTable();
            databaseObject.DatabaseDataAdapter = new SqlDataAdapter();
            databaseObject.ResultSet = new DataSet();

            databaseObject.CommandToExecute = new SqlCommand(@"uspGetPhysicianSearchInfo", databaseObject.DatabaseConnection);
            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            /*SqlParameter param1 = new SqlParameter();
            param1.ParameterName = "@StateId";
            param1.Value = addPhysician.PhysicianStateId;
            SqlParameter param2 = new SqlParameter();
            param2.ParameterName = "@PlanId";
            param2.Value = addPhysician.InsurancePlan;
            SqlParameter param3 = new SqlParameter();
            param3.ParameterName = "@DeptId";
            param3.Value = addPhysician.DepartmentId;

            databaseObject.CommandToExecute.Parameters.Add(param1);
            databaseObject.CommandToExecute.Parameters.Add(param2);
            databaseObject.CommandToExecute.Parameters.Add(param3);

            dataAdapter.SelectCommand = databaseObject.CommandToExecute;
            dataAdapter.Fill(resultSet);*/
            databaseObject.DatabaseDataAdapter = new SqlDataAdapter("uspGetPhysicianSearchInfo", databaseObject.DatabaseConnection);
            databaseObject.DatabaseDataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@DeptId", DepartmentId));
            databaseObject.DatabaseDataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@StateId", PhysicianStateId));
            databaseObject.DatabaseDataAdapter.SelectCommand.Parameters.Add(new SqlParameter("@PlanId", InsurancePlan));

            databaseObject.DatabaseDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            //DatabaseDataTable = new DataTable();

            databaseObject.DatabaseDataAdapter.Fill(databaseObject.ResultSet);

            //DbConnection.DatabaseCommand.Dispose();

            //DbConnection.DatabaseDataTable.Dispose();

            return databaseObject.ResultSet;
        }

        public int UpdatePhysicianInfo(PhysicianDetails phyDeatailsObject)
        {
            databaseObject.CommandToExecute.CommandText = @"uspUpdatePhysicianInfo";

            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = new SqlParameter();
            param1.ParameterName = "@PhysicianId";
            param1.Value = phyDeatailsObject.PhysicianId;
            SqlParameter param2 = new SqlParameter();
            param2.ParameterName = "@DeptId";
            param2.Value = phyDeatailsObject.DepartmentId;
            SqlParameter param3 = new SqlParameter();
            param3.ParameterName = "@StateId";
            param3.Value = phyDeatailsObject.PhysicianStateId;
            SqlParameter param4 = new SqlParameter();
            param4.ParameterName = "@PlanId";
            param4.Value = phyDeatailsObject.InsurancePlan;
            SqlParameter param5 = new SqlParameter();
            param5.ParameterName = "@EducationalQualification";
            param5.Value = phyDeatailsObject.EducationalQualification;
            SqlParameter param6 = new SqlParameter();
            param6.ParameterName = "@YearsOfExperience";
            param6.Value = phyDeatailsObject.YearsOfExperience;

            try
            {
                databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;

                databaseObject.DatabaseConnection.Open();

                databaseObject.CommandToExecute.Parameters.Add(param1);
                databaseObject.CommandToExecute.Parameters.Add(param2);
                databaseObject.CommandToExecute.Parameters.Add(param3);
                databaseObject.CommandToExecute.Parameters.Add(param4);
                databaseObject.CommandToExecute.Parameters.Add(param5);
                databaseObject.CommandToExecute.Parameters.Add(param6);

                return databaseObject.CommandToExecute.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                return 0;
            }
        }
    }
}
