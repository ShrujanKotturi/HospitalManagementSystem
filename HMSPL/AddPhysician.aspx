<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddPhysician.aspx.cs" Inherits="HMSPL.WebForm3" %>
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
            <td class="style1" 
                style="color: #CC0000; font-size: medium; background-color: #FFFFCC;">
                <span lang="EN-GB" style="mso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-GB;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA;mso-bidi-font-weight:bold; color: #CC0000;" 
                    class="style9">Physician Id</span></td>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:TextBox ID="physicianIdTextBox" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                    &nbsp;</td>
            <td class="style11" style="width: 579px; background-color: #FFFFCC">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" 
                style="color: #CC0000; font-size: medium; background-color: #FFFFCC;">
                <span lang="EN-GB" style="mso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-GB;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA;mso-bidi-font-weight:bold; color: #CC0000;" 
                    class="style9">Physician First Name</span></td>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:TextBox ID="physicianFirstNameTextBox" runat="server"></asp:TextBox>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="physicianFirstNameTextBox" ErrorMessage="*Mandatory Field" 
                        ForeColor="Red" EnableClientScript="False" ValidationGroup="validate1"></asp:RequiredFieldValidator>
            </td>
            <td class="style11" style="width: 579px; background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="physicianFirstNameTextBox" 
                        ErrorMessage="Allow Only alphabets.." ForeColor="Red" 
                        ValidationExpression="([a-zA-Z]*)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style1" 
                style="color: #CC0000; font-size: medium; background-color: #FFFFCC;">
                <span lang="EN-GB" style="mso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-GB;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA;mso-bidi-font-weight:bold; color: #CC0000;" 
                    class="style9">Physician Last Name 
                    </span>
            </td>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:TextBox ID="physicianLastNameTextBox" runat="server"></asp:TextBox>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="physicianLastNameTextBox" ErrorMessage="*Mandatory Field" 
                        ForeColor="Red" EnableClientScript="False" ValidationGroup="validate1"></asp:RequiredFieldValidator>
            </td>
            <td class="style11" style="width: 579px; background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="physicianLastNameTextBox" 
                        ErrorMessage="Allow Only alphabets.." ForeColor="Red" 
                        ValidationExpression="([a-zA-Z]*)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" style="background-color: #FFFFCC">
                <asp:Label ID="Label1" runat="server" Text="Department Id" CssClass="style9" 
                    style="color: #CC0000; font-size: medium"></asp:Label>
            </td>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:DropDownList ID="physicianDepartmentId" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="Dept" 
                        DataValueField="DepartmentId" AutoPostBack="True" 
                    AppendDataBoundItems="True">
                    <asp:ListItem>-Select-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                        SelectCommand="uspGetDepartmentInfo" 
                    SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="physicianDepartmentId" ErrorMessage="*Mandatory Field" 
                        ForeColor="Red" EnableClientScript="False" ValidationGroup="validate1"></asp:RequiredFieldValidator>
            </td>
            <td class="style11" style="width: 579px; background-color: #FFFFCC">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" 
                style="color: #CC0000; font-size: medium; background-color: #FFFFCC;">
                <span lang="EN-GB" style="mso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-GB;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA;mso-bidi-font-weight:bold; color: #CC0000;" 
                    class="style9">Educational 
                    Qualification</span></td>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:TextBox ID="physicianEducationalQualification" runat="server"></asp:TextBox>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="physicianEducationalQualification" 
                        ErrorMessage="*Mandatory Field" ForeColor="Red" 
                    EnableClientScript="False" ValidationGroup="validate1"></asp:RequiredFieldValidator>
            </td>
            <td class="style11" style="width: 579px; background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="physicianEducationalQualification" 
                        ErrorMessage="Allow only alphabets &amp; space" ForeColor="Red" 
                        ValidationExpression="([a-zA-Z\s]+)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style1" 
                style="color: #CC0000; font-size: medium; background-color: #FFFFCC;">
                <span lang="EN-GB" style="mso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-GB;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA;mso-bidi-font-weight:bold; color: #CC0000;" 
                    class="style9">Years of Experience</span></td>
            <td class="style6" style="background-color: #FFFFCC">
                <asp:TextBox ID="physicianYearsOfExperience" runat="server"></asp:TextBox>
            </td>
            <td class="style7" style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="physicianYearsOfExperience" ErrorMessage="*Mandatory Field" 
                        ForeColor="Red" EnableClientScript="False" ValidationGroup="validate1"></asp:RequiredFieldValidator>
            </td>
            <td class="style8" style="width: 579px; background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                        ControlToValidate="physicianYearsOfExperience" 
                        ErrorMessage="Allow Only Numeric values.." ForeColor="Red" 
                        ValidationExpression="([0-9]*)"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style1" 
                style="color: #CC0000; font-size: medium; background-color: #FFFFCC;">
                <span lang="EN-GB" style="mso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-GB;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA;mso-bidi-font-weight:bold; color: #CC0000;" 
                    class="style9">State</span></td>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:DropDownList ID="physicianstate" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="StateName" 
                        DataValueField="StateId" AutoPostBack="True" AppendDataBoundItems="true">
                    <asp:ListItem>-Select-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                        SelectCommand="uspLoadStateIdDetails" 
                    SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="physicianstate" ErrorMessage="*Mandatory Field" 
                        ForeColor="Red" EnableClientScript="False" ValidationGroup="validate1"></asp:RequiredFieldValidator>
            </td>
            <td class="style11" style="width: 579px; background-color: #FFFFCC">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" 
                style="color: #CC0000; font-size: medium; background-color: #FFFFCC;">
                <span lang="EN-GB" style="mso-fareast-font-family:&quot;Times New Roman&quot;;mso-ansi-language:EN-GB;
mso-fareast-language:EN-US;mso-bidi-language:AR-SA;mso-bidi-font-weight:bold; color: #CC0000;" 
                    class="style9">Plan</span></td>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:DropDownList ID="physicianPlan" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="PlanName" 
                        DataValueField="PlanId" AutoPostBack="True" 
                    AppendDataBoundItems="True">
                    <asp:ListItem>-Select-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                        SelectCommand="uspLoadInsurancePlanIdDetails" 
                        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="physicianPlan" ErrorMessage="*Mandatory Field" 
                        ForeColor="Red" EnableClientScript="False" ValidationGroup="validate1"></asp:RequiredFieldValidator>
            </td>
            <td class="style11" style="width: 579px; background-color: #FFFFCC">
                    &nbsp;</td>
        </tr>
    </table>
    <asp:Button ID="registerPhysicianButton" runat="server" 
            onclick="registerPhysicianButton_Click" Text="Register" 
        ValidationGroup="validate1" />
        <asp:Button ID="resetPhysicianButton" runat="server" style="margin-left: 75px" 
            Text="Reset" onclick="resetPhysicianButton_Click" Width="54px" />
    <asp:Button ID="Search" runat="server" onclick="Search_Click" 
        style="margin-left: 353px" Text="Search Physician History" Width="173px" />
</asp:Content>
