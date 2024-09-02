<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_HistoryRecord_Details" Title="" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Details.aspx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DataGridUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table class="PopTable" cellspacing="1">
    <tr>
       <td class="PopTableHeader" align="center" style="height: 25px"><asp:Label ID="lblTitle" runat="server" Text="更改前內容" meta:resourcekey="lblTitleResource1"></asp:Label></td> 
    </tr>
    <colgroup class="PopTableRightTD"></colgroup> 
    <tr>
        <td>
            <asp:Table ID="Table1" runat="server" meta:resourcekey="Table1Resource1" ></asp:Table>
        </td>
    </tr>
    <tr>
       <td class="PopTableHeader" align="center" style="height: 25px"><asp:Label ID="Label1" runat="server" Text="更改後內容" meta:resourcekey="Label1Resource1"></asp:Label></td> 
    </tr>
    <tr>
        <td>
            <asp:Table ID="Table2" runat="server" meta:resourcekey="Table2Resource1" ></asp:Table>
        </td>
    </tr>
</table>
</asp:Content>

