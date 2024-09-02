<%@ Page Title="並會簽說明" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SignDirections.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.ShowSignDirections" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="lbl" runat="server" Text ="一般" meta:resourcekey="lblResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" Text ="該站點只能有一名簽核者，同意即送下一站，該簽核者否決表單即結案。" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                 <asp:Label ID="Label4" runat="server" Text ="並簽" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text ="該站點可設定多人簽核，一人簽核同意即送下一站，會依「表單維護」的並簽設定來決定是否一人否決即可結案。" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
        </tr>
      <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text ="會簽" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                   <asp:Label ID="Label3" runat="server" Text ="該站點可設定多人簽核，全部簽核者同意才送下一站，一位簽核者否決即結案。" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
