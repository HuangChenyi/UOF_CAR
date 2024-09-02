<%@ Control Language="C#" AutoEventWireup="true" Inherits="Master_UC_SiteMap" Codebehind="UC_SiteMap.ascx.cs" %>

<script id="UC_SiteMap" type="text/javascript">
    
    function ClearSiteMapNode()
    {
        document.getElementById("divMasterSiteMap").innerHTML = '';
    }  
   
    function AddSiteMapNode(nodeName)
    {
        var node = "&raquo; <span>" + nodeName + "</span>";
        var currentSiteMap = document.getElementById("divMasterSiteMap").innerHTML;
        document.getElementById("divMasterSiteMap").innerHTML =  currentSiteMap + node;
    }  
    
    function AddSiteMapNodeWithLink(nodeName, linkUrl)
    {
        var node = "&raquo; <a class='d' href='" + linkUrl + "'>" + nodeName + "</a>";
        var currentSiteMap = document.getElementById("divMasterSiteMap").innerHTML;
        document.getElementById("divMasterSiteMap").innerHTML =  currentSiteMap + node;
    }  
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>
<table><tr>
<td style="white-space:nowrap;"><asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder></td>
<td ><div id="divMasterSiteMap"><asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder></div></td>
</tr></table>
    </contenttemplate>
</asp:UpdatePanel>


