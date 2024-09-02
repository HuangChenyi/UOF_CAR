<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_Common_UC_CreateBorrow" Codebehind="UC_CreateBorrow.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script id="CreateBorrowjs" type="text/javascript">

    function RadToolBar1_CreatBorrow_ButtonClicking(sender, args) {
        var Key = args.get_item().get_value();
        var meetingStartTimeValue = $("#<%=hidMeetingStartTime.ClientID%>").val();
        var meetingEndTimeValue = $("#<%=hidMeetingEndTime.ClientID%>").val();
        if (Key == "create") {

            args.set_cancel(true);

            var borrowGuidObj = $("#<%=hideBorrowGUID.ClientID%>");
            var borrowValue = borrowGuidObj.val();

            var borrowPlantsObj = "<%=hidBorrowPlants.ClientID %>";                       

            //2015/08/05 ken 改變會議時間後要更新借用帶入的會議時間, 且不要postback, 所以改用前端變數處理
           
            var repeatType = '';
            repeatType = $("#<%=hfRepeatType.ClientID %>").val();
            if (borrowValue != '') {
                $uof.dialog.open2("~/EIP/Plant/BorrowEdit.aspx", args.get_item(), "", 1080, 800, openBorrowDialogResult, { "borrowPlants": borrowPlantsObj, "borrowGuid": borrowValue, "MeetingStartTime": meetingStartTimeValue, "MeetingEndTime": meetingEndTimeValue, "repeatType": repeatType });
            }
            else {
                $uof.dialog.open2("~/EIP/Plant/BorrowEdit.aspx", args.get_item(), "", 1080, 800, openBorrowDialogResult, { "borrowPlants": borrowPlantsObj, "MeetingStartTime": meetingStartTimeValue, "MeetingEndTime": meetingEndTimeValue, "repeatType": repeatType });
            }
        }
        else if (Key == "delete") {
            if (confirm('<%=msgDelconfirm.Text %>') == false)
                args.set_cancel(true);
        }
        else if (Key == "examineplant") {
            args.set_cancel(true);
            var userGuid = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideUserGUID.Value, true) %>');
            var borrowPlantsObj =  "<%=hidBorrowPlants.ClientID%>";     

            $uof.dialog.open2("~/EIP/Plant/ChoiceApprovePlant.aspx", args.get_item(), '<%=lblTitle.Text%>', 800, 600, openBorrowDialogResult, { "borrowPlants": borrowPlantsObj, "UserGuid": userGuid, "MeetingStartTime": meetingStartTimeValue, "MeetingEndTime": meetingEndTimeValue });
        }
    }

    function openBorrowDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null) {
            return false;
        }
        else {
            return true;
        }
    }

    function rdpStart_ValueChanged(sender, args) {

        var rdtStart = $(sender);
        var status = "<%=m_Status%>";
        var id = sender.get_element().attributes["id"].value;
        var borrowPlantsObj = $("#<%=hidBorrowPlants.ClientID%>");
        var data = [borrowPlantsObj.val(), id, args.get_newValue(), status];
        var returnValue = $uof.pageMethod.syncUc("EIP/Calendar/Common/UC_CreateBorrow.ascx", "AlterHidPlantBorrowB", data);
        borrowPlantsObj.val(returnValue);
    }

    function rtpStart_ValueChange(sender, args) {

        var rdtStart = $(sender);
        var status = "<%=m_Status%>";
        var id = sender.get_element().attributes["id"].value;
        var borrowPlantsObj = $("#<%=hidBorrowPlants.ClientID%>");
        var data = [borrowPlantsObj.val(), id, args.get_newValue(), status];
        var returnValue = $uof.pageMethod.syncUc("EIP/Calendar/Common/UC_CreateBorrow.ascx", "AlterHidPlantBorrowB", data);
        borrowPlantsObj.val(returnValue);
    }

    function rdpEnd_ValueChanged(sender, args) {

        var rdtStart = $(sender);
        var status = "<%=m_Status%>";
        var id = sender.get_element().attributes["id"].value;
        var borrowPlantsObj = $("#<%=hidBorrowPlants.ClientID%>");
        var data = [borrowPlantsObj.val(), id, args.get_newValue(), status];
        var returnValue = $uof.pageMethod.syncUc("EIP/Calendar/Common/UC_CreateBorrow.ascx", "AlterHidPlantBorrowB", data);
        borrowPlantsObj.val(returnValue);
    }

    function rtpEnd_ValueChange(sender, args) {

        var rdtStart = $(sender);
        var status = "<%=m_Status%>";
        var id = sender.get_element().attributes["id"].value;
        var borrowPlantsObj = $("#<%=hidBorrowPlants.ClientID%>");
        var data = [borrowPlantsObj.val(), id, args.get_newValue(), status];
        var returnValue = $uof.pageMethod.syncUc("EIP/Calendar/Common/UC_CreateBorrow.ascx", "AlterHidPlantBorrowB", data);
        borrowPlantsObj.val(returnValue);
    }
</script>
<table width="100%">
    <tr>
        <td>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_CreatBorrow_ButtonClicking" CausesValidation="false"
                Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
                <Items>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                        ImageUrl="~/EIP/Personal/icon_images/icon_m31.gif" Value="create" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                        Text="新增借用" meta:resourcekey="TBarButtonResource1" CausesValidation="false">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" Visible="false">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton  runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                        ImageUrl="~/EIP/Personal/icon_images/icon_m31.gif" Value="examineplant" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                        Text="選擇已核准的設備" CausesValidation="false" Visible="false" meta:resourcekey="TBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" CausesValidation="false"
                        ImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" Value="delete" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m03.gif"
                        Text="刪除" meta:resourcekey="TBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="設備已被借出或已歸還不可刪除"
                ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                        DataKeyNames="DETAIL_GUID" Width="100%" AllowSorting="True" OnRowDataBound="Grid1_RowDataBound"
                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnhancePager="True"
                        PageSize="4" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging">
                        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl=""
                            LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass=""
                            PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl=""
                            ShowHeaderPager="True"></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:BoundField DataField="CLASS_NAME" HeaderText="類別" meta:resourcekey="BoundFieldResource1"></asp:BoundField>
                            <asp:BoundField DataField="SERIAL_NO" HeaderText="編號" meta:resourcekey="BoundFieldResource2"></asp:BoundField>
                            <asp:BoundField DataField="PLANT_NAME" HeaderText="名稱" meta:resourcekey="BoundFieldResource3"></asp:BoundField>
                            <asp:TemplateField HeaderText="狀態" meta:resourcekey="BoundFieldResource4" >
                                <ItemTemplate>
                                    <asp:Label ID="lblBorrowState" runat="server" Text='<%#: Eval("BORROW_STATE") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DETAIL_GUID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblDetailGuid" runat="server" Text='<%#: Eval("DETAIL_GUID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BORROW_GUID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblBorrowGuid" runat="server" Text='<%#: Eval("BORROW_GUID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PLANT_GUID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblPlantGuid" runat="server" Text='<%# Eval("PLANT_GUID") %>'></asp:Label>
                                    <asp:Label ID="lblIsMeetingRoom" runat="server" Text='<%# Eval("IS_MEETINGROOM") %>'></asp:Label>
                                    <asp:Label ID="lblPlantName" runat="server" Text='<%#: Eval("PLANT_NAME") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField >
                            <asp:TemplateField HeaderText="Type" Visible="False">
                                 <ItemTemplate>
                                    <asp:Label ID="lblType" runat="server" Text='<%#: Eval("TYPE") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="借用時間" meta:resourcekey="BoundFieldResource5" />
                        </Columns>
                        <HeaderStyle Wrap="false" />
                    </Fast:Grid>
                    <asp:HiddenField ID="hfRepeatType" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>
<asp:Label ID="lblTitle" runat="server" Text="選擇已核准的設備" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
<asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
<asp:HiddenField ID="hideUserGUID" runat="server" />
<asp:HiddenField ID="hideBorrowGUID" runat="server" />
<asp:HiddenField ID="hidBorrowPlants" runat="server" />
<asp:HiddenField ID="hidMeetingStartTime" runat="server" />
<asp:HiddenField ID="hidMeetingEndTime" runat="server" />
<asp:HiddenField ID="hidDetailCount" runat="server" />
<asp:HiddenField ID="hidApproveCount" runat="server" />


