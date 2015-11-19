using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using HMSBO;
using HMSDAL;

namespace HMSBLL
{
    public class ViewPatientHistoryBLL
    {
        PatientDetails1 viewPatientHistoryBLL = new PatientDetails1();
        ViewPatientHistory dBAccess = new ViewPatientHistory();
        ViewPatientHistoryByPatientName dBAccessByName = new ViewPatientHistoryByPatientName();
        ViewPatientHistoryByPhoneNumber dBAccessByPhoneNumber = new ViewPatientHistoryByPhoneNumber();
        public DataSet ViewPatientHistoryBy(int PatientId)
        {
            return dBAccess.ViewPatientHistoryBy(PatientId);
        }

        public DataSet ViewPatientHistoryByName(string PatientFirstName, string PatientLastName)
        {
            return dBAccessByName.ViewPatientHistoryByName(PatientFirstName, PatientLastName);
        }
        public DataSet ViewPatientHistoryByPhoneNumber(string PatientPhoneNumber)
        {
            return dBAccessByPhoneNumber.ViewPatientHistoryBy(PatientPhoneNumber);
        }
        public DataSet ViewPatientHistoryByPhoneNumberSortByFirstName(string PatientPhoneNumber)
        {
            return dBAccessByPhoneNumber.ViewPatientHistoryByPhoneNumberSortByFirstName(PatientPhoneNumber);
        }
        public DataSet ViewPatientHistoryByPhoneNumberSortByLastName(string PatientPhoneNumber)
        {
            return dBAccessByPhoneNumber.ViewPatientHistoryByPhoneNumberSortByLastName(PatientPhoneNumber);
        }
    }
}