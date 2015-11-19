using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMSPL
{
    public partial class SearchPhysicianWithPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PhysicianIdRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (PhysicianIdRadioButton.Checked == true)
            {
                physicianIdSearchLabel.Visible = true;
                PhysicianIdDropDownBox.Visible = true;
                PhysicianNameSearchLabel.Visible = false;
                PhysicianNameDropDownBox.Visible = false;
                
            }
            physicianNameGridView.Visible = false;
            physicianIdGridView.Visible = false;
        }

        protected void PhysicianNameRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (PhysicianNameRadioButton.Checked == true)
            {
                physicianIdSearchLabel.Visible = false;
                PhysicianIdDropDownBox.Visible = false;
                PhysicianNameSearchLabel.Visible = true;
                PhysicianNameDropDownBox.Visible = true;
            }

            physicianNameGridView.Visible = false;
            physicianIdGridView.Visible = false;
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            if (PhysicianIdRadioButton.Checked == true)
            {
                physicianIdGridView.Visible= true;
                physicianNameGridView.Visible = false;

            }
            else if (PhysicianNameRadioButton.Checked == true)
            {
                physicianNameGridView.Visible = true;
                physicianIdGridView.Visible = false;
            }

        }

        protected void PhysicianNameDropDownBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str = PhysicianNameDropDownBox.SelectedItem.ToString();

            string[] str1 = str.Split(' ');

            Label1.Text = str1[0];
            Label2.Text = str1[1];
        }

        protected void physicianNameGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       

       
       

       


    }
}