using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using HMSBO;

namespace HMSDAL
{
    public class PatientDetailsDAL
    {
         DatabaseObject databaseObject = new DatabaseObject();

         SqlParameter param1;

        public int InsertPatientDetails(PatientDetails1 patientDetailsObject)
        {
            int queryStatus = 0;

             databaseObject.CommandToExecute = new SqlCommand();

             databaseObject.CommandToExecute.CommandText = @"uspInsertPatientInfo";

             databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

             databaseObject.DBDataTable = new DataTable();

                    databaseObject.DBDataTable.Columns.Add("PatientId", typeof(int));
                    databaseObject.DBDataTable.Columns.Add("PatientFirstName", typeof(string));
                    databaseObject.DBDataTable.Columns.Add("PatientLastName", typeof(string));
                    databaseObject.DBDataTable.Columns.Add("PatientDateOfBirth", typeof(DateTime));
                    databaseObject.DBDataTable.Columns.Add("PatientEmailId", typeof(string));
                    databaseObject.DBDataTable.Columns.Add("PatientPhoneNumber", typeof(string));
                    databaseObject.DBDataTable.Columns.Add("PatientStateId", typeof(string));
                    databaseObject.DBDataTable.Columns.Add("PatientInsurancePlanId", typeof(string));

                    databaseObject.DBDataTable.Rows.Add(patientDetailsObject.PatientId,patientDetailsObject.PatientFirstName,
                                                        patientDetailsObject.PatientLastName,patientDetailsObject.DateOfBirth,
                                                        patientDetailsObject.EmailId,patientDetailsObject.PhoneNumber,
                                                        patientDetailsObject.StateId,patientDetailsObject.InsurancePlan);
                    param1 = new SqlParameter();

                    param1.ParameterName = "@PatientInput";

                    param1.Value = databaseObject.DBDataTable;

                    param1.SqlDbType = SqlDbType.Structured;


                    try
                    {
                        databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;

                        databaseObject.DatabaseConnection.Open();

                        databaseObject.CommandToExecute.Parameters.Add(param1);

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

        public int CheckNameOfPatientExists(PatientDetails1 patientDetailsObject)
        {
            int result = 0;

            databaseObject.CommandToExecute.CommandText = @"uspCheckAvailabilityOfPatientName";

            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = new SqlParameter();
            param1.ParameterName = "@patientFirstName";
            param1.Value = patientDetailsObject.PatientFirstName;
            SqlParameter param2 = new SqlParameter();
            param2.ParameterName = "@patientLastName";
            param2.Value = patientDetailsObject.PatientLastName;
      
            try
            {
                databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;

                databaseObject.DatabaseConnection.Open();

                databaseObject.CommandToExecute.Parameters.Add(param1);
                databaseObject.CommandToExecute.Parameters.Add(param2);

                databaseObject.DBDataReader =databaseObject.CommandToExecute.ExecuteReader();
                if (databaseObject.DBDataReader.HasRows == true)
                {
                    while (databaseObject.DBDataReader.Read())
                    {
                        result = Convert.ToInt32(databaseObject.DBDataReader[0].ToString());
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

        public int GeneratePatientId()
        {
            int result = 999;

            databaseObject.DatabaseDataAdapter = new SqlDataAdapter();

            //dataBaseObject.queryToExecute = new SqlCommand(@"uspGetLastPhysicianID", dataBaseObject.dbConnection);
            //dataBaseObject.queryToExecute.CommandType = CommandType.StoredProcedure;
            databaseObject.DBDataTable = new DataTable();
            //SqlParameter Param1 = new SqlParameter();

            databaseObject.CommandToExecute.CommandText = @"uspGetLastPatientId";

            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;
            try{

                databaseObject.DatabaseDataAdapter.SelectCommand = databaseObject.CommandToExecute;
                databaseObject.DatabaseDataAdapter.Fill(databaseObject.DBDataTable);
                //databaseObject.DatabaseConnection.Open();

                //databaseObject.DBDataReader = databaseObject.CommandToExecute.ExecuteReader();

                //if (databaseObject.DBDataReader.HasRows)
                //{
                //    while (databaseObject.DBDataReader.Read())
                //    {
                //        result = Convert.ToInt32(databaseObject.DBDataReader[0].ToString());
                //    }

                //}
                //else 
                //{
                //    result = 999;


                if (databaseObject.DBDataTable.Rows.Count == 0)
                {
                    result = 999;
                }
                else
                    //result = ResultSet.Rows[0][0].ToString();
                    result = Convert.ToInt32(databaseObject.DBDataTable.Rows[0][0].ToString());


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

        public int InsertPatientInfo(PatientDetails1 patient1)
        {
            databaseObject.CommandToExecute = new SqlCommand();

            databaseObject.CommandToExecute.CommandText = "uspInsertPatientInfo";

            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            databaseObject.DBDataTable = new DataTable();

            databaseObject.DBDataTable.Columns.Add("PatientId", typeof(string));
            databaseObject.DBDataTable.Columns.Add("PatientFirstName", typeof(string));
            databaseObject.DBDataTable.Columns.Add("PatientLastName", typeof(string));
            databaseObject.DBDataTable.Columns.Add("DateOfBirth", typeof(DateTime));
            databaseObject.DBDataTable.Columns.Add("EmailId", typeof(string));
            databaseObject.DBDataTable.Columns.Add("PhoneNumber", typeof(string));
            databaseObject.DBDataTable.Columns.Add("PatientStateId", typeof(string));
            databaseObject.DBDataTable.Columns.Add("InsurancePlan", typeof(string));

            databaseObject.DBDataTable.Rows.Add(patient1.PatientId, patient1.PatientFirstName, 
                                                patient1.PatientLastName, patient1.DateOfBirth, patient1.EmailId, 
                                                patient1.PhoneNumber, patient1.StateId, patient1.InsurancePlan);

            param1 = new SqlParameter();

            param1.ParameterName = "@PatientInput";

            param1.Value = databaseObject.DBDataTable;

            param1.SqlDbType = SqlDbType.Structured;

            databaseObject.CommandToExecute.Parameters.Add(param1);

            try
            {
                databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;

                databaseObject.DatabaseConnection.Open();

                return databaseObject.CommandToExecute.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                return ex.ErrorCode;
            }

            finally
            {
                databaseObject.DatabaseConnection.Close();
            }
        }

        public int UpdatePatientDetails(PatientDetails1 patientDetailsObject)
        {


            int result = 0;

            databaseObject.CommandToExecute.CommandText = @"uspUpdatePatientDetails";

            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = new SqlParameter();
            param1.ParameterName = "@patientFirstName";
            param1.Value = patientDetailsObject.PatientFirstName;

            SqlParameter param2 = new SqlParameter();
            param2.ParameterName = "@patientLastName";
            param2.Value = patientDetailsObject.PatientLastName;

            SqlParameter param3 = new SqlParameter();
            param3.ParameterName = "@dateOfBirth";
            param3.Value = patientDetailsObject.DateOfBirth;

            SqlParameter param4 = new SqlParameter();
            param4.ParameterName = "@emailId";
            param4.Value = patientDetailsObject.EmailId;

            SqlParameter param5 = new SqlParameter();
            param5.ParameterName = "@phoneNumber";
            param5.Value = patientDetailsObject.PhoneNumber;

            SqlParameter param6 = new SqlParameter();
            param6.ParameterName = "@patientStateId";
            param6.Value = patientDetailsObject.StateId;


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

                result = databaseObject.CommandToExecute.ExecuteNonQuery();

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

        public DataTable ViewPatientDetails(PatientDetails1 patientDetailsObject)
        {
            databaseObject.DatabaseDataAdapter = new SqlDataAdapter();

            databaseObject.DBDataTable = new DataTable();

            databaseObject.CommandToExecute = new SqlCommand();
            databaseObject.CommandToExecute.CommandText = @"uspGetPatientDetails";

            SqlParameter param1 = new SqlParameter();
            param1.ParameterName = "@patientFirstName";
            param1.Value = patientDetailsObject.PatientFirstName;
            SqlParameter param2 = new SqlParameter();
            param2.ParameterName = "@patientLastName";
            param2.Value = patientDetailsObject.PatientLastName;

            databaseObject.CommandToExecute.Parameters.Add(param1);
            databaseObject.CommandToExecute.Parameters.Add(param2);

            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;
            try
            {

                databaseObject.DatabaseDataAdapter.SelectCommand = databaseObject.CommandToExecute;
                databaseObject.DatabaseDataAdapter.Fill(databaseObject.DBDataTable);
            }
            catch (SqlException ex)
            {
                return databaseObject.DBDataTable;
            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }

            return databaseObject.DBDataTable;
        }
    }
}
