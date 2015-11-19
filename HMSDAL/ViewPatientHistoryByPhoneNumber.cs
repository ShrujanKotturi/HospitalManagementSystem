using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using HMSBO;

namespace HMSDAL
{
    public class ViewPatientHistoryByPhoneNumber
    {
        PatientDetails1 patientInfo = new PatientDetails1();
        DatabaseObject databaseObject = new DatabaseObject();
        SqlDataAdapter DataAdapter;
        DataSet resultSet = null;


        public DataSet ViewPatientHistoryBy(string PatientPhoneNumber)
        {
            databaseObject.CommandToExecute = new SqlCommand(@"uspViewPatientHistoryByPatientPhoneNumber", databaseObject.DatabaseConnection);
            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;
            try
            {
                DataAdapter = new SqlDataAdapter();
                resultSet = new DataSet();
                SqlParameter param1 = new SqlParameter();
                param1.ParameterName = "@PatientPhoneNumber";
                param1.Value = PatientPhoneNumber;
                databaseObject.CommandToExecute.Parameters.Add(param1);
                DataAdapter.SelectCommand = databaseObject.CommandToExecute;
                DataAdapter.Fill(resultSet);
                return resultSet;
            }
            catch
            {
                return null;
            }
        }
        public DataSet ViewPatientHistoryByPhoneNumberSortByFirstName(string PatientPhoneNumber)
        {
            databaseObject.CommandToExecute = new SqlCommand(@"uspViewPatientHistoryByPatientPhoneNumberSortedByFirstName", databaseObject.DatabaseConnection);
            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;
            try
            {
                DataAdapter = new SqlDataAdapter();
                resultSet = new DataSet();
                SqlParameter param1 = new SqlParameter();
                param1.ParameterName = "@PatientPhoneNumber";
                param1.Value = PatientPhoneNumber;
                databaseObject.CommandToExecute.Parameters.Add(param1);
                DataAdapter.SelectCommand = databaseObject.CommandToExecute;
                DataAdapter.Fill(resultSet);
                return resultSet;
            }
            catch
            {
                return null;
            }
        }
        public DataSet ViewPatientHistoryByPhoneNumberSortByLastName(string PatientPhoneNumber)
        {
            databaseObject.CommandToExecute = new SqlCommand(@"uspViewPatientHistoryByPatientPhoneNumberSortedByLastName", databaseObject.DatabaseConnection);
            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;
            try
            {
                DataAdapter = new SqlDataAdapter();
                resultSet = new DataSet();
                SqlParameter param1 = new SqlParameter();
                param1.ParameterName = "@PatientPhoneNumber";
                param1.Value = PatientPhoneNumber;
                databaseObject.CommandToExecute.Parameters.Add(param1);
                DataAdapter.SelectCommand = databaseObject.CommandToExecute;
                DataAdapter.Fill(resultSet);
                return resultSet;
            }
            catch
            {
                return null;
            }
        }
    }
}
