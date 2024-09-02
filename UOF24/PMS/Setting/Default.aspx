<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="PMS_Setting_Default" Title="Project Default Setting" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="../Common/UC_ProjectStatusDDL.ascx" TagName="UC_ProjectStatusDDL" TagPrefix="uc4" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../Common/UC_NoticeType.ascx" TagName="UC_NoticeType" TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style="padding-left: 0px; padding-top: 3px">
    <table class="PopTable">
        <tr>
            <td class="PopTableHeader">
                <asp:Label ID="Label1" runat="server" Text="可以建立專案的人員" meta:resourcekey="Label1Resource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align:left; background-color:White;">
                <asp:CustomValidator ID="CustomValidator2" runat="server" BackColor="Red" ForeColor="White" ErrorMessage="您沒有操作權限"  Visible="False" Width="100%" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <uc2:UC_ChoiceList ID="ucChoiceCreator" runat="server" ExpandToUser="false" />
                </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="PopTableHeader">
                <asp:Label ID="Label2" runat="server" Text="預設通知類別(請勾選要系統自動發送之通知類別)" meta:resourcekey="Label2Resource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align:left; background-color:White;">
                <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" ForeColor="White" Visible="False" Width="100%" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <uc1:UC_NoticeType ID="ucNoticeType" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="PopTableHeader">
                <asp:Label ID="Label4" runat="server" Text="可以查詢所有專案的人員" meta:resourcekey="Label4Resource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align:left; background-color:White;">
                <asp:CustomValidator ID="CustomValidator3" runat="server" BackColor="Red" ForeColor="White" ErrorMessage="您沒有操作權限" Visible="False" Width="100%" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <uc2:UC_ChoiceList ID="ucChoiceViewer" runat="server" ExpandToUser="false" />
                </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="PopTableHeader">
                <asp:Label ID="Label3" runat="server" Text="可以查詢特定專案的人員" meta:resourcekey="Label3Resource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align:left; background-color:White;">
                  <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <telerik:RadToolBar ID="toolBarProjViewer" runat="server" Width="100%" meta:resourcekey="toolBarProjViewerResource2">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Value="ProjStatus" meta:resourcekey="RadToolBarButtonResource1">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="專案狀態" meta:resourcekey="Label5Resource1"></asp:Label>
                                        </td>
                                        <td>
                                            <uc4:UC_ProjectStatusDDL ID="UC_ProjectStatusDDL" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
             
                <Fast:Grid ID="gridQueryUser" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"   OnRowDataBound="gridQueryUser_RowDataBound"  EnhancePager="True" PageSize="15" Width="100%" OnPageIndexChanging="gridQueryUser_PageIndexChanging" OnSorting="gridQueryUser_Sorting"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="gridQueryUserResource2"   HeaderStyle-Wrap="False">
                    <EnhancePagerSettings
                        ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <exportexcelsettings allowexporttoexcel="False" />
                    <Columns>
                        <asp:BoundField DataField="PROJECT_GUID" SortExpression="PROJECT_GUID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                        <asp:BoundField DataField="PROJECT_NAME" SortExpression="PROJECT_NAME" HeaderText="專案" meta:resourcekey="BoundFieldResource2" />
                        <asp:TemplateField HeaderText="可以查詢的人員" SortExpression="VIEWER_NAME" meta:resourcekey="TemplateFieldResource1">
                            <itemtemplate>
                                <uc2:UC_ChoiceList runat="server" ID="UC_ChoiceList" IsAllowEdit="false"></uc2:UC_ChoiceList>
                            </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="動作" meta:resourcekey="TemplateFieldResource2">
                            <itemtemplate>
                        <asp:ImageButton runat="server" AlternateText="編輯" ImageUrl="~/Common/Images/Icon/icon_m19.png" ID="ibtnEdit" meta:resourcekey="ibtnEditResource1" OnClick="ibtnEdit_Click"></asp:ImageButton>
 
                        </itemtemplate> 
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle Wrap="False" />
                </Fast:Grid>
                </ContentTemplate>
                    <Triggers>
                      
                        <asp:AsyncPostBackTrigger ControlID="toolBarProjViewer" EventName="ButtonClick" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
<asp:Label ID="lblAudit" runat="server" Text="Default Audit Selected !" Visible="False" meta:resourcekey="lblAuditResource1"></asp:Label>
<asp:Label ID="lblStartProj" runat="server" Text="Default StartProject Selected !" Visible="False" meta:resourcekey="lblStartProjResource1"></asp:Label>
<asp:Label ID="lblReminder" runat="server" Text="Default Reminder Selected !" Visible="False" meta:resourcekey="lblReminderResource1"></asp:Label>
<asp:Label ID="lblReminderTime" runat="server" Text="Default Reminder Time Selected !" Visible="False" meta:resourcekey="lblReminderTimeResource1"></asp:Label>
<asp:Label ID="lblTimeOut" runat="server" Text="Default TimeOut Selected !" Visible="False" meta:resourcekey="lblTimeOutResource1"></asp:Label>
<asp:Label ID="lblOutcome" runat="server" Text="Default AuditOutcome Selected !" Visible="False" meta:resourcekey="lblOutcomeResource1"></asp:Label>
<asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有操作權限" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblNoticeEmptyMsg" runat="server" Text="通知類別目前沒有預設值，請通知系統管理員" Visible="False" meta:resourcekey="lblNoticeEmptyMsgResource1"></asp:Label>
</div>
</asp:Content>

