<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="CDS_Lab_Grid_OrderDetail" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="訂單編號"></asp:Label>

            </td>
            <td>
                <asp:Label ID="lblOrderId" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>

    <Ede:Grid ID="Grid1" runat="server"  AutoGenerateCheckBoxColumn="false"  ></Ede:Grid>

</asp:Content>

