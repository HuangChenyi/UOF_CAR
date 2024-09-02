<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_FileOnlinePreview.ascx.cs" Inherits="Ede.Uof.Web.WKF.Common.UC_FileOnlinePreview" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<style>
    .TdRowValign {
        vertical-align:middle;
    }
</style>
<script type="text/javascript">
    function btnViewClick(fileId) {
        var hfNeedRedirect = $("#<%=hfNeedRedirect.ClientID%>");
        hfNeedRedirect.val(fileId);
    }
</script>
<Fast:Grid ID="gridFileList" runat="server" Width="100%" EnhancePager="False" EnableTheming="true"
    PageSize="15" OnRowDataBound="gridFileList_RowDataBound" AutoGenerateCheckBoxColumn="false" ShowHeader="false"
    AutoGenerateColumns="false" AllowSorting="false" AllowPaging="false">
    <EnhancePagerSettings ShowHeaderPager="false" />
    <ExportExcelSettings AllowExportToExcel="false" DataSourceType="ObjectDataSource" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <%--為了避免enter觸發imagebuttonclick放一顆假的來阻擋--%>
                <asp:ImageButton ID="fakeone" runat="server" style="display:none" Enabled="false" />
                <asp:ImageButton ID="btnView" runat="server" Text="VIEW"></asp:ImageButton>
                <asp:Image Width="16px" ID="imgDocType" runat="server" />
                <asp:Label runat="server" ID="lblFileName"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Wrap="False" />
            <ItemStyle Width="80px" Wrap="false" />
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Label runat="server" ID="lblUploader"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Wrap="False" />
            <ItemStyle Width="80px" Wrap="false" CssClass="TdRowValign" />
        </asp:TemplateField>
    </Columns>
</Fast:Grid>
<asp:HiddenField ID="hfNeedRedirect" runat="server" />
<asp:HiddenField ID="hfFormId" runat="server" />
<asp:HiddenField ID="hfFormVersionId" runat="server" />
<asp:HiddenField ID="hfEnableSave" runat="server" />
<asp:HiddenField ID="hfDocNbr" runat="server" />
<asp:HiddenField ID="hfRawUrl" runat="server" />