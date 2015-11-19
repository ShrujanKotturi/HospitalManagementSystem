<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddPhysician1.aspx.cs" Inherits="HMSPL.AddPhysician1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageContent" runat="server">
<div style="background-color: #FFFFCC">
    
        <asp:Label ID="SearchPhysicianBy" runat="server" Text="Search Physician By" 
            style="color: #FF0000"></asp:Label>
        <asp:RadioButton ID="PhysicianIdRadioButton" runat="server" AutoPostBack="True" 
            GroupName="RadioButtonGroup" 
            oncheckedchanged="PhysicianIdRadioButton_CheckedChanged" Text="Physician Id" />
        <asp:RadioButton ID="PhysicianNameRadioButton" runat="server" 
            Text="Physician Name" AutoPostBack="True" GroupName="RadioButtonGroup" 
            oncheckedchanged="PhysicianNameRadioButton_CheckedChanged" />
    
    </div>
    <p style="background-color: #FFFFCC">
        <asp:Label ID="physicianIdSearchLabel" runat="server" Text="Physician Id" 
            Visible="False" CssClass="style1" 
            style="color: #CC0000; background-color: #FFFFCC"></asp:Label>
        <asp:DropDownList ID="PhysicianIdDropDownBox" runat="server" 
            style="margin-left: 40px; background-color: #FFFFFF;" DataSourceID="SqlDataSource1" 
            DataTextField="physicianId" DataValueField="physicianId" Visible="False" 
            ValidationGroup="physicianIdGroup"  AppendDataBoundItems="True">
                    <asp:ListItem>-Select-</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HMSDBConnectionString3 %>" 
            SelectCommand="uspPhysicianIdDropDown" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </p>
    <p style="background-color: #FFFFCC">
        <asp:Label ID="PhysicianNameSearchLabel" runat="server" Text="Physician Name" 
            Visible="False" CssClass="style1" 
            style="color: #CC0000; background-color: #FFFFCC"></asp:Label>
        <asp:DropDownList ID="PhysicianNameDropDownBox" runat="server" 
            style="margin-left: 38px; background-color: #FFFFFF;" DataSourceID="SqlDataSource2" 
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
    <p style="background-color: #FFFFCC">
        <asp:Button ID="SearchButton" runat="server" onclick="SearchButton_Click" 
            Text="Search" style="background-color: #FFFFFF" />
        &nbsp;<asp:Label ID="Label1" runat="server" Text="Label" Visible="False" 
            style="background-color: #FFFFCC"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" 
            style="background-color: #FFFFCC"></asp:Label>
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
        DataSourceID="SqlDataSource4" EnableModelValidation="True" Visible="False" 
        style="background-color: #FFFFCC">
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
       
        Visible="False" style="background-color: #FFFFCC">
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
</asp:Content>
