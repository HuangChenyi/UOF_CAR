<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SelectCopyForm" Title="選取複製表單" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SelectCopyForm.aspx.cs" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" Height="100%" Width="100%" ScrollBars="Auto"
        meta:resourcekey="Panel1Resource1">
        <table cellpadding="0" cellspacing="0" width="100%" style="height: 380px">
            <tr>
                <td class="PopTableRightTD" valign="top">&nbsp;<asp:CustomValidator ID="CustomValidator1"
                    runat="server" Display="Dynamic" ErrorMessage="請選擇欲複製的表單版本" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <telerik:RadTreeView ID="treeForm" runat="server"></telerik:RadTreeView>
                </td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>

