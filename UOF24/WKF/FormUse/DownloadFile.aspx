<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_DownloadFile" Codebehind="DownloadFile.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function NoAuth()
        {
            $('#' + '<%=Button1.ClientID%>').click();
        }
    </script>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <asp:Label ID="lblNoAuth" runat="server" Text="無下載權限" Visible="false"></asp:Label>
</asp:Content>

