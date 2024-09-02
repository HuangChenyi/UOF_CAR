<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_hiddenFieldUC" Codebehind="hiddenFieldUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<script type="text/javascript">
function <%=getFuncName%>()
{
    return "<%=this.hiddenField.ClientID%>";
}
</script>

<asp:TextBox ID="tbx_hidden" runat="server" Visible="False" 
    meta:resourcekey="tbx_hiddenResource1"></asp:TextBox>
<asp:HiddenField ID="hiddenField" runat="server" />
