using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using HMSBO;
namespace HMSDAL
{
    public class PhysicianDetailsDAL
    {
        DatabaseObject databaseObject = new DatabaseObject();

        SqlParameter param1;

        public int InsertPhysicianDetails(PhysicianDetails physicianDetailsObject)
        {
            int queryStatus = 0;

            databaseObject.CommandToExecute = new SqlCommand();

            databaseObject.CommandToExecute.CommandText = @"uspInsertPhysicianDetails";

            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            databaseObject.DBDataTable = new DataTable();
            databaseObject.DBDataTable.Columns.Add("PhysicianId", typeof(string));
            databaseObject.DBDataTable.Columns.Add("PhysicianFirstName", typeof(string));
            databaseObject.DBDataTable.Columns.Add("PhysicianLastName", typeof(string));
            databaseObject.DBDataTable.Columns.Add("DepartmentId", typeof(string));
            databaseObject.DBDataTable.Columns.Add("EducationalQualification", typeof(string));
            databaseObject.DBDataTable.Columns.Add("YearsOfExperience", typeof(int));
            databaseObject.DBDataTable.Columns.Add("PhysicianStateId", typeof(string));
            databaseObject.DBDataTable.Columns.Add("InsurancePlan", typeof(string));

            databaseObject.DBDataTable.Rows.Add(physicianDetailsObject.PhysicianId, physicianDetailsObject.PhysicianFirstName,
                                              physicianDetailsObject.PhysicianLastName, physicianDetailsObject.DepartmentId,
                                                physicianDetailsObject.EducationalQualification, physicianDetailsObject.YearsOfExperience,
                                                physicianDetailsObject.PhysicianStateId, physicianDetailsObject.InsurancePlan);
            param1 = new SqlParameter();

            param1.ParameterName = "@userPhysicianData";

            param1.Value = databaseObject.DBDataTable;

            param1.SqlDbType = SqlDbType.Structured;

            //SqlParameter param2 = new SqlParameter();
            //param2.ParameterName = "@physicianFirstName";
            //param2.Value = physicianDetailsObject.PhysicianFirstName;
            //SqlParameter param3 = new SqlParameter();
            //param3.ParameterName = "@physicianLastName";
            //param3.Value = physicianDetailsObject.PhysicianLastName;

            try
            {
                databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;

                databaseObject.DatabaseConnection.Open();

                databaseObject.CommandToExecute.Parameters.Add(param1);

                //databaseObject.CommandToExecute.Parameters.Add(param2);

                //databaseObject.CommandToExecute.Parameters.Add(param3);

                queryStatus = databaseObject.CommandToExecute.ExecuteNonQuery();

                return queryStatus;

            }
            catch (SqlException ex)
            {
                return queryStatus;
            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }
           
        }
        public string CheckNameOfPhysicianExists(PhysicianDetails physicianDetailsObject)
        {
            string result = null;

            databaseObject.CommandToExecute.CommandText = @"uspCheckAvailabilityOfPhysicianName";

            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = new SqlParameter();
            param1.ParameterName = "@physicianFirstName";
            param1.Value = physicianDetailsObject.PhysicianFirstName;
            SqlParameter param2 = new SqlParameter();
            param2.ParameterName = "@physicianLastName";
            param2.Value = physicianDetailsObject.PhysicianLastName;

            try
            {
                databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;

                databaseObject.DatabaseConnection.Open();

                databaseObject.CommandToExecute.Parameters.Add(param1);
                databaseObject.CommandToExecute.Parameters.Add(param2);

                databaseObject.DBDataReader = databaseObject.CommandToExecute.ExecuteReader();
                if (databaseObject.DBDataReader.HasRows == true)
                {
                    while (databaseObject.DBDataReader.Read())
                    {
                        result = databaseObject.DBDataReader[0].ToString();
                    }

                }


            }
            catch (SqlException ex)
            {

            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }

            return result;
        }
        public string GeneratePhysicianId()
        {
            string phyid = "PR000";

            databaseObject.CommandToExecute.CommandText = @"uspGetLastPhysicianId";

            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            try
            {
                databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;

                databaseObject.DatabaseConnection.Open();

                databaseObject.DBDataReader = databaseObject.CommandToExecute.ExecuteReader();

                if (databaseObject.DBDataReader.HasRows)
                {
                    while (databaseObject.DBDataReader.Read())
                    {
                        string s1 = databaseObject.DBDataReader[0].ToString();
                        StringBuilder sb = new StringBuilder();
                        sb.Append(s1.Substring(0,2)).Append(int.Parse(s1.Substring(2))+1);
                        phyid = sb.ToString();
                    }

                }
                else
                {
                    phyid = "PR000";
                }

            }
            catch (SqlException ex)
            {

            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }

            return phyid;
        }


    }
}
