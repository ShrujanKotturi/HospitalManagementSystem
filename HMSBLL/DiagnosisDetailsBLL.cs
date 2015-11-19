using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HMSDAL;
using HMSBO;


namespace HMSBLL
{
    public class DiagnosisDetailsBLL
    {
        DiagnosisDetailsDAL diagnosisDetailsDALObject = new DiagnosisDetailsDAL();

        public int InsertDiagnosisDetails(PatientDiagnosisDetails patientDiagnosisObject)
        {
            return (diagnosisDetailsDALObject.InsertDiagnosisDetails(patientDiagnosisObject));
        }

        public int GetDiagnosisId()
        {
            int newDiagnosisId;
            newDiagnosisId = diagnosisDetailsDALObject.GetDiagnosisId();
            newDiagnosisId = newDiagnosisId + 1;
            return newDiagnosisId;
        }

        public string PhysicianDetails()
        {
            return diagnosisDetailsDALObject.PhysicianDetails();
        }


    }
}
