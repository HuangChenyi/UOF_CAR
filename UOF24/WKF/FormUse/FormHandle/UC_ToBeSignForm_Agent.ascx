<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_FormHandle_UC_ToBeSignForm_Agent" Codebehind="UC_ToBeSignForm_Agent.ascx.cs" %>
<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<script type="text/javascript">
    function ImageButton1_set_Agent(ViewclientID, SignclientID, taskID, siteID, nodeSeq, formVersionID) {
        var signWindowWidth = "<%=signWindowWidth%>";
    var signWindowHeight = "<%=signWindowHeight%>";

}
function lbtnDoc_set_Agent(ViewclientID, SignclientID, taskID, siteID, nodeSeq, formVersionID) {
    var signWindowWidth = "<%=signWindowWidth%>";
    var signWindowHeight = "<%=signWindowHeight%>";

}
function openDialogResult(returnValue) {
    if (typeof (returnValue) == "undefined") {
        //$("#" + SignclientID).css("cursor", "pointer").prop("disabled", false);
        return false;
    }
    return true;
}
</script>
<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="8pt" Text="待簽表單(代理)" meta:resourcekey="Label1Resource1"></asp:Label><br />
<asp:UpdatePanel id="UpdatePanel1" runat="server">
    <contenttemplate>
<Fast:Grid ID="DGFormList" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
    AutoGenerateColumns="False"  
    SkinID="HomepageBlockStyle"  Width="100%" AllowPaging="True" ShowHeader="False" OnRowDataBound="DGFormList_RowDataBound" BorderStyle="None" BorderWidth="0px" OnPageIndexChanging="DGFormList_PageIndexChanging" meta:resourcekey="DGFormListResource1" OnRowCommand="DGFormList_RowCommand">
    <Columns>
      <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                <itemtemplate>
<asp:Image runat="server" ID="Image1" meta:resourceKey="Image1Resource1"></asp:Image>



</itemtemplate>
                            </asp:TemplateField>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
            <itemtemplate>
<asp:LinkButton runat="server" ID="lbtnDocNbr" meta:resourceKey="LinkButton1Resource1" __designer:wfdid="w9"></asp:LinkButton>



</itemtemplate>
        </asp:TemplateField>

<asp:TemplateField meta:resourcekey="TemplateFieldResource3">

                                <itemtemplate>
<asp:ImageButton id="ImageButton1" runat="server"></asp:ImageButton>
</itemtemplate>
                            </asp:TemplateField>
    </Columns>
</Fast:Grid></contenttemplate>
</asp:UpdatePanel>
<asp:Label id="Label6" meta:resourcekey="Label6Resource1" Text="進行簽核" Font-Size="8pt" Font-Bold="True" runat="server" Visible="False"></asp:Label>