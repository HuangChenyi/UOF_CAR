<%@ Page Title="週期會議借用設備" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="MeetingPlantDetail.aspx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.MeetingPlantDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/EIP/Plant/UC_EquipmentDetail.ascx" TagPrefix="uc1" TagName="UC_EquipmentDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function() {
            var isPostBack = $("#<%=hfIsPostBack.ClientID%>");
            if (isPostBack.val() === 'false') {
                isPostBack.val('true');
                var curwindow = $uof.dialog.getOpener();             
                var pd;
                if (curwindow) {
                    pd = curwindow.document;
                } else if (typeof (dialogArguments) != "undefined") {
                    pd = dialogArguments.document;
                }
                var meetingClientId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["meetingClientId"],true)%>');
                var hfVal = $("#" + meetingClientId, pd).val();
                if (pd) {
                    $("#<%=hfMeetingGuids.ClientID%>").val(hfVal);
                }
                $("#<%=btnPostBack.ClientID%>").click();                  
            }
        });

        function rdbarBorrow_ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            if (key === "delete") {
                if (!confirm('<%=lblDelConfirm.Text%>')) {
                    args.set_cancel(true);
                }
            }
        }
        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblNotAllowWeek" runat="server" Visible="false" Text="設備不允許週期借用，請自行單筆新增要借用的設備。" ForeColor="Red" meta:resourcekey="lblNotAllowWeekResource1"></asp:Label>
            <asp:Panel ID="Panel1" runat="server" Height="50px" Visible="False" ScrollBars="Vertical" meta:resourcekey="Panel1Resource1">
                <asp:Label ID="lblErrorMsg" runat="server" Text="以下會議序號部分設備無法借用，請重新選擇要借用的設備："  ForeColor="Red" meta:resourcekey="lblErrorMsgResource1"></asp:Label>
                <br />
                <asp:Label ID="lblMeetingNO" runat="server"  ForeColor="Red" meta:resourcekey="lblMeetingNOResource1"></asp:Label>
            </asp:Panel>
            </ContentTemplate>
    </asp:UpdatePanel>
            <telerik:RadToolBar ID="rdbarDetail" runat="server" OnClientButtonClicking="rdbarBorrow_ButtonClicking" OnButtonClick="rdbarDetail_ButtonClick" CausesValidation="False" Width="100%" meta:resourcekey="rdbarDetailResource1" SingleClick="None" >
                <Items>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m03.gif"
                                              ImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" Value="delete" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m03.gif"
                                              Text="取消會議" CausesValidation="false" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" >
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <Ede:Grid ID="meetingGrid" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False" DataKeyNames="MEETING_GUID" Width="100%" AllowPaging="True"
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                EnhancePager="True" EmptyDataText="沒有資料" PageSize="10"
                KeepSelectedRows="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" OnRowDataBound="meetingGrid_RowDataBound" OnPageIndexChanging="meetingGrid_PageIndexChanging" meta:resourcekey="meetingGridResource1">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                     <asp:BoundField DataField="ROW_NO" HeaderText="序號" meta:resourcekey="BoundFieldResource1" >
                    <HeaderStyle Width="30px" Wrap="False" />
                     <ItemStyle HorizontalAlign="Center" />
                     </asp:BoundField>                    
                    <asp:TemplateField HeaderText="會議時間" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTime" runat="server" meta:resourcekey="lblTimeResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="True" />
                        <ItemStyle Width="200px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="設備" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <uc1:UC_EquipmentDetail runat="server" ID="equipmentDetail" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>                   
                </Columns>
            </Ede:Grid>
            
            <asp:HiddenField ID="hfMeetingGuids" runat="server" />            
            <asp:HiddenField ID="hfIsPostBack" runat="server" Value="false" />
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfVaildIsFail" runat="server" />
            <asp:HiddenField ID="hfRepeatType" runat="server" />
            <asp:HiddenField ID="hfRepeatGuid" runat="server" />
            <asp:HiddenField ID="hfBorrowEmpty" runat="server" />
            <asp:HiddenField ID="hfRemindTime" runat="server"  />
            <asp:HiddenField ID="hfHasRemindTime" runat="server" />
            <asp:HiddenField ID="hfAllowRepeat" runat="server" />
            <asp:Label ID="lblDialogTitle" runat="server" Text="借用設備" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>       
            <asp:Label ID="lblDelConfirm" Text="確定要刪除該筆會議?" runat="server" Visible="False" meta:resourcekey="lblDelConfirmResource1"></asp:Label>
            <asp:Button ID="btnPostBack" runat="server" Text="Button" Style="display: none;" OnClick="btnPostBack_Click" meta:resourcekey="btnPostBackResource1" />
</asp:Content>
