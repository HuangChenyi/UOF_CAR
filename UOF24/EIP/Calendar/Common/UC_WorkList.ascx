<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.EIP.Schedule.UI.UC_WorkList" Codebehind="UC_WorkList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="UC_SchClassList.ascx" TagName="UC_SchClassList" TagPrefix="uc2" %>
<%@ Register Src="~/eip/calendar/common/uc_schclass.ascx" TagName="UC_SchClass" TagPrefix="uc1" %>
<script type="text/javascript">

    function RadToolBar1_WorkList_ButtonClicking(sender, args) {

        var Key = args.get_item().get_value();

        if (Key == "Delete") {
            if (!confirm('<%=msgDelconfirm.Text %>'))
                args.set_cancel(true);
        }
        else if (Key == "Complete") {
            if (!confirm('<%=msgCompleteconfirm.Text %>'))
                args.set_cancel(true);
        }
        else if (Key == "Proceeding") {
            if (!confirm('<%=msgProcessingconfirm.Text %>'))
                args.set_cancel(true);
        }
        else if (Key == "Create") {
            var ownerGuid = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideUserguid.Value,true)%>');
            var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';
            args.set_cancel(true);

            $uof.dialog.open2("~/EIP/Calendar/CreateWork.aspx", args.get_item(), "", 600, 600, openDialogResult, { 'OwnerGuid': ownerGuid, 'Date': date });
        }
    }
    function workRadsplitter2_clientLoaded(sender, args) {
        var radsplitter = $find("<%=workRadsplitter2.ClientID%>");
        var leftPane = $find("<%=leftPane.ClientID%>");
        var workRadpane = $find("<%=workRadpane2.ClientID%>");

        var width = radsplitter.get_width();
        if (leftPane == null) {
            radsplitter.set_width(1);
            radsplitter.set_width(width);

        }
        else {
            if (workRadpane.get_width() == width)
                workRadpane.set_width(width - leftPane.get_width() - 6);
        }

    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else {
            return true;
        }
    }
</script>
<style type="text/css">
    .breakword {
        word-break: break-all;
    }

    body {
        overflow: hidden;
    }
</style>

<telerik:RadSplitter ID="workRadsplitter1" runat="server" Orientation="Horizontal"
    PanesBorderSize="0" Height="100%"
    BorderSize="0" LiveResize="True" ResizeWithParentPane="True"
    ResizeWithBrowserWindow="True">

    <telerik:RadPane ID="workToolbarPane" runat="server" Height="35" Scrolling="None" Locked="true">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="conditional">
            <ContentTemplate>
                <table style="width:100%">
                    <tr>
                        <td style="width:5%"><uc1:UC_SchClass ID="UC_SchClass1" runat="server" /></td>
                        <td>
                            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_WorkList_ButtonClicking"
                                Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png"
                                        Value="Create" CheckedImageUrl="~/Common/Images/Icon/icon_m71.png" Text="新增工作"
                                        meta:resourcekey="TBarButtonResource1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m72.png"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m72.png" ImageUrl="~/Common/Images/Icon/icon_m72.png"
                                        Value="Proceeding" CheckedImageUrl="~/Common/Images/Icon/icon_m72.png" Text="標示為進行中"
                                        meta:resourcekey="TBarButtonResource2">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m49.png"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m49.png" ImageUrl="~/Common/Images/Icon/icon_m49.png"
                                        Value="Complete" CheckedImageUrl="~/Common/Images/Icon/icon_m49.png" Text="標示為已完成"
                                        meta:resourcekey="TBarButtonResource3">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" ImageUrl="~/Common/Images/Icon/icon_m03.png"
                                        Value="Delete" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" Text="刪除"
                                        meta:resourcekey="TBarButtonResource4">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="errMessage">
                                        <ItemTemplate>
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="無法刪除!此工作為交辦事項"
                                                meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                        </td>
                    </tr>
                </table>
                
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
            </Triggers>
        </asp:UpdatePanel>
    </telerik:RadPane>
    <telerik:RadPane ID="workRadpane12" runat="server" Scrolling="none" Height="100%">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
            <ContentTemplate>
                <telerik:RadSplitter ID="workRadsplitter2" runat="server" Height="100%" LiveResize="True" OnClientLoaded="workRadsplitter2_clientLoaded">
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
                    <telerik:RadPane ID="workRadpane2" runat="server" Height="100%">
                        <telerik:RadSplitter ID="workRadsplitter4" runat="server" Orientation="Horizontal" PanesBorderSize="0" Height="100%"
                            BorderSize="0" LiveResize="True" ResizeWithParentPane="True" ResizeWithBrowserWindow="True">
                            <telerik:RadPane ID="workRadpane5" runat="server" Height="100%">

                                <Fast:Grid ID="WorkGrid" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False" DataKeyNames="WORK_GUID" Width="100%" OnRowDataBound="Grid1_RowDataBound"
                                    AllowPaging="True" DataSourceID="ObjectDataSource1" DataKeyOnClientWithCheckBox="False"
                                    OnSorting="Grid1_Sorting" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" EnhancePager="True" KeepSelectedRows="False" PageSize="15" meta:resourcekey="Grid1Resource1">
                                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                                        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                                        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                                        ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField ItemStyle-CssClass="breakword" HeaderText="主旨" SortExpression="SUBJECT" ItemStyle-Wrap="false"
                                            meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="LinkButton3" Text='<%#: Eval("SUBJECT") %>' meta:resourceKey="LinkButton3Resource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CREATE_USER" HeaderText="建立人員" SortExpression="CREATE_USER" ItemStyle-Wrap="false"
                                            meta:resourcekey="BoundFieldResource1">
                                            <HeaderStyle Width="150px" />
                                            <ItemStyle Width="150px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="START_TIME" HeaderText="開始時間" SortExpression="START_TIME" ItemStyle-Wrap="false"
                                            meta:resourcekey="BoundFieldResource2">
                                            <HeaderStyle Width="120px" Wrap="false"/>
                                            <ItemStyle Width="120px" Wrap="false"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="END_TIME" HeaderText="結束時間" SortExpression="END_TIME" ItemStyle-Wrap="false"
                                            meta:resourcekey="BoundFieldResource3">
                                            <HeaderStyle Width="120px" Wrap="false"/>
                                            <ItemStyle Width="120px" Wrap="false"/>
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource2" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblStatus" meta:resourceKey="lblStatusResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetNoClassWork"
                                    TypeName="Ede.Uof.EIP.Schedule.Work.WorkManagementUCO">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="hideUserguid" Name="userGUID" PropertyName="Value"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>

                                <asp:HiddenField ID="hideUserguid" runat="server" />
                                <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
                                <asp:Label ID="msgCompleteconfirm" runat="server" Text="確定要標示成已完成?" Visible="False"
                                    meta:resourcekey="msgCompleteconfirmResource1"></asp:Label>
                                <asp:Label ID="msgProcessingconfirm" runat="server" Text="確定要標示成進行中?" Visible="False"
                                    meta:resourcekey="msgProcessingconfirmResource1"></asp:Label>
                                <asp:Label ID="msgNotbegin" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="msgNotbeginResource1"></asp:Label>
                                <asp:Label ID="msgComplete" runat="server" Text="已完成" Visible="False" meta:resourcekey="msgCompleteResource1"></asp:Label>
                                <asp:Label ID="msgProcessing" runat="server" Text="進行中" Visible="False" meta:resourcekey="msgProcessingResource1"></asp:Label>
                                <asp:Label ID="lblDescriptionNeeded" runat="server" Text="未輸入工作狀態說明" Visible="False"
                                    meta:resourcekey="lblDescriptionNeededResource1"></asp:Label>
                                <asp:Label ID="msgAudit" runat="server" Text="審核中" Visible="False" meta:resourcekey="msgAuditResource1"></asp:Label>
                            </telerik:RadPane>
                        </telerik:RadSplitter>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="UC_SchClass1" EventName="BarClassButtonClick" />
                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                <asp:AsyncPostBackTrigger ControlID="UC_SchClassList1" EventName="NodeOnClick" />
                <asp:AsyncPostBackTrigger ControlID="UC_SchClass1" EventName="SelectedOnChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </telerik:RadPane>
</telerik:RadSplitter>