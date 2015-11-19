using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using HMSBO;

namespace HMSDAL
{
    public class BillingDetailsDAL
    {
        SqlParameter param1 = new SqlParameter();
        DatabaseObject databaseObject = new DatabaseObject();

        public int InsertBillingDetails(BillingDetails billingDetailsObject)
        {
            int queryStatus = 0;

            databaseObject.CommandToExecute = new SqlCommand();
            

            databaseObject.CommandToExecute.CommandText = @"uspInsertBillingDetails";
            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;
            databaseObject.DBDataTable = new DataTable();
            databaseObject.DBDataTable.Columns.Add("BillId", typeof(int));
            databaseObject.DBDataTable.Columns.Add("BillAmount", typeof(int));
            databaseObject.DBDataTable.Columns.Add("CardNumber", typeof(string));
            databaseObject.DBDataTable.Columns.Add("ModeOfPayment", typeof(string));

            databaseObject.DBDataTable.Rows.Add(billingDetailsObject.BillId,billingDetailsObject.BillAmount,
                                                billingDetailsObject.CardNumber,billingDetailsObject.ModeOfPayment);
            param1 = new SqlParameter();
            param1.ParameterName = "@userBillingData";
            param1.Value = databaseObject.DBDataTable;

            param1.SqlDbType = SqlDbType.Structured;

            try
            {
                databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;

                databaseObject.DatabaseConnection.Open();

                databaseObject.CommandToExecute.Parameters.Add(param1);

                queryStatus = databaseObject.CommandToExecute.ExecuteNonQuery();

            }
            catch (SqlException sqlEx)
            {
                return sqlEx.ErrorCode;
            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }
            return queryStatus;
        }

        public int GetBillId()
        {
            int lastBillId = 0;

            databaseObject.CommandToExecute = new SqlCommand();
            

            databaseObject.CommandToExecute.CommandText = @"uspGetLastBillId";
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
                        lastBillId = Convert.ToInt16(databaseObject.DBDataReader[0].ToString());
                    }
                }
                else
                    lastBillId = 0;

            }
            catch (SqlException sqlEx)
            {
                return sqlEx.ErrorCode;
            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }

            return lastBillId;
        }

        public int generateBillId()
        {
            int patientBillId = 0;

            databaseObject.CommandToExecute = new SqlCommand();


            databaseObject.CommandToExecute.CommandText = @"uspGetPatientBillId";
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
                        patientBillId = Convert.ToInt16(databaseObject.DBDataReader[0].ToString());
                    }
                }
                else
                    patientBillId = 0;

            }
            catch (SqlException sqlEx)
            {
                return sqlEx.ErrorCode;
            }
            finally
            {
                databaseObject.DatabaseConnection.Close();
            }

            return patientBillId;
        }

        public decimal GetPreAprrovedAmount(int patientId)
        {
            decimal insuredAmount = 0;

            SqlParameter param1 = new SqlParameter();

            databaseObject.CommandToExecute = new SqlCommand();

            databaseObject.CommandToExecute.CommandText = @"uspGetPreApprovedAmount";
            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;

            param1.ParameterName = "@PatientId";

            param1.Value = patientId;



            try
            {

                databaseObject.CommandToExecute.Connection = databaseObject.DatabaseConnection;
                databaseObject.CommandToExecute.Parameters.Add(param1);
                databaseObject.DatabaseConnection.Open();
                databaseObject.DBDataReader = databaseObject.CommandToExecute.ExecuteReader();
                if (databaseObject.DBDataReader.HasRows)
                {
                    while (databaseObject.DBDataReader.Read())
                    {
                        insuredAmount = Convert.ToInt16(databaseObject.DBDataReader[0].ToString());
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

            return insuredAmount;
        }
    }
}
