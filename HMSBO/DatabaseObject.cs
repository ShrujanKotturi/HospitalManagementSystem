using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace HMSBO
{
    public class DatabaseObject
    {
        public SqlConnection DatabaseConnection { get; set; }
        public SqlCommand CommandToExecute { get; set; }
        public SqlDataReader DBDataReader { get; set; }
        public DataTable DBDataTable { get; set; }
        public SqlDataAdapter DatabaseDataAdapter { get; set; }
        public DataSet ResultSet { get; set; }

        public DatabaseObject()
        {
            DatabaseConnection=new SqlConnection(@"Data Source=PC182483;Initial Catalog = HMSDB; Integrated Security=True;");
            CommandToExecute = new SqlCommand();   
        }

    }
}
