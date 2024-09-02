<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CalendarLink.aspx.cs" Inherits="Ede.Uof.Web.Basic.Personal.Information.CalendarLink" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        Sys.Application.add_load(function () {

            $("#<%=input1.ClientID%>").focus();
            $("#<%=input1.ClientID%>").select();
        });
    </script>
    <table class="PopTable" style="width:100%;">
        <tr>
            <td class="PopTableHeader" style="text-align:center!important;">
                <asp:Label ID="Label1" runat="server" Text="行事曆連結" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center!important;">
                <asp:TextBox ID="input1" runat="server" Width="100%"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
