<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Plant_ClassManagement" Title="類別設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ClassManagement.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="tbjs" type="text/javascript">


        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined")
                return false;
            else
                return true;
        }


        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            switch (value) {
                case "Create":
                   
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Plant/CreateClass.aspx", args.get_item(),
                   "", 600, 500, OpenDialogResult);
                    break;
                case "Delete":
                    args.set_cancel(!confirm('<%=msgDelconfirm.Text %>'));
                    break;
            }
        }
    </script>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <telerik:RadSplitter ID="MasterRdSplitter" runat="server"  Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRdPanel" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增類別" Value="Create"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m145.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m145.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m145.gif" ImageUrl="~/Common/Images/Icon/icon_m145.gif" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除選取類別" Value="Delete"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="GridRdPanel" runat="server" >
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" BackColor="Red" ForeColor="White" />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="類別內仍有設備，不可刪除" ForeColor="Red"
                        Display="None" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                        DataKeyNames="CLASS_GUID" AutoGenerateColumns="False"
                        Width="100%" DataSourceID="ObjectDataSource1" OnRowDataBound="Grid1_RowDataBound"
                        OnRowCommand="Grid1_RowCommand" AllowPaging="True"
                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                        EmptyDataText="沒有資料" EnhancePager="True"
                        KeepSelectedRows="False" meta:resourcekey="Grid1Resource2" PageSize="15"   >
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="類別名稱" SortExpression="NAME" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="btnName" Text='<%#: Eval("NAME") %>' CommandName="ClassEdit"
                                        meta:resourceKey="btnNameResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="保管人" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList1" IsAllowEdit="false"></uc1:UC_ChoiceList>
                                </ItemTemplate>
                                <HeaderStyle Wrap="false" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="CLASS_GUID" HeaderText="CLASS_GUID" ReadOnly="True" SortExpression="CLASS_GUID"
                                Visible="False" meta:resourcekey="BoundFieldResource1" />
                            <asp:TemplateField HeaderText="會議室場地" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsMeetingRoom" runat="server"
                                        meta:resourcekey="lblIsMeetingRoomResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="借用限制" meta:resourcekey="TemplateFieldResource4">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblUseDay" runat="server" meta:resourcekey="lblUseDayResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="借用申請方式" meta:resourcekey="TemplateFieldResource5">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsExamine" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                </telerik:RadPane>
            </telerik:RadSplitter>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAuthorityClass" TypeName="Ede.Uof.EIP.Plant.ReadBorrowRecordUCO">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label><br />
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="lblIs" runat="server" Text="是" Visible="False" meta:resourcekey="lblIsResource1"></asp:Label>
    <asp:Label ID="lblNot" runat="server" Text="否" Visible="False" meta:resourcekey="lblNotResource1"></asp:Label>
    <asp:Label ID="lblNotLimit" runat="server" Text="不限定" Visible="False" meta:resourcekey="lblNotLimitResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
    <asp:Label ID="lblByExamine" runat="server" Text="由設備借用單借用" Visible="False" meta:resourcekey="lblByExamineResource1"></asp:Label>
    <asp:Label ID="lblByCalendar" runat="server" Text="由行事曆借用" Visible="False" meta:resourcekey="lblByCalendarResource1"></asp:Label>

    <asp:Label ID="lblIsUseDay" runat="server" Text="可借用到系統日之後" Visible="False" meta:resourcekey="lblIsUseDayResource1"></asp:Label>
    <asp:Label ID="lblMonths" runat="server" Text="每月" Visible="False" meta:resourcekey="lblMonthsResource1"></asp:Label>
    <asp:Label ID="lblDayOfMonth" runat="server" Text="日" Visible="False" meta:resourcekey="lblDayOfMonthResource1"></asp:Label>
    <asp:Label ID="lblCanAdd" runat="server" Text="可新增" Visible="False" meta:resourcekey="lblCanAddResource1"></asp:Label>
    <asp:Label ID="lblThisMonth" runat="server" Text="當月" Visible="False" meta:resourcekey="lblThisMonthResource1"></asp:Label>
    <asp:Label ID="lblNextMonth" runat="server" Text="次月" Visible="False" meta:resourcekey="lblNextMonthResource1"></asp:Label>
    <asp:Label ID="lblMonthsLater" runat="server" Text="個月後" Visible="False" meta:resourcekey="lblMonthsLaterResource1"></asp:Label>
    <asp:Label ID="lblBorrow" runat="server" Text="的借用" Visible="False" meta:resourcekey="lblBorrowResource1"></asp:Label>

    <asp:Label ID="lblBorrowRange" runat="server" Text="每月{0} {1}可新增{1}的借用" Visible="False" meta:resourcekey="lblBorrowRangeResource1"></asp:Label>



</asp:Content>
