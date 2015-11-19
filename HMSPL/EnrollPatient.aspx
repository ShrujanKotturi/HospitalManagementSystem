<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EnrollPatient.aspx.cs" Inherits="HMSPL.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageContent" runat="server">
<table style="width: 127%">
        <tr>
           <td style="background-color: #FFCCCC">
               <asp:LinkButton ID="homeLinkButton" runat="server" 
            NavigateUrl="~/Navigation.aspx" PostBackUrl="~/HomePage.aspx" 
                   style="color: #CC0000">Home</asp:LinkButton>
           </td>
           <td style="background-color: #FFCCCC">
           <asp:LinkButton ID="LinkButton1" runat="server" 
            NavigateUrl="~/Navigation.aspx" PostBackUrl="~/EnrollPatient.aspx" 
                   style="color: #CC0000">Enroll Patient</asp:LinkButton>
           </td>
           <td style="background-color: #FFCCCC">
           <asp:LinkButton ID="LinkButton2" runat="server" 
            NavigateUrl="~/Navigation.aspx" PostBackUrl="~/PatientDiagnosis.aspx" 
                   style="color: #CC0000">Patient Diagnosis</asp:LinkButton>
           </td>
           <td style="background-color: #FFCCCC">
           <asp:LinkButton ID="LinkButton3" runat="server" 
            NavigateUrl="~/Navigation.aspx" PostBackUrl="~/PatientHistory.aspx" 
                   style="color: #CC0000">Patient History</asp:LinkButton>
           </td>
           <td style="background-color: #FFCCCC">
           <asp:LinkButton ID="LinkButton4" runat="server" 
            NavigateUrl="~/Navigation.aspx" PostBackUrl="~/AddPhysician.aspx" 
                   style="color: #CC0000">Add Physician</asp:LinkButton>
           </td>
           <td style="background-color: #FFCCCC">
           <asp:LinkButton ID="LinkButton5" runat="server" 
            NavigateUrl="~/Navigation.aspx" PostBackUrl="~/PhysicianSearch.aspx" 
                   style="color: #CC0000">Physician Search</asp:LinkButton>
           </td>
        </tr>
    </table>
<table class="style1" width="127%">
        <tr>
            <td style="font-size: medium; background-color: #FFFFCC">
                Patient First Name :<br />
            </td>
            <td style="background-color: #FFFFCC">
                <asp:TextBox ID="patientFirstNameTextBox" runat="server" Height="35px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="patientFirstNameRequiredFieldValidator" 
                    runat="server" ControlToValidate="PatientFirstNameTextBox" 
                    ErrorMessage="* Required Field" ForeColor="Red" EnableClientScript="False" 
                    ValidationGroup="validate3"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="patientFirstNameRegularExpressionValidator" 
                    runat="server" ControlToValidate="PatientFirstNameTextBox" 
                    ErrorMessage="Enter Only alphabets" ForeColor="Red" 
                    ValidationExpression="([a-zA-Z]*)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; background-color: #FFFFCC">
                Patient Last Name :<br />
            </td>
            <td style="background-color: #FFFFCC">
                <asp:TextBox ID="patientLastNameTextBox" runat="server" Height="35px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="patientLastNameRequiredFieldValidator" 
                    runat="server" ControlToValidate="PatientLastNameTextBox" 
                    ErrorMessage="* Required Field" ForeColor="Red" EnableClientScript="False" 
                    ValidationGroup="validate3"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="patientLastNameRegularExpressionValidator" 
                    runat="server" ControlToValidate="PatientLastNameTextBox" 
                    ErrorMessage="Enter Only alphabets" ForeColor="Red" 
                    ValidationExpression="([a-zA-Z]*)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; background-color: #FFFFCC">
                Date Of Birth :<br />
            </td>
            <td style="background-color: #FFFFCC">
                <asp:TextBox ID="dateOfBirthTextBox" runat="server" Height="35px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="dateOfBirthRequiredFeildValidator" 
                    runat="server" ControlToValidate="DateOfBirthTextBox" 
                    ErrorMessage="* Required Field" ForeColor="Red" EnableClientScript="False" 
                    ValidationGroup="validate3"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="font-size: medium; background-color: #FFFFCC">
                Phone Number :<br />
            </td>
            <td style="background-color: #FFFFCC">
                <asp:TextBox ID="phoneNumberTextBox" runat="server" Height="35px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="phoneNumberRequiredFieldValidator" 
                    runat="server" ControlToValidate="PhoneNumberTextBox" 
                    ErrorMessage="* Required Field" ForeColor="Red" EnableClientScript="False" 
                    ValidationGroup="validate3"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="phoneNumberRegularExpressionValidator" 
                    runat="server" ControlToValidate="PhoneNumberTextBox" 
                    ErrorMessage="Enter Only numbers" ForeColor="Red" 
                    ValidationExpression="([0-9]*)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; background-color: #FFFFCC">
                Email Id<br />
            </td>
            <td style="background-color: #FFFFCC">
                <asp:TextBox ID="emailIdTextBox" runat="server" Height="35px"></asp:TextBox>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="emailIdRequiredFieldValidator" runat="server" 
                    ControlToValidate="EmailIdTextBox" ErrorMessage="* Required Field" 
                    ForeColor="Red" EnableClientScript="False" ValidationGroup="validate3"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="emailIdRegularExpressionValidator" 
                    runat="server" ControlToValidate="EmailIdTextBox" 
                    ErrorMessage="Enter the Email Id in proper format" ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="font-size: medium; background-color: #FFFFCC">
                State Id :<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspLoadStateIdDetails" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <br />
            </td>
            <td style="background-color: #FFFFCC">
                <asp:DropDownList ID="stateIdDropDownList" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="StateName" 
                    DataValueField="StateId" Height="22px" AppendDataBoundItems="True">
                    <asp:ListItem>-Select-</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="stateIdRequiredFeildValidator" runat="server" 
                    ControlToValidate="StateIdDropDownList" ErrorMessage="* Required Field" 
                    ForeColor="Red" ValidationGroup="validate3"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="font-size: medium; background-color: #FFFFCC">
                Plan Id :<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspLoadInsurancePlanIdDetails" 
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
            </td>
            <td style="background-color: #FFFFCC">
                <asp:DropDownList ID="planIdDropDownList" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="PlanName" 
                    DataValueField="PlanId" AppendDataBoundItems="True">
                    <asp:ListItem>-Select-</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="requiredFieldValidator7" runat="server" 
                    ControlToValidate="PlanIdDropDownList" ErrorMessage="* Required Field" 
                    ForeColor="Red" ValidationGroup="validate3"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="background-color: #FFFFCC">
                <asp:Button ID="submittButton" runat="server" Height="34px" 
                    onclick="submittButton_Click" Text="Submit" Width="89px" 
                    ValidationGroup="validate3" />
                <br />
            </td>
            <td style="background-color: #FFFFCC">
                <asp:Button ID="resetButton" runat="server" Height="34px" 
                    onclick="resetButton_Click" Text="Reset" Width="85px" />
            </td>
            <td style="background-color: #FFFFCC">
                &nbsp;</td>
            <td style="background-color: #FFFFCC">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
