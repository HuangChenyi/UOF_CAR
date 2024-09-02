<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_HOMETaskReportBack" Codebehind="UC_HOMETaskReportBack.ascx.cs" %>
<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <Fast:Grid ID="gridTask" runat="server" AllowSorting="True" 
            AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
             DataKeyOnClientWithCheckBox="False" 
             ShowHeader="False" SkinID="HomepageBlockStyle" 
             ForeColor="Black" GridLines="None" 
            OnRowDataBound="gridTask_RowDataBound" Width="100%" 
    EnhancePager="True" meta:resourcekey="gridTaskResource1" AllowPaging="True" 
            onpageindexchanging="gridTask_PageIndexChanging" PageSize="15">
            <ExportExcelSettings AllowExportToExcel="False">
            </ExportExcelSettings>
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <itemtemplate>
                        <table>
                            <tr>
                                <td style="min-width:16px;min-height:16px">
                                    <IMG height="16" src="<%=ResolveUrl("~/common/images/icon/icon02.png") %>" width="16" />
                                </td>
                            </tr>
                        </table>
                    </itemtemplate>
                    <itemstyle width="16px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="任務名稱" meta:resourcekey="TemplateFieldResource2">
                    <itemtemplate>
                        <asp:LinkButton id="lbtTask" runat="server" meta:resourcekey="lbtTaskResource1" 
                    Text='<%# Bind("NAME") %>' __designer:wfdid="w5" OnClick="lbtTask_Click"></asp:LinkButton>
                    </itemtemplate>
                    <itemstyle forecolor="Black" width="35%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="任務狀態" meta:resourcekey="TemplateFieldResource3">
                    <itemtemplate>
                        <asp:Label runat="server" ID="lblStatus" meta:resourcekey="lblStatusResource1"></asp:Label>
                    </itemtemplate>
                    <itemstyle forecolor="Black" width="15%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="預計時程" meta:resourcekey="TemplateFieldResource4">
                    <itemtemplate>
                        <asp:Label runat="server" ID="lblExpectedStartDate" 
                    meta:resourcekey="lblExpectedStartDateResource1"></asp:Label>
                        <asp:Label runat="server" Text="~" ID="lblExpected" 
                            meta:resourcekey="lblExpectedResource1"></asp:Label>
                        <asp:Label runat="server" ID="lblExpectedEndDate" 
                    meta:resourcekey="lblExpectedEndDateResource1"></asp:Label>
                    </itemtemplate>
                    <itemstyle forecolor="Black" width="20%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="專案名稱" meta:resourcekey="TemplateFieldResource5">
                    <itemtemplate>
                        <asp:LinkButton runat="server" Text='<%# Bind("PROJECT_NAME") %>' ID="lbtProj" 
                    meta:resourcekey="lbtProjResource1"></asp:LinkButton>
                    </itemtemplate>
                    <itemstyle forecolor="Black" width="30%" />
                </asp:TemplateField>
                <asp:BoundField DataField="GUID" Visible="False" 
            meta:resourcekey="BoundFieldResource1" />
                <asp:BoundField DataField="PROJECT_GUID" Visible="False" 
            meta:resourcekey="BoundFieldResource2" />
            </Columns>
            <EnhancePagerSettings
        ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" 
        LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" 
        PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" 
        PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
        </Fast:Grid>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblLaterMsg1" runat="server" Text="(逾時" Visible="False" meta:resourcekey="lblLaterMsg1Resource1"></asp:Label>
<asp:Label ID="lblLaterMsg2" runat="server" Text="天)" Visible="False" meta:resourcekey="lblLaterMsg2Resource1"></asp:Label>
<asp:Label ID="lblAuditMsg" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditMsgResource1"></asp:Label>
<asp:Label ID="lblCompletedMsg" runat="server" Text="已完成" Visible="False" meta:resourcekey="lblCompletedMsgResource1"></asp:Label>
<asp:Label ID="lblNotYetBeginMsg" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginMsgResource1"></asp:Label>
<asp:Label ID="lblProceedingMsg" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingMsgResource1"></asp:Label>
