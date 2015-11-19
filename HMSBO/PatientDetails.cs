using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HMSBO
{
    public class PatientDetails
    {
        public int PatientId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string EmailId { get; set; }
        public int PhoneNumber { get; set; }
        public string PatientStateId { get; set; }
        public string InsurancePlan { get; set; }
    }
}
