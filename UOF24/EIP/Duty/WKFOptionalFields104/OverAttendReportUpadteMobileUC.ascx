<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OverAttendReportUpadteUC.ascx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.OverAttendReportUpadteUC" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<style type="text/css">
    .cssHidden{
        display: none;
    }

    .cssGrid{
        border-style: none;
    }

    .getOverAttendItem { }

    .getLblReasonVal { }

    .getLblReasonCName { }

    .getTxtRemark { }

    .getLblRemark { }

    .getLblWorkDate { }

    .getLblWorkType { }

    .getWorkTypeVal { display: none; }
</style>

<script type="text/javascript">

     /**
     * 起單時必填驗證
     *
     **/
    function CheckApplicantReason(sender, args) {
    
        var reasonType =  $('#<%=hfReasonType.ClientID%>').val();
        var allowModify = $('#<%=hfAllowModify.ClientID%>').val().toLowerCase();
        var companySNO = $('#<%=hfApplicantCompanySNO.ClientID%>').val();
        var companyCode =  $('#<%=hfApplicantCompanyNO.ClientID%>').val();
        var employeeNO  =  $('#<%=hfApplicantEmployeeNO.ClientID%>').val();
        
        //沒有公司統編或員編就不跑驗證，跑 CheckOverAttend      
        if (companySNO === '' || employeeNO === '') return;

        // 必填驗證前，先檢查目前的填寫原因方式，是否跟104所設定的一樣
        var checkData = [companySNO, companyCode];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverAttendReportUpadteUC.ascx", "CheckReasonType", checkData);
        if ($('#<%=hfReasonType.ClientID%>').val() != result) {

            sender.textContent = $('#<%=lblReasonTypeChange.ClientID%>').text();
            args.IsValid = false;
            return;
        }

        /* 以下開始檢查必填驗證 */

        // 下拉+輸入；可修改
        if (reasonType == '1' && allowModify == 'true')   
        {
            // 檢查所有下拉選到的選項
            var selectedReason = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem option[selected="selected"]');
            var valueIsSelect = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem option[selected="selected"][value="select"]');
            var invalidCount = 0;

            if (selectedReason.length == 0) {
                sender.innerText   = '<%=lblgridNoData.Text %>';            
                args.IsValid = false;
                return;
            }

            //全部都"請選擇"視同未填寫，驗證不通過
            if (selectedReason.length == valueIsSelect.length) {
                args.IsValid = false;
                return;
            }

            for (var i = 0; i < selectedReason.length; i++) {
                var selectedVal = selectedReason[i].value;

                // 判斷是否有選項是"請選擇"
                if (selectedVal == 'select') {
                    invalidCount++;
                }

                // 判斷是否有下拉選項是"S00"，並且說明欄位沒有填寫原因
                var remarkEle = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getTxtRemark')[0];
                if (selectedVal === 'S00' && typeof (remarkEle) != "undefined") {
                    if (remarkEle.value == '') {
                        sender.textContent = $('#<%=lblRemarkEmpty.ClientID%>').text();
                        args.IsValid = false;
                        return;
                    }
                }
            }

            //驗證未通過的數量等於所有資料的數量視同都未填寫
            if (selectedReason.length == invalidCount) {
                 args.IsValid = false;
                 return;
            }
        }
        else if (reasonType == '0' && allowModify == 'true')  // 自行輸入；可修改
        {
            var remarkList = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem .getTxtRemark');
            var invalidCount = 0;

            if (remarkList.length == 0) {
                sender.innerText   = '<%=lblgridNoData.Text %>';            
                args.IsValid = false;
                return;
            }

            for (var i = 0; i < remarkList.length; i++) {
                var remarkStr = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem .getTxtRemark')[i].value;
                if (remarkStr == '') {
                    invalidCount++;
                }
            }

             //驗證未通過的數量等於所有資料的數量視同都未填寫
            if (remarkList.length == invalidCount) {
                 args.IsValid = false;
                 return;
            }
        }
        args.IsValid = true;
    }


     /**
      * 簽核中必填驗證
      * @param sender
      * @param args
      */
    function CheckReasonRequired(sender, args) {
        
        var reasonType =  $('#<%=hfReasonType.ClientID%>').val();
        var allowModify = $('#<%=hfAllowModify.ClientID%>').val().toLowerCase();
        var companySNO = $('#<%=hfApplicantCompanySNO.ClientID%>').val();
        var companyCode  =  $('#<%=hfApplicantCompanyNO.ClientID%>').val();
        var employeeNO  =  $('#<%=hfApplicantEmployeeNO.ClientID%>').val();
        
        //沒有公司統編或員編就不跑驗證，跑 CheckOverAttend      
        if (companySNO === '' || employeeNO === '') return;

        // 必填驗證前，先檢查目前的填寫原因方式，是否跟104所設定的一樣
        var checkData = [companySNO, companyCode];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverAttendReportUpadteUC.ascx", "CheckReasonType", checkData);
        if ($('#<%=hfReasonType.ClientID%>').val() != result) {

            if ($('#<%=hfAllowModify.ClientID%>').val().toLowerCase() == 'true') {
                sender.textContent = $('#<%=lblReasonTypeChange.ClientID%>').text();
            }
            else if ($('#<%=hfAllowModify.ClientID%>').val().toLowerCase() == 'false') {
                sender.textContent = $('#<%=lblReasonTypeChange2.ClientID%>').text();
            }
            
            args.IsValid = false;
            return;
        }

        /* 以下開始檢查必填驗證 */

        var requiredErrorMsg = '';

        if (reasonType == '1' && allowModify == 'true') {   // 下拉+輸入；可修改
            
            // 檢查所有下拉選到的選項
            var selectedReason = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem [ClientID="getDdlReason"]');
            for (var i = 0; i < selectedReason.length; i++) {
                var selectedVal = selectedReason[i].value;

                // 日期 及 上班/下班
                var workDate = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblWorkDate')[0].innerText;
                var workType = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblWorkType')[0].innerText;

                // 判斷是否有選項是"請選擇"
                if (selectedVal == 'select') {
                    requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                    continue;
                }

                // 判斷是否有下拉選項是"S00"，並且說明欄位沒有填寫原因
                var remarkEle = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getTxtRemark')[0];
                if (selectedVal === 'S00' && typeof (remarkEle) != "undefined") {
                    if (remarkEle.value == '') {
                        requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                        continue;
                    }
                }
            }
        }
        else if (reasonType == '0' && allowModify == 'true') {  // 自行輸入；可修改
            var remarkList = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem .getTxtRemark');

            for (var i = 0; i < remarkList.length; i++) {
                var remarkStr = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem .getTxtRemark')[i].value;
                if (remarkStr == '') {

                    // 日期 及 上班/下班
                    var workDate = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblWorkDate')[0].innerText;
                    var workType = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblWorkType')[0].innerText;

                    requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                    continue;
                }
            }
        }
        else if (reasonType == '1' && allowModify == 'false') { // 下拉+輸入；不可修改
            var reasonList = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem .getLblReasonCName');
            for (var i = 0; i < reasonList.length; i++) {

                // 日期 及 上班/下班
                var workDate = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblWorkDate')[0].innerText;
                var workType = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblWorkType')[0].innerText;

                var reasonCName = reasonList[i].innerText;
                if (reasonCName === '') {
                    args.IsValid = false;
                    return;
                }

                // 判斷是否為S00的選項，是的話則要檢查說明欄位是否有值
                var reasonVal = $('#<%=grdOverAttend.ClientID %> tr .getLblReasonVal')[i].innerText;
                if (reasonVal == 'S00') {
                    var remark = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem .getLblRemark')[i].innerText;
                    if (remark == '') {
                        requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                        continue;
                    }
                }
            }
        }
        else if (reasonType == '0' && allowModify == 'false') { // 自行輸入；不可修改
            var remarkList = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem .getLblRemark');
            for (var i = 0; i < remarkList.length; i++) {
                var remark = remarkList[i].innerText;
                if (remark == '') {

                    // 日期 及 上班/下班
                    var workDate = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblWorkDate')[0].innerText;
                    var workType = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblWorkType')[0].innerText;

                    requiredErrorMsg += workDate + ' ' + workType + '<br/>';
                    continue;
                }
            }
        }

        if (requiredErrorMsg !== '') {
            sender.innerHTML = $('#<%=lblReasonEmpty.ClientID%>').text() + '<br/>' + requiredErrorMsg;
            args.IsValid = false;
        }
    }

      /**
     * 超時出勤送單驗證
     * @param sender
     * @param args
     */
    function CheckOverAttend(sender, args) {
        
        var companySNO  =  $('#<%=hfApplicantCompanySNO.ClientID%>').val();
        var employeeNO = $('#<%=hfApplicantEmployeeNO.ClientID%>').val();
        var hfNotAllowApplicant  =  $('#<%=hfNotAllowApplicant.ClientID%>').val();        

        if (hfNotAllowApplicant == 'No') {
              sender.textContent ='<%=lblNotAllowApplicant.Text %>'; 
            args.IsValid = false;
            return;
        }

        if (companySNO === '' || employeeNO === '') {
            sender.textContent ='<%=lblApplciantMissing.Text %>'; 
            args.IsValid = false;
            return;
        }

          args.IsValid = true;
    }

     /**
     * 驗證有沒有重複申請(主要檢查草稿)
     * */
    function CheckReApplicate(sender, args) {
        var companySNO  =  $('#<%=hfApplicantCompanySNO.ClientID%>').val();
        var employeeNO = $('#<%=hfApplicantEmployeeNO.ClientID%>').val();     
        var hfNotAllowApplicant  =  $('#<%=hfNotAllowApplicant.ClientID%>').val();    
        var overAttendList = [];

        // 取得清單的tr
        var trList = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem');
        if (trList.length !== 0) {
            for (var i = 0; i < trList.length; i++) {

                // 日期
                var workDate = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblWorkDate')[0].innerText;

                // 上班/下班
                var workCardType = $('#<%=grdOverAttend.ClientID %> .getWorkTypeVal')[i].innerText;

                // 初始化超時出勤代碼跟說明文字
                var reasonCode = '', reason = '';

                if ($('#<%=hfReasonType.ClientID%>').val() == '1') {

                    // 超時原因下拉選單選項代碼
                    reasonCode = $('#<%=grdOverAttend.ClientID %> .getLblReasonVal')[i].innerText;

                    // 說明欄位
                    if ($('#<%=hfAllowModify.ClientID%>').val() == 'true' && reasonCode == 'S00') {
                        reason = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getTxtRemark')[0].value;
                    }
                    else if ($('#<%=hfAllowModify.ClientID%>').val() == 'false' && reasonCode == 'S00') {
                        reason = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblRemark')[0].innerText;
                    }
                }
                else if ($('#<%=hfReasonType.ClientID%>').val() == '0') {
                    // 超時原因欄位
                    if ($('#<%=hfAllowModify.ClientID%>').val() == 'true') {
                        reason = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getTxtRemark')[0].value;
                    }
                    else if ($('#<%=hfAllowModify.ClientID%>').val() == 'false') {
                        reason = $('#<%=grdOverAttend.ClientID %> .getOverAttendItem:eq(' + i + ') .getLblRemark')[0].innerText;
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
        // pageMethod檢查超時出勤原因 (104的store procedure檢查)
        var jsonStr = JSON.stringify(overAttendList);   


        var applicant = $('#<%=hfApplicant.ClientID%>').val();     

        var data = [jsonStr, applicant];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverAttendReportUpadteUC.ascx", "CheckOverAttend", data);
        if (result != '') {
            args.IsValid = false;
            return;
        }
    }

    /**
     * 檢查是否允許超時出勤原因輸入後可再修改
     * @param sender
     * @param args
     */
    function CheckAllowUpdate(sender, args) {
        var data = [];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields104/OverAttendReportUpadteUC.ascx", "CheckAllowUpdate", data);

        if (result === 'false') {
            args.IsValid = false;
            return;
        }
    }
</script>

<asp:UpdatePanel ID="upOverAttend" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <span  Id="dateSpan" runat="server"  visible="False">
          <table  Id="dateDT" runat="server"  visible="False"  style="width:100%" >
            <tr runat="server">
                <td runat="server">
                    <asp:Label ID="lblBeginDate" runat="server" Text="超時出勤日期(起)" meta:resourcekey="lblBeginDateResource1"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr runat="server">
                <td runat="server">                
                    <telerik:RadDatePicker ID="rdBeginDate" runat="server"  EnableTheming="True">
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                        </Calendar>
                        <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
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
                    </igsch:WebDateChooser>
                </td>
            </tr>
            <tr runat="server">
                <td style="padding-top: 8px;" runat="server">
                    <asp:Label ID="lblEndDate" runat="server" Text="超時出勤日期(迄)" meta:resourcekey="lblEndDateResource1"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
            </tr>
                <tr runat="server">
                    <td runat="server">
                        <telerik:RadDatePicker ID="rdEndDate" runat="server"  EnableTheming="True">
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                            </Calendar>
                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
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
                <tr runat="server">
                    <td style="padding-top: 8px;" runat="server">
                        <telerik:RadButton runat="server" ID="rbtnQuery" Text="查詢" OnClick="rbtnQuery_Click"  CausesValidation="False" meta:resourcekey="rbtnQueryResource1"></telerik:RadButton>
                        <asp:Label ID="lblQueryNotice" runat="server" Text="*查詢區間為七天" ForeColor="Blue" meta:resourcekey="lblQueryNoticeResource1"></asp:Label>     
                        <br />
                        <asp:CustomValidator ID="cvOverAttend" runat="server" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>                 
                    </td>
                </tr> 
        </table>  
        </span>
      <hr />
      <Ede:Grid ID="grdOverAttend" runat="server"  Width="100%"
            AutoGenerateCheckBoxColumn="False" DataKeyNames="WORK_DATE,WORK_CARD_TYPE"
            OnRowDataBound="grdOverAttend_RowDataBound" AllowSorting="False"
            CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False" 
            PageSize="15" EmptyDataText="此區間沒有可供修改的超時出勤資訊" EnhancePager="False" KeepSelectedRows="False" 
            SelectedRowColor="" UnSelectedRowColor=""  ShowHeader="False" CssClass="cssGrid" meta:resourcekey="grdOverAttendResource1">
            <EmptyDataRowStyle ForeColor="Red" />
            <HeaderStyle Wrap="False"   />
            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <table style="width: 100%;" class="getOverAttendItem">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="日期" meta:resourcekey="Label1Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblWorkDate" CssClass="getLblWorkDate" runat="server" meta:resourcekey="lblWorkDateResource1"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblWorkType" CssClass="getLblWorkType" runat="server" meta:resourcekey="lblWorkTypeResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 15px;">
                                    <asp:Label ID="Label2" runat="server" Text="應刷卡時間" meta:resourcekey="Label2Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblMustTime" runat="server" meta:resourcekey="lblMustTimeResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 15px;">
                                    <asp:Label ID="Label3" runat="server" Text="實際刷卡時間" meta:resourcekey="Label3Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblActualTime" runat="server" meta:resourcekey="lblActualTimeResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 15px;">
                                    <asp:Label ID="Label4" runat="server" Text="超時原因" meta:resourcekey="Label4Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblReasonText"  runat="server" meta:resourcekey="lblReasonTextResource1" ></asp:Label>
                               </td>
                            </tr>
                                   <tr>
                                <td style="padding-top: 15px;">
                                    <asp:Label ID="Label7" runat="server" Text="修改超時原因" meta:resourcekey="Label7Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlReason" runat="server" ClientID="getDdlReason" Width="200px" AutoPostBack="True" EnableTheming="True" OnSelectedIndexChanged="ddlReason_SelectedIndexChanged" meta:resourcekey="ddlReasonResource1"></asp:DropDownList>
                                    <asp:Label ID="lblReasonCName" CssClass="getLblReasonCName" runat="server" Visible="False" meta:resourcekey="lblReasonCNameResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 5px;">
                                    <asp:TextBox ID="txtRemark" CssClass="getTxtRemark" runat="server" Width="300px" MaxLength="40" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
                                    <asp:Label ID="lblRemark" CssClass="getLblRemark" runat="server" Visible="False" meta:resourcekey="lblRemarkResource1"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <hr />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="WORK_CARD_TYPE" meta:resourcekey="BoundFieldResource1">
                    <HeaderStyle CssClass="cssHidden" />
                    <ItemStyle CssClass="getWorkTypeVal" />
                </asp:BoundField>

                <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <asp:Label ID="lblReasonVal" CssClass="getLblReasonVal" runat="server" meta:resourcekey="lblReasonValResource1"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="cssHidden" />
                    <ItemStyle CssClass="cssHidden" />
                </asp:TemplateField>
            </Columns>
        </Ede:Grid>
        
        <table>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvCheckAllowUpdate" runat="server" ClientValidationFunction="CheckAllowUpdate" Display="Dynamic" EnableTheming="True" ErrorMessage="超時出勤原因已填寫(不可再次填寫)" ForeColor="Red" meta:resourcekey="cvCheckAllowUpdateResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvReason" runat="server" ClientValidationFunction="CheckReasonRequired" Display="Dynamic" EnableTheming="True" ErrorMessage="超時原因或說明不可為空。" ForeColor="Red" meta:resourcekey="cvReasonResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="cvApplicantReason" runat="server" ClientValidationFunction="CheckApplicantReason" Display="Dynamic" EnableTheming="True"  ErrorMessage="至少填寫一筆超時原因" ForeColor="Red" meta:resourcekey="cvApplicantReasonResource1"></asp:CustomValidator>            
                </td>
            </tr>
            <tr>
                <td>
                     <asp:CustomValidator ID="cvOverAttendCheck" runat="server" ClientValidationFunction="CheckOverAttend"   Display="Dynamic" EnableTheming="True" ForeColor="Red" meta:resourcekey="cvOverAttendCheckResource1"></asp:CustomValidator>
                </td>
            </tr>   
            <tr>
                <td>
                    <asp:CustomValidator ID="cvReApplicate" runat="server" ClientValidationFunction="CheckReApplicate" Display="Dynamic" ErrorMessage="超時原因不允許重複申請修改，請檢查申請資料" meta:resourcekey="cvReApplicateResource1"></asp:CustomValidator>
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
<asp:LinkButton ID="lnk_Edit" runat="server" onclick="lnk_Edit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
<asp:LinkButton ID="lnk_Cannel" runat="server" onclick="lnk_Cannel_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
<asp:LinkButton ID="lnk_Submit" runat="server" onclick="lnk_Submit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>

<asp:Label ID="lblQueryOverWeek" runat="server" Text="查詢區間不可大於七天" Visible="False" meta:resourcekey="lblQueryOverWeekResource1"></asp:Label>
<asp:Label ID="lblDateVaild" runat="server" Text="查詢的開始日期不可以晚於結束日期" Visible="False" meta:resourcekey="lblDateVaildResource1"></asp:Label>
<asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
<asp:Label ID="lblOnDuty" runat="server" Text="上班" Visible="False" meta:resourcekey="lblOnDutyResource1"></asp:Label>
<asp:Label ID="lblOffDuty" runat="server" Text="下班" Visible="False" meta:resourcekey="lblOffDutyResource1"></asp:Label>
<asp:Label ID="lblgridNoData" runat="server" Text="沒有任何超時出勤資料" Visible="False" meta:resourcekey="lblgridNoDataResource1"></asp:Label>
<asp:Label ID="lblOverAttendHeader" runat="server" Text="超時原因" Visible="False" meta:resourcekey="lblOverAttendHeaderResource1"></asp:Label>
<asp:Label ID="lblApplciantMissing" runat="server" Text="申請者無員工編號或公司統一編號資訊" Visible="False" meta:resourcekey="lblApplciantMissingResource1"></asp:Label>
<asp:Label ID="lblNotAllowApplicant" runat="server" Text="不允許申請此張表單，請洽系統管理員" Visible="False" meta:resourcekey="lblNotAllowApplicantResource1"></asp:Label>
<asp:Label ID="lblReApplicate" runat="server" Text="超時原因不允許重複申請修改，請檢查申請資料。" Visible="False" meta:resourcekey="lblReApplicateResource1"></asp:Label>

<!-- 第一個訊息給有修改權限的站點，第二個給沒有修改權限的站點 -->
<asp:Label ID="lblReasonTypeChange" runat="server" Text="填寫方式設定已被變更，請通知差勤管理員調整104超時原因填寫方式。" CssClass="cssHidden" meta:resourcekey="lblReasonTypeChangeResource1"></asp:Label>
<asp:Label ID="lblReasonTypeChange2" runat="server" Text="填寫方式設定已被變更，請退回可修改超時原因的站點進行修改或請差勤管理員調整104超時原因填寫方式。" CssClass="cssHidden" meta:resourcekey="lblReasonTypeChange2Resource1"></asp:Label>

<asp:Label ID="lblReasonEmpty" runat="server" Text="尚未填寫超時原因或說明" CssClass="cssHidden" meta:resourcekey="lblReasonEmptyResource1"></asp:Label>
<asp:Label ID="lblRemarkEmpty" runat="server" Text="非執行公務必須填寫說明欄位" CssClass="cssHidden" meta:resourcekey="lblRemarkEmptyResource1"></asp:Label>

<asp:Label ID="lblDateHeader" runat="server" Text="日期" Visible="False" meta:resourcekey="lblDateHeaderResource1"></asp:Label>
<asp:Label ID="lblWorkTypeHeader" runat="server" Text="上班/下班" Visible="False" meta:resourcekey="lblWorkTypeHeaderResource1"></asp:Label>
<asp:Label ID="lblMustTimeHeader" runat="server" Text="應刷卡時間" Visible="False" meta:resourcekey="lblMustTimeHeaderResource1"></asp:Label>
<asp:Label ID="lblActualTimeHeader" runat="server" Text="實際刷卡時間" Visible="False" meta:resourcekey="lblActualTimeHeaderResource1"></asp:Label>
<asp:Label ID="lblReasonOldHeader" runat="server" Text="超時原因(變更前)" Visible="False" meta:resourcekey="lblReasonOldHeaderResource1"></asp:Label>
<asp:Label ID="lblReasonNewHeader" runat="server" Text="超時原因(變更後)" Visible="False" meta:resourcekey="lblReasonNewHeaderResource1"></asp:Label>

<asp:HiddenField ID="hfApplicant" runat="server" />
<asp:HiddenField ID="hfApplicantCompanyNO" runat="server" />
<asp:HiddenField ID="hfApplicantCompanySNO" runat="server" />
<asp:HiddenField ID="hfApplicantEmployeeNO" runat="server" />
<asp:HiddenField ID="hfDetailGuid" runat="server" />
<asp:HiddenField ID="hfNotAllowApplicant" runat="server" />

<asp:HiddenField ID="hfReasonJson" runat="server" />
<asp:HiddenField ID="hfAllowModify" runat="server" />
<asp:HiddenField ID="hfReasonType" runat="server" />
<asp:HiddenField ID="hfIsApplicant" runat="server" />
<asp:HiddenField ID="hfDocNbr" runat="server" />