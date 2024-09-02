<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Plant_BorrowEdit" Title="借用設備" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="BorrowEdit.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" Namespace="System.Web.UI" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .TEST {
            background-color: red;
        }

        .AA {
            background-color: gray;
        }
    </style>
    <style>
        @import url('../../Common/javascript/SuperTable/superTables.css');
    </style>
    <script type="text/javascript" src="../../Common/javascript/SuperTable/superTables.js"></script>
    <script type="text/javascript" src="../../Common/javascript/SuperTable/jquery.superTable.js"></script>
    <script type="text/javascript">        
        Sys.Application.add_load(function () {
            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }
            var borrowPlants = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["borrowPlants"],true)%>');
            var hfVal = $("#" + borrowPlants, pd).val();
            if (pd) {
                $("#<%=hfborrowplant.ClientID%>").val(hfVal);
            }
        });
        var plants = "";
        function addrow() {
            tr = $('#showTable').insertRow();
            tr.id = RowCount;
            //tr.onclick=doalter;   
            tr.onclick = doalter;
        }

        var imgClick = "";

        function doalter() {
            alert(this.id);
        }

        function BorrowPlant(startTime, endTime, detailGuid, plantGuid, borrowPlants) {
            if (imgClick == "") {
                $uof.dialog.open2("~/EIP/Plant/BorrowDialog.aspx", "", "", 350, 350, openDialogResultBorrowPlant,
                    {
                        "StartTime": startTime,
                        "EndTime": endTime,
                        "DetailGuid": detailGuid,
                        "PlantGuid": plantGuid,
                        "borrowPlants": borrowPlants
                    });
            }
            imgClick = "";
            return false;
        }

        function DeleteBorrowPlant(date, time, guid) {
            imgClick = "Image";

            if (confirm('<%=lbConfirmDelete.Text %>') == true) {
                $("#abc").val(date + '@' + time + '@' + guid);
                window.history.forward();
                var ajaxManager;
                if (ajaxManager == null)
                    ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "delete", "Value": "" }));
                return false;
            }
            else {
                var ajaxManager;
                if (ajaxManager == null)
                    ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "", "Value": "" }));
                return false;
            }

        }
        function treeEquipment_NodeClicking(sender, args) {
            var node = args.get_node();
            var IsMeetingRoom = node.get_attributes().getAttribute("IsMeetingRoom");
            args.set_cancel(true);
            var nodeValue = node.get_value();
            if (node.get_level() == 1) {
                $uof.dialog.open2("~/EIP/Plant/ChoicePlant.aspx", node, "", 1100, 700, openDialogResult, { "PlantGuid": nodeValue, "IsMeetingRoom": IsMeetingRoom });
            }
        }

        var WebTreeCheckedStatus = false;
        function treeEquipment_NodeChecked(sender, args) {
            var node = args.get_node();
            var count = 0;
            if (node.get_level() == 0) {
                if (WebTreeCheckedStatus == false) {
                    WebTreeCheckedStatus = true;
                    if (node.get_nodes().get_count() > 0) {
                        for (i = 0; i < node.get_nodes().get_count(); i++) {
                            node.get_nodes().getNode(i).set_checked(node.get_checked());
                        }
                    }
                    WebTreeCheckedStatus = false;
                }
            }
            else {
                if (WebTreeCheckedStatus == false) {
                    WebTreeCheckedStatus = true;
                    var parentNode = node.get_parent();
                    for (i = 0; i < parentNode.get_nodes().get_count(); i++) {
                        if (parentNode.get_nodes().getNode(i).get_checked() == false) {
                            parentNode.set_checked(false);
                            WebTreeCheckedStatus = false;
                            break;
                        } else {
                            count++;
                        }
                    }
                    if (count == parentNode.get_nodes().get_count()) {
                        parentNode.set_checked(true);
                        WebTreeCheckedStatus = false;
                    }
                }
            }
        }
        function OnValueChanging(sender, args) {

            if (args.get_newValue() == "") {

                args.set_newValue(args.get_oldValue());
                args.set_cancel(true);
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null)
                return false;
            else {
                return true;
            }
        }

        function openDialogResultBorrowPlant(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null)
                return false;
            else {
                $('#<%=hfReturnValue.ClientID%>').val(returnValue);
                __doPostBack('<%= UpdatePanel3.ClientID %>', '');
            }
        }
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
    <table style="width: 100%">
        <tr>
            <td style="vertical-align: top;">
                <table style="width: 98%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="222" rowspan="2" style="vertical-align: top;">
                            <table width="222" height="670" border="0" align="center" cellpadding="0" cellspacing="0"
                                class="xline-itemtag">
                                <tr>
                                    <td height="32" style="background-image: url('<%=themePath%>/images/borrow_01.gif')">&nbsp;&nbsp;<span class="bigtit"><asp:Label ID="lblItemList" runat="server" Text="設備列表"
                                        meta:resourcekey="lblItemListResource1"></asp:Label></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;">
                                        <table width="95%" border="0" style="text-align: center;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="blank8"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">
                                                    <telerik:RadTreeView ID="treeEquipment" CheckBoxes="true" EnableNodeTextHtmlEncoding="true" runat="server" OnNodeCheck="treeEquipment_NodeCheck" OnClientNodeChecked="treeEquipment_NodeChecked" OnClientNodeClicking="treeEquipment_NodeClicking" Width="200px" Height="550px"></telerik:RadTreeView>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="vertical-align: top;">
                            <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="blank8"></td>
                                </tr>
                                <tr>
                                    <td height="25" style="background-image: url('<%=themePath%>/images/borrow_02.gif'); background-repeat: no-repeat;" class="k">
                                        <asp:Label ID="lblPresentBorrow" runat="server" Text="快速借用" meta:resourcekey="lblPresentBorrowResource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="xline-itemtag2">
                                                    <tr>
                                                        <td>
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td>
                                                                        <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick" Width="100%" meta:resourcekey="RadToolBar1Resource1">
                                                                            <Items>
                                                                                <telerik:RadToolBarButton runat="server" Text="" Value="BorrowDate" meta:resourcekey="RadToolBarButtonResource1">
                                                                                    <ItemTemplate>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td style="white-space: nowrap; word-wrap: break-word">
                                                                                                    <asp:Label ID="Label7" runat="server" Text="快速借用時間起迄 :" meta:resourcekey="Label7Resource1"></asp:Label>
                                                                                                </td>
                                                                                                <td style="white-space: nowrap">
                                                                                                    <telerik:RadDateTimePicker ID="wdcStart" runat="server">
                                                                                                        <DateInput runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                                                                    </telerik:RadDateTimePicker>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:Label ID="Label8" runat="server" Text="~" meta:resourcekey="Label8Resource1"></asp:Label>
                                                                                                </td>
                                                                                                <td style="white-space: nowrap">
                                                                                                    <telerik:RadDateTimePicker ID="wdcEnd" runat="server">
                                                                                                        <DateInput runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                                                                    </telerik:RadDateTimePicker>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                </telerik:RadToolBarButton>
                                                                                <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                                                                                </telerik:RadToolBarButton>
                                                                                <telerik:RadToolBarButton runat="server" Text="快速借用" Value="submit"
                                                                                    ClickedImageUrl="~/Common/Images/Icon/icon_m184.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m184.gif"
                                                                                    HoveredImageUrl="~/Common/Images/Icon/icon_m184.gif" ImageUrl="~/Common/Images/Icon/icon_m184.gif" meta:resourcekey="RadToolBarButtonResource4">
                                                                                </telerik:RadToolBarButton>
                                                                                <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true">
                                                                                </telerik:RadToolBarButton>
                                                                            </Items>
                                                                        </telerik:RadToolBar>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請勾選快速借用" ForeColor="Red"
                                                                            meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                                                        <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="" ForeColor="Red"
                                                                            meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                                                                        <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填寫開始時間" ForeColor="Red"
                                                                            meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                                                                        <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請填寫結束時間" ForeColor="Red"
                                                                            meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                                                                        <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" ForeColor="Red"
                                                                            meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                                                                        <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ErrorMessage="週期性事件僅限當日" ForeColor="Red" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
                                                                        <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ErrorMessage=""></asp:CustomValidator>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="white-space: nowrap; width: 70px;">
                                                                        <asp:Label ID="Label4" runat="server" Text="借用設備：" meta:resourcekey="Label4Resource1"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Panel ID="Panel1" runat="server" Height="100px" ScrollBars="Vertical" meta:resourcekey="Panel1Resource1">
                                                                            <asp:Table ID="Table2" runat="server" meta:resourcekey="Table2Resource1">
                                                                            </asp:Table>
                                                                        </asp:Panel>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="blank8"></td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="treeEquipment" EventName="NodeCheck" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Panel runat="server" ID="kk" Visible="False" meta:resourcekey="kkResource1">
                                                    <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td height="25" style="background-image: url('<%=themePath%>/images/borrow_03.gif'); background-repeat: no-repeat;" class="k">&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="目前借用記錄" meta:resourcekey="Label1Resource1"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table border="0" align="center" cellpadding="0" cellspacing="0" class="xline-itemtag2">
                                                                    <tr>
                                                                        <td class="blank8"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td style="width: 15px;"></td>
                                                                                    <td style="white-space: nowrap;">
                                                                                        <asp:Label ID="Label2" runat="server" Text="本次預約：" meta:resourcekey="Label2Resource1"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <img src="<%=themePath%>/images/borrow_04.gif">
                                                                                    </td>
                                                                                    <td style="width: 20px;"></td>
                                                                                    <td style="white-space: nowrap;">
                                                                                        <asp:Label ID="Label3" runat="server" Text="自己預約" meta:resourcekey="Label3Resource1"></asp:Label>：
                                                                                    </td>
                                                                                    <td>
                                                                                        <img src="<%=themePath%>/images/borrow_05.gif" width="60" height="23">
                                                                                    </td>
                                                                                    <td style="width: 20px;"></td>
                                                                                    <td style="white-space: nowrap;">
                                                                                        <asp:Label ID="Label6" runat="server" Text="他人預約" meta:resourcekey="Label6Resource1"></asp:Label>：
                                                                                    </td>
                                                                                    <td>
                                                                                        <img src="<%=themePath%>/images/borrow_11.gif" width="60" height="23">
                                                                                    </td>
                                                                                    <td style="width: 75px;"></td>
                                                                                    <td style="white-space: nowrap;" align="right">
                                                                                        <asp:Label ID="Label5" runat="server" Text="預約日期：" meta:resourcekey="Label5Resource1"></asp:Label>
                                                                                    </td>
                                                                                    <td align="right" style="width: 2%">
                                                                                        <asp:ImageButton ID="imgPre" runat="server" ImageUrl="~/EIP/Calendar/images/pre.jpg" OnClick="imgPre_Click" />
                                                                                    </td>
                                                                                    <td align="center" style="width: 18%">
                                                                                        <telerik:RadDatePicker ID="wdcQueryDate" runat="server"
                                                                                            OnSelectedDateChanged="wdcQueryDate_SelectedDateChanged" AutoPostBack="True">
                                                                                            <DateInput runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                                                        </telerik:RadDatePicker>

                                                                                    </td>
                                                                                    <td align="left" style="width: 2%">
                                                                                        <asp:ImageButton ID="imgNext" runat="server" ImageUrl="~/EIP/Calendar/images/next.jpg" OnClick="imgNext_Click" />
                                                                                    </td>
                                                                                    <td>&nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <Fast:Grid ID="grdPresentBorrow" runat="server" Width="100%" AutoGenerateCheckBoxColumn="False"
                                                                                AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                                                                                DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15"
                                                                                OnRowDataBound="grdPresentBorrow_RowDataBound" AllowSorting="True"
                                                                                OnRowCommand="grdPresentBorrow_RowCommand" EmptyDataText="沒有資料"
                                                                                KeepSelectedRows="False" meta:resourcekey="grdPresentBorrowResource3">
                                                                                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                                                                                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                                                            </Fast:Grid>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="blank8">
                                                                            <asp:HiddenField ID="hidQuickItem" runat="server" />
                                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Visible="False"
                                                                                meta:resourcekey="LinkButton1Resource1" Text="LinkButton"></asp:LinkButton>
                                                                            <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <input name="abc" id="abc" type="hidden" />
                                                <asp:HiddenField ID="hidinitialView" runat="server" />
                                                <asp:HiddenField ID="hfReturnValue" runat="server" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="treeEquipment" EventName="NodeCheck" />
                                                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblSelfBrorrow" runat="server" Text="您已預約該設備, 無法再次新增。" Visible="false" meta:resourcekey="lblSelfBrorrowResource1"></asp:Label>
    <asp:Label ID="lblErr" runat="server" Text="下列場地/設備目前已借出，尚未歸還，請於歸還後再進行借用。<br />(管理者須對該設備進行歸還操作，才算完成歸還)<br />借用主旨:{0}<br />借用時間:{1}<br />借用人:{2}" Visible="false" meta:resourcekey="lblErrResource1"></asp:Label>
    <asp:Label ID="lblSampleShowLimitMsg" runat="server" Text="設備{0}只開放今天後{1}天內借用(可借用到{2})。" Visible="false" meta:resourcekey="lblSampleShowLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblLimitMsg" runat="server" Text="{0}只開放借用到{1}，無法新增。" Visible="false" meta:resourcekey="lblLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblRangeLimitMsg" runat="server" Text="{0}{1}~{2}不開放借用，無法新增。" Visible="false" meta:resourcekey="lblRangeLimitMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfborrowplant" runat="server" />
    <asp:HiddenField ID="hfRepeatType" runat="server" />
    <asp:HiddenField ID="hfDelValue" runat="server" />

    <script>
        function pos(itemID, time) {
            $("#abc").val(itemID + time);
            __doPostBack('ctl00$ContentPlaceHolder1$LinkButton1', '');
        }
    </script>
    <script language="javascript">
        function DD(o) {
            alert(o.className);
            o.style.className = "TEST";
        }

        function setScollbarTop(sender, args) {
            if (typeof ($("#divdatagrid")) != 'undefined')
                $("#divdatagrid").scrollTop = 562;
        }
    </script>
</asp:Content>
