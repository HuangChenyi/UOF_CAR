<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_SiteSignInfo" Title="觀看流程" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SiteSignInfo.aspx.cs" %>
<%@ Register Src="TaskSiteSignInfo/UC_TaskSiteRecord.ascx" TagName="UC_TaskSiteRecord" TagPrefix="uc1" %>
<%@ Register src="ViewResponsibleLog.ascx" tagname="ViewResponsibleLog" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1">
        <Tabs>
            <telerik:RadTab runat="server" Text="觀看表單簽核歷程" meta:resourcekey="igtabTable1Resource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="觀看狀態變更記錄" meta:resourcekey="igtabTable2Resource1">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="RadPageView1" runat="server">
            <uc1:UC_TaskSiteRecord id="UC_TaskSiteRecord1" runat="server"></uc1:UC_TaskSiteRecord>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server">
            <uc2:ViewResponsibleLog ID="ViewResponsibleLog2" runat="server" />     
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    
<asp:Label ID="lblNodata" runat="server" Text="表單已被刪除，無法找到表單相關資訊" Visible="False" meta:resourcekey="lblNodataResource1"></asp:Label>
</asp:Content>

