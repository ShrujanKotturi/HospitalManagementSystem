using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using HMSBO;

namespace HMSDAL
{
    public class DiagnosisDetailsDAL
    {
        SqlParameter param1 = new SqlParameter();
        DatabaseObject databaseObject = new DatabaseObject();

        public int InsertDiagnosisDetails(PatientDiagnosisDetails patientDiagnosisObject)
        {
            int queryStatus = 0;

            databaseObject.CommandToExecute = new SqlCommand();
         

            databaseObject.CommandToExecute.CommandText = @"uspInsertPatientDiagnosisDetails";
            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            databaseObject.DBDataTable = new DataTable();

            databaseObject.DBDataTable.Columns.Add("PatientId", typeof(int));
            databaseObject.DBDataTable.Columns.Add("DiagnosisId", typeof(int));
            databaseObject.DBDataTable.Columns.Add("Symptoms", typeof(string));
            databaseObject.DBDataTable.Columns.Add("DiagnosisProvided", typeof(string));
            databaseObject.DBDataTable.Columns.Add("Physician", typeof(string));
            databaseObject.DBDataTable.Columns.Add("DateOfDiagnosis", typeof(DateTime));
            databaseObject.DBDataTable.Columns.Add("FollowupRequired", typeof(string));
            databaseObject.DBDataTable.Columns.Add("DateOfFollowup", typeof(DateTime));
            databaseObject.DBDataTable.Columns.Add("BillId", typeof(int));

            databaseObject.DBDataTable.Rows.Add(patientDiagnosisObject.PatientId, patientDiagnosisObject.DiagnosisId, patientDiagnosisObject.Symptoms,
                                                patientDiagnosisObject.DiagnosisProvided, patientDiagnosisObject.AdministeredBy, patientDiagnosisObject.DateOfDiagnosis,
                                                patientDiagnosisObject.FollowUpRequired, patientDiagnosisObject.FollowUpDate, patientDiagnosisObject.BillId);


            param1.ParameterName = "@userDiagnosisData";

            param1.Value = databaseObject.DBDataTable;

            param1.SqlDbType = SqlDbType.Structured;

            try
            {
                databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;

                databaseObject.DatabaseConnection.Open();

                databaseObject.CommandToExecute.Parameters.Add(param1);

                queryStatus = databaseObject.CommandToExecute.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                return ex.ErrorCode;
            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }
            return queryStatus; 
        }

        public int GetDiagnosisId()
        {
            int lastDiagnosisId = 0;

            databaseObject.CommandToExecute = new SqlCommand();
           

            databaseObject.CommandToExecute.CommandText = @"uspGetLastDiagnosisId";
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
                        lastDiagnosisId = (int)databaseObject.DBDataReader[0];
                    }
                }
                    
            }
            catch (SqlException sqlEx)
            {
                return sqlEx.ErrorCode;
            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }

            return lastDiagnosisId;
        }

        public string PhysicianDetails()
        {
            string physicianDetails=string.Empty;

            databaseObject.CommandToExecute = new SqlCommand();
           

            databaseObject.CommandToExecute.CommandText = "@uspGetPhysicianDetails";
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
                        physicianDetails = (string)databaseObject.DBDataReader[0];
                    }
                }

            }
            catch (SqlException sqlEx)
            {
                return sqlEx.ErrorCode.ToString();
            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }
            return physicianDetails;
        }
    }
}
