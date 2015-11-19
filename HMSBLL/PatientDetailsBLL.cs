using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HMSDAL;
using HMSBO;
using System.Data;
using System.Data.SqlClient;

namespace HMSBLL
{
    public class PatientDetailsBLL
    {

        PatientDetailsDAL patientDetailsDALObject = new PatientDetailsDAL();

        public int InsertPatientDetails(PatientDetails1 patientDetailsObject)
        {
            return patientDetailsDALObject.InsertPatientDetails(patientDetailsObject);
        }

        public int CheckNameOfPatientExists(PatientDetails1 patientDetailsObject)
        {
            return patientDetailsDALObject.CheckNameOfPatientExists(patientDetailsObject);
        }

        public int GeneratePatientId()
        {
            return (patientDetailsDALObject.GeneratePatientId() + 1);
        }

        public DataTable ViewPatientDetails(PatientDetails1 patientDetailsObject)
        {
            return patientDetailsDALObject.ViewPatientDetails(patientDetailsObject);
        }

        public int UpdatePatientDetails(PatientDetails1 patientDetailsObject)
        {
            return patientDetailsDALObject.UpdatePatientDetails(patientDetailsObject);
        }
    }
}
