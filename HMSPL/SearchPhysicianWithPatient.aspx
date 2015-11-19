<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchPhysicianWithPatient.aspx.cs" Inherits="HMSPL.SearchPhysicianWithPatient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body style="background-color: #FFFFCC">
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="SearchPhysicianBy" runat="server" Text="Search Physician By" 
            style="color: #FF0000"></asp:Label>
        <asp:RadioButton ID="PhysicianIdRadioButton" runat="server" AutoPostBack="True" 
            GroupName="RadioButtonGroup" 
            oncheckedchanged="PhysicianIdRadioButton_CheckedChanged" Text="Physician Id" />
        <asp:RadioButton ID="PhysicianNameRadioButton" runat="server" 
            Text="Physician Name" AutoPostBack="True" GroupName="RadioButtonGroup" 
            oncheckedchanged="PhysicianNameRadioButton_CheckedChanged" />
    
    </div>
    <p>
        <asp:Label ID="physicianIdSearchLabel" runat="server" Text="Physician Id" 
            Visible="False" CssClass="style1"></asp:Label>
        <asp:DropDownList ID="PhysicianIdDropDownBox" runat="server" 
            style="margin-left: 40px" DataSourceID="SqlDataSource1" 
            DataTextField="physicianId" DataValueField="physicianId" Visible="False" 
            ValidationGroup="physicianIdGroup"  AppendDataBoundItems="True">
                    <asp:ListItem>-Select-</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
            SelectCommand="uspPhysicianIdDropDown" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="PhysicianNameSearchLabel" runat="server" Text="Physician Name" 
            Visible="False" CssClass="style1"></asp:Label>
        <asp:DropDownList ID="PhysicianNameDropDownBox" runat="server" 
            style="margin-left: 38px" DataSourceID="SqlDataSource2" 
            DataTextField="PhysicianName" DataValueField="PhysicianName" 
            Visible="False" ValidationGroup="physicianNameGroup" AutoPostBack="True" 
            onselectedindexchanged="PhysicianNameDropDownBox_SelectedIndexChanged"  
            AppendDataBoundItems="True">
                    <asp:ListItem>-Select-</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
            SelectCommand="uspPhysicianNameDropDown" 
            SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="SearchButton" runat="server" onclick="SearchButton_Click" 
            Text="Search" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
    </p>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
        SelectCommand="uspSearchPhysicianByPhysicianId" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="PhysicianIdDropDownBox" Name="PhysicianId" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="physicianIdGridView" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource4" EnableModelValidation="True" Visible="False">
        <Columns>
            <asp:BoundField DataField="PhysicianFirstName" HeaderText="PhysicianFirstName" 
                SortExpression="PhysicianFirstName" />
            <asp:BoundField DataField="PhysicianLastName" HeaderText="PhysicianLastName" 
                SortExpression="PhysicianLastName" />
            <asp:BoundField DataField="DepartmentId" HeaderText="DepartmentId" 
                SortExpression="DepartmentId" />
            <asp:BoundField DataField="EducationalQualification" 
                HeaderText="EducationalQualification" 
                SortExpression="EducationalQualification" />
            <asp:BoundField DataField="patient" HeaderText="patient" ReadOnly="True" 
                SortExpression="patient" />
            <asp:BoundField DataField="symptoms" HeaderText="symptoms" 
                SortExpression="symptoms" />
            <asp:BoundField DataField="DiagnosisProvided" HeaderText="DiagnosisProvided" 
                SortExpression="DiagnosisProvided" />
            <asp:BoundField DataField="FollowupDate" HeaderText="FollowupDate" 
                SortExpression="FollowupDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
        SelectCommand="uspSearchPhysicianByPhysicianName" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" 
                Name="PhysicianFirstName" PropertyName="Text" Type="String" 
                DefaultValue="sougata" />
            <asp:ControlParameter ControlID="Label2" 
                Name="PhysicianLastName" PropertyName="Text" Type="String" 
                DefaultValue="rakshit" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="physicianNameGridView" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource3" EnableModelValidation="True" 
        onselectedindexchanged="physicianNameGridView_SelectedIndexChanged" 
        Visible="False">
        <Columns>
            <asp:BoundField DataField="PhysicianFirstName" HeaderText="PhysicianFirstName" 
                SortExpression="PhysicianFirstName" />
            <asp:BoundField DataField="PhysicianLastName" HeaderText="PhysicianLastName" 
                SortExpression="PhysicianLastName" />
            <asp:BoundField DataField="DepartmentId" HeaderText="DepartmentId" 
                SortExpression="DepartmentId" />
            <asp:BoundField DataField="EducationalQualification" 
                HeaderText="EducationalQualification" 
                SortExpression="EducationalQualification" />
            <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" 
                SortExpression="Column1" />
            <asp:BoundField DataField="Symptoms" HeaderText="Symptoms" 
                SortExpression="Symptoms" />
            <asp:BoundField DataField="DiagnosisProvided" HeaderText="DiagnosisProvided" 
                SortExpression="DiagnosisProvided" />
            <asp:BoundField DataField="FollowupDate" HeaderText="FollowupDate" 
                SortExpression="FollowupDate" />
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
