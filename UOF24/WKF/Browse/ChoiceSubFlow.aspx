<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Browse_ChoiceSubFlow" Title="選擇副流程" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChoiceSubFlow.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="text-align: center">
<br />
    <table border="0" cellpadding="0" cellspacing="0" width="60%">
        <tr>
            <td align="center">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ForeColor="Blue" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td align="center">
                <telerik:RadTreeView ID="treeSubFlow" runat="server"></telerik:RadTreeView>
            </td>
        </tr>
    </table>
   
    </div>
    <asp:Label ID="lblError" runat="server" meta:resourcekey="lblErrorResource1" Text="錯誤!請選擇流程!"
        Visible="False"></asp:Label>
</asp:Content>

