<%@ Page Title="設定表單查閱者" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupReaderUser.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.SetupReaderUser" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc2" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblFormReader" runat="server" Text="表單查閱者" meta:resourcekey="lblFormReaderResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <uc2:UC_ChoiceList runat="server" ID="choiceListReaderUser" ExpandToUser="false" ShowMember="false" ShowAddToFavorite="false" />
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblDepartment" runat="server" Text="可查詢部門" meta:resourcekey="lblDepartmentResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <uc2:UC_ChoiceList runat="server" ID="choiceListReaderDept" ChioceType="Group" ShowMember="true" ShowSubDept="true" ExpandToUser="false" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:CustomValidator ID="cvCheckDeptEmpty" runat="server" Display="Dynamic" ErrorMessage="請選擇部門" ForeColor="Red" meta:resourcekey="cvCheckDeptEmptyResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvCheckReaderEmpty" runat="server" Display="Dynamic" ErrorMessage="請選擇表單查閱者" ForeColor="Red" meta:resourcekey="cvCheckReaderEmptyResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>

    <asp:HiddenField ID="hfFormId" runat="server" />
    <asp:HiddenField ID="hfReaderRMID" runat="server" />
    <asp:HiddenField ID="hfIsEditing" runat="server" />
    <asp:HiddenField ID="hfIsFrom" runat="server" />
    <asp:HiddenField ID="hfScriptId" runat="server" />
</asp:Content>
