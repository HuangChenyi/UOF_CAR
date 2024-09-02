<%@ Page Language="C#" Title="人員欄位設定" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Config_UserColumn" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" Codebehind="UserColumn.aspx.cs" %>

<%@ Register Src="EmployeeColumn.ascx" TagName="EmployeeColumn" TagPrefix="uc1" %>
<%@ Register Src="MemberColumn.ascx" TagName="MemberColumn" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server"  SelectedIndex="0" OnTabClick="RadTabStrip1_TabClick">
        <Tabs>
            <telerik:RadTab runat="server" Value="EmpColumnTab" Selected="true" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="MemColumnTab">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="EmpColumnRmp" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="EmpPageView" runat="server" Selected="true">
            <uc1:EmployeeColumn runat="server" ID="EmployeeColumn" />
        </telerik:RadPageView>
    </telerik:RadMultiPage>

     <telerik:RadMultiPage ID="MemberColumnRmp" runat="server" SelectedIndex="0" Visible="false">
        <telerik:RadPageView ID="MemPageView" runat="server" Selected="true">
            <uc2:MemberColumn runat="server" ID="MemberColumn"/>
        </telerik:RadPageView>
    </telerik:RadMultiPage>

    <asp:Label ID="Label1" runat="server" Text="內部員工欄位維護" meta:resourcekey="Label1Resource2" Visible="false"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="外部會員欄位維護" meta:resourcekey="Label2Resource2" Visible="false"></asp:Label>
</asp:Content>
