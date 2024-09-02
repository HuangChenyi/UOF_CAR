<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_UimgViewer.ascx.cs" Inherits="Ede.Uof.Web.Common.DCS.UC_UimgViewer" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<style type="text/css">
.viewerCssClass{
    
    border:1px solid #ccc
}
</style>
<%--<div runat="server" id="fileHost" style="margin-left: 2px;">
            <uc1:UC_FileCenter ID="fileCenter" runat="server" ModuleName="EIP" ReadOnly="true"/>  
        </div>   --%>   
<%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="True" UpdateMode="Always">
    <ContentTemplate>--%>
        <asp:Panel ID="Panel1" runat="server"></asp:Panel>
<%--        </ContentTemplate>
     </asp:UpdatePanel>--%>
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
<script type="text/javascript">
    $(function () {
        console.log('uimgviewer call');
    });
    </script>
