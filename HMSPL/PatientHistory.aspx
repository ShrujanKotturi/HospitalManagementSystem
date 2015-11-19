<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PatientHistory.aspx.cs" Inherits="HMSPL.WebForm4" %>
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
     <div>
    
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; View Patient History By :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="patientIdRadioButton" runat="server" 
            oncheckedchanged="RadioButton1_CheckedChanged" Text="Patient Id" 
            AutoPostBack="True" GroupName="same" />
&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="patientNameRadioButton" runat="server" Text="Patient Name" 
            oncheckedchanged="patientNameRadioButton_CheckedChanged" 
            AutoPostBack="True" GroupName="same" />
        &nbsp;&nbsp;
        <asp:RadioButton ID="patientPhoneNumberRadioButton" runat="server" 
            GroupName="Same" 
            oncheckedchanged="patientPhoneNumberRadioButton_CheckedChanged" 
            Text="Patient Phone Number" AutoPostBack="True" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="sortByLabel" runat="server" Text="Sort by" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="sortByDropDownList" runat="server" Visible="False">
            <asp:ListItem>Select</asp:ListItem>
            <asp:ListItem>First Name</asp:ListItem>
            <asp:ListItem>Last Name</asp:ListItem>
        </asp:DropDownList>
        <br />
    
    </div>
&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="patientIdLabel" runat="server" Text="Patient Id" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="patientIdTextBox" runat="server" Visible="False"></asp:TextBox> 
        
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="patientIdValidatorLabel" runat="server" 
        Text="Please enter Patient ID " Visible="False"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="patientIdRegularExpressionValidator" 
        runat="server" ControlToValidate="patientIdTextBox" 
        ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9]+$">Please enter only numeric values</asp:RegularExpressionValidator>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="patientFirstNameLabel" runat="server" Text="Patient First Name" 
        Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="patientFirstNameTextBox" runat="server" Visible="False"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="patientFirstNameValidatorLabel" runat="server" 
        Text="Please enter Patient First Name" Visible="False"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="patientFirstNameRegularExpressionValidator" 
        runat="server" ControlToValidate="patientFirstNameTextBox" 
        ErrorMessage="RegularExpressionValidator" ValidationExpression="^[a-zA-Z]+$">Please enter only alphabetic values</asp:RegularExpressionValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="patientLastNameLabel" runat="server" Text="Patient Last Name" 
        Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="patientLastNameTextBox" runat="server" Visible="False"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="patientLastNameValidatorLabel" runat="server" 
        Text="Please enter Patient Last Name " Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="patientLastNameRegularExpressionValidator" 
        runat="server" ControlToValidate="patientLastNameTextBox" 
        ErrorMessage="RegularExpressionValidator" ValidationExpression="^[a-zA-Z]+$">Please enter only alphabetic values</asp:RegularExpressionValidator>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="patientPhoneNumberLabel" runat="server" 
        Text="Patient Phone Number" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="patientPhoneNumberTextBox" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="patientPhoneNumberValidatorLabel" runat="server" Text="Please enter Valid 10 digit Phone Number " 
        Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="patientPhoneNumberRegularExpressionValidator" 
        runat="server" ControlToValidate="patientPhoneNumberTextBox" 
        ErrorMessage="Please enter valid Phone Number" 
        ValidationExpression="([0-9].{9})"></asp:RegularExpressionValidator>
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="searchButton" runat="server" Text="Search" 
        onclick="searchButton_Click"  />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="resetButton" runat="server" Text="Reset" Height="26px" 
        onclick="resetButton_Click" />
    <br />
    <br />
&nbsp;<asp:Label ID="noPatientLabel" runat="server" 
        Text="There is no matching data for entered details" Visible="False"></asp:Label>
    <br />
    <br />
    
    <br />
    <asp:GridView ID="resultGridView" runat="server" AutoGenerateColumns="False" >
    <Columns>
                 <asp:BoundField DataField="PatientId" HeaderText="PatientId" />
                        <asp:BoundField DataField="PatientFirstName" HeaderText="PatientFirstName" />
                        <asp:BoundField DataField="PatientLastName" HeaderText="PatientLastName" />
                        <asp:BoundField DataField="DateOfDiagnosis" HeaderText="DateOfDiagnosis" />
                        <asp:TemplateField HeaderText="Symptoms">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" text='<% #Bind("Symptom")%>' ToolTip='<% #Bind("Symptoms") %>' onclick='showdetails(this)' style="text-decoration:underline;cursor:pointer;color:Blue;"
                                    runat="server"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DiagnosisProvided">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink2" text='<% #Bind("Diagnosis")%>' ToolTip='<% #Bind("DiagnosisProvided") %>' onclick='showdetails(this)' style="text-decoration:underline;cursor:pointer;color:Blue;"
                                    runat="server"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FollowUpDate" HeaderText="FollowUpDate" />
                        <asp:BoundField DataField="BillAmount" HeaderText="BillAmount" />
                        <asp:BoundField DataField="PhysicianId" HeaderText="PhysicianId" />
                        </Columns>
    </asp:GridView>

</asp:Content>
