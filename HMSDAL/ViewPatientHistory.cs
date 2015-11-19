using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using HMSBO;

namespace HMSDAL
{
    public class ViewPatientHistory
    {
        PatientDetails patientInfo = new PatientDetails();
        DatabaseObject databaseObject = new DatabaseObject();
        SqlDataAdapter DataAdapter;
        DataSet resultSet = null;
        

        public DataSet ViewPatientHistoryBy(int PatientId)
        {
          databaseObject.CommandToExecute = new SqlCommand(@"uspViewPatientHistoryByPatientId", databaseObject.DatabaseConnection);
            databaseObject.CommandToExecute.CommandType = CommandType.StoredProcedure;
            try
            {
                DataAdapter = new SqlDataAdapter();
                resultSet = new DataSet();
                SqlParameter param1 = new SqlParameter();
                param1.ParameterName = "@PatientId";
                param1.Value = PatientId;
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