<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ViewMembersSchedule.aspx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.ViewMembersSchedule" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc7" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        @import url('../../Common/javascript/SuperTable/superTables.css');
    </style>
    <script type="text/javascript" src="../../Common/javascript/SuperTable/superTables.js"></script>
    <script type="text/javascript" src="../../Common/javascript/SuperTable/jquery.superTable.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(
          function  () {
            if ($('#<%=hfPostBack.ClientID%>').val() != 'True') return;
            $('#<%=hfPostBack.ClientID%>').val('False');

            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != 'undefined') {
                pd = dialogArguments.document;
            }

            if (pd) {                    
                //與會人員 
                if ($("#<%=Request.QueryString["meetingUsersClientId"]%>", pd) != null) {
                    var hfClientID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["meetingUsersClientId"] ,true)%>');
                    var userSetData = $("#" + hfClientID, pd).val();
                    $('#<%=hfMeetingMember.ClientID %>').val(userSetData);
                }
                $('#<%= btnLoadUser.ClientID%>').click();
            }
        });

        function UpdateMeetingData() {
            var curwindow = $uof.dialog.getOpener();
            var pd;

            if (curwindow) {
                pd = curwindow.document;
            }
            else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArgument.document;
            }

            var agnetJSON = $('#<%=hfMeetingMember.ClientID %>').val();
            $('#<%=Request.QueryString["meetingUsersClientId"]%>', pd).val(agnetJSON);
        }

        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
                args.set_cancel(true);
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table border="0" class="PopTable" style="width: 100%">
                <tr>
                    <td style="white-space: nowrap">
                        <span style="color: #ff0000">*</span><asp:Label ID="lblStartTimeTitle" runat="server" Text="開始時間" meta:resourcekey="lblStartTimeTitleResource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap">
                        <telerik:RadDateTimePicker ID="rdStartTime" runat="server" meta:resourcekey="rdStartTimeResource1"></telerik:RadDateTimePicker>
                        <asp:CustomValidator ID="cvStartTime" runat="server" Display="Dynamic" ErrorMessage="請填入開始時間" meta:resourcekey="cvStartTimeResource1"></asp:CustomValidator>
                    </td>
                    <td style="white-space: nowrap">
                        <span style="color: #ff0000">*</span><asp:Label ID="lblEndTimeTitle" runat="server" Text="結束時間" meta:resourcekey="lblEndTimeTitleResource1"></asp:Label>
                    </td>
                    <td style="white-space: nowrap">
                        <telerik:RadDateTimePicker ID="rdEndTime" runat="server" meta:resourcekey="rdEndTimeResource1"></telerik:RadDateTimePicker>
                        <asp:CustomValidator ID="cvEndTime" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" meta:resourcekey="cvEndTimeResource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="cvTimeLimit" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" meta:resourcekey="cvTimeLimitResource1"></asp:CustomValidator>

                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <span style="color: #ff0000">*</span><asp:Label ID="lblChairTitle" runat="server" Text="主席" meta:resourcekey="lblChairTitleResource1"></asp:Label>
                    </td>
                    <td colspan="3" style="white-space: nowrap">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblChairViewer" runat="server" meta:resourcekey="lblChairViewerResource1"></asp:Label>
                                <uc7:UC_BtnChoiceOnce ID="UC_BtnChoiceChair" runat="server" />
                                <asp:CustomValidator ID="cvCheckChair" runat="server" Display="Dynamic" ErrorMessage="主席不允許空白" meta:resourcekey="cvCheckChairResource1"></asp:CustomValidator>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" style="white-space: nowrap">
                        <span style="color: #ff0000">*</span><asp:Label ID="lblMember" runat="server" Text="預計參加人員" meta:resourcekey="lblMemberResource1"></asp:Label>
                    </td>
                    <td colspan="3" style="height: 150px;">
                        <uc1:UC_ChoiceList ID="UC_ChoiceMemberList" runat="server" ShowMember="False" TreeHeight="100px" />
                        <asp:CustomValidator ID="cvChoiceMember" runat="server" Display="Dynamic" ErrorMessage="參加人員不允許空白" meta:resourcekey="cvChoiceMemberResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap; text-align: center" colspan="4">
                        <telerik:RadButton ID="btnQuery" runat="server" Text="查詢" OnClick="btnQuery_Click" meta:resourcekey="btnQueryResource1" Style="position: relative;"></telerik:RadButton>
                    </td>
                </tr>
            </table>
            <div><br></div>
            <table>
                <tr style="line-height: 10px;">
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <table style="white-space: nowrap;">
                                        <tr>
                                            <td width="10px"></td>
                                            <td style="white-space: nowrap;">
                                                <asp:Label ID="lblmeetingTimeImage" runat="server" Text="會議時間：" meta:resourcekey="lblmeetingTimeImageResource1"></asp:Label>
                                            </td>
                                            <td>
                                                <img src="<%=themePath%>/images/calendar_01.gif" width="60" height="23">
                                            </td>
                                            <td width="20px"></td>
                                            <td style="white-space: nowrap;">
                                                <asp:Label ID="lblmeetingScheduleImage" runat="server" Text="會議時間內其他行程：" meta:resourcekey="lblmeetingScheduleImageResource1"></asp:Label>
                                            </td>
                                            <td>
                                                <img src="<%=themePath%>/images/borrow_04.gif" width="60" height="23">
                                            </td>
                                            <td style="width:20px"></td>
                                            <td style="white-space: nowrap;">
                                                <asp:Label ID="lblMeetingDate" runat="server" Text="會議日期：" meta:resourcekey="lblMeetingDateResource1"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="imgPre" runat="server" ImageUrl="~/EIP/Calendar/images/pre.jpg" OnClick="imgPre_Click" meta:resourcekey="imgPreResource1" />
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="rdMeetingDate" runat="server" OnSelectedDateChanged="wdcQueryDate_SelectedDateChanged" AutoPostBack="True" meta:resourcekey="rdMeetingDateResource1"></telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="imgNext" runat="server" ImageUrl="~/EIP/Calendar/images/next.jpg" OnClick="imgNext_Click" meta:resourcekey="imgNextResource1" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Ede:Grid ID="gridViewMeeting" runat="server" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                            DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15" OnRowDataBound="gridViewMeeting_RowDataBound" AllowSorting="True"
                            EmptyDataText="沒有資料" KeepSelectedRows="False" CustomDropDownListPage="False" meta:resourcekey="gridViewMeetingResource1" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        </Ede:Grid>
                    </td>
                </tr>
            </table>

            <asp:Button ID="btnLoadUser" runat="server" Style="display: none" OnClick="btnLoadUser_Click" meta:resourcekey="btnLoadUserResource1" />
            <asp:HiddenField ID="hfPostBack" runat="server" Value="True" />
            <asp:Label ID="lblAttendee" runat="server" Text="參加人員" Visible="False" meta:resourcekey="lblAttendeeResource1"></asp:Label>
            <asp:Label ID="lblChair" runat="server" Text="主席" Visible="False" meta:resourcekey="lblChairResource1"></asp:Label>
            <asp:Label ID="lblSave" runat="server" Text="更新會議內容" Visible="False" meta:resourcekey="lblSaveResource1"></asp:Label>
            <asp:Label ID="lblChairGuid" runat="server" Visible="False" meta:resourcekey="lblChairGuidResource1"></asp:Label>
            <asp:Label ID="lblMemberXml" runat="server" Visible="False" meta:resourcekey="lblMemberXmlResource1"></asp:Label>
            <asp:HiddenField ID="hfMeetingMember" runat="server" />
            <asp:HiddenField ID="hfMeetingGuid" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
