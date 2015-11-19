using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using HMSBO;

namespace HMSDAL
{
    public class ViewPatientHistoryByPatientName
    {
        PatientDetails patientInfo = new PatientDetails();
        DatabaseObject databaseObject = new DatabaseObject();
        SqlDataAdapter DataAdapter;
        DataSet resultSet = null;
        DataTable gridViewResult = null;

        public DataSet ViewPatientHistoryByName(string PatientFirstName, string PatientLastName)
        {
            databaseObject.CommandToExecute = new SqlCommand(@"uspViewPatientHistoryByPatientName", databaseObject.DatabaseConnection);
            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;
            try
            {
                DataAdapter = new SqlDataAdapter();
                resultSet = new DataSet();
                SqlParameter param2 = new SqlParameter();
                param2.ParameterName = "@PatientFirstName";
                param2.Value = PatientFirstName;
                SqlParameter param3 = new SqlParameter();
                param3.ParameterName = "@PatientLastName";
                param3.Value = PatientLastName;
                databaseObject.CommandToExecute.Parameters.Add(param2);
                databaseObject.CommandToExecute.Parameters.Add(param3);
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
