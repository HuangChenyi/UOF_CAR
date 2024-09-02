<%@ Page Title="申請明細" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="OverTimeBatchDetail.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.OverTimeBatchDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="white-space:nowrap">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" SingleClick="None" OnButtonClick="RadToolBar1_ButtonClick">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="Keyword">
                        <ItemTemplate>
                            <asp:Label ID="lblkeyWord" runat="server" Text="關鍵字:" ForeColor="Black" meta:resourcekey="lblkeyWordResource1"></asp:Label>
                            <telerik:RadTextBox ID="txtKeyWord" runat="server" />
                            <asp:Label ID="lblstatus" runat="server" Text="狀態:" ForeColor="Black" meta:resourcekey="lblstatusResource1"></asp:Label>
                            <telerik:RadDropDownList ID="ddlstatus" runat="server">
                                <Items>
                                    <telerik:DropDownListItem Text="全部" Value="All" Selected="True" meta:resourcekey="ListItemResource1"></telerik:DropDownListItem>
                                    <telerik:DropDownListItem Text="成功" Value="Pass" meta:resourcekey="ListItemResource2"></telerik:DropDownListItem>
                                    <telerik:DropDownListItem Text="失敗" Value="Fail" meta:resourcekey="ListItemResource3"></telerik:DropDownListItem>
                                </Items>
                            </telerik:RadDropDownList>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search"  meta:resourcekey="RadToolBarButtonResource1"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.png" DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.png" ImageUrl="~/Common/Images/Icon/icon_m39.png">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" ></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Msg">
                        <ItemTemplate>
                            <asp:Label ID="lblApplyUser" runat="server" Text="" ForeColor="Blue" ></asp:Label>&nbsp;&nbsp;
                            <asp:Label ID="lblNotice" runat="server" Text="部分加班人員加班時數尚未完成計算，請稍候。" Visible="false" ForeColor="Red" meta:resourcekey="lblNoticeResource1"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
              </td>
             </tr>
             <tr>
              <td>
            <Ede:Grid ID="detailGrid" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                      DefaultSortDirection="Descending" EmptyDataText="沒有資料" OnSorting="detailGrid_Sorting" OnBeforeExport="detailGrid_BeforeExport"
                      EnhancePager="True" KeepSelectedRows="False" PageSize="15" DefaultSortColumnName="STATE"
                      Width="100%" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" AutoGenerateColumns="False" OnPageIndexChanging="detailGrid_PageIndexChanging" OnRowDataBound="detailGrid_RowDataBound" AllowPaging="True" meta:resourcekey="detailGridResource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="True"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="姓名" SortExpression="GROUP_NAME" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="加班時數" DataField="CAL_RESULT" SortExpression="CAL_RESULT" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="驗證結果" SortExpression="STATE" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="錯誤訊息" DataField="ERROR_MESSAGE" SortExpression="ERROR_MESSAGE" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
            </Ede:Grid>
              </td>
             </tr>
            </table>
            <asp:Label ID="lblPassMsg" runat="server" Text="成功" Visible="False" meta:resourcekey="lblPassMsgResource1"></asp:Label>
            <asp:Label ID="lblFailMsg" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblFailMsgResource1"></asp:Label>
            <asp:Label ID="lblApplyWord" runat="server" Text="申請人數:{0}  成功人數:{1}  失敗人數:{2}" Visible="False" meta:resourcekey="lblApplyWordResource1"></asp:Label>           
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
