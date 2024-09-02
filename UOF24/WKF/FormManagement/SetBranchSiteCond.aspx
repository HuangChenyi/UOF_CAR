<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetBranchSiteCond" Title="分岔條件設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetBranchSiteCond.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" cellpadding="0" cellspacing="0" height="490" width="100%">
        <tr>
            <td align="center" height="20" style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
                height: 27px">
                <asp:Label ID="Label2" runat="server" Text="判斷條件" meta:resourcekey="Label2Resource1"></asp:Label><asp:CustomValidator
                    ID="CustomValidatorCondition" runat="server" Display="Dynamic" ErrorMessage="請選擇判斷條件" meta:resourcekey="CustomValidatorConditionResource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td class="PopTableRightTD" valign="top" width="54%">
                <asp:Panel ID="Panel1" runat="server" Height="100%" ScrollBars="Auto" meta:resourcekey="Panel1Resource1">
                    <telerik:RadTreeView ID="treeCondition" runat="server" Width="100%">
                    </telerik:RadTreeView>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

