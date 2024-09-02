<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_UC_FieldCultureCollection" Codebehind="UC_FieldCultureCollection.ascx.cs" %>
<%@ Register src="UC_FieldCulture.ascx" tagname="UC_FieldCulture" tagprefix="uc1" %>
<%@ Register src="UC_FieldDataListCulture.ascx" tagname="UC_FieldDataListCulture" tagprefix="uc2" %>
<%@ Register src="UC_DataListCulture.ascx" tagname="UC_DataListCulture" tagprefix="uc3" %>
<%@ Register src="UC_DataGridCulture.ascx" tagname="UC_DataGridCulture" tagprefix="uc4" %>


<script>
    function ViewForm(Culture)
    {
        var data = ['<%= FieldCultureXmlForJs %>'];
        var fileName = $uof.pageMethod.syncUc("WKF/FormManagement/VersionFieldUserControl/UC_FieldCultureCollection.ascx", "SaveFile", data);

        $("#<%=hfFileName.ClientID%>").val(fileName);
       var formVersionId = '<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formVersionId"], true) %>'
        var temp = fileName;
        $uof.dialog.open2("~/WKF/FormManagement/ViewForm.aspx", "", "", 800, 600, function () { return false; },
            {
                "FileName": temp,
                "Culture": Culture,
                "formVersionId": formVersionId
            });
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Table ID="Table1" runat="server" width="100%" meta:resourcekey="Table1Resource1"></asp:Table>
        <asp:Label ID="lblDefault" runat="server" Text="還原" Visible="false"  meta:resourcekey="lblDefaultResource1"></asp:Label>
        <asp:Label ID="lblView" runat="server" Text="預覽" Visible="false"  meta:resourcekey="lblViewResource1"></asp:Label>
        <asp:Label ID="lblEnable" runat="server" Text="啟用" Visible="false"  meta:resourcekey="lblEnableResource1"></asp:Label>
        <asp:Label ID="lblDisable" runat="server" Text="停用" Visible="false"  meta:resourcekey="lblDisableResource1"></asp:Label>
        <asp:Label ID="lblDefalutCulture" runat="server" Text="預設語系" Visible="false" meta:resourcekey="lblDefalutCultureResource1"></asp:Label>
        <asp:HiddenField runat="server" ID="hfFileName"></asp:HiddenField>
    </ContentTemplate>
</asp:UpdatePanel>
 
