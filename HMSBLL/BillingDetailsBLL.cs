using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HMSBO;
using HMSDAL;

namespace HMSBLL
{
    public class BillingDetailsBLL
    {
        BillingDetailsDAL billingDetailsDALObject = new BillingDetailsDAL();

        public int GetBillId()
        {
            int newBillId;
            newBillId = billingDetailsDALObject.GetBillId();
            newBillId = newBillId + 1;
            return newBillId;
        }
        public int generateBillId()
        {
            int newGenerateBillId = 0;
            newGenerateBillId = billingDetailsDALObject.generateBillId();
            return newGenerateBillId;
        }

        public int InsertBillingDetails(BillingDetails billingDetailsObject)
        {
            return (billingDetailsDALObject.InsertBillingDetails(billingDetailsObject));
        }
        public decimal GetPreAprrovedAmount(int patientId)
        {
            return (billingDetailsDALObject.GetPreAprrovedAmount(patientId));
        }
    }
}
