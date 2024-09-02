<%@ Page Title="版本編號範例" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DocVerExample.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.DocVerExample" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable" style="width: 100%;">
        <tr>
            <td class="PopTableLeftTD" style="text-align: center">
            </td>
            <td class="PopTableLeftTD" style="width: 38%; text-align: center">
                <asp:Label ID="lblVarDefault" runat="server" Text="預設(取出皆異動)" meta:resourcekey="lblVarDefaultResource1"></asp:Label>
            </td>
            <td class="PopTableLeftTD" style="width: 38%; text-align: center">
                <asp:Label ID="lblVarAdvanced" runat="server" Text="進階(公佈後取出才異動)" meta:resourcekey="lblVarAdvancedResource1"></asp:Label>
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPubCheckOut" runat="server" Text="公佈後取出" meta:resourcekey="lblPubCheckOutResource1"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="1.0 → 1.1" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="text-align: center">
                <asp:Label ID="Label2" runat="server" Text="1.0 → 1.1" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCheckIn" runat="server" Text="存回" meta:resourcekey="lblCheckInResource1"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:Label ID="Label3" runat="server" Text="1.1 → 1.1" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="text-align: center">
                <asp:Label ID="Label4" runat="server" Text="1.1 → 1.1" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCheckInNOut" runat="server" Text="存回後取出" meta:resourcekey="lblCheckInNOutResource1"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:Label ID="Label5" runat="server" Text="1.1 → 1.2" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="text-align: center">
                <asp:Label ID="Label6" runat="server" Text="1.1 → 1.1" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPublic" runat="server" Text="公佈" meta:resourcekey="lblPublicResource1"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:Label ID="Label7" runat="server" Text="1.2 → 2.0" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="text-align: center">
                <asp:Label ID="Label8" runat="server" Text="1.1 → 1.1" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPubCheckOut2" runat="server" Text="公佈後取出" meta:resourcekey="lblPubCheckOut2Resource1"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:Label ID="Label9" runat="server" Text="2.0 → 2.1" meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="text-align: center">
                <asp:Label ID="Label10" runat="server" Text="1.1 → 1.2" meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
