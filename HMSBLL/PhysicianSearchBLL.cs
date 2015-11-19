using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HMSBO;
using HMSDAL;
using System.Data;
using System.Data.SqlClient;


namespace HMSBLL
{
    public class PhysicianSearchBLL
    {
        PhysicianDetails physicianSearch = new PhysicianDetails();
        PhysicianSearchDAL dBAccess = new PhysicianSearchDAL();
        public DataSet GetPhysicianDetailsBy(string StateId, string PlanName, string DepartmentId)
        {
            return dBAccess.GetPhysicianDetailsBy(StateId,PlanName,DepartmentId);
        }
        public int UpdatePhysicianInfo(PhysicianDetails phyDeatailsObject)
        {
            return dBAccess.UpdatePhysicianInfo(phyDeatailsObject);
        }
    }
}
