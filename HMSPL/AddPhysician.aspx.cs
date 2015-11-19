using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HMSBO;
using HMSBLL;

namespace HMSPL
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        PhysicianDetailsBLL physicianDetailsBLLObject = new PhysicianDetailsBLL();
        PhysicianDetails physicianDetailsObject = new PhysicianDetails();
        protected void Page_Load(object sender, EventArgs e)
        {
            physicianIdTextBox.Text = physicianDetailsBLLObject.GeneratePhysicianId().ToString();
        }

        protected void registerPhysicianButton_Click(object sender, EventArgs e)
        {
            physicianDetailsObject.PhysicianId = physicianIdTextBox.Text;

            physicianDetailsObject.PhysicianFirstName = physicianFirstNameTextBox.Text;

            physicianDetailsObject.PhysicianLastName = physicianLastNameTextBox.Text;

            physicianDetailsObject.DepartmentId = physicianDepartmentId.SelectedValue;

            physicianDetailsObject.EducationalQualification = physicianEducationalQualification.Text; ;

            physicianDetailsObject.YearsOfExperience = Convert.ToInt32(physicianYearsOfExperience.Text);

            physicianDetailsObject.PhysicianStateId = physicianstate.SelectedItem.Value; ;

            physicianDetailsObject.InsurancePlan = physicianPlan.SelectedItem.Value;

            if (physicianDetailsBLLObject.CheckNameOfPhysicianExists(physicianDetailsObject) == null)
            {

                int queryStatus = physicianDetailsBLLObject.InsertPhysicianDetails(physicianDetailsObject);

                if (queryStatus > 0)

                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Inserted Successfully')", true);
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Failed Successfully')", true);
            }
            else
            {
                Response.Write("Physician Already exists");
            }
        }

        protected void resetPhysicianButton_Click(object sender, EventArgs e)
        {
            physicianFirstNameTextBox.Text = string.Empty;

            physicianLastNameTextBox.Text = string.Empty;

            physicianEducationalQualification.Text = string.Empty;

            physicianYearsOfExperience.Text = string.Empty;
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/AddPhysician1.aspx");
        }
    }
}