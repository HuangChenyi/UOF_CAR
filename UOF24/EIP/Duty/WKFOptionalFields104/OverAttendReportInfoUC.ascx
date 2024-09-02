<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="OverAttendReportInfoUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.OverAttendReportInfoUC" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<style type="text/css">
    .cssHidden{
        display: none;
    }

    .getLblWorkDate { }

    .getLblWorkType { }

    .getDdlReason { }

    .getLblReasonVal { }

    .getLblReasonCName { }

    .getTxtRemark { }

    .getLblRemark { }

</style>

<script type="text/javascript">

    // 必填驗證
    function CheckReasonRequired(sender, args) {

        args.IsValid = true;
        var requiredErrorMsg = '';

        if ($('#<%=hfReasonType.ClientID%>').val() == '1' && $('#<%=hfAllowModify.ClientID%>').val() == 'true') // 下拉+輸入；可修改
        {
            // 檢查所有下拉選到的選項
            var selectedReason = $('#<%=grdOverAttend.ClientID %> tr .getDdlReason option[selected="selected"]');
            for (var i = 0; i < selectedReason.length; i++) {

                // 下拉選單選擇的選項
                var selectedVal = selectedReason[i].value;

                // 日期 及 上班/下班
                var workDate = $('#<%=grdOverAttend.ClientID %> tr .getLblWorkDate')[i].innerText;
                var workType = $('#<%=grdOverAttend.ClientID %> tr .getLblWorkType')[i].innerText;

                // 判斷是否有選項是"請選擇"
                if (selectedVal == 'select') {
                    requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                    continue;
                }

                // 判斷是否有下拉選項是"S00"，並且說明欄位沒有填寫原因
                var remarkEle = $('#<%=grdOverAttend.ClientID %> tr:eq(' + (i + 1) + ') input[class="getTxtRemark"]')[0];
                if (selectedVal === 'S00' && typeof (remarkEle) != "undefined") {
                    if (remarkEle.value == '') {
                        requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                        continue;
                    }
                }
            }
        }
        else if ($('#<%=hfReasonType.ClientID%>').val() == '0' && $('#<%=hfAllowModify.ClientID%>').val() == 'true')  // 自行輸入；可修改
        {
            var remarkList = $('#<%=grdOverAttend.ClientID %> tr input[class="getTxtRemark"]');

            for (var i = 0; i < remarkList.length; i++) {
                var remarkStr = $('#<%=grdOverAttend.ClientID %> tr input[class="getTxtRemark"]')[i].value;
                if (remarkStr == '') {

                    // 日期 及 上班/下班
                    var workDate = $('#<%=grdOverAttend.ClientID %> tr .getLblWorkDate')[i].innerText;
                    var workType = $('#<%=grdOverAttend.ClientID %> tr .getLblWorkType')[i].innerText;

                    requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                    continue;
                }
            }
        }
        else if ($('#<%=hfReasonType.ClientID%>').val() == '1' && $('#<%=hfAllowModify.ClientID%>').val() == 'false') { // 下拉+輸入；不可修改
            var reasonList = $('#<%=grdOverAttend.ClientID %> tr .getLblReasonCName');
            for (var i = 0; i < reasonList.length; i++) {

                // 日期 及 上班/下班
                var workDate = $('#<%=grdOverAttend.ClientID %> tr .getLblWorkDate')[i].innerText;
                var workType = $('#<%=grdOverAttend.ClientID %> tr .getLblWorkType')[i].innerText;

                var reasonCName = reasonList[i].innerText;
                if (reasonCName === '') {
                    requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                    continue;
                }

                // 判斷是否為S00的選項，是的話則要檢查說明欄位是否有值
                var reasonVal = $('#<%=grdOverAttend.ClientID %> tr .getLblReasonVal')[i].innerText;
                if (reasonVal == 'S00') {
                    var remark = $('#<%=grdOverAttend.ClientID %> tr .getLblRemark')[i].innerText;
                    if (remark == '') {
                        requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                        continue;
                    }
                }
            }
        }
        else if ($('#<%=hfReasonType.ClientID%>').val() == '0' && $('#<%=hfAllowModify.ClientID%>').val() == 'false') { // 自行輸入；不可修改
            var remarkList = $('#<%=grdOverAttend.ClientID %> tr .getLblRemark');
            for (var i = 0; i < remarkList.length; i++) {
                var remark = remarkList[i].innerText;
                if (remark == '') {

                    // 日期 及 上班/下班
                    var workDate = $('#<%=grdOverAttend.ClientID %> tr .getLblWorkDate')[i].innerText;
                    var workType = $('#<%=grdOverAttend.ClientID %> tr .getLblWorkType')[i].innerText;

                    requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                    continue;
                }
            }
        }

        // 如果有尚未填寫的欄位，則驗證檔住
        if (requiredErrorMsg !== '') {
            sender.innerHTML = $('#<%=lblReasonEmpty.ClientID%>').text() + '<br/>' + requiredErrorMsg;
            args.IsValid = false;
        }
    }

    // 填寫方式驗證 & 必填驗證 & 104超時出勤檢查驗證
    function CheckOverAttend(sender, args) {

        // 填寫方式檢查；沒過得戶就不需做以下兩個檢查
        var checkData = [$('#<%=hfCompanySNo.ClientID%>').val(), $('#<%=hfCompanyCode.ClientID%>').val()];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverAttendReportInfoUC.ascx", "CheckReasonType", checkData);
        if ($('#<%=hfReasonType.ClientID%>').val() != result) {
            sender.textContent = $('#<%=lblReasonTypeChange.ClientID%>').text();
            args.IsValid = false;
            return;
        }

        // 必填檢查；沒過的話就不需做104檢查
        CheckReasonRequired(sender, args);
        if (args.IsValid == false) {
            return;
        }

        /* 以下是104超時出勤檢查 (必填檢查過了才會做104的檢查) */

        var overAttendList = [];

        // 取得清單的tr (含header，所以for迴圈要從i=1開始避掉header)
        var trList = $('#<%=grdOverAttend.ClientID %> tr');

        if (trList.length !== 0) {
            for (var i = 1; i < trList.length; i++) {

                var tdList = $('#<%=grdOverAttend.ClientID %> tr:eq(' + i + ') td');

                // 初始化要檢查的參數
                var workDate = tdList[0].innerText, workCardType = '', reasonCode = '', reason = '';

                if ($('#<%=hfReasonType.ClientID%>').val() == '1') {

                    // 超時出勤類型代碼 (上班/下班 <=> 0/1)
                    workCardType = tdList[6].innerText;

                    // 超時原因下拉選單選項代碼
                    reasonCode = $('#<%=grdOverAttend.ClientID %> tr:eq(' + i + ') .getLblReasonVal')[0].innerText;

                    // 說明欄位
                    if ($('#<%=hfAllowModify.ClientID%>').val() == 'true' && reasonCode == 'S00') {
                        reason = $('#<%=grdOverAttend.ClientID %> tr:eq(' + i + ') .getTxtRemark')[0].value;
                    }
                    else if ($('#<%=hfAllowModify.ClientID%>').val() == 'false' && reasonCode == 'S00') {
                        reason = $('#<%=grdOverAttend.ClientID %> tr:eq(' + i + ') .getLblRemark')[0].innerText;
                    }
                }
                else if ($('#<%=hfReasonType.ClientID%>').val() == '0') {

                    // 超時出勤類型代碼 (上班/下班 <=> 0/1)
                    workCardType = tdList[5].innerText;

                    // 超時原因欄位
                    if ($('#<%=hfAllowModify.ClientID%>').val() == 'true') {
                        reason = $('#<%=grdOverAttend.ClientID %> tr:eq(' + i + ') .getTxtRemark')[0].value;
                    }
                    else if ($('#<%=hfAllowModify.ClientID%>').val() == 'false') {
                        reason = $('#<%=grdOverAttend.ClientID %> tr:eq(' + i + ') .getLblRemark')[0].innerText;
                    }
                    
                }

                // 要檢查的物件
                var overAttendItem = {
                    workDate: workDate,
                    workCardType: workCardType,
                    reasonCode: reasonCode,
                    reason: reason
                }

                // 加入list
                overAttendList.push(overAttendItem);
            }
        }
        else
        {
            args.IsValid = false;
            return;
        }

        // pageMethod檢查超時出勤原因 (104的store procedure檢查)
        var jsonStr = JSON.stringify(overAttendList);
        var companySNo = $('#<%=hfCompanySNo.ClientID%>').val();
        var employeeNo = $('#<%=hfEmployeeNo.ClientID%>').val();
        var docNbr = $('#<%=hfDocNbr.ClientID%>').val();

        var data = [jsonStr, companySNo, employeeNo, docNbr];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverAttendReportInfoUC.ascx", "CheckOverAttend", data);

        // 若104送回來的檢查字串是空的，代表有過，若不是空，則驗證失敗
        if (result !== '') {
            sender.textContent = result;
            args.IsValid = false;
            return;
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <Ede:Grid ID="grdOverAttend" runat="server"  Width="100%"
            AutoGenerateCheckBoxColumn="False" DataKeyNames="WORK_DATE"
            OnRowDataBound="grdOverAttend_RowDataBound"
            CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False" 
            PageSize="15" EmptyDataText="沒有資料" EnhancePager="False" KeepSelectedRows="False" 
            SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdOverAttendResource1">
            <HeaderStyle Wrap="False" />
            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:BoundField DataField="WORK_DATE" HeaderText="日期" meta:resourcekey="BoundFieldResource1">
                    <ItemStyle HorizontalAlign="Center" CssClass="getLblWorkDate" Width="10%"/>
                </asp:BoundField>

                <asp:TemplateField HeaderText="上班/下班" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <asp:Label ID="lblWorkType" runat="server" CssClass="getLblWorkType" meta:resourcekey="lblWorkTypeResource1"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="10%"/>
                </asp:TemplateField>

                <asp:BoundField DataField="MUST_TIME" HeaderText="應刷卡時間" meta:resourcekey="BoundFieldResource2" >
                    <ItemStyle HorizontalAlign="Center" Width="10%"/>
                </asp:BoundField>

                <asp:BoundField DataField="ACTUAL_TIME" HeaderText="實際刷卡時間" meta:resourcekey="BoundFieldResource3" >
                    <ItemStyle HorizontalAlign="Center" Width="10%"/>
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="超時原因" meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlReason" OnSelectedIndexChanged="ddlReason_SelectedIndexChanged" CssClass="getDdlReason" AutoPostBack="True" Width="100%" runat="server" meta:resourcekey="ddlReasonResource1"></asp:DropDownList>
                        <asp:Label ID="lblReasonCName" runat="server" CssClass="getLblReasonCName" Visible="False" meta:resourcekey="lblReasonCNameResource1"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="15%"/>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="說明" meta:resourcekey="TemplateFieldResource3">
                    <ItemTemplate>
                        <asp:TextBox ID="txtRemark" runat="server" Width="100%" MaxLength="40" CssClass="getTxtRemark" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
                        <asp:Label ID="lblRemark" runat="server" Visible="False" CssClass="getLblRemark" meta:resourcekey="lblRemarkResource1"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="45%" />
                </asp:TemplateField>

                <asp:BoundField DataField="WORK_TYPE" meta:resourcekey="BoundFieldResource4">
                    <HeaderStyle CssClass="cssHidden" />
                    <ItemStyle CssClass="cssHidden" />
                </asp:BoundField>
                
                <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                    <ItemTemplate>
                        <asp:Label ID="lblReasonVal" runat="server" CssClass="getLblReasonVal" meta:resourcekey="lblReasonValResource1"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="cssHidden" />
                    <ItemStyle CssClass="cssHidden" />
                </asp:TemplateField>
            </Columns>
        </Ede:Grid>
        <table>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvOverAttendCheck" runat="server" ClientValidationFunction="CheckOverAttend" Display="Dynamic" meta:resourcekey="cvOverAttendCheckResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>

        <asp:HiddenField ID="hfCompanyId" runat="server" />
        <asp:HiddenField ID="hfCompanyCode" runat="server" />
        <asp:HiddenField ID="hfCompanySNo" runat="server" />
        <asp:HiddenField ID="hfEmployeeNo" runat="server" />
        <asp:HiddenField ID="hfReasonType" runat="server" />
        <asp:HiddenField ID="hfDetailGuid" runat="server" />
        <asp:HiddenField ID="hfStartDate" runat="server" />
        <asp:HiddenField ID="hfEndDate" runat="server" />

        <asp:HiddenField ID="hfDocNbr" runat="server" />
        <asp:HiddenField ID="hfAllowModify" runat="server" />

        <asp:HiddenField ID="hfOtReasonItem" runat="server"/>
        
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblOnDuty" runat="server" Text="上班" Visible="False" meta:resourcekey="lblOnDutyResource1"></asp:Label>
<asp:Label ID="lblOffDuty" runat="server" Text="下班" Visible="False" meta:resourcekey="lblOffDutyResource1"></asp:Label>
<asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
<asp:Label ID="lblOverAttendHeader" runat="server" Text="超時原因" Visible="False" meta:resourcekey="lblOverAttendHeaderResource1"></asp:Label>
<asp:Label ID="lblReasonTypeChange" runat="server" Text="填寫方式設定已被變更，請退回可修改超時原因的站點進行修改或請差勤管理員調整104超時原因填寫方式。" CssClass="cssHidden" meta:resourcekey="lblReasonTypeChangeResource1"></asp:Label>
<asp:Label ID="lblReasonEmpty" runat="server" Text="尚未填寫超時原因或說明" CssClass="cssHidden" meta:resourcekey="lblReasonEmptyResource1"></asp:Label>

<asp:Label ID="lblDateHeader" runat="server" Text="日期" Visible="False" meta:resourcekey="lblDateHeaderResource1"></asp:Label>
<asp:Label ID="lblWorkTypeHeader" runat="server" Text="上班/下班" Visible="False" meta:resourcekey="lblWorkTypeHeaderResource1"></asp:Label>
<asp:Label ID="lblMustTimeHeader" runat="server" Text="應刷卡時間" Visible="False" meta:resourcekey="lblMustTimeHeaderResource1"></asp:Label>
<asp:Label ID="lblActualTimeHeader" runat="server" Text="實際刷卡時間" Visible="False" meta:resourcekey="lblActualTimeHeaderResource1"></asp:Label>
<asp:Label ID="lblReasonHeader" runat="server" Text="超時原因" Visible="False" meta:resourcekey="lblReasonHeaderResource1"></asp:Label>

<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
            
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>            
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>