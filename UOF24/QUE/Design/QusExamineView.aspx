<%@ Page Title="問卷審核" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="QusExamineView.aspx.cs" Inherits="Ede.Uof.Web.QUE.Design.QusExamineView" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/QUE/Common/UC_Qus.ascx" TagPrefix="uc1" TagName="UC_Qus" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable" style="width:100%">
        <tr>
            <td colspan="4" class="PopTableHeader">
                <asp:Label ID="Label3" runat="server" Text="基本設定" meta:resourcekey="Label3Resource1"></asp:Label>    
            </td>
        </tr>
        <tr>
            <td style="width:25%">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="lblNameTitle" runat="server" Text="問卷名稱" meta:resourcekey="lblNameTitleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap" >
                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="lblCatTitle" runat="server" Text="問卷類別" meta:resourcekey="lblCatTitleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Label ID="lblCat" runat="server" meta:resourcekey="lblCatResource1"></asp:Label>                    
                <asp:HiddenField ID="hidCat" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="問卷調查對象" meta:resourcekey="Label12Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList1" IsAllowEdit="false" />
            </td>
        </tr>
        <tr>
            <td style="width:25%">
                <asp:Label ID="lblTimeTitle" runat="server" Text="調查時間" meta:resourcekey="lblTimeTitleResource1"></asp:Label>
            </td>
            <td style="width:45%">
                <table style="width:100%">
                    <tr>
                        <td>
                            <asp:Label ID="lblStartTime" runat="server" meta:resourcekey="lblStartTimeResource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="~" meta:resourcekey="Label5Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEndTime" runat="server" meta:resourcekey="lblEndTimeResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width:25%">
                <asp:Label ID="lblSendMessageTitle" runat="server" Text="發送問卷調查通知" meta:resourcekey="lblSendMessageTitleResource1"></asp:Label>                       
            </td>
            <td style="width:25% ; white-space: nowrap">
                <asp:Label ID="lblSendMessage" runat="server" meta:resourcekey="lblSendMessageResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStatisticsPulishTitle" runat="server" Text="統計結果公布時間" meta:resourcekey="lblStatisticsPulishTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblStatisticsPulish" runat="server" meta:resourcekey="lblStatisticsPulishResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblStatisticsExpiredTitle" runat="server" Text="統計結果下架日期" meta:resourcekey="lblStatisticsExpiredTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblStatisticsExpired" runat="server" meta:resourcekey="lblStatisticsExpiredResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblDesignerTitile" runat="server" Text="問卷設計人" meta:resourcekey="lblDesignerTitileResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblDesignerGuid" runat="server" Visible="False" meta:resourcekey="lblDesignerGuidResource1"></asp:Label>
                <asp:Label ID="lblDesigner" runat="server" meta:resourcekey="lblDesignerResource1"></asp:Label>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblStateTitle" runat="server" Text="問卷狀態" meta:resourcekey="lblStateTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblStatisticsTitle" runat="server" Text="統計結果" meta:resourcekey="lblStatisticsTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblStatistics" runat="server" meta:resourcekey="lblStatisticsResource1"></asp:Label>
            </td>
                <td style="white-space:nowrap">
                <asp:Label ID="lblRegisteredTitle" runat="server" Text="問卷記名" meta:resourcekey="lblRegisteredTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblRegistsered" runat="server" meta:resourcekey="lblRegistseredResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblAllowCopyTitle" runat="server" Text="允許他人複製問卷" meta:resourcekey="lblAllowCopyTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAllowCopy" runat="server" meta:resourcekey="lblAllowCopyResource1"></asp:Label>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblAllowSaveTitle" runat="server" Text="允許儲存問卷" meta:resourcekey="lblAllowSaveTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblSave" runat="server" meta:resourcekey="lblSaveResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblRepeatSubmitTitle" runat="server" Text="允許重複填寫" meta:resourcekey="lblRepeatSubmitTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblRepeatSubmit" runat="server" meta:resourcekey="lblRepeatSubmitResource1"></asp:Label>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblAllowModifyTitle" runat="server" Text="允許填寫者修改或取消" meta:resourcekey="lblAllowModifyTitleResource1"></asp:Label>
            </td>
            <td >
                <asp:Label ID="lblAllowModify" runat="server" meta:resourcekey="lblAllowModifyResource1"></asp:Label><br />
                       
            </td>
        </tr>
               
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblFileTitle" runat="server" Text="附件" meta:resourcekey="lblFileTitleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="QUE" Editable="false" />
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblMemoTitle" runat="server" Text="備註" meta:resourcekey="lblMemoTitleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <div style="max-height:100px">
                    <asp:Label ID="lblMemo" runat="server" meta:resourcekey="lblMemoResource1"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
                   
                <td style="white-space:nowrap">
                <asp:Label ID="lblCerateTimeTitle" runat="server" Text="建立時間" meta:resourcekey="lblCerateTimeTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblCreateTime" runat="server" meta:resourcekey="lblCreateTimeResource1"></asp:Label>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="lblModifyTimeTitle" runat="server" Text="最後一次修改時間" meta:resourcekey="lblModifyTimeTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblModifyTime" runat="server" meta:resourcekey="lblModifyTimeResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="PopTableHeader">
                <asp:Label ID="Label8" runat="server" Text="問卷設定" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
        </tr>
        <tr>

            <td colspan="4"  class="PopTableRightTD" style="text-align:left">
                <center>
                <uc1:UC_Qus runat="server" ID="UC_Qus" />
                </center>               
            </td>
        </tr>
            <tr>
            <td colspan="4" class="PopTableHeader">
                <asp:Label ID="Label7" runat="server" Text="審核意見" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
        </tr>
            <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="審核意見" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtExamineContent" runat="server" TextMode="MultiLine" Rows="4" Width="800px" meta:resourcekey="txtExamineContentResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvDenyContent" runat="server" ErrorMessage="請輸入審核意見" Display="Dynamic" meta:resourcekey="cvDenyContentResource1"></asp:CustomValidator>
            </td>
        </tr>
               
        <tr>
            <td colspan="5" class="PopTableRightTD" style="text-align:left;">
                <Ede:Grid ID="logGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="True"
                        DefaultSortDirection="Ascending" DefaultSortColumnName="CREATE_DATE" EmptyDataText="沒有資料"
                        EnhancePager="True" KeepSelectedRows="False" OnRowDataBound="logGrid_RowDataBound"
                        PageSize="15" Width="100%" OnPageIndexChanging="logGrid_PageIndexChanging"
                        OnSorting="logGrid_Sorting" CustomDropDownListPage="False" meta:resourcekey="logGridResource1" SelectedRowColor="" UnSelectedRowColor="">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                            PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="審核者" SortExpression="EXAMINER" meta:resourcekey="TemplateFieldResource1"><ItemTemplate><asp:Label ID="lblExaminer" runat="server" meta:resourcekey="lblExaminerResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="COMMENT" HeaderText="意見" meta:resourcekey="BoundFieldResource1" />
                            <asp:TemplateField HeaderText="審核時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreateDate" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="15%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審核狀態" SortExpression="STATUS" meta:resourcekey="TemplateFieldResource2"><ItemTemplate><asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle Width="5%" />
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>
            </td>
        </tr>
    </table>
     
    <asp:HiddenField ID="hidDisableApprove" runat="server" />   
    <asp:HiddenField ID="hidMasterGuid" runat="server" />   
    <asp:HiddenField ID="hidIshide" runat="server" Value="False" />   
    <asp:HiddenField ID="hidEndDate" runat="server" />

    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
    <asp:Label ID="lblAPStatus" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAPStatusResource1"></asp:Label>
    <asp:Label ID="lblDSStatus" runat="server" Text="製作中" Visible="False" meta:resourcekey="lblDSStatusResource1"></asp:Label>
    <asp:Label ID="lblPLStatus" runat="server" Text="發佈" Visible="False" meta:resourcekey="lblPLStatusResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="公開" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblNoPublish" runat="server" Text="不公開" Visible="False" meta:resourcekey="lblNoPublishResource1"></asp:Label>
    <asp:Label ID="lblNoAnonymous" runat="server" Text="記名" Visible="False" meta:resourcekey="lblNoAnonymousResource1"></asp:Label>
    <asp:Label ID="lblAnonymous" runat="server" Text="不記名" Visible="False" meta:resourcekey="lblAnonymousResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="允許" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" Text="否決" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>
    <asp:Label ID="lblExpiredMsg" runat="server" Text="問卷調查時間已截止，只允許否決問卷" Visible="False" meta:resourcekey="lblExpiredMsgResource1"></asp:Label>
    <asp:Label ID="lblLinkName" runat="server" Text="請點選此處,填寫問卷。" Visible="False" meta:resourcekey="lblLinkNameResource1"></asp:Label>
    <asp:Label ID="lblisExamine" runat="server" Text="該問卷已審核過" Visible="False" meta:resourcekey="lblisExamineResource1"></asp:Label>
    <asp:Label ID="lblNotExaminer" runat="server" Text="登入者非該問卷審核者,所以無法連結此問卷!" Visible="False" meta:resourcekey="lblNotExaminerResource1"></asp:Label>
    <asp:Label ID="lblBeforeStart" runat="server" Text="開始前" Visible="False" meta:resourcekey="lblBeforeStartResource1"></asp:Label>
    <asp:Label ID="lbl15min" runat="server" Text="15分鐘" Visible="False" meta:resourcekey="lbl15minResource1"></asp:Label>
    <asp:Label ID="lbl30min" runat="server" Text="30分鐘" Visible="False" meta:resourcekey="lbl30minResource1"></asp:Label>
    <asp:Label ID="lbl1hr" runat="server" Text="1小時" Visible="False" meta:resourcekey="lbl1hrResource1"></asp:Label>
    <asp:Label ID="lbl2hr" runat="server" Text="2小時" Visible="False" meta:resourcekey="lbl2hrResource1"></asp:Label>
    <asp:Label ID="lbl1day" runat="server" Text="1天" Visible="False" meta:resourcekey="lbl1dayResource1"></asp:Label>
    <asp:Label ID="lbl3day" runat="server" Text="3天" Visible="False" meta:resourcekey="lbl3dayResource1"></asp:Label>
    <asp:Label ID="lbl1week" runat="server" Text="1週" Visible="False" meta:resourcekey="lbl1weekResource1"></asp:Label>
    <asp:Label ID="lblNoticeAtOnce" runat="server" Text="立即通知(啟用後約5分鐘可收到通知)" Visible="False" meta:resourcekey="lblNoticeAtOnceResource1"></asp:Label>
    <asp:Label ID="lblNoticeSurveyStart" runat="server" Text="問卷調查開始時通知" Visible="False" meta:resourcekey="lblNoticeSurveyStartResource1"></asp:Label>
    <asp:Label ID="lblNoNotice" runat="server" Text="不通知" Visible="False" meta:resourcekey="lblNoNoticeResource1"></asp:Label>
    <asp:Label ID="lblSetSendUsers" runat="server" Text="未設定問卷調查對象，只允許否決問卷" Visible="False" meta:resourcekey="lblSetSendUsersResource1"></asp:Label>
    <asp:Label ID="lblInsertTargetUserMsg" runat="server" Text="已啟用問卷，問卷發送將進入系統排程。" meta:resourcekey="lblInsertTargetUserMsgResource1" Visible="False"></asp:Label>

</asp:Content>


