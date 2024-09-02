<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Setting_QueryUserSetting" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryUserSetting.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table class="PopTable">
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label1" runat="server" Text="專案" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblProjName" runat="server" Text="EB7.30出版" meta:resourcekey="lblProjNameResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label2" runat="server" Text="可以查詢的人員" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
               <uc1:UC_ChoiceList ID="ucChoiceViewer" runat="server" ExpandToUser="false" />
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidMode" runat="server" />
</asp:Content>

