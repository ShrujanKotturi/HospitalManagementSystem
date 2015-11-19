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
    public partial class EnrollPatientWithEdit : System.Web.UI.Page
    {
        PatientDetailsBLL patientDetailsBLLObject = new PatientDetailsBLL();

        PatientDetails1 patientDetailsObject = new PatientDetails1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void serachPatientDetailsButton_Click(object sender, EventArgs e)
        {
            if (searchPatientFirstNameTextBox.Text != string.Empty && searchPatientLastNameTextBox.Text != string.Empty)
            {
                patientDetailsObject.PatientFirstName = searchPatientFirstNameTextBox.Text;

                patientDetailsObject.PatientLastName = searchPatientLastNameTextBox.Text;

                ViewPatientDetailsPanel.Visible = true;

                DataTable resultSet = patientDetailsBLLObject.ViewPatientDetails(patientDetailsObject);

                patientIdTextBox.Text = resultSet.Rows[0].ItemArray[0].ToString();

                patientFirstNameTextBox.Text = resultSet.Rows[0].ItemArray[1].ToString();

                patientLastNameTextBox.Text = resultSet.Rows[0].ItemArray[2].ToString();

                dateOfBirthTextBox.Text = resultSet.Rows[0].ItemArray[3].ToString();

                emailIdTextBox.Text = resultSet.Rows[0].ItemArray[4].ToString();

                phoneNumberTextBox.Text = resultSet.Rows[0].ItemArray[5].ToString();

                stateIdDropDownList.SelectedValue = resultSet.Rows[0].ItemArray[6].ToString();

                PlanIdTextBox.Text = resultSet.Rows[0].ItemArray[7].ToString();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Enter the Details')", true);
            }
        }

        protected void updatePatientDetailsButton_Click(object sender, EventArgs e)
        {
            DateTime intermediateDOb;

            bool dateOfBirthFlag = false;

            patientDetailsObject.PatientId = Convert.ToInt32(patientIdTextBox.Text);

            patientDetailsObject.PatientFirstName = patientFirstNameTextBox.Text;

            patientDetailsObject.PatientLastName = patientLastNameTextBox.Text;

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
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Enter valid date of birth date')", true);
                    dateOfBirthFlag = true;
                }
            }


            patientDetailsObject.EmailId = emailIdTextBox.Text;

            patientDetailsObject.PhoneNumber = phoneNumberTextBox.Text;

            patientDetailsObject.StateId = stateIdDropDownList.SelectedItem.Value;

            patientDetailsObject.InsurancePlan = PlanIdTextBox.Text;


            if (dateOfBirthFlag == false)
            {
                int queryStatus = patientDetailsBLLObject.UpdatePatientDetails(patientDetailsObject);


                if (queryStatus > 0)
                {
                    Response.Write("Sucessful");
                    ClientScript.RegisterStartupScript(this.GetType(), "Information", "alert('Patient Details Updated Successfully . Patient Id is : " + patientDetailsObject.PatientId + "')", true);
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "Information", "alert('Failed')", true);
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Information", "alert('Enter a valid Date of Birth')", true);
        }

        protected void resetButton_Click(object sender, EventArgs e)
        {
            dateOfBirthTextBox.Text = string.Empty;
            emailIdTextBox.Text = string.Empty;
            phoneNumberTextBox.Text = string.Empty;
        }
    }
}