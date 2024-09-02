<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.EIP.Schedule.UI.UC_BorrowList" Codebehind="UC_BorrowList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="UC_SchClassList.ascx" TagName="UC_SchClassList" TagPrefix="uc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/eip/calendar/common/uc_schclass.ascx" TagName="UC_SchClass" TagPrefix="uc1" %>

<script id="BorrowListjs" type="text/javascript">

    function RadToolBar1_BorrowList_ButtonClicking(sender, args) {
        var Key = args.get_item().get_value();

        if (Key == "Delete") {
            if (confirm('<%=msgDelconfirm.Text %>') == false)
                args.set_cancel(true);
        }
        else if (Key == "Create") {
            var UserGuid = '<%=UserGuid%>';
            var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';

            args.set_cancel(true);
            $uof.dialog.open2("~/EIP/Plant/CreateBorrow.aspx", args.get_item(), "", 700, 800, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
        }
    }

    function broRadsplitter2_clientLoaded(sender, args) {
        var radsplitter = $find("<%=broRadsplitter2.ClientID%>");
        var leftPane = $find("<%=leftPane.ClientID%>");
        var broRadpane = $find("<%=broRadpane2.ClientID%>");

        var width = radsplitter.get_width();
        if (leftPane == null) {
            radsplitter.set_width(1);
            radsplitter.set_width(width);

        }
        else {
            if (broRadpane.get_width() == width)
                broRadpane.set_width(width - leftPane.get_width() - 6);
        }
    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else {
            return true;
        }
    }
    
    function OpenChoicePlantDialog(plantGuid) {
        $uof.dialog.open2("~/EIP/Plant/ChoicePlant.aspx", "", '', 800, 700, function (returnValue) { return false; }, { PlantGuid: plantGuid});
        return false; 
    }
</script>

<style>
    body {
        overflow: hidden;
    }
</style>

<telerik:RadSplitter ID="broRadsplitter1" runat="server" Orientation="Horizontal"
    PanesBorderSize="0" Height="100%"
    BorderSize="0" LiveResize="True" ResizeWithParentPane="True"
    ResizeWithBrowserWindow="True">

    <telerik:RadPane ID="broToolbarPane" runat="server" Height="35" Scrolling="None" Locked="true">  
        <table style="width: 100%">
            <tr>
                <td style="width:5%">
                    <uc1:UC_SchClass ID="UC_SchClass_B" runat="server" />
                </td>
                <td>
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_BorrowList_ButtonClicking" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
                        <Items>
                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m65.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m65.gif" ImageUrl="~/Common/Images/Icon/icon_m65.gif"
                                Value="Create" CheckedImageUrl="~/Common/Images/Icon/icon_m65.gif" Text="新增借用"
                                meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </td>
            </tr>
        </table>
    </telerik:RadPane>
    <telerik:RadPane ID="broRadpane12" runat="server" Scrolling="none" Height="100%">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
            <ContentTemplate>
                <telerik:RadSplitter ID="broRadsplitter2" runat="server" Height="100%" LiveResize="True" 
                 OnClientLoaded="broRadsplitter2_clientLoaded">
                    <telerik:RadPane ID="leftPane" runat="server" Width="15%" Height="100%">
                        <div class="LeftPaneBackground">
                            <telerik:RadSplitter ID="Radsplitter3" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                                BorderSize="0" PanesBorderSize="0" LiveResize="True" ResizeWithParentPane="True"
                                ResizeWithBrowserWindow="True">
                                <telerik:RadPane ID="leftDownPane" runat="server" Height="100%">
                                    <uc2:UC_SchClassList ID="UC_SchClassList1" runat="server" />
                                </telerik:RadPane>
                            </telerik:RadSplitter>
                        </div>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="broRadpane2" runat="server">
                        <telerik:RadSplitter ID="broRadsplitter4" runat="server" Orientation="Horizontal" PanesBorderSize="0" Height="100%"
                            BorderSize="0" LiveResize="True" ResizeWithParentPane="True" ResizeWithBrowserWindow="True">
                          
                            <telerik:RadPane ID="broRadpane5" runat="server" Height="100%">

                                <Fast:Grid ID="gridBorrow" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyNames="BORROW_GUID"
                                    OnRowCommand="gridBorrow_RowCommand" OnRowDataBound="gridBorrow_RowDataBound"
                                    DataSourceID="objDS_Borrow" Width="100%" DataKeyOnClientWithCheckBox="False"
                                    DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15">
                                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                                        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                                        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                                        ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnEditBorrow" Text='<%#: Eval("SUBJECT") %>' CommandName="EditBorrow"
                                                    meta:resourceKey="btnEditBorrowResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:Literal runat="server" ID="Literal1" meta:resourceKey="Literal1Resource1"></asp:Literal>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="開始時間" meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Literal runat="server" ID="Literal2"></asp:Literal>
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" Wrap="false"/>
                                            <ItemStyle Width="120px" Wrap="false"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="結束時間" meta:resourcekey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:Literal runat="server" ID="Literal3"></asp:Literal>
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" Wrap="false"/>
                                            <ItemStyle Width="120px" Wrap="false"/>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                                <asp:ObjectDataSource ID="objDS_Borrow" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetNoClassMyBorrow" TypeName="Ede.Uof.EIP.Plant.UserReadUCO">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>

                                <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>
                                <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
                            </telerik:RadPane>
                        </telerik:RadSplitter>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="UC_SchClass_B" EventName="BarClassButtonClick" />
                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                <asp:AsyncPostBackTrigger ControlID="UC_SchClassList1" EventName="NodeOnClick" />
                <asp:AsyncPostBackTrigger ControlID="UC_SchClass_B" EventName="SelectedOnChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </telerik:RadPane>
</telerik:RadSplitter>