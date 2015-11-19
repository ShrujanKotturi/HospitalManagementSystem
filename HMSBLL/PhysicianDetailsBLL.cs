using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HMSDAL;
using HMSBO;

namespace HMSBLL
{
    public class PhysicianDetailsBLL
    {
        PhysicianDetailsDAL PhysicianDetailsDALObject = new PhysicianDetailsDAL();

        public int InsertPhysicianDetails(PhysicianDetails physicianDetailsObject)
        {
            return PhysicianDetailsDALObject.InsertPhysicianDetails(physicianDetailsObject);
        }

        public string CheckNameOfPhysicianExists(PhysicianDetails physicianDetailsObject)
        {
            return PhysicianDetailsDALObject.CheckNameOfPhysicianExists(physicianDetailsObject);
            }

        public string GeneratePhysicianId()
        {
            return (PhysicianDetailsDALObject.GeneratePhysicianId());
        }

    }
}
