<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_DMSUimgViewer.ascx.cs" Inherits="Ede.Uof.Web.DMS.WKFOptionalFields.UC_DMSUimgViewer" %>
<style type="text/css">
.viewerCssClass{
    
    border:1px solid #ccc
}
</style>
<asp:HiddenField ID="hdnWidthPercentage" runat="server" Value="false" />
<asp:HiddenField ID="hdnWidth" runat="server" Value="0" />
<asp:HiddenField ID="hdnHeightPercentage" runat="server" Value="false" />
<asp:HiddenField ID="hdnNumberOfPages" runat="server" Value="0" />
<asp:HiddenField ID="hdnUgWidth" runat="server" Value="0" />
<asp:HiddenField ID="hdnUgHeight" runat="server" Value="0" />
<asp:HiddenField ID="hdnHeight" runat="server" Value="0" />
<asp:HiddenField ID="hdnDcsRegistrable" runat="server" />
<asp:HiddenField ID="hdnSourceXpsId" runat="server" /> 
<asp:HiddenField ID="hdnSourceUgId" runat="server" /> 
<asp:HiddenField ID="hdnXpsWidth" runat="server" Value="0" />
<asp:HiddenField ID="hdnXpsHeight" runat="server" Value="0" />
<asp:HiddenField ID="hdnDefaultRatio" runat="server" Value="1" />
<asp:HiddenField ID="hdnHideUGDiv" runat="server" Value="false" />
<asp:HiddenField ID="hdnIsMobile" runat="server" value="false"/>