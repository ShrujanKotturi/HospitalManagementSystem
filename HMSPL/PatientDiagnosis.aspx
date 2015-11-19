<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PatientDiagnosis.aspx.cs" Inherits="HMSPL.WebForm6" %>
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
            <td class="style3" style="background-color: #FFFFCC">
                <asp:Label ID="patientIdLabel" runat="server" Text="Patient Id" 
                    style="font-size: medium; color: #CC0000;"></asp:Label>
                <asp:SqlDataSource ID="patientIdSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspGetPatientId" 
                    SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:DropDownList ID="patientIdDropDownList" runat="server" 
                    DataSourceID="patientIdSqlDataSource" DataTextField="PatientId" 
                    DataValueField="PatientId" Width="175px" Height="35px" AutoPostBack="True" style="font-size: medium" 
                    >
                </asp:DropDownList>
            </td>
            <td class="style2" style="background-color: #FFFFCC">
                <span style="font-size: medium">
                <asp:RequiredFieldValidator ID="patientIdRequiredFieldValidator" runat="server" 
                    ControlToValidate="patientIdDropDownList" ErrorMessage="* Required Field" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                </span></td>
        </tr>
        <tr>
            <td class="style3" style="font-size: medium; background-color: #FFFFCC;">
                <asp:Label ID="DiagnosisIdLabel" runat="server" Text="Diagnosis Id" 
                    Visible="False" style="color: #CC0000"></asp:Label>
                <br style="color: #CC0000" />
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:TextBox ID="DiagnosisIdTextBox" runat="server" ReadOnly="True" 
                    Width="175px" Visible="False" style="font-size: medium"></asp:TextBox>
            </td>
            <td class="style2" style="background-color: #FFFFCC">
                &nbsp;</td>
            <td style="background-color: #FFFFCC">
                </span></td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:Label ID="symptomsLabel" runat="server" Text="Symptoms" 
                    style="font-size: medium; color: #CC0000;"></asp:Label>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:TextBox ID="symptomsTextBox" runat="server" Height="41px" Rows="2" 
                    Width="175px" style="font-size: medium"></asp:TextBox>
            </td>
            <td class="style2" style="background-color: #FFFFCC">
                <span style="font-size: medium">
                <asp:RequiredFieldValidator ID="symptomsRequiredFieldValidator" runat="server" 
                    ControlToValidate="symptomsTextBox" ErrorMessage="* Required Field" 
                    BackColor="White" ForeColor="Red" EnableClientScript="False" 
                    style="color: #CC0000; background-color: #FFFFCC"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="symptomsRegularExpressionValidator" 
                    runat="server" ControlToValidate="symptomsTextBox" 
                    ErrorMessage="Only alphanumerics are allowed" ForeColor="Red" 
                    ValidationExpression="([a-zA-Z0-9\s]+)"></asp:RegularExpressionValidator>
                </span>
            </td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:Label ID="diagnosisProvidedLabel" runat="server" Text="Diagnosis Provided" 
                    style="font-size: medium; color: #CC0000;"></asp:Label>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:TextBox ID="diagnosisProvidedTextBox" runat="server" Height="48px" 
                    Rows="2" Width="175px" style="font-size: medium"></asp:TextBox>
            </td>
            <td class="style2" style="background-color: #FFFFCC">
                <span style="font-size: medium">
                <asp:RequiredFieldValidator ID="diagnosisProvidedRequiredFieldValidator" 
                    runat="server" ControlToValidate="diagnosisProvidedTextBox" 
                    ErrorMessage="* Required Field" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                </span></td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:Label ID="administeredByLabel" runat="server" Text="Administered By" 
                    style="font-size: medium; color: #CC0000;"></asp:Label>
                <asp:SqlDataSource ID="physicianDetailsSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspLoadPhysicianDetails" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="patientIdDropDownList" DefaultValue="" 
                            Name="PatientId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:DropDownList ID="administeredByDropDownList" runat="server" Width="175px" 
                    DataSourceID="physicianDetailsSqlDataSource" DataTextField="Physician" 
                    DataValueField="Physician" Height="35px" 
                    AutoPostBack="True" style="font-size: medium">
                </asp:DropDownList>
            </td>
            <td class="style2" style="background-color: #FFFFCC">
                <span style="font-size: medium">
                <asp:RequiredFieldValidator ID="administeredByRequiredFieldValidator" 
                    runat="server" ControlToValidate="administeredByDropDownList" 
                    ErrorMessage="* Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                </span></td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:Label ID="dateOfDiagnosisLabel" runat="server" Text="Date of Diagnosis" 
                    style="font-size: medium; color: #CC0000;"></asp:Label>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:TextBox ID="dateOfDiagnosisTextBox" runat="server" Width="175px" 
                    style="font-size: medium"></asp:TextBox>
            </td>
            <td class="style2" style="background-color: #FFFFCC">
                <span style="font-size: medium">
                <asp:RequiredFieldValidator ID="dateOfDiagnosisRequiredFieldValidator" 
                    runat="server" ControlToValidate="dateOfDiagnosisTextBox" 
                    ErrorMessage="* Required Field" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="dateOfDiagnosisRegularExpressionValidator" 
                    runat="server" ControlToValidate="dateOfDiagnosisTextBox" 
                    ErrorMessage="Enter date in dd/MM/yyyy format" 
                    
                    ValidationExpression="([0-9]|0[0-9]|1[0-9]|2[0-9]|3[0-1])[/]([0-9]|0[0-9]|1[0-2])[/](1[9][0-9][0-9]|2[0-9][0-9][0-9])" 
                    ForeColor="Red"></asp:RegularExpressionValidator>
                </span>
            </td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:Label ID="followUpRequiredLabel" runat="server" Text="Follow up Required" 
                    style="font-size: medium; color: #CC0000;"></asp:Label>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <span style="font-size: medium">
                <asp:CheckBox ID="followUpRequiredCheckBox" runat="server" 
                     AutoPostBack="True" oncheckedchanged="followUpRequiredCheckBox_CheckedChanged" 
                     />
            </td>
            <td class="style2" style="background-color: #FFFFCC">
                &nbsp;</td>
            <td style="background-color: #FFFFCC">
                </span></td>
        </tr>
        <tr>
            <td id="followUpDateLabel" class="style3" style="background-color: #FFFFCC">
                <asp:Label ID="followUpDateLabel" runat="server" Text="Follow up Date" 
                    Visible="False" style="font-size: medium; color: #CC0000;"></asp:Label>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:TextBox ID="followUpDateTextBox" runat="server" Visible="False" 
                    AutoPostBack="True" style="font-size: medium" Width="174px"></asp:TextBox>
            </td>
            <td class="style2" style="background-color: #FFFFCC">
                <span style="font-size: medium">
                <asp:RequiredFieldValidator ID="followUpDateRequiredFieldValidator" 
                    runat="server" ControlToValidate="followUpDateTextBox" 
                    ErrorMessage="* Required Field" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
            </td>
            <td style="background-color: #FFFFCC">
                <asp:RegularExpressionValidator ID="followUpDateRegularExpressionValidator" 
                    runat="server" ControlToValidate="followUpDateTextBox" 
                    ErrorMessage="Enter date in dd/MM/yyyy format" 
                    
                    ValidationExpression="([0-9]|0[0-9]|1[0-9]|2[0-9]|3[0-1])[/]([0-9]|0[0-9]|1[0-2])[/](1[9][0-9][0-9]|2[0-9][0-9][0-9])" 
                    ForeColor="Red"></asp:RegularExpressionValidator>
                </span>
            </td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:Label ID="BillIdLabel" runat="server" Text="Bill Id" Visible="False" 
                    style="font-size: medium; color: #CC0000;"></asp:Label>
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                <asp:TextBox ID="BillIdDiagnosisDetailsTextBox" runat="server" ReadOnly="True" 
                    Width="174px" Visible="False" style="font-size: medium"></asp:TextBox>
            </td>
            <td class="style2" style="background-color: #FFFFCC">
                &nbsp;</td>
            <td style="background-color: #FFFFCC">
                </span></td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #FFFFCC; color: #CC0000;">
                &nbsp;</td>
            <td class="style4" style="background-color: #FFFFCC">
                &nbsp;</td>
            <td class="style2" style="background-color: #FFFFCC">
                &nbsp;</td>
            <td style="background-color: #FFFFCC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #FFFFCC">
                <asp:Button ID="DiagnosisDetailsSaveButton" runat="server" Height="39px" Text="Save" 
                    Width="92px" onclick="DiagnosisDetailsSaveButton_Click" 
                    style="color: #000000"  />
            </td>
            <td class="style4" style="background-color: #FFFFCC">
                &nbsp;</td>
            <td class="style2" style="background-color: #FFFFCC">
                &nbsp;</td>
            <td style="background-color: #FFFFCC">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" style="height: 5px; background-color: #FFFFCC">
                </td>
            <td class="style4" style="height: 5px; background-color: #FFFFCC">
                </td>
            <td class="style2" style="height: 5px; background-color: #FFFFCC">
                </td>
            <td style="height: 5px; background-color: #FFFFCC">
                </td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <asp:Panel ID="BillingDetailsPanel" runat="server" Width="1095px" 
        Visible="False" style="margin-top: 0px">
        <table class="style5" width="127%">
            <tr>
                <td class="style6" style="width: 236px; background-color: #FFFFCC;">
                    <asp:Label ID="BillingDetailsBillId" runat="server" Text="Bill Id" 
                        Visible="False" style="background-color: #FFFFCC; color: #CC0000;"></asp:Label>
                </td>
                <td class="style8" style="background-color: #FFFFCC">
                    &nbsp;</td>
                <td style="background-color: #FFFFCC">
                    <asp:TextBox ID="BillIdTextBox" runat="server" Height="22px" 
                        Width="174px" style="background-color: #FFFFFF" ReadOnly="True" 
                        Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6" style="width: 236px; background-color: #FFFFCC;">
                    <asp:Label ID="billAmountLabel" runat="server" Text="Bill Amount" 
                        style="background-color: #FFFFCC; color: #CC0000;"></asp:Label>
                </td>
                <td class="style8" style="background-color: #FFFFCC">
                    &nbsp;</td>
                <td style="background-color: #FFFFCC">
                    <asp:TextBox ID="BillAmountTextBox" runat="server" Height="22px" 
                       
                        style="background-color: #FFFFFF" Width="174px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="BillAmountRequiredFieldValidator" 
                        runat="server" ControlToValidate="BillAmountTextBox" 
                        ErrorMessage="* Required Field" ForeColor="Red" 
                        style="background-color: #FFFFCC"></asp:RequiredFieldValidator>
                        <asp:Button ID="actualBillAmountButton" runat="server" 
                        onclick="actualBillAmountButton_Click" Text="Generate Actual Bill" 
                        Width="141px" />
                </td>
            </tr>
            <tr>
                <td class="style6" style="width: 236px; background-color: #FFFFCC;">
                    <asp:Label ID="modeOfPaymentLabel" runat="server" Text="Mode of Payment" 
                        style="background-color: #FFFFCC; color: #CC0000;"></asp:Label>
                </td>
                <td class="style8" style="background-color: #FFFFCC">
                    &nbsp;</td>
                <td style="background-color: #FFFFCC">
                    <asp:DropDownList ID="ModeOfPaymentDropDownList" runat="server" 
                        AutoPostBack="True" Height="18px" 
                        onselectedindexchanged="ModeOfPaymentDropDownList_SelectedIndexChanged" 
                        Width="174px" style="background-color: #FFFFFF" >
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Card</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style6" style="width: 236px; background-color: #FFFFCC;">
                    <asp:Label ID="CardNumberLabel" runat="server" Text="Card Number" 
                        Visible="False" style="background-color: #FFFFCC; color: #CC0000;"></asp:Label>
                </td>
                <td style="background-color: #FFFFCC">
                    &nbsp;</td>
                <td class="style8" style="background-color: #FFFFCC">
                    &nbsp;<asp:TextBox ID="CardNumberTextBox" runat="server" 
                       
                        AutoPostBack="True" Visible="False" style="background-color: #FFFFFF" 
                        Width="166px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6" style="width: 236px; background-color: #FFFFCC;">
                    &nbsp;</td>
                <td class="style8" style="background-color: #FFFFCC">
                    &nbsp;</td>
                <td style="background-color: #FFFFCC">
                    <br style="background-color: #FFFFCC" />
                </td>
            </tr>
            <tr>
                <td class="style6" style="width: 236px; background-color: #FFFFCC;">
                    <asp:Button ID="BillingDetailsSubmitButton" runat="server" Height="43px" 
                        onclick="BillingDetailsSubmitButton_Click" Text="Submit" Width="92px" 
                        style="background-color: #C0C0C0" />
                </td>
                <td class="style8" style="background-color: #FFFFCC">
                    &nbsp;</td>
                <td style="background-color: #FFFFCC">
                    &nbsp;</td>
            </tr>
        </table>
         </asp:Panel>
</asp:Content>
