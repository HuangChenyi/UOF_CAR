<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_MyAudit" Codebehind="UC_MyAudit.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <Fast:Grid ID="gridMySeries" runat="server" Width="100%" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
            AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"
            OnRowDataBound="gridMySeries_RowDataBound" meta:resourcekey="gridMySeriesResource1"
            EnhancePager="True" PageSize="15" AllowPaging="True" OnPageIndexChanging="gridMySeries_PageIndexChanging" OnSorting="gridMySeries_Sorting"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False"   >
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField HeaderText="名稱" SortExpression="GUID" meta:resourcekey="TemplateFieldResource1">
                    <itemtemplate>
                        <asp:Image runat="server" Height="16px" Width="16px" ID="imgType" meta:resourcekey="imgTypeResource1"></asp:Image>
                        <asp:LinkButton runat="server" Text='<%# Bind("NAME") %>' ID="lbtName" meta:resourcekey="lbtNameResource1"></asp:LinkButton>
                    </itemtemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="專案名稱" SortExpression="PROJECT_GUID" meta:resourcekey="TemplateFieldResource2" >
                    <itemtemplate>
                        <asp:LinkButton runat="server" ID="lbtProjName" meta:resourcekey="lbtProjNameResource1"></asp:LinkButton>
                    </itemtemplate>            
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="審核結果" meta:resourcekey="TemplateFieldResource3">
                    <itemtemplate>
                        <asp:Label runat="server" ID="lblOutcome" meta:resourcekey="lblOutcomeResource1"></asp:Label>
                    </itemtemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="預計時程" meta:resourcekey="TemplateFieldResource4">
                    <itemtemplate>
                        <asp:Label runat="server" ID="lblExpectedStartDate" meta:resourcekey="lblExpectedStartDateResource1"></asp:Label>
                        <asp:Label runat="server" Text="~" ID="lblExpected" meta:resourcekey="lblExpectedResource1"></asp:Label>
                        <asp:Label runat="server" ID="lblExpectedEndDate" meta:resourcekey="lblExpectedEndDateResource1"></asp:Label>
                    </itemtemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="實際時程" meta:resourcekey="TemplateFieldResource5">
                    <itemtemplate>
                        <asp:Label runat="server" ID="lblPracticalStartlDate" meta:resourcekey="lblPracticalStartlDateResource1"></asp:Label>
                        <asp:Label runat="server" Text="~" ID="lblPractical" meta:resourcekey="lblPracticalResource1"></asp:Label>
                        <asp:Label runat="server" ID="lblPracticalEndDate" meta:resourcekey="lblPracticalEndDateResource1"></asp:Label>
                    </itemtemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="負責人" meta:resourcekey="TemplateFieldResource6">
                    <itemtemplate>
                        <asp:Label runat="server" ID="lblDirectorNames" meta:resourcekey="lblDirectorNamesResource1"></asp:Label>
                    </itemtemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource7">
                    <itemtemplate>
                        <asp:LinkButton runat="server" Text="改善" ID="lbtnReform" meta:resourcekey="lbtnReformResource1"></asp:LinkButton>
                    </itemtemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
            </Columns>
            <EnhancePagerSettings
            ShowHeaderPager="True" />
        </Fast:Grid>
        <asp:HiddenField ID="hidBindType" runat="server" />
        <asp:HiddenField ID="hidProjStatus" runat="server" value="Proceeding"  />
        <asp:HiddenField ID="hidsendingStartDate" runat="server" />
        <asp:HiddenField ID="hidsendingEndDate" runat="server" />
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
    <asp:Label ID="lblOutcome1" runat="server" Text="不通過" Visible="False" meta:resourcekey="lblOutcome1Resource1"></asp:Label>
    <asp:Label ID="lblOutcome0" runat="server" Text="通過" Visible="False" meta:resourcekey="lblOutcome0Resource1"></asp:Label>
    <asp:Label ID="lblIsReformed" runat="server" Text="(已改善)" Visible="False" meta:resourcekey="lblIsReformedResource1"></asp:Label>
    <asp:HiddenField ID="hideUpdate" runat="server" value="Fasle" />
