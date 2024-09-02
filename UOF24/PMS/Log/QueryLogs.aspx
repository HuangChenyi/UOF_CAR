<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="PMS_Log_QueryLogs" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryLogs.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>   
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>   
<%@ Register Src="../Common/UC_ProjectStatusDDL.ascx" TagName="UC_ProjectStatusDDL" TagPrefix="uc4" %> 
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" >
    
function fnActionTime(source, arguments)
{
    var toolbarbutton = $find('<%=RadToolBar1.ClientID%>');
    var start = $telerik.findElement(toolbarbutton.get_element(), ("rdpStart")).value;
    var end = $telerik.findElement(toolbarbutton.get_element(), ("rdpEnd")).value; 
        if (start == '' || end == '') 
        {
            arguments.IsValid = false;
        }
        else 
        {
            arguments.IsValid = true;
        }
}
</script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="proStatus" meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="專案狀態：" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td>
                                <uc4:UC_ProjectStatusDDL ID="UC_ProjectStatusDDL1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="proName" meta:resourcekey="RadToolBarButtonResource3">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="專案名稱：" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="proDate" meta:resourcekey="RadToolBarButtonResource5">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="期間" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpStart" runat="server" 
                                    meta:resourcekey="rdpStartResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput  LabelWidth="64px" 
                                        Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="~" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpEnd" runat="server"  
                                    meta:resourcekey="rdpEndResource1">
                                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput  LabelWidth="64px" 
                                        Width="">
                                    </DateInput>
                                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                </telerik:RadDatePicker>

                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="btnQuery"
                 CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                 HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource8">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource9">
                <ItemTemplate>
                    <asp:CustomValidator ID="cvActionTime" runat="server" Display="Dynamic" Text="請選擇查詢的日期期間" ClientValidationFunction="fnActionTime" meta:resourcekey="cvActionTimeResource1"></asp:CustomValidator>
                </ItemTemplate>
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
            <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <contenttemplate>
                <fast:grid id="grd" runat="server" allowsorting="True" autogeneratecheckboxcolumn="False"
                        autogeneratecolumns="False"  datakeynames="LOG_GUID"
                        datakeyonclientwithcheckbox="False" enhancepager="True"
                        pagesize="15"   Width="100%"
                        AllowPaging="True" OnRowDataBound="grd_RowDataBound" OnSorting="grd_Sorting" OnPageIndexChanging="grd_PageIndexChanging" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="grdResource2" >
            <EnhancePagerSettings
                ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" 
                        LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" 
                        PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" 
                        PreviousAltImageUrl="" PreviousImageUrl="" />
                    <exportexcelsettings allowexporttoexcel="False" />
            <Columns>
                <asp:BoundField HeaderText="LOG_GUID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                <%--<asp:BoundField DataField="ACTION_TIME" HeaderText="發生時間" SortExpression="ACTION_TIME" meta:resourcekey="BoundFieldResource2" />--%>
                 <asp:TemplateField HeaderText="發生時間" SortExpression="ACTION_TIME" meta:resourcekey="BoundFieldResource2">
                    <itemtemplate>
<asp:Label runat="server" ID="lblActiontime" ></asp:Label>

</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作人" SortExpression="ACTOR" meta:resourcekey="TemplateFieldResource1">
                    <itemtemplate>
<asp:Label runat="server" ID="lblActor" meta:resourcekey="lblActorResource1"></asp:Label>

</itemtemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ACTION_DES" HeaderText="描述" SortExpression="ACTION_DES" meta:resourcekey="BoundFieldResource3" >
                    <itemstyle width="500px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="方法" SortExpression="FUNC_ID" meta:resourcekey="TemplateFieldResource2">
                    <itemtemplate>
<asp:Label runat="server" ID="lblFuncID" meta:resourcekey="lblFuncIDResource1"></asp:Label>

</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="專案名稱" SortExpression="PROJ_NAME" meta:resourcekey="TemplateFieldResource3" >
                    <itemtemplate>
<asp:LinkButton runat="server" Text='<%# Bind("PROJ_NAME") %>' ID="lbtProjName" meta:resourcekey="lbtProjNameResource1"></asp:LinkButton>

                    
</itemtemplate>
                </asp:TemplateField>
            </Columns>
        </fast:grid></contenttemplate>
                <triggers>
<asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
</triggers>
            </asp:UpdatePanel>
    <asp:Label ID="lblPMSAuditNewProjectMsg" runat="server" Text="審核新專案" Visible="False" meta:resourcekey="lblPMSAuditNewProjectMsgResource1"></asp:Label> 
   <asp:Label ID="lblPMSReportBackTaskMsg" runat="server" Text="回報任務" Visible="False" meta:resourcekey="lblPMSReportBackTaskMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSAuditSeriesCompletedMsg" runat="server" Text="審核階段完成" Visible="False" meta:resourcekey="lblPMSAuditSeriesCompletedMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSAuditTaskCompletedMsg" runat="server" Text="審核任務完成" Visible="False" meta:resourcekey="lblPMSAuditTaskCompletedMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSViewMsg" runat="server" Text="查詢" Visible="False" meta:resourcekey="lblPMSViewMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSCreateTaskMsg" runat="server" Text="建立任務" Visible="False" meta:resourcekey="lblPMSCreateTaskMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSChangeTaskMsg" runat="server" Text="修改任務" Visible="False" meta:resourcekey="lblPMSChangeTaskMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSDeleteTaskMsg" runat="server" Text="刪除任務" Visible="False" meta:resourcekey="lblPMSDeleteTaskMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSCreateChildSeriesMsg" runat="server" Text="建立子階段" Visible="False" meta:resourcekey="lblPMSCreateChildSeriesMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSUrgeTaskMsg" runat="server" Text="任務稽催" Visible="False" meta:resourcekey="lblPMSUrgeTaskMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSChangeSeriesMsg" runat="server" Text="修改階段" Visible="False" meta:resourcekey="lblPMSChangeSeriesMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSDeleteSeriesMsg" runat="server" Text="刪除階段" Visible="False" meta:resourcekey="lblPMSDeleteSeriesMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSCreateSeriesMsg" runat="server" Text="建立階段" Visible="False" meta:resourcekey="lblPMSCreateSeriesMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSCreateChildTaskMsg" runat="server" Text="建立子任務" Visible="False" meta:resourcekey="lblPMSCreateChildTaskMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSChangeDraftProjectMsg" runat="server" Text="修改草稿專案" Visible="False" meta:resourcekey="lblPMSChangeDraftProjectMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSChangeProjectMsg" runat="server" Text="修改專案" Visible="False" meta:resourcekey="lblPMSChangeProjectMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSDeleteProjectMsg" runat="server" Text="刪除專案" Visible="False" meta:resourcekey="lblPMSDeleteProjectMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSSuspendProjectMsg" runat="server" Text="中止專案" Visible="False" meta:resourcekey="lblPMSSuspendProjectMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSCreateProjectMsg" runat="server" Text="建立專案" Visible="False" meta:resourcekey="lblPMSCreateProjectMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSStartProjectMsg" runat="server" Text="啟動專案" Visible="False" meta:resourcekey="lblPMSStartProjectMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSMoveMsg" runat="server" Text="搬移工作順序" Visible="False" meta:resourcekey="lblPMSMoveMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSMoveChildMsg" runat="server" Text="搬移子工作順序" Visible="False" meta:resourcekey="lblPMSMoveChildMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSReformSeriesMsg" runat="server" Text="改善階段" Visible="False" meta:resourcekey="lblPMSReformSeriesMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSSetDefaultNoticeMsg" runat="server" Text="設定預設通知類別" Visible="False" meta:resourcekey="lblPMSSetDefaultNoticeMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSSetProjectViewerMsg" runat="server" Text="設定專案查詢者" Visible="False" meta:resourcekey="lblPMSSetProjectViewerMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSSetProjectCreatorMsg" runat="server" Text="設定專案建立者" Visible="False" meta:resourcekey="lblPMSSetProjectCreatorMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSSendAuditProjectMsg" runat="server" Text="送審專案" Visible="False" meta:resourcekey="lblPMSSendAuditProjectMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSSendAuditSeriesMsg" runat="server" Text="送審階段" Visible="False" meta:resourcekey="lblPMSSendAuditSeriesMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSRemindOnHandMsg" runat="server" Text="手動發送任務" Visible="False" meta:resourcekey="lblPMSRemindOnHandMsgResource1"></asp:Label>
   <asp:Label ID="lblPMSCloseProjectMsg" runat="server" Text="手動結案" Visible="False" meta:resourcekey="lblPMSCloseProjectMsgResource1"></asp:Label>
       
</asp:Content>

