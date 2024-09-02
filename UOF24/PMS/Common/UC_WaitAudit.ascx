<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_WaitAudit" Codebehind="UC_WaitAudit.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
            <Fast:Grid ID="gridWait" runat="server" Width="100%" PageSize="15" EnhancePager="True" OnRowDataBound="gridWait_RowDataBound" 
                DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False" AllowSorting="True"  meta:resourcekey="gridWaitResource1"
                DataKeyNames="PROJECT_GUID"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False"   >
                <ExportExcelSettings AllowExportToExcel="False"/>
        <Columns>
            <asp:BoundField DataField="GUID" Visible="False" meta:resourcekey="BoundFieldResource1" />
            <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource1">
                <itemtemplate>
                    <asp:Image runat="server" Height="16px" Width="16px" ID="imgWaitType" meta:resourcekey="imgWaitTypeResource1"></asp:Image>
                    <asp:LinkButton runat="server" Text='<%# Bind("NAME") %>' ID="lbtnName" meta:resourcekey="lbtnNameResource1" OnClick="lbtnName_Click"></asp:LinkButton>
                </itemtemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="預計時程" meta:resourcekey="TemplateFieldResource2">
                <itemtemplate>
                    <asp:Label runat="server" ID="lblWaitExpectedStartDate" meta:resourcekey="lblWaitExpectedStartDateResource1"></asp:Label>
                    <asp:Label runat="server" Text="~" ID="lblWaitExpected" meta:resourcekey="lblWaitExpectedResource1"></asp:Label>
                    <asp:Label runat="server" ID="lblWaitExpectedEndDate" meta:resourcekey="lblWaitExpectedEndDateResource1"></asp:Label>   
                </itemtemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="實際時程" meta:resourcekey="TemplateFieldResource3">
                <itemtemplate>
                    <asp:Label runat="server" ID="lblWaitPracticalStartlDate" meta:resourcekey="lblWaitPracticalStartlDateResource1"></asp:Label>
                    <asp:Label runat="server" Text="~" ID="lblWaitPractical" meta:resourcekey="lblWaitPracticalResource1"></asp:Label>
                    <asp:Label runat="server" ID="lblWaitPracticalEndDate" meta:resourcekey="lblWaitPracticalEndDateResource1"></asp:Label>
                </itemtemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
           <%-- <asp:BoundField DataField="SENDTIME" HeaderText="                                                                                                                                                                                                                                                                                                                                                                                                                                                                     送審日期" meta:resourcekey="BoundFieldResource2" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>--%>
             <asp:TemplateField HeaderText="送審日期" meta:resourcekey="BoundFieldResource2">
                <itemtemplate>
                    <asp:Label runat="server" ID="lblSENDTIME"></asp:Label>
                </itemtemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="送審人" meta:resourcekey="TemplateFieldResource4">
                <itemtemplate>
                    <asp:Label runat="server" ID="lblSENDER" meta:resourcekey="lblSENDERResource1"></asp:Label>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="動作" meta:resourcekey="TemplateFieldResource5">
                <itemtemplate>
                    <asp:LinkButton runat="server" Text="審核" ID="lbtAudit" meta:resourcekey="lbtAuditResource1" OnClick="lbtAudit_Click"></asp:LinkButton>
                </itemtemplate>
            </asp:TemplateField>
        </Columns>
        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
    </Fast:Grid>
</ContentTemplate>
</asp:UpdatePanel>
<table>
    <tr>
        <td style="padding: 2px;vertical-align: middle;text-align: center ;">
            <img height="16" src="<%=Request.ApplicationPath %>/Common/images/icon/icon_m90.png" width="16" /></td>
        <td style="padding: 2px;vertical-align: middle;text-align: center ;">
            <asp:Label ID="Label1" runat="server" Text="專案" meta:resourcekey="Label1Resource1"></asp:Label></td>
        <td style="padding: 2px;vertical-align: middle;text-align: center ;">
            <img height="16" src="<%=Request.ApplicationPath %>/Common/images/icon/icon_m88.png" width="16" /></td>
        <td style="padding: 2px;vertical-align: middle;text-align: center ;">
            <asp:Label ID="Label4" runat="server" Text="階段" meta:resourcekey="Label4Resource1"></asp:Label></td>
        <td style="padding: 2px;vertical-align: middle;text-align: center ;">
            <img height="16" src="<%=Request.ApplicationPath %>/Common/images/icon/icon_m147.png" width="16" /></td>
        <td style="padding: 2px;vertical-align: middle;text-align: center ;">
            <asp:Label ID="Label6" runat="server" Text="任務" meta:resourcekey="Label6Resource1"></asp:Label></td>
    </tr>
</table>
<asp:Label ID="lblAuditErrMsg" runat="server" Text="審核失敗" Visible="False" meta:resourcekey="lblAuditErrMsgResource1"></asp:Label> 