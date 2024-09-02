<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="PunchInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.PunchInfoUC" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<script>
    function ValidateApply_<%=ClientID%>(sender, arguments) {       
        var result = '';
        var company_NO =  $("#<%=hfApplicantCompanyNo.ClientID%>").val();
        var employ_NO = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();       
        var startDate = $find("<%=rdPunchDate.ClientID%>").get_dateInput().get_value();
        var startTime = $find("<%=rtWorkTime.ClientID%>").get_dateInput().get_value();
        var endDate = $find("<%=rdPunchDate.ClientID%>").get_dateInput().get_value();
        var endTime = $find("<%=rtOffTime.ClientID%>").get_dateInput().get_value();
        var reason = $("#<%=txtReason.ClientID%>").val();      

        //沒有公司統編或員編就不跑其他驗證       
        if (company_NO === '' || employ_NO === '') {
            return;
        }

        if (startTime === '' && endTime === '') {           
            sender.innerText = '<%=lblEmptyPunchTime.Text%>'
            arguments.IsValid = false;
            return;
        }
        else {           
            data = [company_NO, employ_NO, startDate, startTime, endDate, endTime, reason];
            result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/PunchInfoUC.ascx", "ValidateApply", data);

            if (result === '@#TimeIsNotValid##') {
                sender.textContent = '<%=lblTimeIsNotValid.Text%>';
                arguments.IsValid = false;
                return;
            }

            if (result !== '') {
                sender.textContent = result;
                arguments.IsValid = false;
                return;
            }
        }
    }   
    
    function ValidateMissingInfo_<%=ClientID%>(source, arguments) {
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
         var applicantCompanyUnifiedId = $("#<%=hfApplicantCompanyNo.ClientID%>").val();

        if (applicantEmployeeNo === '' || applicantCompanyUnifiedId === '') {
            arguments.IsValid = false;
            return;
        }
    }

    // 事由必填
    function CheckRemarkRequired(source, args) {
        var remark = $("#<%=txtReason.ClientID%>");
        if (remark && remark.val().trim()==="") {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table class="PopTable" style="width: 100%">
            <tr>
                <td style="white-space:nowrap">
                    <asp:Label ID="lblDateTitle" runat="server" Text="忘刷卡日期" meta:resourcekey="lblDateTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPunchDate" runat="server" Visible="False" meta:resourcekey="lblDateResource1"></asp:Label>
                    <telerik:RadDatePicker ID="rdPunchDate" runat="server" SkinID="AllowEmpty" meta:resourcekey="rdDateResource1" >
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" />
                            <DateInput LabelWidth="40%"  DateFormat="yyyy/MM/dd" DisplayDateFormat="yyyy/MM/dd" Width="">
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </DateInput>
                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td style="white-space:nowrap">
                    <asp:Label ID="lblWorkTimeTitle" runat="server" Text="上班忘刷卡時間" meta:resourcekey="lblWorkTimeTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblWorkTime" runat="server" Visible="False" meta:resourcekey="lblWorkTimeResource1" ></asp:Label>
                    <telerik:RadTimePicker ID="rtWorkTime" runat="server" SkinID="AllowEmpty"  meta:resourcekey="rtWorkTimeResource1" >
                    
                    </telerik:RadTimePicker>
                </td>
            </tr>
            <tr>
                <td style="white-space:nowrap">
                    <asp:Label ID="lbOffTimeTitle" runat="server" Text="下班忘刷卡時間" meta:resourcekey="lbOffTimeTitleResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblOffTime" runat="server" Visible="False" meta:resourcekey="lblOffTimeResource1" ></asp:Label>
                    <telerik:RadTimePicker ID="rtOffTime" runat="server" SkinID="AllowEmpty"  meta:resourcekey="rtOffTimeResource1" >
                     
                    </telerik:RadTimePicker>
                </td>
            </tr>
            <tr>
                <td style="white-space:nowrap">
                    <asp:Label ID="lblRemartTitleRequired" runat="server" ForeColor="Red" Text="*" Visible="false"></asp:Label>
                    <asp:Label ID="lblReasonTitle" runat="server" Text="事由" meta:resourcekey="lblReasonTitleResource1"></asp:Label>
                </td>
                <td>                    
                    <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine"  Rows="3" Width="100%" meta:resourcekey="txtReasonResource1"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvMissingInfo" runat="server" ErrorMessage="申請者無員工編號或公司統一編號資訊" Display="Dynamic" meta:resourcekey="cvMissingInfoResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvRemark" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="事由不可空白" Visible="False" ClientValidationFunction="CheckRemarkRequired" meta:resourcekey="cvRemarkResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>       
                    <asp:CustomValidator ID="cvApply" runat="server" Display="Dynamic" meta:resourcekey="cvApplyResource1"></asp:CustomValidator>              
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>            
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblWorkPunch" runat="server" Text="補上班卡" Visible="False" meta:resourcekey="lblWorkPunchResource1"></asp:Label>
<asp:Label ID="lblOffPunch" runat="server" Text="補下班卡" Visible="False" meta:resourcekey="lblOffPunchResource1"></asp:Label>
<asp:Label ID="lblEmptyPunchTime" runat="server" Text="上班忘刷卡 及 下班忘刷卡之時間 ,請記得填寫" Visible="false" meta:resourcekey="lblEmptyPunchTimeResource1" ></asp:Label>
<asp:Label ID="lblTimeIsNotValid" runat="server" Text="所申請的日期/時間不可晚於現在時間。" Visible="false" meta:resourcekey="lblTimeIsNotValidResource1"></asp:Label>
<asp:HiddenField ID="hfApplicant" runat="server" />
<asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
<asp:HiddenField ID="hfApplicantCompanyNo" runat="server" />
<asp:HiddenField ID="hfFormNumber" runat="server" />
<asp:HiddenField ID="hfFieldMode" Value="" runat="server" />