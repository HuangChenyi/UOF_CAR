<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_UC_ProjectManager" Codebehind="UC_ProjectManager.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<script type="text/javascript">

    function checkNumber(e, args) {
        var v = $("#<%=Grid1.ClientID%>").find(".GridItem");
        if (v.length === 0) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }


        
    }

</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

<telerik:RadButton ID="btnJoinProject" runat="server" Text="加入專案"  OnClick="btnJoinProject_Click" CausesValidation="False" meta:resourcekey="btnJoinProjectResource1"></telerik:RadButton>
<asp:CustomValidator ID="cvLblNumber" runat="server" ClientValidationFunction="checkNumber" ForeColor="Red"  ErrorMessage="專案不能為空" Display="Dynamic" Enabled="False" meta:resourcekey="cvLblNumberResource1"></asp:CustomValidator>

<Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" OnRowDataBound="Grid1_RowDataBound" AllowSorting="True"  DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15"   meta:resourcekey="Grid1Resource1" OnRowCommand="Grid1_RowCommand1" OnRowDeleting="Grid1_RowDeleting">

    <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
    <Columns>
        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <asp:LinkButton ID="lnkBtnDelete" runat="server" Text="刪除" CausesValidation="False" meta:resourcekey="lnkBtnDeleteResource1"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="PROJ_NBR" HeaderText="專案編號" meta:resourcekey="BoundFieldResource1" />
        <asp:BoundField DataField="PROJ_NAME" HeaderText="專案名稱" meta:resourcekey="BoundFieldResource2" />
        <asp:TemplateField HeaderText="專案負責人" meta:resourcekey="TemplateFieldResource2">
            <ItemTemplate>
                <asp:Label ID="lblPMID" runat="server" Text='<%# Eval("PM_RM_ID") %>' Visible="False" meta:resourcekey="lblPMIDResource1"></asp:Label>
                <asp:Label ID="lblLeaderName" runat="server" Text='<%# Eval("PM_NAME") %>' Visible="False" meta:resourcekey="lblLeaderNameResource1"></asp:Label>
                <asp:Label ID="lblLeaderNameWithLink" runat="server" Text='<%# Eval("PM_LINK") %>' meta:resourcekey="lblLeaderNameWithLinkResource1"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="專案代理人" meta:resourcekey="TemplateFieldResource3">
            <ItemTemplate>
                <asp:Label ID="lblAgentID" runat="server" Text='<%# Eval("PROJ_AGENT_RM_ID") %>' Visible="False" meta:resourcekey="lblAgentIDResource1"></asp:Label>
                <asp:Label ID="lblAgentName" runat="server" Text='<%# Eval("AGENT_NAME") %>' Visible="False" meta:resourcekey="lblAgentNameResource1"></asp:Label>
                <asp:Label ID="lblAgentNameWithLink" runat="server" Text='<%# Eval("AGENT_LINK") %>' meta:resourcekey="lblAgentNameWithLinkResource1"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="GUID" Visible="False" meta:resourcekey="TemplateFieldResource4">
            <ItemTemplate>
                <asp:Label ID="lblGUID" runat="server" Text='<%# Eval("PROJ_GUID") %>' Visible="False" meta:resourcekey="lblGUIDResource1"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</Fast:Grid>
            </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblDelNBR" runat="server" Visible="False" meta:resourcekey="lblDelNBRResource1"></asp:Label>
<asp:Label ID="lblSameProject" runat="server" Text="已加入相同專案編號" Visible="False" meta:resourcekey="lblSameProjectResource1"></asp:Label>
    <div style="display:none;">
<asp:Label ID="lblArrayNBR" runat="server" meta:resourcekey="lblArrayNBRResource1" ></asp:Label>
    </div>
<asp:Label ID="lblDelGuid" runat="server" Visible="False" meta:resourcekey="lblDelGuidResource1"></asp:Label>
<asp:Label ID="lblMappingError" runat="server" Text="無法對應主檔資訊，可能主檔資訊已被刪除" ForeColor="Red" Visible="false"></asp:Label>
<asp:TextBox ID="txtArrayNBR" runat="server" style="display:none"></asp:TextBox>
<asp:Label ID="lblNumber" runat="server" Text="專案編號" Visible="False" meta:resourcekey="lblNumberResource1"></asp:Label>
<asp:Label ID="lblName" runat="server" Text="專案名稱" Visible="False" meta:resourcekey="lblNameResource1"></asp:Label>
<asp:Label ID="lblLeader" runat="server" Text="專案負責人" Visible="False" meta:resourcekey="lblLeaderResource1"></asp:Label>
<asp:Label ID="lblAgent" runat="server" Text="專案代理人" Visible="False" meta:resourcekey="lblAgentResource1"></asp:Label>
<asp:Label ID="lblDel" runat="server" Text="確定刪除此專案編號?" Visible="False" meta:resourcekey="lblDelResource1"></asp:Label>
<asp:Label ID="lblSelect" runat="server" Text="選擇專案" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
