<%@ Page Title="複製目錄連結" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocUrlCopy" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DocUrlCopy.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        Sys.Application.add_load(function ()
        {
            var txtUrl = $('#<%=txtUrl.ClientID%>');
        });

    </script>

    <table class="PopTable" style="width:100%;">
        <tr>
            <td class="PopTableHeader" style="text-align:center!important;">
                <asp:Label ID="lblType" runat="server" Text="Label" meta:resourcekey="lblTypeResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableRightTD" style="height:40px;">
                <asp:TextBox ID="txtUrl" runat="server" Width="100%" meta:resourcekey="txtUrlResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblDoc" runat="server" Text="文件連結" Visible="False" meta:resourcekey="lblDocResource1"></asp:Label>
    <asp:Label ID="lblFolder" runat="server" Text="目錄連結" Visible="False" meta:resourcekey="lblFolderResource1"></asp:Label>
</asp:Content>

