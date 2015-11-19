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
    public partial class WebForm6 : System.Web.UI.Page
    {
        DiagnosisDetailsBLL diagnosisDetailsBLLObject = new DiagnosisDetailsBLL();
        PatientDiagnosisDetails patientDiagnosisDetailsPLObject = new PatientDiagnosisDetails();
        BillingDetails billingDetailsPLObject = new BillingDetails();
        BillingDetailsBLL billingDetailsBLLObject = new BillingDetailsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DiagnosisDetailsSaveButton_Click(object sender, EventArgs e)
        {
            bool diagnosisDateFlag = false, followUpDateFlag = false;
            int billId = 0;

            patientDiagnosisDetailsPLObject.PatientId = Convert.ToInt32(patientIdDropDownList.SelectedItem.Value);
            //patientDiagnosisDetailsPLObject.DiagnosisId = int.Parse(DiagnosisIdTextBox.Text);
            patientDiagnosisDetailsPLObject.Symptoms = symptomsTextBox.Text;
            patientDiagnosisDetailsPLObject.DiagnosisProvided = diagnosisProvidedTextBox.Text;
            patientDiagnosisDetailsPLObject.AdministeredBy = (administeredByDropDownList.SelectedItem.ToString());
            patientDiagnosisDetailsPLObject.DiagnosisId = (diagnosisDetailsBLLObject.GetDiagnosisId());

            billId = billingDetailsBLLObject.GetBillId();

            patientDiagnosisDetailsPLObject.BillId = billId;

            DateTime dateNow = DateTime.Now;
            DateTime diagnosisDate;
            string date = dateOfDiagnosisTextBox.Text;
            if (DateTime.TryParseExact(date, "dd/MM/yyyy", null, DateTimeStyles.None, out diagnosisDate))
            {
                if (dateNow.Subtract(diagnosisDate).TotalDays >= 0)
                {

                    DateTime intermediateDiagnosisDate;
                    intermediateDiagnosisDate = DateTime.ParseExact(dateOfDiagnosisTextBox.Text, "dd/MM/yyyy", null);

                    patientDiagnosisDetailsPLObject.DateOfDiagnosis = intermediateDiagnosisDate;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Enter valid diagnosis date')", true);
                    diagnosisDateFlag = true;
                }
            }
            if (followUpRequiredCheckBox.Checked == true && diagnosisDateFlag == false)
            {
                patientDiagnosisDetailsPLObject.FollowUpRequired = "Y";
                string followdate = followUpDateTextBox.Text;
                DateTime followUpDate;
                if (DateTime.TryParseExact(followdate, "dd/MM/yyyy", null, DateTimeStyles.None, out followUpDate))
                {
                    if (followUpDate.Subtract(diagnosisDate).TotalDays >= 0)
                    {

                        DateTime intermediateFollowUpDate;
                        intermediateFollowUpDate = DateTime.ParseExact(followUpDateTextBox.Text, "dd/MM/yyyy", null);

                        patientDiagnosisDetailsPLObject.FollowUpDate = intermediateFollowUpDate;

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Enter valid follow up date')", true);
                        followUpDateFlag = true;
                    }
                }

            }
            else
            {
                patientDiagnosisDetailsPLObject.FollowUpRequired = "N";
            }

            patientDiagnosisDetailsPLObject.BillId = billId;

            if (diagnosisDateFlag == false && followUpDateFlag == false)
            {
                int queryStatus;
                queryStatus = diagnosisDetailsBLLObject.InsertDiagnosisDetails(patientDiagnosisDetailsPLObject);

                if (queryStatus > 0)
                {
                    //Response.Write("Diagnosis Details Inserted Successful");
                    ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Diagnosis Details Inserted Successful')", true);
                    BillingDetailsPanel.Visible = true;
                    BillingDetailsPanel.EnableViewState = true;


                }
                else
                {
                    //Response.Write("Diagnosis Details Insertion Failed");
                    ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Diagnosis Details Insertion Failed')", true);
                    BillingDetailsPanel.Visible = false;
                    BillingDetailsPanel.EnableViewState = false;

                }
            }
            else
                //Response.Write("Invalid Date of Diagnosis and Date of Follow Up");
                ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Invalid Date of Diagnosis and Date of Follow Up')", true);
        }

        protected void followUpRequiredCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (followUpRequiredCheckBox.Checked)
            {
                followUpDateLabel.Visible = true;
                followUpDateRegularExpressionValidator.Visible = true;
                followUpDateTextBox.Visible = true;

            }
            else
            {
                followUpDateLabel.Visible = false;
                followUpDateRegularExpressionValidator.Visible = false;
                followUpDateTextBox.Visible = false;
            }
        }

        protected void ModeOfPaymentDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ModeOfPaymentDropDownList.SelectedIndex == 1)
            {
                CardNumberLabel.Visible = false;
                CardNumberTextBox.Visible = false;
            }
            else if (ModeOfPaymentDropDownList.SelectedIndex == 2)
            {
                CardNumberLabel.Visible = true;
                CardNumberTextBox.Visible = true;
            }
        }

        protected void BillingDetailsSubmitButton_Click(object sender, EventArgs e)
        {
            int queryStatus = 0;
            int billId = 0;

            billId = billingDetailsBLLObject.generateBillId();

            billingDetailsPLObject.BillId = billId;
            billingDetailsPLObject.BillAmount = decimal.Parse(BillAmountTextBox.Text);
            billingDetailsPLObject.ModeOfPayment = ModeOfPaymentDropDownList.SelectedItem.Value;


            if (ModeOfPaymentDropDownList.SelectedIndex == 2)
            {
                billingDetailsPLObject.CardNumber = CardNumberTextBox.Text;
            }

            queryStatus = billingDetailsBLLObject.InsertBillingDetails(billingDetailsPLObject);


            if (queryStatus > 0)
            {
                //Response.Write("Billing Details Inserted Successfully");
                ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Billing Details Inserted Successfully')", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ALERT", "alert('Billing Details Insertion Failed')", true);
                //Response.Write("Billing Details Insertion Failed");
            }
        }

        protected void actualBillAmountButton_Click(object sender, EventArgs e)
        {
            decimal billAmountWithPlan = 0;

            decimal billAmountWithoutPlan = decimal.Parse(BillAmountTextBox.Text);

            billAmountWithPlan = billingDetailsBLLObject.GetPreAprrovedAmount(Convert.ToInt32(patientIdDropDownList.SelectedItem.Value));

            if (billAmountWithPlan > billAmountWithoutPlan)
            {
                BillAmountTextBox.Text = (0).ToString();

            }
            else
            {
                decimal actualAmount = (billAmountWithoutPlan - billAmountWithPlan);
                BillAmountTextBox.Text = actualAmount.ToString();
            }
        }
    }
}