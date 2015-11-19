<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EnrollPatientWithEdit.aspx.cs" Inherits="HMSPL.EnrollPatientWithEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageContent" runat="server">
<table class="style1">
        <tr>
            <td class="style2">
                Patient First Name :<br />
            </td>
            <td>
                <asp:TextBox ID="searchPatientFirstNameTextBox" runat="server" Height="29px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Patient Last Name<br />
            </td>
            <td>
                <asp:TextBox ID="searchPatientLastNameTextBox" runat="server" Height="29px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="serachPatientDetailsButton" runat="server" Height="37px" 
                    onclick="serachPatientDetailsButton_Click" Text="Search" Width="72px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="ViewPatientDetailsPanel" runat="server" Visible="False">
        <br />
        <table class="style1">
            <tr>
                <td class="style4">
                    Patient ID :</td>
                <td class="style6">
                    <asp:TextBox ID="patientIdTextBox" runat="server" Height="38px" ReadOnly="True" 
                        Enabled="False"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    Patient First Name :<br />
                </td>
                <td class="style6">
                    <asp:TextBox ID="patientFirstNameTextBox" runat="server" Height="35px" 
                        ReadOnly="True" Enabled="False"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    Patient Last Name :<br />
                </td>
                <td class="style6">
                    <asp:TextBox ID="patientLastNameTextBox" runat="server" Height="35px" 
                        ReadOnly="True" Enabled="False"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    Date Of Birth :<br />
                </td>
                <td class="style6">
                    <asp:TextBox ID="dateOfBirthTextBox" runat="server" Height="35px" 
                        ValidationGroup="UpdatePatientDetailsGroup "></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="dateOfBirthRequiredFeildValidator" 
                        runat="server" ControlToValidate="DateOfBirthTextBox" 
                        ErrorMessage="* Required Field" ForeColor="Red" EnableClientScript="False" 
                        ValidationGroup="UpdatePatientDetailsGroup "></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="dateOfBirthRegularExpressionValidator" 
                        runat="server" ControlToValidate="dateOfBirthTextBox" 
                        ErrorMessage="Enter date in dd/MM/yyyy format" style="color: #FF0000" 
                        
                        ValidationExpression="([0-9]|0[0-9]|1[0-9]|2[0-9]|3[0-1])[/]([0-9]|0[0-9]|1[0-2])[/](1[9][0-9][0-9]|2[0][0-9][0-9])" 
                        ValidationGroup="UpdatePatientDetailsGroup "></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Phone Number :<br />
                </td>
                <td class="style6">
                    <asp:TextBox ID="phoneNumberTextBox" runat="server" Height="35px" 
                        ValidationGroup="UpdatePatientDetailsGroup "></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="phoneNumberRequiredFieldValidator" 
                        runat="server" ControlToValidate="PhoneNumberTextBox" 
                        ErrorMessage="* Required Field" ForeColor="Red" 
                        ValidationGroup="UpdatePatientDetailsGroup "></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="phoneNumberRegularExpressionValidator" 
                        runat="server" ControlToValidate="PhoneNumberTextBox" 
                        ErrorMessage="Enter Only numbers" ForeColor="Red" 
                        ValidationExpression="([0-9]*)" EnableClientScript="False" 
                        ValidationGroup="UpdatePatientDetailsGroup "></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Email Id<br />
                </td>
                <td class="style6">
                    <asp:TextBox ID="emailIdTextBox" runat="server" Height="35px" 
                        ValidationGroup="UpdatePatientDetailsGroup "></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="emailIdRequiredFieldValidator" runat="server" 
                        ControlToValidate="EmailIdTextBox" ErrorMessage="* Required Field" 
                        ForeColor="Red" EnableClientScript="False" 
                        ValidationGroup="UpdatePatientDetailsGroup "></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="emailIdRegularExpressionValidator" 
                        runat="server" ControlToValidate="EmailIdTextBox" 
                        ErrorMessage="Enter the Email Id in proper format" ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        EnableClientScript="False" ValidationGroup="UpdatePatientDetailsGroup "></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    State Id :<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                        SelectCommand="uspLoadStateIdDetails" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                    <br />
                </td>
                <td class="style6">
                    <asp:DropDownList ID="stateIdDropDownList" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="StateName" 
                        DataValueField="StateId" Height="30px" 
                        ValidationGroup="UpdatePatientDetailsGroup " >
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="stateIdRequiredFeildValidator" runat="server" 
                        ControlToValidate="stateIdDropDownList" ErrorMessage="* Required Field" 
                        ForeColor="Red" EnableClientScript="False" 
                        ValidationGroup="UpdatePatientDetailsGroup "></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    Plan Id :<br />
                </td>
                <td class="style7">
                    <asp:TextBox ID="PlanIdTextBox" runat="server" Height="32px" ReadOnly="True" 
                        Enabled="False"></asp:TextBox>
                </td>
                <td class="style3">
                </td>
                <td class="style3">
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Button ID="updatePatientDetailsButton" runat="server" Height="34px" 
                        onclick="updatePatientDetailsButton_Click" Text="Update" Width="89px" 
                        ValidationGroup="UpdatePatientDetailsGroup " />
                    <br />
                </td>
                <td class="style6">
                    <asp:Button ID="resetPatientDetailsButton" runat="server" Height="34px" 
                        onclick="resetButton_Click" Text="Reset" Width="85px" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
