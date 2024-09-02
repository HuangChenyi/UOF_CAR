<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_ExportEmployeeExcel" Title="匯出人員" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ExportEmployeeExcel.aspx.cs" %>

<%@ Register Src="../../../Common/Organization/DepartmentTree.ascx" TagName="DepartmentTree"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="PopTable" cellspacing="1">

        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="lblInclude" runat="server" Text="包含" meta:resourcekey="lblIncludeResource1"></asp:Label></td>
            <td>
                <asp:CheckBox ID="cbExpire" runat="server" Text="帳號過期人員" meta:resourcekey="cbExpireResource1" />
                <asp:CheckBox ID="cbLock" runat="server" Text="帳號被鎖定人員" meta:resourcekey="cbLockResource1" />
                <asp:CheckBox ID="cbSuspend" Text="帳號被停用人員" runat="server" meta:resourcekey="cbSuspendResource1"/>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label1" runat="server" Text="選擇部門" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="vertical-align: top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="cbParttimeDep" runat="server" Checked="true" Text="包含兼任部門" meta:resourcekey="cbParttimeDepResource1"/>
                        <uc1:DepartmentTree ID="DepartmentTree1" runat="server" DisplayAllDept="true"/>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </td>
        </tr>

    </table>
    <asp:Label ID="lblExportMsg" runat="server" Text="匯出Excel" Visible="False" meta:resourcekey="lblExportMsgResource1"></asp:Label>
    <asp:Label ID="lblAccount" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblAccountResource1"></asp:Label>
    <asp:Label ID="lblName" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblNameResource1"></asp:Label>
    <asp:Label ID="lblDepName" runat="server" Text="部門" Visible="False" meta:resourcekey="lblDepNameResource1"></asp:Label>
    <asp:Label ID="lblTitleName" runat="server" Text="職級" Visible="False" meta:resourcekey="lblTitleNameResource1"></asp:Label>
    <asp:Label ID="lblFuncName" runat="server" Text="職務" Visible="False" meta:resourcekey="lblFuncNameResource1"></asp:Label>
    <asp:Label ID="lblSex" runat="server" Text="性別" Visible="False" meta:resourcekey="lblSexResource1"></asp:Label>
    <asp:Label ID="lblBirthday" runat="server" Text="生日" Visible="False" meta:resourcekey="lblBirthdayResource1"></asp:Label>
    <asp:Label ID="lblArrive" runat="server" Text="到職日" Visible="False" meta:resourcekey="lblArriveResource1"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" Text="電子郵件" Visible="False" meta:resourcekey="lblEmailResource1"></asp:Label>
    <asp:Label ID="lblMobile" runat="server" Text="手機" Visible="False" meta:resourcekey="lblMobileResource1"></asp:Label>
    <asp:Label ID="lblEmergency" runat="server" Text="緊急電話" Visible="False" meta:resourcekey="lblEmergencyResource1"></asp:Label>
    <asp:Label ID="lblExt" runat="server" Text="分機" Visible="False" meta:resourcekey="lblExtResource1"></asp:Label>
    <asp:Label ID="lblEducName" runat="server" Text="教育程度" Visible="False" meta:resourcekey="lblEducNameResource1"></asp:Label>
    <asp:Label ID="lblSuperior" runat="server" Text="部門主管" Visible="False" meta:resourcekey="lblSuperiorResource1"></asp:Label>
    <asp:Label ID="lblSigner" runat="server" Text="簽核人員" Visible="False" meta:resourcekey="lblSignerResource1"></asp:Label>
</asp:Content>

