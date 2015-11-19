using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HMSBO
{
    public class PatientDetails1
    {
        public int PatientId { get; set; }
        public string PatientFirstName { get; set; }
        public string PatientLastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string EmailId { get; set; }
        public string PhoneNumber { get; set; }
        public string StateId { get; set; }
        public string InsurancePlan { get; set; }
    }
}
