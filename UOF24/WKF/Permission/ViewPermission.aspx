<%@ Page Title="" Language="C#" MasterPageFile="~/Master/OneColumn.master" AutoEventWireup="true" CodeBehind="ViewPermission.aspx.cs" Inherits="Ede.Uof.Web.WKF.Permission.ViewPermission" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/WKF/Permission/RolePermission.ascx" TagPrefix="uc1" TagName="RolePermission" %>
<%@ Register Src="~/WKF/Permission/DownloadExportPermission.ascx" TagPrefix="uc1" TagName="DownloadExportPermission" %>
<%@ Register Src="~/WKF/Permission/UserPermission.ascx" TagPrefix="uc1" TagName="UserPermission" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal"
        Width="100%" PanesBorderSize="0" Height="100%"
        BorderSize="0" LiveResize="True" FullScreenMode="True" meta:resourcekey="Radsplitter1Resource1" SplitBarsSize="">
        <telerik:RadPane ID="toolbarPane" runat="server" Height="26px" Locked="True" Index="0" meta:resourcekey="toolbarPaneResource1">
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" Width="100%" meta:resourcekey="RadTabStrip1Resource1" >
                <Tabs>
                    <telerik:RadTab runat="server" Selected="True" meta:resourcekey="RadTabResource1">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" meta:resourcekey="RadTabResource2">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" meta:resourcekey="RadTabResource3">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
        </telerik:RadPane>
        <telerik:RadPane ID="RadPane2" runat="server" Index="1" meta:resourcekey="RadPane2Resource1">
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="100%" meta:resourcekey="RadMultiPage1Resource1">
                <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1" Selected="True">
                    <uc1:UserPermission runat="server" id="UserPermission" />
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource1">
                    <uc1:RolePermission runat="server" id="RolePermission" />
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource1">
                    <uc1:DownloadExportPermission runat="server" id="DownloadExportPermission" />
                </telerik:RadPageView>
            </telerik:RadMultiPage>
            <asp:Label ID="lblPerson" runat="server" Text="依人員" Visible="False" meta:resourcekey="lblPersonResource1" ></asp:Label>
            <asp:Label ID="lblRole" runat="server" Text="依角色" Visible="False" meta:resourcekey="lblRoleResource1" ></asp:Label>
            <asp:Label ID="lblDownload" runat="server" Text="下載匯出報表" Visible="False" meta:resourcekey="lblDownloadResource1" ></asp:Label>
        </telerik:RadPane>
    </telerik:RadSplitter>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    
</asp:Content>
