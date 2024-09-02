<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_ExportMemberExcel"
    Title="匯出人員" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ExportMemberExcel.aspx.cs" %>

<%@ Register Src="../../../Common/Organization/UC_GroupManagerTree.ascx" TagName="UC_GroupManagerTree"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" class="PopTable" cellspacing="1">

                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblInclude" runat="server" Text="包含" meta:resourcekey="lblIncludeResource1"></asp:Label>
                    </td>
                    <td >
                        <asp:CheckBox ID="cbExpire" runat="server" Text="帳號過期人員" meta:resourcekey="cbExpireResource1" />
                        <asp:CheckBox ID="cbLock" runat="server" Text="帳號被鎖定人員" meta:resourcekey="cbLockResource1" />
                        <asp:CheckBox ID="cbSuspend" runat="server" Text="帳號被停用人員" meta:resourcekey="cbSuspendResource1"/>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label1" runat="server" Text="選擇群組" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td style=" vertical-align:top">
                        <uc1:UC_GroupManagerTree ID="GroupTree1" runat="server" ></uc1:UC_GroupManagerTree>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblExportMsg" runat="server" Text="匯出Excel" Visible="False" meta:resourcekey="lblExportMsgResource1"></asp:Label>
            <asp:Label ID="lblAccount" runat="server" Text="帳號" Visible="False" meta:resourcekey="lblAccountResource1"></asp:Label>
            <asp:Label ID="lblName" runat="server" Text="姓名" Visible="False" meta:resourcekey="lblNameResource1"></asp:Label>
            <asp:Label ID="lblGroupName" runat="server" Text="群組" Visible="False" meta:resourcekey="lblGroupNameResource1"></asp:Label>
            <asp:Label ID="lblSex" runat="server" Text="性別" Visible="False" meta:resourcekey="lblSexResource1"></asp:Label>
            <asp:Label ID="lblBirthday" runat="server" Text="生日" Visible="False" meta:resourcekey="lblBirthdayResource1"></asp:Label>
            <asp:Label ID="lblEmail" runat="server" Text="電子郵件" Visible="False" meta:resourcekey="lblEmailResource1"></asp:Label>
            <asp:Label ID="lblExt" runat="server" Text="分機" Visible="False" meta:resourcekey="lblExtResource1"></asp:Label>
            <asp:Label ID="lblCompName" runat="server" Text="公司名稱" Visible="False" meta:resourcekey="lblCompNameResource1"></asp:Label>
            <asp:Label ID="lblCompSerial" runat="server" Text="公司統一編號" Visible="False" meta:resourcekey="lblCompSerialResource1"></asp:Label>
            <asp:Label ID="lblCompAdd" runat="server" Text="公司地址" Visible="False" meta:resourcekey="lblCompAddResource1"></asp:Label>
            <asp:Label ID="lblCompFax" runat="server" Text="公司傳真" Visible="False" meta:resourcekey="lblCompFaxResource1"></asp:Label>
            <asp:Label ID="lblClass" runat="server" Text="類別" Visible="False" meta:resourcekey="lblClassResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
