<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_SearchProject" Codebehind="UC_SearchProject.ascx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<script type = "text/javascript" id = "btnClientCode">
    function CheckSubmitDelete(event)
    {
        if (!confirm('<%=lblDeleteMsg.Text %>')) {
            event.preventDefault();
        }
   
    }
    function CheckSubmitAudit(event)
    { 
        if (!confirm('<%=lblAuditMsg.Text %>')) {
            event.preventDefault();
        }
  
    }
    function CheckSubmitStart(event)
    {
        if (!confirm('<%=lblStartMsg.Text %>')) {
            event.preventDefault();
        }
  
    }
    function CheckSubmitSuspend(event) {
        if (!confirm('<%=lblSuspendMsg.Text %>'))
        {
            event.preventDefault();
        }
    }
    function CheckSubmitClose(event)
    {
        if (!confirm('<%=lblCloseMsg.Text %>')) {
            event.preventDefault();
        }
    }
</script>

               <asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator> 
            <Fast:Grid ID="gridProject" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" AutoGenerateSelectButton="True" 
                DataKeyOnClientWithCheckBox="False" 
                   EnhancePager="True" Width="100%"
                PageSize="15" SelectedRowColor="White"  
                   DataKeyNames="PROJECT_GUID" 
                   OnSelectedIndexChanged="gridProject_SelectedIndexChanged" 
                   OnRowDataBound="gridProject_RowDataBound" OnRowCommand="gridProject_RowCommand" 
                   AllowPaging="True" OnPageIndexChanging="gridProject_PageIndexChanging" 
                    DefaultSortDirection="Ascending" 
                   onbeforeexport="gridProject_BeforeExport" meta:resourcekey="gridProjectResource1" CustomDropDownListPage="False" DefaultSortColumnName="PROJECT_NAME" EmptyDataText="No data found" KeepSelectedRows="False" OnSorting="gridProject_Sorting" UnSelectedRowColor="">
                <EnhancePagerSettings
                    ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />

<ExportExcelSettings AllowExportToExcel="true" ExportType=DataSource ></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="專案名稱" meta:resourcekey="TemplateFieldResource1" HeaderStyle-Wrap="false" SortExpression="PROJECT_NAME">
                        <itemtemplate>
<asp:LinkButton runat="server" Text='<%# Bind("PROJECT_NAME") %>' ID="lbtProjName" meta:resourcekey="lbtProjNameResource1"></asp:LinkButton>

</itemtemplate>                        

<HeaderStyle Wrap="False"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="專案狀態" meta:resourcekey="TemplateFieldResource2" HeaderStyle-Wrap="false" SortExpression="STATUS">
                        <itemtemplate>
<asp:Label runat="server" Text='<%# Bind("STATUS") %>' ID="lblProjStatus" meta:resourcekey="lblProjStatusResource1"></asp:Label>

<asp:Label runat="server" Text="(可結案)" ID="lblAllowClose" meta:resourcekey="lblAllowCloseResource1"></asp:Label>

</itemtemplate>

<HeaderStyle Wrap="False"></HeaderStyle>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="起案日/結案日" meta:resourcekey="TemplateFieldResource3" HeaderStyle-Wrap="false">
                        <itemtemplate>
<asp:Label runat="server" Text='<%# Bind("START_DATE") %>' ID="lblStartDate" meta:resourcekey="lblStartDateResource1"></asp:Label>
 <asp:Label runat="server" Text="~" ID="lblProj" meta:resourcekey="lblProjResource1"></asp:Label>
 <asp:Label runat="server" Text='<%# Bind("END_DATE") %>' ID="lblEndDate" meta:resourcekey="lblEndDateResource1"></asp:Label>

</itemtemplate>

<HeaderStyle Wrap="False"></HeaderStyle>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="預計時程" meta:resourcekey="TemplateFieldResource4" HeaderStyle-Wrap="false">
                        <itemtemplate>
<asp:Label runat="server" Text='<%# Bind("EXPECT_START_DATE") %>' ID="lblExpectedStartDate" meta:resourcekey="lblExpectedStartDateResource1"></asp:Label>
 <asp:Label runat="server" Text="~" ID="lblExpected" meta:resourcekey="lblExpectedResource1"></asp:Label>
 <asp:Label runat="server" Text='<%# Bind("EXPECT_END_DATE") %>' ID="lblExpectedEndDate" meta:resourcekey="lblExpectedEndDateResource1"></asp:Label>

</itemtemplate>

<HeaderStyle Wrap="False"></HeaderStyle>

                        <ItemStyle Wrap="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="實際時程" meta:resourcekey="TemplateFieldResource5" HeaderStyle-Wrap="false">
                        <itemtemplate>
<asp:Label runat="server" Text='<%# Bind("PRACTICAL_START_TIME") %>' ID="lblPracticalStartlDate" meta:resourcekey="lblPracticalStartlDateResource1"></asp:Label>
 <asp:Label runat="server" Text="~" ID="lblPractical" meta:resourcekey="lblPracticalResource1"></asp:Label>
 <asp:Label runat="server" Text='<%# Bind("PRACTICAL_END_TIME") %>' ID="lblPracticalEndDate" meta:resourcekey="lblPracticalEndDateResource1"></asp:Label>
 
</itemtemplate>

<HeaderStyle Wrap="False"></HeaderStyle>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="起始日期相差值" 
                        meta:resourcekey="TemplateFieldResource8" HeaderStyle-Wrap="false">
                        <itemtemplate>
<asp:Label runat="server" ID="lblStartDifferDate" meta:resourcekey="lblStartDifferDateResource1"></asp:Label>
                        </itemtemplate>
                        <ControlStyle Width="120px" />

<HeaderStyle Wrap="False"></HeaderStyle>
                    </asp:TemplateField>
                                         
                    <asp:TemplateField HeaderText="結束日期相差值" 
                        meta:resourcekey="TemplateFieldResource9" HeaderStyle-Wrap="false">
                        <itemtemplate>
<asp:Label runat="server" ID="lblEndDifferDate" meta:resourcekey="lblEndDifferDateResource1"></asp:Label>
                        </itemtemplate>
                        <ControlStyle Width="120px" />

<HeaderStyle Wrap="False"></HeaderStyle>
                    </asp:TemplateField>
                                                       
                    <asp:TemplateField HeaderText="專案負責人" meta:resourcekey="TemplateFieldResource6" HeaderStyle-Wrap="false">
                        <itemtemplate>
<asp:Label runat="server" ID="lblPM" meta:resourcekey="lblPMResource1"></asp:Label>

</itemtemplate>                       

<HeaderStyle Wrap="False"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="動作" meta:resourcekey="TemplateFieldResource7" HeaderStyle-Wrap="false">
                        <itemtemplate>
                            <asp:ImageButton runat="server" OnClientClick="CheckSubmitAudit(event)" AlternateText="送審" ImageUrl="~/Common/Images/Icon/icon_m157.gif" ID="btnAudit" Visible="False" Text="送審" meta:resourcekey="btnAuditResource1"></asp:ImageButton>
 
                            <asp:ImageButton runat="server" OnClientClick="CheckSubmitStart(event)" AlternateText="起動" ImageUrl="~/Common/Images/Icon/icon_m165.gif" ID="btnStart" Visible="False" Text="啟動" meta:resourcekey="btnStartResource1"></asp:ImageButton>
 
                            <asp:ImageButton runat="server" OnClientClick="CheckSubmitSuspend(event)" AlternateText="中止" ImageUrl="~/Common/Images/Icon/icon_m168.gif" ID="btnSuspend" Visible="False" Text="中止" meta:resourcekey="btnSuspendResource1"></asp:ImageButton>
 
                            <asp:ImageButton runat="server" OnClientClick="CheckSubmitDelete(event)" AlternateText="刪除" ImageUrl="~/Common/Images/Icon/icon_m46.gif" ID="btnDelete" Visible="False" Text="删除" meta:resourcekey="btnDeleteResource1"></asp:ImageButton>
 
                            <asp:ImageButton runat="server" OnClientClick="CheckSubmitClose(event)" AlternateText="結案" ImageUrl="~/Common/Images/Icon/icon_m172.gif" ID="btnClose" Visible="False" Text="結案" meta:resourcekey="btnCloseResource1"></asp:ImageButton>
 
                             
</itemtemplate>

<HeaderStyle Wrap="False"></HeaderStyle>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#FFC0C0" />
            </Fast:Grid>
      
<asp:Label ID="lblAuditMsg" runat="server" Text="選擇確定後該專案將立即送審，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblAuditMsgResource1"></asp:Label>
<asp:Label ID="lblStartMsg" runat="server" Text="選擇確定後該專案將立即啟動，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblStartMsgResource1"></asp:Label>
<asp:Label ID="lblSuspendMsg" runat="server" Text="選擇確定後該專案將立即中止，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblSuspendMsgResource1"></asp:Label>
<asp:Label ID="lblCloseMsg" runat="server" Text="選擇確定後該專案將立即結案，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblCloseMsgResource1"></asp:Label>
<asp:Label ID="lblDeleteMsg" runat="server" Text="選擇確定後該專案將立即刪除，包含該專案的所有相關資料將一併被刪除，請問您是否確定要繼續？" Visible="False" meta:resourcekey="lblDeleteMsgResource1"></asp:Label> 
<asp:Label runat="server" Text="(可結案)" ID="lblAllowClose1" meta:resourcekey="lblAllowCloseResource1" Visible=false></asp:Label>
<asp:Label ID="lblLaterMsg1" runat="server" Text="(逾時" Visible="False" meta:resourcekey="lblLaterMsg1Resource1"></asp:Label>
<asp:Label ID="lblLaterMsg2" runat="server" Text="天)" Visible="False" meta:resourcekey="lblLaterMsg2Resource1"></asp:Label>

<asp:Label ID="lblDeleteNoAuthorityMsg" runat="server" Text="您沒有刪除該專案的權限！" Visible="False" meta:resourcekey="lblDeleteNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblDeleteNotAllowedStatusMsg" runat="server" Text="該專案的狀態不允許被刪除！" Visible="False" meta:resourcekey="lblDeleteNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblAuditNoAuthorityMsg" runat="server" Text="您沒有送審該專案的權限！" Visible="False" meta:resourcekey="lblAuditNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblStartNoAuthorityMsg" runat="server" Text="您沒有起動該專案的權限！" Visible="False" meta:resourcekey="lblStartNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblAuditNotAllowedStatusMsg" runat="server" Text="該專案的狀態不允許被送審！" Visible="False" meta:resourcekey="lblAuditNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblStartNotAllowedStatusMsg" runat="server" Text="該專案的狀態不允許被起動！" Visible="False" meta:resourcekey="lblStartNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblAuditProjIncompleteMsg" runat="server" Text="該專案沒有預計時程，不允許被送審！" Visible="False" meta:resourcekey="lblAuditProjIncompleteMsgResource1"></asp:Label>
<asp:Label ID="lblStartProjIncompleteMsg" runat="server" Text="該專案沒有預計時程，不允許被起動！" Visible="False" meta:resourcekey="lblStartProjIncompleteMsgResource1"></asp:Label>
<asp:Label ID="lblNoAuditorNotAuditMsg" runat="server" Text="該專案沒有設定審核者，不允許送審！" Visible="False" meta:resourcekey="lblNoAuditorNotAuditMsgResource1"></asp:Label>
<asp:Label ID="lblAuditorNotStartMsg" runat="server" Text="該專案已設定審核者，不允許直接起動！" Visible="False" meta:resourcekey="lblAuditorNotStartMsgResource1"></asp:Label>
<asp:Label ID="lblAuditTaskNoDateMsg" runat="server" Text="該專案有未設定日期的任務，不允許送審！" Visible="False" meta:resourcekey="lblAuditTaskNoDateMsgResource1"></asp:Label>
<asp:Label ID="lblStartTaskNoDateMsg" runat="server" Text="該專案有未設定日期的任務，不允許起動！" Visible="False" meta:resourcekey="lblStartTaskNoDateMsgResource1"></asp:Label>
<asp:Label ID="lblAuditNoTaskMsg" runat="server" Text="該專案至少需包含一個以上的任務，否則不允許送審" Visible="False" meta:resourcekey="lblAuditNoTaskMsgResource1"></asp:Label>
<asp:Label ID="lblStartNoTaskMsg" runat="server" Text="該專案至少需包含一個以上的任務，否則不允許起動" Visible="False" meta:resourcekey="lblStartNoTaskMsgResource1"></asp:Label>
<asp:Label ID="lblSuspendNoAuthorityMsg" runat="server" Text="您沒有中止該專案的權限！" Visible="False" meta:resourcekey="lblSuspendNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblSuspendNotAllowedStatusMsg" runat="server" Text="該專案的狀態不允許被中止！" Visible="False" meta:resourcekey="lblSuspendNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblCloseNoAuthorityMsg" runat="server" Text="您沒有結束該專案的權限！" Visible="False" meta:resourcekey="lblCloseNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblCloseNotAllowedStatusMsg" runat="server" Text="該專案的狀態不允許被結案！" Visible="False" meta:resourcekey="lblCloseNotAllowedStatusMsgResource1"></asp:Label>
<asp:Label ID="lblCloseUnCompleteMsg" runat="server" Text="該專案的工作項目尚未全部完成，不允許被結案！" Visible="False" meta:resourcekey="lblCloseUnCompleteMsgResource1"></asp:Label>

<asp:Label ID="lblStartBtn" runat="server" Text="啟動" Visible="False" meta:resourcekey="lblStartBtnResource1"></asp:Label>
<asp:Label ID="lblAuditBtn" runat="server" Text="送審" Visible="False" meta:resourcekey="lblAuditBtnResource1"></asp:Label>

    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label> 
   <asp:Label ID="lblNotYetBegin" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginResource1"></asp:Label>  
   <asp:Label ID="lblProceeding" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingResource1"></asp:Label> 
   <asp:Label ID="lblAudit" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditResource1"></asp:Label> 
   <asp:Label ID="lblSuspend" runat="server" Text="已中止" Visible="False" meta:resourcekey="lblSuspendResource1"></asp:Label> 
   <asp:Label ID="lblClose" runat="server" Text="已結案" Visible="False" meta:resourcekey="lblCloseResource1"></asp:Label> 
<asp:Label ID="lblActionAlertMsg" runat="server" Text="[{0}]專案已經{1}" Visible="False" meta:resourcekey="lblActionAlertMsgResource1"></asp:Label>

<asp:HiddenField ID="hidShowSelectColumn" runat="server" value="true" />
<asp:HiddenField ID="hidShowTimeColumn" runat="server" value="true" />
<asp:HiddenField ID="hidShowOperationColumn" runat="server" value="true" />
<asp:HiddenField ID="hidSearchProjectName" runat="server" />
<asp:HiddenField ID="hidSearchProjectStatus" runat="server" />
