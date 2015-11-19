using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HMSBO;
using HMSBLL;
using System.Data;
using System.Data.SqlClient;

namespace HMSPL
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        PhysicianSearchBLL physicianSearch = new PhysicianSearchBLL();
        PhysicianDetails phyDetailsObject = new PhysicianDetails();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchPhysicianButton_Click(object sender, EventArgs e)
        {
            if (searchPhysicianStateDropDownList.SelectedIndex == 0 || searchPhysicianPlanDropDownList.SelectedIndex == 0 ||
                searchPhysicianDepartmentDropDownList.SelectedIndex == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Select some value')", true);
            }
            DataSet result1;
            result1 = physicianSearch.GetPhysicianDetailsBy(searchPhysicianStateDropDownList.SelectedItem.Value,
                searchPhysicianPlanDropDownList.SelectedItem.Value,
                searchPhysicianDepartmentDropDownList.SelectedItem.Value);
            PhysicianGrid.DataSource = result1;
            PhysicianGrid.DataBind();
            PhysicianIdDropDownList.DataSource = result1.Tables[0];
            PhysicianIdDropDownList.DataTextField = "PhysicianId";
            PhysicianIdDropDownList.DataValueField = "PhysicianId";
            PhysicianIdDropDownList.DataBind();
        }

        protected void resetPhysicianButton_Click(object sender, EventArgs e)
        {
            searchPhysicianStateDropDownList.SelectedIndex = 0;
            searchPhysicianPlanDropDownList.SelectedIndex = 0;
            searchPhysicianDepartmentDropDownList.SelectedIndex = 0;
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            phyIdLabel.Visible = true;
            PhysicianIdDropDownList.Visible = true;
            updateButton.Visible = true;
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            phyStateLabel.Visible = true;
            phyStateDropDownList.Visible = true;
            phyPlanLabel.Visible = true;
            phyPlanDropDownList.Visible = true;
            phyDepartmentLabel.Visible = true;
            phyDepartmentDropDownList.Visible = true;
            educationalQualificationLabel.Visible = true;
            educationalQualificationTextBox.Visible = true;
            yearsOfExperienceLabel.Visible = true;
            yearsOfExperienceTextBox.Visible = true;
            savePhysicianUpdateButton.Visible = true;
        }

        protected void savePhysicianUpdateButton_Click1(object sender, EventArgs e)
        {
            int result;
            if (phyDepartmentDropDownList.SelectedIndex == 0 || phyPlanDropDownList.SelectedIndex == 0 || phyStateDropDownList.SelectedIndex == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Select some value')", true);
            }

            phyDetailsObject.PhysicianId = PhysicianIdDropDownList.SelectedItem.Value;
            //phyDetailsObject.PhysicianFirstName = PhysicianFirstNameDropDownList.SelectedItem.Value;
            //phyDetailsObject.PhysicianLastName = PhysicianLastNameDropDownList.SelectedItem.Value;
            phyDetailsObject.DepartmentId = phyDepartmentDropDownList.SelectedItem.Value;
            phyDetailsObject.PhysicianStateId = phyStateDropDownList.SelectedItem.Value;
            phyDetailsObject.YearsOfExperience = int.Parse(yearsOfExperienceTextBox.Text);
            phyDetailsObject.EducationalQualification = educationalQualificationTextBox.Text;
            phyDetailsObject.InsurancePlan = phyPlanDropDownList.SelectedItem.Value;

            result = physicianSearch.UpdatePhysicianInfo(phyDetailsObject);

            if (result > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Physician details updated successfully')", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Updation Failed')", true);
            }
        }
    }
}