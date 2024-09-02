<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaveBatchInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.LeaveBatchInfoUC" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc2" TagName="UC_ChoiceListMobile" %>

<style>
    .LeaveTable104 > tbody > tr:nth-child(even) > td {
        padding-left : 10px;
        padding-bottom: 10px;
    }

    .LeaveTable104 > tbody > tr:nth-child(odd) > td {
        padding-left : 10px;
        padding-bottom: 10px;
    }

    .labelMutiline {
      white-space:pre-wrap;
    }
</style>
<script type="text/javascript">
    function CheckDataEmpty(source, args) {    
        var leaveInfoDt = $("#<%=hfLeaveInfoDt.ClientID %>").val();
        if (leaveInfoDt === null || leaveInfoDt === '[]' || leaveInfoDt === '') {
            args.IsValid = false;
            return;
        }
        else {
            var data = [leaveInfoDt]
            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "CheckDataEmpty", data);
            if (result != '') {
                args.IsValid = false;
                return;
            }
            args.IsValid = true;
        }
    }
     function ValidateMissingInfo_<%=ClientID%>(source, arguments) {
         var applicant = $("#<%=hfApplicant.ClientID%>").val();
         var data = [applicant]
         var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "ValidateMissingInfo", data);
         if (result === '') {
             arguments.IsValid = false;
             return;
         }
     }


    //驗證代理人必填
    function ValidateAgent_<%=ClientID%>(source, arguments) {
        var agnetJSON;
        var is_Mark = "<%=lblMark.Visible%>";
        var agentMobile = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val();

        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        // 職務代理人的選人範圍，是否為"申請者個人設定中的代理人"
        if (isAgentRangeSetting.toLowerCase() == 'true') {

            if ($('#<%=hfIsAgentUnavailable.ClientID %>').val().toLowerCase() == 'true') {
                arguments.IsValid = false;
                return;
            }

            agnetJSON = $('#<%=hfAgentXML.ClientID %>').val();
        }
        else {
            if (typeof agentMobile !== "undefined" && agentMobile !== "") {
                var selectedArray = agentMobile.split(",");
                var array = new Array(selectedArray.length);

                for (var i = 0; i < selectedArray.length; i++) {
                    array[i] = selectedArray[i].split("|")[1];
                }
                agnetJSON = $uof.json.toString(array);
            }
        }
        
        var data = [is_Mark, agnetJSON, 'Mobile', isAgentRangeSetting];

        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "ValidateAgent", data);

        if (result === '') {
            arguments.IsValid = false;
            return;
        }
    }

    //驗證代理人帳號是否無效
    function ValidateAgentAccount_<%=ClientID%>(source, arguments) {
        var agnetJSON;
        lblAgent = $('#<%=lblAgent.ClientID %>').text();
        lblErrMsg1 = $('#<%=lblErrMsg1.ClientID %>').text();
        var cvRequiredAgentAccount = $("#<%=cvRequiredAgentAccount.ClientID %>");

        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        // 職務代理人的選人範圍，是否為"申請者個人設定中的代理人"
        if (isAgentRangeSetting.toLowerCase() == 'true') {
            agnetJSON = $('#<%=hfAgentXML.ClientID %>').val();
        }
        else {
            var agentMobile = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val().toString();
            if (typeof agentMobile !== "undefined" && agentMobile !== "") {
                var selectedArray = agentMobile.split(",");
                var array = new Array(selectedArray.length);

                for (var i = 0; i < selectedArray.length; i++) {
                    array[i] = selectedArray[i].split("|")[1];
                }
                agnetJSON = $uof.json.toString(array);
            }
        }
        
        var data = [agnetJSON, 'Mobile', isAgentRangeSetting];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "ValidateAgentAccount", data);

        if (result != '') {
            var errMsgAgent = "";
            errMsgAgent = result + lblErrMsg1;
            cvRequiredAgentAccount.text(errMsgAgent);
            arguments.IsValid = false;
            return;
        }    
    }

    //驗證原因必填
    function ValidateReason_<%=ClientID%>(source, arguments) {
        var is_Mark = "<%=lblMark2.Visible%>";
        var reason = $("#<%=txtReason.ClientID%>").val();
        var data = [is_Mark, reason];

        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "ValidateReason", data);

        if (result === '') {
            arguments.IsValid = false;
            return;
        }
    }


    //重新計算時數
    function ValidateCal_<%=ClientID%>(sender, arguments) {
        var leaveInfoDt = $("#<%=hfLeaveInfoDt.ClientID %>").val();
        if (leaveInfoDt === null || leaveInfoDt === '[]' || leaveInfoDt === '') {
            return;
        }
        $("#<%=rdbtnCal.ClientID%>").click();
    }

    //驗證代理人是否包含自己
    function ValidateIncludeApplyUser_<%=ClientID%>(source, arguments) {

        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        // 職務代理人的選人範圍，是否不為"申請者個人設定中的代理人"
        if (isAgentRangeSetting.toLowerCase() != 'true') {
            var agnetJSON;
            var applicantGuid = $("#<%=hfApplicant.ClientID%>").val();
            lblIncludeApplyUser = $('#<%=lblIncludeApplyUser.ClientID %>').text();
            var cvIsInculdeApplyUser = $("#<%=cvIsInculdeApplyUser.ClientID %>");
            var agentMobile = $("#<%=UC_ChoiceListMobile.ClientID%>_hiddenSelected").val().toString();
            if (typeof agentMobile !== "undefined" && agentMobile !== "") {
                var selectedArray = agentMobile.split(",");
                var array = new Array(selectedArray.length);

                for (var i = 0; i < selectedArray.length; i++) {
                    array[i] = selectedArray[i].split("|")[1];
                }
                agnetJSON = $uof.json.toString(array);
            }
            var data = [agnetJSON, 'Mobile', applicantGuid ];

            var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "IsIncludeApplyUser", data);

            if (result == '') {
                var errMsgAgent = "";
                errMsgAgent = lblIncludeApplyUser;
                cvIsInculdeApplyUser.text(errMsgAgent);
                arguments.IsValid = false;
                return;
            }   
        }
        else {
            arguments.IsValid = true;
            return;
        }
    }

    //驗證是否超過申請期限
    function ValidateLeaveLimit_<%=ClientID%>(source, arguments) {
        lblLeaveBefore = $('#<%=lblLeaveBefore.ClientID %>').text();
        lblLeaveAfter = $('#<%=lblLeaveAfter.ClientID %>').text();

        var applicant = $("#<%=hfApplicant.ClientID%>").val();
        var leaveInfoDt = $("#<%=hfLeaveInfoDt.ClientID%>").val();
        var fieldMode = $("#<%= hfFieldMode.ClientID %>").val(); 
        var applyDate = $("#<%= hfApplyDate.ClientID %>").val();

        var cvLeaveLimit = $("#<%=cvLeaveLimit.ClientID %>");
        if (leaveInfoDt === null || leaveInfoDt === '[]' || leaveInfoDt === '') {
            return;
        }
        var data = [applicant, leaveInfoDt, fieldMode, applyDate,lblLeaveBefore,lblLeaveAfter];
        var limitErrMsg = "";
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "ValidateLeaveLimit", data);
        if(result !== '')
        {
            source.innerHTML = result;
            arguments.IsValid = false;
            return;
        }
    }

    function CheckContinuous_<%=ClientID%>(source, arguments) {
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
        var leaveInfoDt = $("#<%=hfLeaveInfoDt.ClientID%>").val();
        if (leaveInfoDt === null || leaveInfoDt === '[]' || leaveInfoDt === '') {
            return;
        }
        var data = [applicantCompanyNo, applicantEmployeeNo, leaveInfoDt];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "CheckContinuous", data);
        if (result !== '') {
            arguments.IsValid = false;
            return;
        }
    }
        
    function ValidateApply_<%=ClientID%>(source, arguments) {
        var applicantEmployeeNo = $("#<%=hfApplicantEmployeeNo.ClientID%>").val();
        var applicantCompanyNo = $("#<%=hfApplicantCompanyNo.ClientID%>").val();
        var applicant = $("#<%=hfApplicant.ClientID%>").val();
        var reason = $("#<%=txtReason.ClientID%>").val();
        var result = '';
        var errorMessage = '';
        var data = [$("#<%=hfFormNumber.ClientID%>").val()];
        var leaveInfoDt = $("#<%=hfLeaveInfoDt.ClientID%>").val();
        if (leaveInfoDt === null || leaveInfoDt === '[]' || leaveInfoDt === '') {
            return;
        }

        if ($("#<%=hfFieldMode.ClientID%>").val() === "ReturnApplicant" || $("#<%=hfFieldMode.ClientID%>").val() === "Signin")
        {
            $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "UpdateStatus", data);
        }
       //沒有公司統編或員編就不跑其他驗證
        if (applicantEmployeeNo === '' || applicantCompanyNo === '') {
            return;
        }

        var agnetJSON = '';
        var isAgentRangeSetting = $("#<%= hfIsAgentRangeSetting.ClientID %>").val();

        // 職務代理人的選人範圍，是否為"申請者個人設定中的代理人"
        if (isAgentRangeSetting.toLowerCase() == 'true') {
            agnetJSON = $('#<%=hfAgentXML.ClientID %>').val();
        }
        else {
            agnetJSON = $("#<%=UC_ChoiceList.ClientID%>_hiddenJSON").val();
        }

        $(leaveInfoDt).find('FieldValue').each(function (index, element) {
            var startDate = element.attributes['startDate'].value;
            var endDate   = element.attributes['endDate'].value;
            var startTime = element.attributes['startTime'].value;
            var endTime   = element.attributes['endTime'].value;
            var eventDate = element.attributes['eventDate'].value;
            var leaCode = element.attributes['leaveCode'].value;
            var totalHour = element.attributes['hours'].value;
    
            data = [applicantCompanyNo, applicantEmployeeNo, applicant, agnetJSON, startDate, startTime, endDate, endTime, leaCode, reason, eventDate, 'false', totalHour, (index + 1).toString(), isAgentRangeSetting];
            errorMessage = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/LeaveBatchInfoUC.ascx", "ValidateApply", data);
            if(errorMessage !== '')
            {
                result += errorMessage;
            }
        });

        if(result !== '')
        {
            source.innerHTML = result;
            arguments.IsValid = false;
            return;
        }        
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Label ID="lblEditlessOnMobileDevice" runat="server" Text="此欄位不允許在App編輯" Visible="False" ForeColor="Blue" style="padding-left:10px" meta:resourcekey="lblEditlessOnMobileDeviceResource1" ></asp:Label>        
        <table class="LeaveTable104" style="width: 100%">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label2" runat="server" Text="假別與時間" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                    &nbsp&nbsp<asp:LinkButton ID="lbtnUserLeaveData" runat="server" Text="可休假餘額" meta:resourcekey="lbtnUserLeaveDataResource1"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <telerik:RadButton ID="rdbtnAddLeave" runat="server" Text="新增明細" CausesValidation="False" OnClick="rdbtnAddLeave_Click" meta:resourcekey="btnAddLeaveResource1"></telerik:RadButton>
                </td>                
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <Ede:Grid ID="grdLeaveInfo" runat="server" EnableTheming="True" DataKeyNames="leaveGuid" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"  
                        OnRowDataBound="grdLeaveInfo_RowDataBound" OnRowCommand="grdLeaveInfo_RowCommand" OnRowDeleting="grdLeaveInfo_RowDeleting" AllowSorting="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="grdLeaveInfoResource1" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                                <ItemTemplate>
                                    <asp:Label ID="lblRowIndex" runat="server" meta:resourcekey="lblRowIndexResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource2">
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                <HeaderStyle HorizontalAlign="Center" Width="80px" />
                                <ItemTemplate>
                                    &nbsp;
                                    <asp:LinkButton ID="lbtnModify" runat="server" CausesValidation="False" Text="修改" CommandName="Modify" meta:resourcekey="lbtnModifyResource1"></asp:LinkButton>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False" Text="刪除" CommandName="Delete" meta:resourcekey="lbtnDeleteResource1"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="假別" DataField="leaveName" meta:resourcekey="BoundFieldResource1">
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="請假時間(起)" meta:resourcekey="TemplateFieldResource3">
                                <ItemStyle HorizontalAlign="Center"  Wrap="False" />
                                <HeaderStyle Wrap="False" />
                                <ItemTemplate>
                                    <asp:Label ID="lblStratDate" runat="server" meta:resourcekey="lblStratDateResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="請假時間(訖)" meta:resourcekey="TemplateFieldResource4">
                                <ItemStyle HorizontalAlign="Center"  Wrap="False" />
                                <HeaderStyle Wrap="False" />
                                <ItemTemplate>
                                    <asp:Label ID="lblEndDate" runat="server" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="事件發生日" DataField="eventDate" meta:resourcekey="BoundFieldResource2" >
                            <HeaderStyle Wrap="False" />
                            <ItemStyle HorizontalAlign="Center" Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="請假時(天)數" meta:resourcekey="TemplateFieldResource5">
                                <ItemStyle HorizontalAlign="Right"  Wrap="False"/>
                                <HeaderStyle Wrap="False"/>
                                <ItemTemplate>
                                    <asp:Label ID="lblHours" runat="server" meta:resourcekey="lblHoursResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="請假代碼" DataField="leaveGuid" Visible="False" meta:resourcekey="BoundFieldResource3"/>
                        </Columns>
                    </Ede:Grid>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label5" runat="server" Text="總時數" meta:resourcekey="Label5Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HiddenField ID="hfTotalHour" runat="server" Value="0" />
                    <asp:Label ID="lblTotalHour" runat="server"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Text="小時" meta:resourcekey="Label6Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label3" runat="server" Text="事由" meta:resourcekey="Label3Resource1"></asp:Label>
                    <asp:Label ID="lblMark2" runat="server" Text="*" ForeColor="Red" Visible="False" meta:resourcekey="lblMark2Resource1"></asp:Label>
                </td>                
            </tr>
            <tr>                
                <td>
                    <asp:Label ID="lblReason" runat="server" Visible="False" CssClass="labelMutiline" meta:resourcekey="lblReasonResource1"></asp:Label>
                    <asp:TextBox ID="txtReason" runat="server" Width="100%" TextMode="MultiLine" Rows="3" meta:resourcekey="txtReasonResource1"></asp:TextBox>
                    <asp:CustomValidator ID="cvRequiredReason" runat="server" ErrorMessage="不允許空白" Display="Dynamic" ForeColor="Red" EnableTheming="True" meta:resourcekey="cvRequiredReasonResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="lblAgent" runat="server" Text="職務代理人" meta:resourcekey="lblAgentResource1"></asp:Label>
                    <asp:Label ID="lblMark" runat="server" Text="*" ForeColor="Red" Visible="False" meta:resourcekey="lblMarkResource1"></asp:Label>
                    <asp:CustomValidator ID="cvRequiredAgent" runat="server" ErrorMessage="不允許空白" Display="Dynamic" ForeColor="Red" EnableTheming="True" meta:resourcekey="cvRequiredAgentResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvRequiredAgentAccount" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="True" meta:resourcekey="cvRequiredAgentAccountResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvIsInculdeApplyUser" runat="server" Display="Dynamic" ForeColor="Red" EnableTheming="True" meta:resourcekey="cvIsInculdeApplyUserResource1"></asp:CustomValidator>
                    <asp:Label runat="server" ID="lblAgentAccount" ForeColor="Blue" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <div style="display: none">
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ChioceType="All" ShowEmployee="true" ShowMember="false" DefaultTab="Employee" />
                    </div>
                    <uc2:UC_ChoiceListMobile runat="server" ID="UC_ChoiceListMobile" ChioceType="User" />

                    <asp:Panel ID="pnlAgentSetting" runat="server">
                        <asp:DropDownList ID="ddlAgent" OnSelectedIndexChanged="ddlAgent_SelectedIndexChanged" AutoPostBack="True" CausesValidation="False"  runat="server"></asp:DropDownList>
                        <asp:Label ID="lblAgentText" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblAgentReselect" Text="選取的職務代理人已不存在，需重選代理人。" Visible="false" ForeColor="Blue" runat="server" meta:resourcekey="lblAgentReselectResource1"></asp:Label>
                        <asp:Label ID="lblAgentUnavailable" Text="選取的職務代理人已不存在，需重選代理人。" Visible="false" ForeColor="Blue" runat="server" meta:resourcekey="lblAgentUnavailableResource1"></asp:Label>
                        <asp:HiddenField ID="hfAgentXML" runat="server" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvShowLeaveCodeError" runat="server" ForeColor="Red" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvShowLeaveCodeErrorResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvMissingInfo" runat="server" ForeColor="Red" ErrorMessage="申請者無員工編號或公司統一編號資訊" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvMissingInfoResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCal" runat="server" ForeColor="Red" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvCalResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvApply" runat="server" ForeColor="Red" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvApplyResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvLeaveLimit" runat="server" ForeColor="Red" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvLeaveLimitResource1"></asp:CustomValidator>
                </td>
            </tr>            
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCheckContinuous" runat="server" ForeColor="Red" ClientValidationFunction="CheckContinuous" ErrorMessage="請假時間需連續，請重新設定" Display="Dynamic" EnableTheming="True" meta:resourcekey="cvCheckContinuousResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCheckData" runat="server" Display="Dynamic" ForeColor="Red" ClientValidationFunction="CheckDataEmpty" ErrorMessage="請新增明細" EnableTheming="True" meta:resourcekey="cvCheckDataResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>
        <telerik:RadButton ID="rdbtnCal" CausesValidation="False" OnClick="rdbtnCal_Click" Style="display: none" runat="server" Text="計算" AutoPostBack="False" EnableTheming="True" meta:resourcekey="rdbtnCalResource1"></telerik:RadButton>
        <asp:HiddenField ID="hfLeaveInfoDt" runat="server" />
        <asp:HiddenField ID="hfApplicantEmployeeNo" runat="server" />
        <asp:HiddenField ID="hfApplicantCompanyNo" runat="server" />
        <asp:HiddenField ID="hfApplicant" runat="server" />
        <asp:HiddenField ID="hfFieldMode" runat="server" />
        <asp:HiddenField ID="hfFormNumber" runat="server" />
        <asp:HiddenField ID="hfApplyDate" runat="server" />

        <asp:HiddenField ID="hfAgentRange" runat="server"/>
        <asp:HiddenField ID="hfIsAgentRangeSetting" runat="server" Value="false"/>
        <asp:HiddenField ID="hfIsAgentUnavailable" runat="server" Value="false"/>
        <asp:HiddenField ID="hfBaseApplicantGroupId" runat="server" Value=""/>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblAddDetail" runat="server" Text="新增明細" Visible="False" meta:resourcekey="lblAddDetailResource1"></asp:Label>
<asp:Label ID="lblComfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblComfirmResource1"></asp:Label>
<asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
<asp:Label ID="lblCal" runat="server" Text="請先計算請假時(天)數" Visible="False" meta:resourcekey="lblCalResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblErrMsg1" runat="server" Text="帳號已停用，請重新選擇職務代理人。" Style="display: none" meta:resourcekey="lblErrMsg1Resource1"></asp:Label>
<asp:Label ID="lblPauseMsg" runat="server" Text="帳號已停用。" Visible="false" meta:resourcekey="lblPauseMsgResource1"></asp:Label>
<asp:Label ID="lblLeaveBefore" runat="server" Text="需於請假開始日期前{0}日提出申請，已超出申請期限" Style="display: none" meta:resourcekey="lblLeaveBeforeResource1"></asp:Label>
<asp:Label ID="lblLeaveAfter" runat="server" Text="需於請假結束日期後{0}日提出申請，已超出申請期限" Style="display: none" meta:resourcekey="lblLeaveAfterResource1"></asp:Label>
<asp:Label ID="lblIncludeApplyUser" runat="server" Text="職務代理人與申請者不可相同" Style="display: none" meta:resourcekey="lblIncludeApplyUserResource1"></asp:Label>
<asp:Label ID="lblDisplayTitleFormat" runat="server" Text="請假區間 {0} {1}~{2} {3}" Visible="False" meta:resourcekey="lblDisplayTitleFormatResource1"></asp:Label>
<asp:Label ID="lblLeaveCodeRowTitle" runat="server" Text="假別" Visible="False" meta:resourcekey="lblLeaveCodeRowTitleResource1"></asp:Label>
<asp:Label ID="lblStratDateRowTitle" runat="server" Text="請假時間(起)" Visible="False" meta:resourcekey="lblStratDateRowTitleResource1"></asp:Label>
<asp:Label ID="lblEndDateRowTitle" runat="server" Text="請假時間(訖)" Visible="False" meta:resourcekey="lblEndDateRowTitleResource1"></asp:Label>
<asp:Label ID="lblEventDateRowTitle" runat="server" Text="事件發生日" Visible="False" meta:resourcekey="lblEventDateRowTitleResource1"></asp:Label>
<asp:Label ID="lblHoursRowTitle" runat="server" Text="請假時(天)數" Visible="False" meta:resourcekey="lblHoursRowTitleResource1"></asp:Label>
