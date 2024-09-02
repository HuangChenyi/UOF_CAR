<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="AuthoritySetting.aspx.cs" Inherits="System_Report_AuthoritySetting" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <telerik:RadTreeView ID="rtvTreeRoleViewer" runat="server" OnNodeClick="rtvTreeRoleViewer_NodeClick" meta:resourcekey="rtvTreeRoleViewerResource1"></telerik:RadTreeView>
    <asp:Label ID="lblRoleList" runat="server" Text="角色列表" Visible="False" meta:resourcekey="lblRoleListResource1" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="uplViewer" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%" class="PopTable" cellspacing="1">
                <tr>
                    <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">
                        <asp:Label ID="lblRole" runat="server" Text="角色說明：" meta:resourcekey="lblRoleResource1"></asp:Label>
                        <asp:Label ID="lblRoleDesc" runat="server" meta:resourcekey="lblRoleDescResource1"></asp:Label>
                    </td>
                     <asp:Label ID="lblSystemAnalysisMsg" runat="server" Visible="False" Text="被設定為系統使用分析瀏覽者，可瀏覽所有系統使用統計分析資料。" meta:resourcekey="lblSystemAnalysisMsgResource1"/>
                     <asp:Label ID="lblWKFAnalysisMsg" runat="server" Visible="False" Text="被設定為電子簽核分析瀏覽者，可瀏覽所有電子簽核統計分析資料。" meta:resourcekey="lblWKFAnalysisMsgResource1"/>
                     <asp:Label ID="lblEmployeeAnalysisMsg" runat="server" Visible="False" Text="被設定為人力資源分析瀏覽者，可瀏覽所有人力資源統計分析資料。" meta:resourcekey="lblEmployeeAnalysisMsgResource1"/>
                     <asp:Label ID="lblDMSAnalysisMsg" runat="server" Visible="False" Text="被設定為文件管理分析瀏覽者，可瀏覽所有文件管理統計分析資料。" meta:resourcekey="lblDMSAnalysisMsgResource1"/>
                     <asp:Label ID="lblForumAnalysisMsg" runat="server" Visible="False" Text="被設定為討論區分析瀏覽者，可瀏覽所有討論區統計分析資料。" meta:resourcekey="lblForumAnalysisMsgResource1"/>
                </tr>
                <tr>
                    <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">
                        <uc1:UC_ChoiceList ID="UC_ChoiceListViewer1" runat="server" />
                        <asp:Label ID="lblNoManagerMsg" runat="server" meta:resourcekey="lblNoManagerMsgResource1" Text="沒有設定人員" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0; width: 100%">
                        <table width="100%" class="PopTable">
                            <tr>
                                <td class="PopTableHeader" style="text-align: center; padding: 0;">
                                    <center>
                                      <asp:Label ID="Label2" runat="server" Text="可使用功能列表" meta:resourcekey="Label2Resource1"/>
                                    </center>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
             <Ede:Grid ID="analysisAuthGrid" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                      DefaultSortDirection="Descending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15"
                      Width="100%" CustomDropDownListPage="False" AutoGenerateColumns="False" meta:resourcekey="analysisAuthGridResource1" SelectedRowColor="" UnSelectedRowColor="" OnRowDataBound="analysisAuthGrid_RowDataBound">
                <EnhancePagerSettings ShowHeaderPager="False"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="功能名稱" meta:resourcekey="TemplateField01Resource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FUNC_NAME") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
            <asp:Label ID="lblWKF_Analysis_Viewer" runat="server" Text="電子簽核分析瀏覽者" Visible="False" meta:resourcekey="lblWKF_Analysis_ViewerResource1" />
            <asp:Label ID="lblSystem_Analysis_Viewer" runat="server" Text="系統使用分析瀏覽者" Visible="False" meta:resourcekey="lblSystem_Analysis_ViewerResource1" />
            <asp:Label ID="lblEmployee_Analysis_Viewer" runat="server" Text="人力資源分析瀏覽者" Visible="False" meta:resourcekey="lblEmployee_Analysis_ViewerResource1" />
            <asp:Label ID="lblDMS_Analysis_Viewer" runat="server" Text="文件管理分析瀏覽者" Visible="False" meta:resourcekey="lblDMS_Analysis_ViewerResource1" />
            <asp:Label ID="lblForum_Analysis_Viewer" runat="server" Text="討論區分析瀏覽者" Visible="False" meta:resourcekey="lblForum_Analysis_ViewerResource1" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
