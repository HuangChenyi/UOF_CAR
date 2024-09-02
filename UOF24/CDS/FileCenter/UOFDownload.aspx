<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="UOFDownload.aspx.cs" Inherits="CDS_Utility_UOFDownload" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table>

        <tr>
            <td>
                <asp:TextBox ID="txtFileGroupID" runat="server"></asp:TextBox>
                <asp:Button ID="btnDownload" runat="server" Text="Download" OnClick="btnDownload_Click" />
            </td>
          

        </tr>
        
    </table>

</asp:Content>

