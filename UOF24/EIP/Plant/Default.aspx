<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Plant_Default" Title="場地設備管理" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%--<%@ Register assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Src="../Calendar/Common/UC_Calendar.ascx" TagName="UC_Calendar" TagPrefix="uc1" %>
<%@ Register Src="../Calendar/Common/UC_MonthList.ascx" TagName="UC_MonthList" TagPrefix="uc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <style type="text/css">
        .breakword {
            word-break: break-all;
        }
    </style>
    <script type="text/javascript">

        function Window_OnClick()
        {
        }

        $(function () {
            //連結借用明細     //其中加入tbx_HiddenField 的目的是用來限定利用傳過來的參數,只可以開窗一次,以避免切換tab時,又造成開窗
            var Borrow_Guid = "<%=Request.QueryString["BORROWGUID"]%>";
            var Owner_Guid = "<%=Request.QueryString["OwnerGuid"]%>";
            var Plant_Guid = "<%=Request.QueryString["PlantGuid"]%>";
            if ((Borrow_Guid != "") & ($("#<%=tbx_HiddenField.ClientID%>").val() == 'True')) {
                $("#<%=tbx_HiddenField.ClientID%>").val('False');

                $uof.dialog.open2("~/EIP/Plant/BorrowDetail.aspx", "", "", 700, 800, function (returnValue) { return true; }, { "borrowGuid": Borrow_Guid, "OwnerGuid": Owner_Guid, "PlantGuid": Plant_Guid });
                return false;
        }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <telerik:RadTreeView ID="treePlant" runat="server"   EnableNodeTextHtmlEncoding="true" OnNodeClick="treePlant_NodeClick" meta:resourcekey="treePlantResource2"></telerik:RadTreeView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTabStrip ID="rts1" MultiPageID="rmp1" runat="server" SelectedIndex="0" meta:resourcekey="rts1Resource1">
                <Tabs>
                    <telerik:RadTab runat="server" Text="依時間" PageViewID="rpvTime" Selected="True" meta:resourcekey="RadTabResource1">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="清單" PageViewID="rpvList" meta:resourcekey="RadTabResource2">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="rmp1" runat="server" SelectedIndex="0" BackColor="White" meta:resourcekey="rmp1Resource1">
                <telerik:RadPageView runat="server" ID="rpvTime" meta:resourcekey="rpvTimeResource1" Selected="True">
                    <uc2:UC_MonthList ID="UC_MonthList1" runat="server" />
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="rpvList" meta:resourcekey="rpvListResource1">
                    <table style="width:100%">
                        <tr>
                            <td colspan="7">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage=""
                                            ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Grid1" EventName="RowCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:Label ID="lblErr" runat="server" Text="下列場地/設備目前已借出，尚未歸還，請於歸還後再進行借用。<br />(管理者須對該設備進行歸還操作，才算完成歸還)<br />借用主旨:{0}<br /> 借用時間:{1}<br />借用者:{2}<br />" Visible="false" meta:resourcekey="lblErrResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Value="Status" meta:resourcekey="RadToolBarButtonResource1">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text="狀態：" meta:resourcekey="Label1Resource2"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlState" runat="server" meta:resourcekey="ddlStateResource1">
                                                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                                                <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="預約"></asp:ListItem>
                                                                <asp:ListItem Value="2" meta:resourcekey="ListItemResource6" Text="審核中"></asp:ListItem>
                                                                <asp:ListItem Value="3" meta:resourcekey="ListItemResource3" Text="已借出"></asp:ListItem>
                                                                <asp:ListItem Value="4" meta:resourcekey="ListItemResource4" Text="已歸還"></asp:ListItem>
                                                                <asp:ListItem Value="5" meta:resourcekey="ListItemResource5" Text="被拒絕"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Value="QueryDate" meta:resourcekey="RadToolBarButtonResource3">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text="借用日期：" meta:resourcekey="Label2Resource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <telerik:RadDatePicker ID="rdStart" runat="server">
                                                            </telerik:RadDatePicker>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text="~" meta:resourcekey="Label3Resource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <telerik:RadDatePicker ID="rdEnd" runat="server">
                                                            </telerik:RadDatePicker>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                                            ClickedImageUrl="~/Common/Images/icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/icon/icon_m39.gif"
                                            ImageUrl="~/Common/Images/icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource5">
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                            </td>
                        </tr>
                    </table>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                DefaultSortColumnName="START_TIME" DefaultSortDirection="Descending" AutoGenerateColumns="False"
                                Width="100%" OnRowDataBound="Grid1_RowDataBound"
                                AllowPaging="True" DataKeyNames="DETAIL_GUID" OnRowCommand="Grid1_RowCommand"
                                DataKeyOnClientWithCheckBox="False" OnPageIndexChanging="Grid1_PageIndexChanging"
                                OnSorting="Grid1_Sorting"  EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15"   meta:resourcekey="Grid1Resource2" OnBeforeExport="Grid1_BeforeExport" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource"/>
                                <Columns>
                                    <asp:TemplateField HeaderText="名稱" SortExpression="PLANT_NAME" meta:resourcekey="TemplateFieldResource1">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnViewDetail" Text='<%#: Eval("PLANT_NAME") %>' CommandName="btnViewDetail" meta:resourceKey="btnViewDetailResource1"></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle CssClass="breakword" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="借用時間" SortExpression="START_TIME" meta:resourcekey="TemplateFieldResource2">
                                        <ItemTemplate>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <asp:Literal runat="server" ID="Literal1"></asp:Literal>                                                           
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                    </asp:TemplateField> 
                                     <asp:BoundField DataField="SUBJECT" HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="BoundFieldResources10">
                                    <HeaderStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="借出時間" SortExpression="LOAN_TIME" meta:resourcekey="BoundFieldResource1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLoanTime" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="歸還時間" SortExpression="RETURN_TIME" meta:resourcekey="BoundFieldResource2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReturnTime" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="目前狀態" SortExpression="BORROW_STATE" meta:resourcekey="BoundFieldResource3">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="OWNER" HeaderText="借用人" SortExpression="OWNER_NAME" meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle Wrap="False" />
                                    </asp:BoundField>
                                    <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnLoan" Text="借出" CommandName="btnLoan" meta:resourceKey="btnLoanResource1"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnReject" Text="拒絕" CommandName="btnReject" meta:resourceKey="btnRejectResource1"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnReturn" Text="歸還" CommandName="btnReturn" meta:resourceKey="btnReturnResource1"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                            </Fast:Grid>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label><asp:ObjectDataSource
        ID="ObjectDataSource1" runat="server" SelectMethod="GetAllBorrowRecord" TypeName="Ede.Uof.EIP.Plant.ReadBorrowRecordUCO">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:Label ID="lbAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lbAllResource1"></asp:Label>
    <asp:HiddenField ID="tbx_HiddenField" Value="True" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" Value="True" runat="server" />

    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label1Resource1" Text="類別列表" Visible="false"></asp:Label>
    <asp:Label ID="lblStateSigning" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblStateSigningResource1"></asp:Label>
    <asp:Label ID="lblStateBooking" runat="server" Text="預約" Visible="False" meta:resourcekey="lblStateBookingResource1"></asp:Label>
    <asp:Label ID="lblStateLoaned" runat="server" Text="已借出" Visible="False" meta:resourcekey="lblStateLoanedResource1"></asp:Label>
    <asp:Label ID="lblStateReturned" runat="server" Text="歸還" Visible="False" meta:resourcekey="lblStateReturnedResource1"></asp:Label>
    <asp:Label ID="lblStateRejected" runat="server" Text="被拒絕" Visible="False" meta:resourcekey="lblStateRejectedResource1"></asp:Label>
</asp:Content>





