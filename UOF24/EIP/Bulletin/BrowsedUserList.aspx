<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_BrowsedUserList" Title="瀏覽記錄" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="BrowsedUserList.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="rdResendToolBar" runat="server" Width="100%" OnButtonClick="rdResendToolBar_ButtonClick" Enabled="true">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="radItemRbtnList" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rdbOption" RepeatDirection="Horizontal">
                                <asp:ListItem Text="尚未讀取人員" Value="unread" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                <asp:ListItem Text="勾選人員" Value="select" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" />
                    <telerik:RadToolBarButton runat="server" Value="reSend" Text="發送通知"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m216.gif" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" />
                    <telerik:RadToolBarButton runat="server" Value="radItemlblNotice" meta:resourcekey="RadToolBarButtonResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblNotice" runat="server" Visible="false"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" cellspacing="1" style="width: 100%">
                <tr>
                    <td class="PopTableRightTD">
                        <div style="text-align: left; padding-bottom: 5px;">
                            <asp:Label ID="lblCount" Text="" ForeColor="Blue" runat="server" Visible="true"></asp:Label>
                            <asp:Label ID="lblViewCount" Text="瀏覽人數: " ForeColor="Blue" runat="server" meta:resourcekey="lblCountResource1" Visible="false"></asp:Label>
                            <asp:Label ID="lblRecommend" Text="推薦人數: " ForeColor="Blue" runat="server" meta:resourcekey="lblRecommendResource1" Visible="false"></asp:Label>
                            <asp:Label ID="lblPepole" Text="人" ForeColor="Blue" runat="server" Visible="false" meta:resourcekey="lblPepoleResource1"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BULLETIN_GUID,USER_GUID"
                            DataSourceID="ObjectDataSource1" Width="100%" OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" DataKeyOnClientWithCheckBox="False"
                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnableModelValidation="True" EnhancePager="True" KeepSelectedRows="False">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="True" ExportType="GridContent" DataSourceType="ObjectDataSource"></ExportExcelSettings>
                            <Columns>
                                <asp:BoundField DataField="GROUP_NAME" HeaderText="部門/群組" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="accountResource4">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="姓名" SortExpression="USER_NAME" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblName" meta:resourceKey="lblNameResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="讀取時間" SortExpression="READ_DATE" meta:resourcekey="BoundFieldResource3" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblReadDate" runat="server" Text='<%#: Bind("READ_DATE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="推薦時間" SortExpression="RECOMMEND_DATE" meta:resourcekey="BoundFieldResource5" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRecommendDate" runat="server" Text='<%#: Bind("RECOMMEND_DATE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetReadUser" TypeName="Ede.Uof.EIP.Bulletin.ReadUCO">
                <SelectParameters>
                    <asp:QueryStringParameter Name="bulletinGUID" QueryStringField="BULLETINID" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfBulletinID" runat="server" />
            <asp:HiddenField ID="hfIsOpenRecommend" runat="server" />
            <asp:Label ID="lblAlertNotify" runat="server" Text="已成功發送{0}筆通知。" Visible="false" meta:resourcekey="lblAlertNotifyResource1"></asp:Label>
            <asp:Label ID="lblNotSelect" runat="server" Text="請選擇人員。" Visible="false" meta:resourcekey="lblNotSelectResource1"></asp:Label>
            <asp:Label ID="lblAllRead" runat="server" Text="所有人員均已讀取。" Visible="false" meta:resourcekey="lblAllReadResource1"></asp:Label>
            <asp:Label ID="lblDeptGroup" runat="server" Text="部門/群組。" Visible="false" meta:resourcekey="BoundFieldResource4"></asp:Label>
            <asp:Label ID="lblViewer" runat="server" Text="瀏覽者" Visible="false" meta:resourcekey="TemplateFieldResource1"></asp:Label>
            <asp:Label ID="lblReadTime" runat="server" Text="讀取時間" Visible="false" meta:resourcekey="BoundFieldResource3"></asp:Label>
            <asp:Label ID="lblRecommendTime" runat="server" Text="推薦時間" Visible="false" meta:resourcekey="BoundFieldResource5"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
