<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PhysicianSearch.aspx.cs" Inherits="HMSPL.WebForm2" %>
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
    <table style="width: 127%">
        <tr>
            <td style="width: 290px; background-color: #FFFFCC;">
                &nbsp;</td>
            <td style="width: 502px; background-color: #FFFFCC;">
                &nbsp;</td>
            <td style="background-color: #FFFFCC; width: 404px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 290px; background-color: #FFFFCC;">
                <asp:Label ID="state" runat="server" Text="Physician State" 
                    style="color: #CC0000; font-weight: 700"></asp:Label>
            </td>
            <td style="width: 502px; background-color: #FFFFCC;">
                <asp:DropDownList ID="searchPhysicianStateDropDownList" runat="server" 
                    Height="22px" Width="121px" DataSourceID="SqlDataSource1" 
                    DataTextField="StateName" DataValueField="StateId" AutoPostBack="True"
                    AppendDataBoundItems="true">
                    <asp:ListItem>-Select-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspGetStateInfo" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <br />
                <br />
            </td>
            <td style="background-color: #FFFFCC; width: 404px;">
                <asp:RequiredFieldValidator ID="physicianSearchRequiredFieldValidator" 
                    runat="server" ControlToValidate="searchPhysicianStateDropDownList" 
                    ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 290px; background-color: #FFFFCC;">
                <asp:Label ID="physicianPlan" runat="server" Text="Plan" 
                    style="font-weight: 700; color: #CC0000"></asp:Label>
            </td>
            <td style="width: 502px; background-color: #FFFFCC;">
                <asp:DropDownList ID="searchPhysicianPlanDropDownList" runat="server" 
                    Height="22px" Width="121px" DataSourceID="SqlDataSource2" 
                    DataTextField="PlanName" DataValueField="PlanId" AutoPostBack="True" AppendDataBoundItems="true">
                    <asp:ListItem>-Select-</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspGetPlanInfo" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <br />
                <br />
            </td>
            <td style="background-color: #FFFFCC; width: 404px;">
                <asp:RequiredFieldValidator ID="PlanRequiredFieldValidator" runat="server" 
                    ControlToValidate="searchPhysicianPlanDropDownList" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 290px; background-color: #FFFFCC;">
&nbsp;<asp:Label ID="department" runat="server" Text="Department" 
                    style="font-weight: 700; color: #CC0000"></asp:Label>
            </td>
            <td style="width: 502px; background-color: #FFFFCC;">
                <asp:DropDownList ID="searchPhysicianDepartmentDropDownList" runat="server" 
                    AutoPostBack="True" Height="22px" Width="122px" 
                    DataSourceID="SqlDataSource3" DataTextField="Dept" 
                    DataValueField="DepartmentId" AppendDataBoundItems="true">
                    <asp:ListItem>-Select-</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="background-color: #FFFFCC; width: 404px;">
                <asp:RequiredFieldValidator ID="stateRequiredFieldValidator3" runat="server" 
                    ControlToValidate="searchPhysicianDepartmentDropDownList" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="height: 23px; width: 290px; background-color: #FFFFCC;">
            </td>
            <td style="height: 23px; width: 502px; background-color: #FFFFCC;">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspGetDepartmentInfo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
            </td>
            <td style="height: 23px; background-color: #FFFFCC; width: 404px;">
            </td>
        </tr>
        <tr>
            <td style="width: 290px; height: 101px; background-color: #FFFFCC;">
                <asp:Button ID="SearchPhysicianButton" runat="server" onclick="SearchPhysicianButton_Click" 
                    Text="Search" />
            </td>
            <td style="width: 502px; height: 101px; background-color: #FFFFCC;">
&nbsp;<asp:Button ID="resetPhysicianButton" runat="server" Text="Reset" 
                    Width="69px" onclick="resetPhysicianButton_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="EditButton" runat="server" Text="Edit" 
                    onclick="EditButton_Click" />
                <br />
                <br />
            </td>
            <td style="height: 101px; background-color: #FFFFCC; width: 404px;">
                &nbsp;</td>
        </tr>
       </table>
      <table style="width: 127%"> 
        <tr>
            <td style="width: 1290px; height: 101px; background-color: #FFFFCC;">

                <asp:GridView ID="PhysicianGrid" runat="server" BackColor="#FFFFCC" 
                    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    EnableModelValidation="True">
                    <EmptyDataTemplate>
                        No data found<br />
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                </asp:GridView>

            </td>
           
        </tr>
      </table>
     <table style="width: 127%">  
        <tr>
            <td style="width: 290px; height: 101px; background-color: #FFFFCC;">
                <asp:Label ID="phyIdLabel" runat="server" 
                    style="font-weight: 700; color: #CC0000" Text="PhysicianId" 
                    Visible="False"></asp:Label>
            </td>
            <td style="width: 502px; height: 101px; background-color: #FFFFCC;">
                <asp:DropDownList ID="PhysicianIdDropDownList" runat="server" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspGetPhysicianId" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
            <td style="height: 101px; background-color: #FFFFCC; width: 404px;">
                &nbsp;</td>
        </tr>      
        <tr>
            <td style="width: 290px; height: 101px; background-color: #FFFFCC;">
                <asp:Button ID="updateButton" runat="server" Text="update" 
                    onclick="updateButton_Click" Visible="False" />
            </td>
            <td style="width: 502px; height: 101px; background-color: #FFFFCC;">
                &nbsp;</td>
            <td style="height: 101px; background-color: #FFFFCC; width: 404px;">
                &nbsp;</td>
        </tr>      
        <tr>
            <td style="width: 290px; height: 101px; background-color: #FFFFCC;">
                <asp:Label ID="phyDepartmentLabel" runat="server" 
                    style="font-weight: 700; color: #CC0000" Text="Physician Department" 
                    Visible="False"></asp:Label>
            </td>
            <td style="width: 502px; height: 101px; background-color: #FFFFCC;">
                <asp:DropDownList ID="phyDepartmentDropDownList" runat="server" 
                    DataSourceID="SqlDataSource5" DataTextField="Dept" 
                    DataValueField="DepartmentId" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspGetDepartmentInfo" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
            <td style="height: 101px; background-color: #FFFFCC; width: 404px;">
                &nbsp;</td>
        </tr>      
        <tr>
            <td style="width: 290px; height: 101px; background-color: #FFFFCC;">
                <asp:Label ID="phyPlanLabel" runat="server" 
                    style="font-weight: 700; color: #CC0000" Text="Physician Plan" 
                    Visible="False"></asp:Label>
            </td>
            <td style="width: 502px; height: 101px; background-color: #FFFFCC;">
                <asp:DropDownList ID="phyPlanDropDownList" runat="server" 
                    DataSourceID="SqlDataSource6" DataTextField="PlanName" 
                    DataValueField="PlanId" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspGetPlanInfo" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
            <td style="height: 101px; background-color: #FFFFCC; width: 404px;">
                &nbsp;</td>
        </tr>      
        <tr>
            <td style="width: 290px; height: 101px; background-color: #FFFFCC;">
                <asp:Label ID="phyStateLabel" runat="server" 
                    style="font-weight: 700; color: #CC0000" Text="Physician State" 
                    Visible="False"></asp:Label>
            </td>
            <td style="width: 502px; height: 101px; background-color: #FFFFCC;">
                <asp:DropDownList ID="phyStateDropDownList" runat="server" 
                    DataSourceID="SqlDataSource7" DataTextField="StateName" 
                    DataValueField="StateId" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
                    SelectCommand="uspGetStateInfo" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </td>
            <td style="height: 101px; background-color: #FFFFCC; width: 404px;">
                &nbsp;</td>
        </tr>      
        <tr>
            <td style="width: 290px; height: 101px; background-color: #FFFFCC;">
                <asp:Label ID="educationalQualificationLabel" runat="server" 
                    style="font-weight: 700; color: #CC0000" Text="Educational Qualification" 
                    Visible="False"></asp:Label>
            </td>
            <td style="width: 502px; height: 101px; background-color: #FFFFCC;">
                <asp:TextBox ID="educationalQualificationTextBox" runat="server" 
                    Visible="False"></asp:TextBox>
            </td>
            <td style="height: 101px; background-color: #FFFFCC; width: 404px;">
                <asp:RequiredFieldValidator ID="eQRequiredFieldValidator" runat="server" 
                    ControlToValidate="educationalQualificationTextBox" 
                    ErrorMessage="Compulsory Field" ValidationGroup="validate1"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="educationalQualificationTextBox" 
                    ErrorMessage="Only Alphabets" ValidationExpression="([a-zA-Z\s]*)"></asp:RegularExpressionValidator>
            </td>
        </tr>      
        <tr>
            <td style="width: 290px; height: 101px; background-color: #FFFFCC;">
                <asp:Label ID="yearsOfExperienceLabel" runat="server" 
                    style="font-weight: 700; color: #CC0000" Text="Years Of Experience" 
                    Visible="False"></asp:Label>
            </td>
            <td style="width: 502px; height: 101px; background-color: #FFFFCC;">
                <asp:TextBox ID="yearsOfExperienceTextBox" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td style="height: 101px; background-color: #FFFFCC; width: 404px;">
                <asp:RequiredFieldValidator ID="yOFRequiredFieldValidator" runat="server" 
                    ControlToValidate="yearsOfExperienceTextBox" ErrorMessage="Compulsory Field" 
                    ValidationGroup="validate1"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RegularExpressionValidator ID="yOFRegularExpressionValidator" 
                    runat="server" ControlToValidate="yearsOfExperienceTextBox" 
                    ErrorMessage="Only Numbers"></asp:RegularExpressionValidator>
            </td>
        </tr>      
        <tr>
            <td style="width: 290px; height: 101px; background-color: #FFFFCC;">
                <asp:Button ID="savePhysicianUpdateButton" runat="server" Text="Save" 
                    ValidationGroup="validate1" onclick="savePhysicianUpdateButton_Click1" 
                    Visible="False" />
            </td>
            <td style="width: 502px; height: 101px; background-color: #FFFFCC;">
                &nbsp;</td>
            <td style="height: 101px; background-color: #FFFFCC; width: 404px;">
                &nbsp;</td>
        </tr>      
    </table>
    <table style="width: 127%">
        
    </table>

</asp:Content>
