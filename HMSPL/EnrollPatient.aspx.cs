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
using System.Globalization;


namespace HMSPL
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        PatientDetailsBLL patientDetailsBLLObject = new PatientDetailsBLL();
        
        PatientDetails1 patientDetailsObject = new PatientDetails1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submittButton_Click(object sender, EventArgs e)
        {
            DateTime intermediateDOb;

            patientDetailsObject.PatientId = patientDetailsBLLObject.GeneratePatientId();

            patientDetailsObject.PatientFirstName = patientFirstNameTextBox.Text;

            patientDetailsObject.PatientLastName = patientLastNameTextBox.Text;

            //intermediateDOb=DateTime.ParseExact(dateOfBirthTextBox.Text, "dd/MM/yyyy", null);

            //patientDetailsObject.DateOfBirth = intermediateDOb;

            DateTime dateNow = DateTime.Now;
            DateTime dateOfBirth;
            string date = dateOfBirthTextBox.Text;
            if (DateTime.TryParseExact(date, "dd/MM/yyyy", null, DateTimeStyles.None, out dateOfBirth))
            {
                if (dateNow.Subtract(dateOfBirth).TotalDays >= 0)
                {
                    intermediateDOb = DateTime.ParseExact(dateOfBirthTextBox.Text, "dd/MM/yyyy", null);

                    patientDetailsObject.DateOfBirth = intermediateDOb;
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Enter valid date of birth date')", true);
            }

            patientDetailsObject.EmailId = emailIdTextBox.Text;

            patientDetailsObject.PhoneNumber = phoneNumberTextBox.Text;

            patientDetailsObject.StateId = Convert.ToString(stateIdDropDownList.SelectedItem.Value);

            patientDetailsObject.InsurancePlan = Convert.ToString(planIdDropDownList.SelectedItem.Value);

            if (patientDetailsBLLObject.CheckNameOfPatientExists(patientDetailsObject) == 0)
            {

                int queryStatus = patientDetailsBLLObject.InsertPatientDetails(patientDetailsObject);


                if (queryStatus > 0)
                {
                    Response.Write("Sucessful");
                    ClientScript.RegisterStartupScript(this.GetType(), "Information", "alert('Patient Enrolled Successfully . Patient Id is : " + patientDetailsObject.PatientId + "')", true);
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "Information", "alert('Failed')", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Information", "alert('Patient already Enrolled')", true);
            }
        }

        protected void resetButton_Click(object sender, EventArgs e)
        {
            patientFirstNameTextBox.Text = string.Empty;

            patientLastNameTextBox.Text = string.Empty;

            dateOfBirthTextBox.Text = string.Empty;

            emailIdTextBox.Text = string.Empty;

            phoneNumberTextBox.Text = string.Empty;

            patientFirstNameRegularExpressionValidator.Enabled = false;

            patientFirstNameRequiredFieldValidator.Enabled = false;

            patientLastNameRegularExpressionValidator.Enabled = false;

            patientLastNameRequiredFieldValidator.Enabled = false;

            dateOfBirthRequiredFeildValidator.Enabled = false;

            emailIdRegularExpressionValidator.Enabled = false;

            emailIdRequiredFieldValidator.Enabled = false;

            phoneNumberRegularExpressionValidator.Enabled = false;

            phoneNumberRequiredFieldValidator.Enabled = false;
        }
    }
}