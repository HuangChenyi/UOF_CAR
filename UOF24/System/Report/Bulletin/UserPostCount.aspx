<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_Bulletin_UserPostCount" Title="公告張貼統計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="UserPostCount.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" 
        OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource2">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="QueryDate" 
                meta:resourcekey="RadToolBarButtonResource4">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="開始時間：" meta:resourcekey="TBLabelResource1"></asp:Label></td>
                            <td>
                                <telerik:RadDatePicker ID="rdpStartTime" runat="server" meta:resourcekey="rdpStartTimeResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput  LabelWidth="64px" Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                            <td>~</td>
                            <td>
                                <asp:Label runat="server" Text="結束時間：" meta:resourcekey="TBLabelResource2"></asp:Label></td>
                            <td>
                                <telerik:RadDatePicker ID="rdpEndTime" runat="server"  meta:resourcekey="rdpEndTimeResource2">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput  LabelWidth="64px" 
                                        Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" 
                meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Value="btnQuery" SelectedImage="~/Common/Images/Icon/icon_m39.gif"
                Text="查詢" meta:resourcekey="TBarButtonResource20">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" 
                meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <contenttemplate>

    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間"
        meta:resourcekey="CustomValidator1Resource1" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
    <table>
        <tr>
            <td>
    <Fast:Grid ID="DGUserInfoList" runat="server" AutoGenerateCheckBoxColumn="False"
        AutoGenerateColumns="False"  
         AllowPaging="True" OnPageIndexChanging="DGUserInfoList_PageIndexChanging" 
                    AllowSorting="True" Width="100%" OnSorting="DGUserInfoList_Sorting" 
                    meta:resourcekey="DGUserInfoListResource1" DataKeyOnClientWithCheckBox="False" 
                     DefaultSortDirection="Ascending" 
                    EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" 
                    PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" 
            LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" 
            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" 
            PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
        <ExportExcelSettings AllowExportToExcel="False" />
        <Columns>
            <asp:TemplateField HeaderText="公告類別名稱" SortExpression="CLASS_NAME" meta:resourcekey="BoundFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="lblClassName" runat="server" Text='<%# Bind("CLASS_NAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="count" HeaderText="公告張貼總數" SortExpression="count" meta:resourcekey="BoundFieldResource2" />
            
        </Columns>
    </Fast:Grid>
            </td>
        </tr>
    </table>
        </contenttemplate>
        <triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" /> 
       </triggers>
    </asp:UpdatePanel>
</asp:Content>

