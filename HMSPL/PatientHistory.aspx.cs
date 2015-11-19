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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            patientFirstNameRegularExpressionValidator.Enabled = false;
            patientLastNameRegularExpressionValidator.Enabled = false;
            patientIdRegularExpressionValidator.Enabled = false;
            patientFirstNameValidatorLabel.Visible = false;
            patientLastNameValidatorLabel.Visible = false;
            patientIdValidatorLabel.Visible = false;
            noPatientLabel.Visible = false;
            patientPhoneNumberRegularExpressionValidator.Enabled = false;
            DataSet result = null;
            if (patientIdRadioButton.Checked == true)
            {

                DatabaseObject obj = new DatabaseObject();

                ViewPatientHistoryBLL objViewPatientHistoryBLL = new ViewPatientHistoryBLL();

                try
                {
                    patientIdRegularExpressionValidator.Enabled = true;

                    result = objViewPatientHistoryBLL.ViewPatientHistoryBy(int.Parse(patientIdTextBox.Text));

                    //DetailsView.DataSource = result;

                    resultGridView.DataSource = result;

                    resultGridView.Visible = true;
                    patientFirstNameRegularExpressionValidator.Enabled = false;
                    patientLastNameRegularExpressionValidator.Enabled = false;
                    if (result.Tables[0].Select().Length == 0 && patientIdTextBox.Text != string.Empty)
                    {
                        noPatientLabel.Visible = true;
                    }
                }
                catch
                {
                    if (patientIdTextBox.Text == string.Empty)
                    {
                        patientIdValidatorLabel.Visible = true;
                    }
                }
                resultGridView.DataBind();
                //DetailsView.Visible = true;

            }
            else if (patientNameRadioButton.Checked == true)
            {

                patientFirstNameRegularExpressionValidator.Enabled = true;
                patientLastNameRegularExpressionValidator.Enabled = true;
                patientIdRegularExpressionValidator.Enabled = false;
                DatabaseObject obj = new DatabaseObject();

                ViewPatientHistoryBLL objViewPatientHistoryByName = new ViewPatientHistoryBLL();
                if (patientFirstNameTextBox.Text == string.Empty)
                {
                    patientFirstNameValidatorLabel.Visible = true;
                    if (patientFirstNameTextBox.Text != string.Empty)
                    {
                        patientFirstNameValidatorLabel.Visible = false;
                    }
                }
                if (patientLastNameTextBox.Text == string.Empty)
                {
                    patientLastNameValidatorLabel.Visible = true;
                    if (patientLastNameTextBox.Text != string.Empty)
                    {
                        patientLastNameValidatorLabel.Visible = false;
                    }
                }

                result = objViewPatientHistoryByName.ViewPatientHistoryByName(patientFirstNameTextBox.Text, patientLastNameTextBox.Text);

                //DetailsView.DataSource = result;

                resultGridView.DataSource = result;

                resultGridView.Visible = true;

                if (result.Tables[0].Select().Length == 0 && patientFirstNameTextBox.Text != string.Empty && patientLastNameTextBox.Text != string.Empty)
                {
                    noPatientLabel.Visible = true;
                }
                resultGridView.DataBind();
            }
            else if (patientPhoneNumberRadioButton.Checked == true)
            {

                DatabaseObject obj = new DatabaseObject();
                obj.CommandToExecute = new SqlCommand(@"uspViewPatientHistoryByPatientPhoneNumber", obj.DatabaseConnection);
                obj.CommandToExecute.CommandType = CommandType.StoredProcedure;
                patientIdRegularExpressionValidator.Enabled = false;
                patientFirstNameRegularExpressionValidator.Enabled = false;
                patientLastNameRegularExpressionValidator.Enabled = false;
                if (sortByDropDownList.Text == "Select")
                {
                    ViewPatientHistoryBLL objViewPatientHistoryByPhoneNumber = new ViewPatientHistoryBLL();

                    patientPhoneNumberRegularExpressionValidator.Enabled = true;

                    resultGridView.Visible = true;

                    result = objViewPatientHistoryByPhoneNumber.ViewPatientHistoryByPhoneNumber(patientPhoneNumberTextBox.Text);

                    resultGridView.DataSource = result;
                    if (patientPhoneNumberTextBox.Text == string.Empty)
                    {
                        patientPhoneNumberValidatorLabel.Visible = true;
                    }
                    else if (result.Tables[0].Select().Length == 0 && patientPhoneNumberTextBox.Text != string.Empty)
                    {
                        noPatientLabel.Visible = true;
                    }
                    resultGridView.DataBind();
                }
                else if (sortByDropDownList.Text == "First Name")
                {
                    ViewPatientHistoryBLL objViewPatientHistoryByPhoneNumber = new ViewPatientHistoryBLL();

                    patientPhoneNumberRegularExpressionValidator.Enabled = true;

                    resultGridView.Visible = true;

                    result = objViewPatientHistoryByPhoneNumber.ViewPatientHistoryByPhoneNumberSortByFirstName(patientPhoneNumberTextBox.Text);

                    resultGridView.DataSource = result;
                    if (patientPhoneNumberTextBox.Text == string.Empty)
                    {
                        patientPhoneNumberValidatorLabel.Visible = true;
                    }
                    else if (result.Tables[0].Select().Length == 0 && patientPhoneNumberTextBox.Text != string.Empty)
                    {
                        noPatientLabel.Visible = true;
                    }
                    resultGridView.DataBind();
                }
                else if (sortByDropDownList.Text == "Last Name")
                {
                    ViewPatientHistoryBLL objViewPatientHistoryByPhoneNumber = new ViewPatientHistoryBLL();

                    patientPhoneNumberRegularExpressionValidator.Enabled = true;

                    resultGridView.Visible = true;

                    result = objViewPatientHistoryByPhoneNumber.ViewPatientHistoryByPhoneNumberSortByLastName(patientPhoneNumberTextBox.Text);

                    resultGridView.DataSource = result;
                    if (patientPhoneNumberTextBox.Text == string.Empty)
                    {
                        patientPhoneNumberValidatorLabel.Visible = true;
                    }
                    else if (result.Tables[0].Select().Length == 0 && patientPhoneNumberTextBox.Text != string.Empty)
                    {
                        noPatientLabel.Visible = true;
                    }
                    resultGridView.DataBind();
                }

            }
        }


        protected void resetButton_Click(object sender, EventArgs e)
        {
            patientIdTextBox.Text = string.Empty;
            patientFirstNameTextBox.Text = string.Empty;
            patientLastNameTextBox.Text = string.Empty;
            patientIdRadioButton.Checked = false;
            patientNameRadioButton.Checked = false;
            patientFirstNameLabel.Visible = false;
            patientFirstNameTextBox.Visible = false;
            patientLastNameLabel.Visible = false;
            patientLastNameTextBox.Visible = false;
            patientIdLabel.Visible = false;
            patientIdTextBox.Visible = false;
            resultGridView.DataSource = null;
            resultGridView.Visible = false;
            patientIdValidatorLabel.Visible = false;
            patientFirstNameValidatorLabel.Visible = false;
            patientLastNameValidatorLabel.Visible = false;
            noPatientLabel.Visible = false;
            patientPhoneNumberLabel.Visible = false;
            patientPhoneNumberTextBox.Visible = false;
            patientPhoneNumberRadioButton.Checked = false;
            patientPhoneNumberRegularExpressionValidator.Enabled = false;
            patientFirstNameRegularExpressionValidator.Enabled = false;
            patientLastNameRegularExpressionValidator.Enabled = false;
            patientIdRegularExpressionValidator.Enabled = false;
            patientPhoneNumberValidatorLabel.Visible = false;
            patientPhoneNumberTextBox.Text = string.Empty;
            patientPhoneNumberTextBox.Visible = false;
            noPatientLabel.Visible = false;
            sortByDropDownList.Visible = false;
            sortByLabel.Visible = false;
        }

        protected void patientNameRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (patientNameRadioButton.Checked == true)
            {
                sortByLabel.Visible = false;
                sortByDropDownList.Visible = false;
                patientPhoneNumberLabel.Visible = false;
                patientPhoneNumberTextBox.Visible = false;
                patientIdLabel.Visible = false;
                patientIdTextBox.Visible = false;
                patientFirstNameLabel.Visible = true;
                patientFirstNameTextBox.Visible = true;
                patientLastNameLabel.Visible = true;
                patientLastNameTextBox.Visible = true;
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (patientIdRadioButton.Checked == true)
            {
                sortByLabel.Visible = false;
                sortByDropDownList.Visible = false;
                patientPhoneNumberLabel.Visible = false;
                patientPhoneNumberTextBox.Visible = false;
                patientIdLabel.Visible = true;
                patientIdTextBox.Visible = true;
                patientFirstNameLabel.Visible = false;
                patientFirstNameTextBox.Visible = false;
                patientLastNameLabel.Visible = false;
                patientLastNameTextBox.Visible = false;
            }
        }

        protected void patientPhoneNumberRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (patientPhoneNumberRadioButton.Checked == true)
            {
                patientPhoneNumberLabel.Visible = true;
                patientPhoneNumberTextBox.Visible = true;
                patientIdLabel.Visible = false;
                patientIdTextBox.Visible = false;
                patientFirstNameLabel.Visible = false;
                patientFirstNameTextBox.Visible = false;
                patientLastNameLabel.Visible = false;
                patientLastNameTextBox.Visible = false;
                sortByLabel.Visible = true;
                sortByDropDownList.Visible = true;
            }
        }
    }
}