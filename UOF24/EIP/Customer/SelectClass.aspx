<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_SelectClass" Title="選擇客戶類別" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SelectClass.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"/>
    <table>
        <tr>
            <td style="width: 100px; height: 21px">
                <asp:Label ID="Label1" runat="server" Text="客戶類別" meta:resourcekey="Label1Resource1"></asp:Label>
                <telerik:RadTreeView ID="rdclasstree"  EnableNodeTextHtmlEncoding="true" Runat="server" CheckBoxes="True"></telerik:RadTreeView>
            </td>
        </tr>
    </table>
        <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None"
            ForeColor="White" Visible="False"></asp:CustomValidator>
        <asp:Label ID="lblFail" runat="server" Text="請選擇類別" Visible="False" meta:resourcekey="lblFailResource1"></asp:Label>


           <%--檢查到這裡--%>
        <input id="hidClassIDs" type="hidden" runat="server"/>  
 </contenttemplate>

    </asp:UpdatePanel>
</asp:Content>

