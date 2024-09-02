<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_Forum_ForumUserInfo"
    Title="最近一個月討論區使用者資訊統計" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ForumUserInfo.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" 
        onbuttonclick="RadToolBar1_ButtonClick" 
        meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="QueryDate" 
                meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <asp:Label ID="Label1" runat="server" Text="開始時間：" meta:resourcekey="TBLabelResource1"></asp:Label>
                            </td>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <telerik:RadDatePicker ID="rdpStartTime" runat="server" 
                                    meta:resourcekey="rdpStartTimeResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput  LabelWidth="64px" ClientEvents-OnValueChanging="OnValueChanging" Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                            <td>~</td>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <asp:Label ID="Label2" runat="server" Text="結束時間：" meta:resourcekey="TBLabelResource2"></asp:Label>
                            </td>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <telerik:RadDatePicker ID="rdpEndTime" runat="server"  meta:resourcekey="rdpEndTimeResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput  LabelWidth="64px"  ClientEvents-OnValueChanging="OnValueChanging" Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" 
                meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="UserType" 
                meta:resourcekey="RadToolBarButtonResource3">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <asp:Label ID="Label1" runat="server" Text="會員群組：" meta:resourcekey="TBLabelResource3"></asp:Label>
                            </td>
                            <td style="padding-left: 2px; padding-right: 1px">
                                <asp:DropDownList runat="server" ID="ddlUserType" meta:resourcekey="ddlUserTypeResource1">
                                    <asp:ListItem Value="all" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                    <asp:ListItem Value="Member" meta:resourcekey="ListItemResource2" Text="外部會員"></asp:ListItem>
                                    <asp:ListItem Value="Employee" meta:resourcekey="ListItemResource3" Text="內部會員"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" 
                meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif" Value="btnQuery" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Text="查詢" meta:resourcekey="TBarButtonResource20">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" 
                meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間"
                meta:resourcekey="CustomValidator1Resource1" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            <Fast:Grid ID="DGUserInfoList" runat="server" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="DGUserInfoList_PageIndexChanging"
                AllowSorting="True" OnSorting="DGUserInfoList_Sorting" meta:resourcekey="DGUserInfoListResource1"
                OnRowDataBound="DGUserInfoList_RowDataBound" 
                DataKeyOnClientWithCheckBox="False"  
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" 
                EnhancePager="True" KeepSelectedRows="False" PageSize="15"  
                >
                <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" 
                    LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" 
                    PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" 
                    PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="使用者名稱" meta:resourcekey="TemplateFieldResource1" SortExpression="USER_GUID">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblUser" meta:resourceKey="lblUserResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TOPIC_POST_COUNT" HeaderText="累計發表主題數" SortExpression="TOPIC_POST_COUNT"
                        meta:resourcekey="BoundFieldResource3" />
                    <asp:BoundField DataField="REPLY_TIMES" HeaderText="累計主題被回覆數" SortExpression="REPLY_TIMES"
                        meta:resourcekey="BoundFieldResource4" />
                    <asp:BoundField DataField="TOTAL_REPLY_TIMES" HeaderText="累計回覆文章數" SortExpression="TOTAL_REPLY_TIMES"
                        meta:resourcekey="BoundFieldResource5" />
                    <asp:BoundField DataField="ESSENCE_TOPIC_COUNT" HeaderText="被設為精華主題數" SortExpression="ESSENCE_TOPIC_COUNT"
                        meta:resourcekey="BoundFieldResource6" />
                    <asp:BoundField DataField="IS_TOP_COUNT" HeaderText="被設為置頂主題數" SortExpression="IS_TOP_COUNT"
                        meta:resourcekey="BoundFieldResource7" />
                    <asp:BoundField DataField="IS_LOCK_COUNT" HeaderText="被鎖定主題數" SortExpression="IS_LOCK_COUNT"
                        meta:resourcekey="BoundFieldResource8" />
                    <asp:BoundField DataField="SUBSCRIBED_USER_COUNT" HeaderText="主題被訂閱總人數" SortExpression="SUBSCRIBED_USER_COUNT"
                        meta:resourcekey="BoundFieldResource9" />
                    <asp:BoundField DataField="SUBS_USER_COUNT" HeaderText="訂閱主題數" SortExpression="SUBS_USER_COUNT"
                        meta:resourcekey="BoundFieldResource10" />
                    <asp:BoundField DataField="RECOMMEND_TOTAL" HeaderText="被推薦總分" SortExpression="RECOMMEND_TOTAL"
                        meta:resourcekey="BoundFieldResource11" />
                    <asp:BoundField DataField="TOTAL_RECOMMAND" HeaderText="推薦總分" SortExpression="TOTAL_RECOMMAND"
                        meta:resourcekey="BoundFieldResource12" />
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
