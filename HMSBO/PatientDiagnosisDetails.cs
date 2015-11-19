using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HMSBO
{
    public class PatientDiagnosisDetails
    {
        public int PatientId { get; set; }
        public int DiagnosisId { get; set; }
        public string Symptoms { get; set; }
        public string DiagnosisProvided { get; set; }
        public string AdministeredBy { get; set; }
        public DateTime DateOfDiagnosis { get; set; }
        public string FollowUpRequired { get; set; }
        public DateTime FollowUpDate { get; set; }
        public int BillId { get; set; }   
    }
}
