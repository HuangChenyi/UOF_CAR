<%@ Page Language="C#" MasterPageFile="~/Master/OneColumn.master" AutoEventWireup="true" Inherits="WKF_Admin_FormFiling" Title="歸檔查詢" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="FormFiling.aspx.cs" %>

<%@ Register Src="FilingClassQuery.ascx" TagName="FilingClassQuery" TagPrefix="uc1" %>
<%@ Register Src="FilingConditionQuery.ascx" TagName="FilingConditionQuery" TagPrefix="uc2" %>
<%@ Register Src="FilingFormExport.ascx" TagName="FilingFormExport" TagPrefix="uc3" %>
<%@ Register Src="FilingDownloadExcel.ascx" TagName="FilingDownloadExcel" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal" Width="100%" Height="100%"
        PanesBorderSize="0" BorderSize="0" LiveResize="True" ResizeWithParentPane="True" ResizeWithBrowserWindow="True">

        <telerik:RadPane ID="toolbarPane" runat="server" Height="26" Locked="true">
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" Width="100%">
                <Tabs>
                    <telerik:RadTab runat="server" Selected="True"></telerik:RadTab>
                    <telerik:RadTab runat="server"></telerik:RadTab>
                    <telerik:RadTab runat="server"></telerik:RadTab>
                    <telerik:RadTab runat="server"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
        </telerik:RadPane>

        <telerik:RadPane ID="RadPane2" runat="server" Height="100%">
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="100%">

                <telerik:RadPageView ID="RadPageView1" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <uc1:FilingClassQuery ID="FilingClassQuery1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>

                <telerik:RadPageView ID="RadPageView2" runat="server">
                    <uc2:FilingConditionQuery ID="FilingConditionQuery1" runat="server" />
                </telerik:RadPageView>

                <telerik:RadPageView ID="RadPageView3" runat="server">
                    <uc3:FilingFormExport ID="FilingFormExport1" runat="server" />
                </telerik:RadPageView>

                <telerik:RadPageView ID="RadPageView4" runat="server">
                    <uc4:FilingDownloadExcel ID="FilingDownloadExcel1" runat="server" />
                </telerik:RadPageView>
            </telerik:RadMultiPage>

            <asp:Label ID="lblClassQuery" runat="server" Text="分類查詢" Visible="False" meta:resourcekey="lblClassQueryResource1"></asp:Label>
            <asp:Label ID="lblCondQuery" runat="server" Text="條件查詢" Visible="False" meta:resourcekey="lblCondQueryResource1"></asp:Label>
            <asp:Label ID="lblFormExport" runat="server" Text="表單匯出" Visible="False" meta:resourcekey="lblFormExportResource1"></asp:Label>
            <asp:Label ID="lblDownload" runat="server" Text="下載匯出報表" Visible="False" meta:resourcekey="lblDownloadResource1"></asp:Label>
        </telerik:RadPane>
    </telerik:RadSplitter>

</asp:Content>

