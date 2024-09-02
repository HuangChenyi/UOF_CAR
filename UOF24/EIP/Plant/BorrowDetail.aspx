<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Plant_BorrowDetail" Title="借用明細" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="BorrowDetail.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register src="../Calendar/Common/UC_RepeatRange.ascx" tagname="UC_RepeatRange" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        function rdtStart_ValueChanged(sender, args) {

            var rdtStart = $(sender);

            var date = args.get_newValue();
            var id = sender.get_element().attributes["id"].value;

            var borrowPlantsObj = $("#<%=hidBorrowPlants.ClientID%>");
            var alertData = [borrowPlantsObj.val(), id, date];
            var returnValue = $uof.pageMethod.sync("AlterHidPlantBorrow", alertData);

            borrowPlantsObj.val(returnValue);
        }

        function rdtEnd_ValueChanged(sender, args) {

            var rdtStart = $(sender);

            var date = args.get_newValue();
            var id = sender.get_element().attributes["id"].value;

            var borrowPlantsObj = $("#<%=hidBorrowPlants.ClientID%>");
            var alertData = [borrowPlantsObj.val(), id, date];
            var returnValue = $uof.pageMethod.sync("AlterHidPlantBorrowB", alertData);

            borrowPlantsObj.val(returnValue);
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            switch (value) {
                case "create":
                    args.set_cancel(true);
                    var borrowPlantsObj = "<%=hidBorrowPlants.ClientID%>";
                    var borrowGuid = "<%=Request.QueryString["borrowGuid"]%>";
                    var meetingStartTimeValue = $("#<%=hfMeetingStartTime.ClientID%>").val();
                    var meetingEndTimeValue = $("#<%=hfMeetingEndTime.ClientID%>").val();
                    var repeatType = '';
                   
                    repeatType = $("#<%=hfRepeatType.ClientID %>").val();
                    if (borrowGuid != '') {
                        $uof.dialog.open2("~/EIP/Plant/BorrowEdit.aspx", args.get_item(), "", 1080, 800, openDialogResult, { "borrowPlants": borrowPlantsObj, "borrowGuid": borrowGuid, "MeetingStartTime": meetingStartTimeValue, "MeetingEndTime": meetingEndTimeValue, "repeatType": repeatType });
                    }
                    else {
                        $uof.dialog.open2("~/EIP/Plant/BorrowEdit.aspx", args.get_item(), "", 1080, 800, openDialogResult, {"repeatType": repeatType });
                    }

                    break;

                case "delete":
                    args.set_cancel(!confirm('<%=msgDelconfirm.Text %>'));
                    break;
            }
        }

        function Button2Click() {
            return confirm('<%= msgDelconfirm.Text %>');
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <table width="100%">
        <tr>
            <td valign="top" width="45%">
                <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="設備已被預訂,無法新增借用" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="只有預約狀態的借用才可刪除" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator9" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage=""></asp:CustomValidator>
                <table class="PopTable" cellspacing="1" width="100%">
                    <tr>
                        <td style="white-space: nowrap;">
                            <span style="color: #ff0000">*</span><asp:Label ID="lbLeftTopic" runat="server" Text="主旨" meta:resourcekey="lbLeftTopicResource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txbTopic" runat="server" Width="100%" meta:resourcekey="txbTopicResource1" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbTopic" ForeColor="Red"
                                Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="lbLeftDesc" runat="server" Text="說明" meta:resourcekey="lbLeftDescResource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txbDesc" runat="server" TextMode="MultiLine" Width="100%" Height="90px" meta:resourcekey="txbDescResource1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="lbLeftCreator" runat="server" Text="借用人員" meta:resourcekey="lbLeftCreatorResource1"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbCreator" runat="server" meta:resourcekey="lbCreatorResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trRepeat" runat="server">
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="週期性" meta:resourcekey="Label6Resource1"></asp:Label>
                        </td>
                        <td>                                          
                            <uc1:UC_RepeatRange ID="UC_RepeatRange1" runat="server" />
                            <asp:Label ID="lblMeetingRepeatLimit" runat="server" CssClass="SizeMemo"></asp:Label>
                        </td>
                    </tr>
                    <tr style="white-space: nowrap;">
                        <td><span style="color: #ff0000">*</span><asp:Label ID="lbLeftPlant" runat="server" Text="場地設備" meta:resourcekey="lbLeftPlantResource1"></asp:Label></td>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto"  meta:resourcekey="Panel1Resource1">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                                                <Items>
                                                    <telerik:RadToolBarButton runat="server" Text="新增借用" Value="create"
                                                        ClickedImageUrl="~/EIP/Personal/icon_images/icon_m31.gif" DisabledImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                                                        HoveredImageUrl="~/EIP/Personal/icon_images/icon_m31.gif" ImageUrl="~/EIP/Personal/icon_images/icon_m31.gif" meta:resourcekey="RadToolBarButtonResource1">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" Text="刪除" Value="delete"
                                                        ClickedImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" DisabledImageUrl="~/EIP/Personal/icon_images/icon_m03.gif"
                                                        HoveredImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" ImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                                                    </telerik:RadToolBarButton>
                                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                                    </telerik:RadToolBarButton>
                                                </Items>
                                            </telerik:RadToolBar>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>

                                                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請選擇欲借用的場地設備" ForeColor="Red" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                                <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="" ForeColor="Red" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                                                <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="結束時間需晚於開始時間" meta:resourcekey="CustomValidator4Resource2"></asp:CustomValidator>
                                                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="請填入開始時間" meta:resourcekey="CustomValidator5Resource2"></asp:CustomValidator>
                                                <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="請填入結束時間" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                                            <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True"
                                                AutoGenerateColumns="False" DataKeyNames="DETAIL_GUID"
                                                Width="100%" AllowSorting="True" OnRowDataBound="Grid1_RowDataBound"
                                                OnRowCommand="Grid1_RowCommand"
                                                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                                EnhancePager="True" PageSize="4"  EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="Grid1Resource2" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                                                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>

                                                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                                <Columns>
                                                    <asp:BoundField DataField="CLASS_NAME" HeaderText="類別" meta:resourcekey="BoundFieldResource1"></asp:BoundField>
                                                    <asp:BoundField DataField="PLANT_NAME" HeaderText="名稱" meta:resourcekey="BoundFieldResource2"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="狀態" meta:resourcekey="BoundFieldResource3" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="借用時間" meta:resourcekey="BoundFieldResource4" />
                                                    <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="btnLoan" Text="借出" CommandName="btnLoan" meta:resourceKey="btnLoanResource1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="btnReject" Text="拒絕" CommandName="btnReject" meta:resourceKey="btnRejectResource1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="btnReturn" Text="歸還" CommandName="btnReturn" meta:resourceKey="btnReturnResource1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="DETAIL_GUID" Visible="False"
                                                        meta:resourcekey="TemplateFieldResource4">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDetailGuid" runat="server" Text='<%# Eval("DETAIL_GUID") %>'
                                                                meta:resourcekey="lblDetailGuidResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="BORROW_GUID" Visible="False"
                                                        meta:resourcekey="TemplateFieldResource5">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBorrowGuid" runat="server" Text='<%# Eval("BORROW_GUID") %>'
                                                                meta:resourcekey="lblBorrowGuidResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="PLANT_GUID" Visible="False"
                                                        meta:resourcekey="TemplateFieldResource6">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPlantGuid" runat="server" Text='<%# Eval("PLANT_GUID") %>'
                                                                meta:resourcekey="lblPlantGuidResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </Fast:Grid>
                                            <asp:HiddenField ID="hfRepeatType" runat="server" />
                                                    </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                                <asp:CustomValidator ID="CustomValidator8" runat="server" Display="Dynamic" ErrorMessage="" ForeColor="Red"></asp:CustomValidator>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>

        </tr>
    </table>
    <asp:Label ID="lblErr" runat="server" Text="下列場地/設備目前已借出，尚未歸還，請於歸還後再進行借用。<br />(管理者須對該設備進行歸還操作，才算完成歸還)<br />借用主旨:{0}<br /> 借用時間:{1}<br />借用者:{2}<br />" Visible="false" meta:resourcekey="lblErrResource1"></asp:Label>
    <asp:Label ID="lbBorrowGuid" runat="server" Visible="False" meta:resourcekey="lbBorrowGuidResource1"></asp:Label>
    <asp:Label ID="lbDetailGuid" runat="server" Visible="False" meta:resourcekey="lbDetailGuidResource1"></asp:Label>
    <asp:Label ID="lbIsRecord" runat="server" Visible="False" meta:resourcekey="lbIsRecordResource1"></asp:Label>
    <asp:Label ID="lblStateSigning" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblStateSigningResource1"></asp:Label>
    <asp:Label ID="lbSteteBooking" runat="server" Text="預約" Visible="False" meta:resourcekey="lbSteteBookingResource1"></asp:Label>
    <asp:Label ID="lbSteteLoaned" runat="server" Text="已借出" Visible="False" meta:resourcekey="lbSteteLoanedResource1"></asp:Label>
    <asp:Label ID="lbSteteReturned" runat="server" Text="歸還" Visible="False" meta:resourcekey="lbSteteReturnedResource1"></asp:Label>
    <asp:Label ID="lbSteteRejected" runat="server" Text="被拒絕" Visible="False" meta:resourcekey="lbSteteRejectedResource1"></asp:Label>
    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="lbDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lbDeleteResource1"></asp:Label>
    <asp:Label ID="lblLoginAlert" runat="server" Text="登入者非此設備保管人,所以無法回覆 !" Visible="False" meta:resourcekey="lblLoginAlertResource1"></asp:Label>
    <asp:HiddenField ID="hidBorrowPlants" runat="server" />
    <asp:Label ID="lblMsg1" runat="server" Text="只允許新增{0}天內借用，另欲新增週期性借用，請先選擇週期設定" Visible="False" meta:resourcekey="lblMsg1Resource1" ></asp:Label>
    <asp:Label ID="lblMsg2" runat="server" Text="只允許新增當日借用，另欲新增週期性借用，請先選擇週期設定" Visible="False" meta:resourcekey="lblMsg2Resource1" ></asp:Label>
    <asp:Label ID="lblSelfBrorrow" runat="server" Text="借用時間重覆, 無法新增,明細如下:" Visible="False" meta:resourcekey="lblSelfBrorrowResource1"></asp:Label>
    <asp:Label ID="lblSelfDetailBrorrow" runat="server" Text="<br />{0} 和 {1}" Visible="False" meta:resourcekey="lblSelfDetailBrorrowResource1"></asp:Label>
    <asp:Label ID="lblError" runat="server" Text="{0}({1})設備已被預訂,無法新增借用,借用明細如下:" Visible="False" meta:resourcekey="lblErrorResource1"></asp:Label>
    <asp:Label ID="lblErrDetail" runat="server" Text=" <br />借用主旨:{0}<br />借用時間:{1}<br />借用者:{2}<br />" Visible="False" meta:resourcekey="lblErrDetailResource1"></asp:Label>
    <asp:HiddenField ID="hfSelfError" runat="server" />
    <asp:HiddenField ID="hfMeetingStartTime" runat="server" />
    <asp:HiddenField ID="hfMeetingEndTime" runat="server" />
    <asp:HiddenField ID="hfError" runat="server" />
    <asp:HiddenField ID="hfAuthErrMsg" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblSampleShowLimitMsg" runat="server" Text="設備{0}只開放今天後{1}天內借用(可借用到{2})。" Visible="false" meta:resourcekey="lblSampleShowLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblAuthErrMsg" runat="server" Text="您沒有借用{0}的權限，請重新選取。<br />" Visible="false"  meta:resourcekey="lblAuthErrMsgResource1"></asp:Label>
    <asp:Label ID="lblLimitMsg" runat="server" Text="{0}只開放借用到{1}，無法新增。" Visible="false"  meta:resourcekey="lblLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblRangeLimitMsg" runat="server" Text="{0}{1}~{2}不開放借用，無法新增。" Visible="false"  meta:resourcekey="lblRangeLimitMsgResource1"></asp:Label>

</asp:Content>

