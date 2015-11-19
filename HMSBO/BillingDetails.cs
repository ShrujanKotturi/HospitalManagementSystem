using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HMSBO
{
    public class BillingDetails
    {
        public int BillId { get; set; }
        public decimal BillAmount { get; set; }
        public String CardNumber { get; set; }
        public String ModeOfPayment { get; set; }
    }
}
