<%@ Page Title="設定歸檔處理者" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupArchiveUser.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.SetupArchiveUser" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagPrefix="uc1" TagName="UC_BtnChoiceOnce" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc2" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblArchiveUser" runat="server" Text="歸檔處理者" meta:resourcekey="lblArchiveUserResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <uc2:UC_ChoiceList runat="server" ID="choiceListArchiveUser" ExpandToUser="false" ShowMember="false" ShowAddToFavorite="false" />
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblDepartment" runat="server" Text="可查詢部門" meta:resourcekey="lblDepartmentResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <uc2:UC_ChoiceList runat="server" ID="choiceListDept" ChioceType="Group" ShowMember="true" ShowSubDept="true" ExpandToUser="false" />
            </td>
        </tr>
    </table>
    <asp:CustomValidator ID="cvCheckEmpty" runat="server" Display="Dynamic" ErrorMessage="請選擇部門及處理者" meta:resourcekey="cvCheckEmptyResource1"></asp:CustomValidator>
    <asp:HiddenField ID="hfFormId" runat="server" />
    <asp:HiddenField ID="hfArchiveRMID" runat="server" />
    <asp:HiddenField ID="hfIsEditing" runat="server" />
    <asp:HiddenField ID="hfIsFrom" runat="server" />
    <asp:HiddenField ID="hfScriptId" runat="server" />

</asp:Content>
