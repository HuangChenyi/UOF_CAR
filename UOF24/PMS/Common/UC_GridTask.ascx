<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_GridTask" Codebehind="UC_GridTask.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
    
<Fast:Grid ID="gridTask" runat="server" DataKeyNames="PROJECT_GUID,GUID" OnRowDataBound="gridTask_RowDataBound" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
     DataKeyOnClientWithCheckBox="True" Width="100%" EnhancePager="True" PageSize="15" OnPageIndexChanging="gridTask_PageIndexChanging" meta:resourcekey="gridTaskResource1"
    DefaultSortDirection="Ascending" AllowPaging="True" OnBeforeExport="gridTask_BeforeExport"  EmptyDataText="沒有資料" KeepSelectedRows="False"    >
     
    <ExportExcelSettings AllowExportToExcel="True" DataSourceType="DataTable"  ExportType="GridContent"></ExportExcelSettings>
    <Columns>
        <asp:TemplateField HeaderText="專案名稱" meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <asp:LinkButton runat="server" Text='<%# Bind("PROJECT_NAME") %>' ID="lbtProj1" meta:resourcekey="lbtProj1Resource1"></asp:LinkButton>
            </ItemTemplate>
            <HeaderStyle Wrap="false" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="任務名稱" meta:resourcekey="TemplateFieldResource2">
            <ItemTemplate>
                <asp:LinkButton runat="server" Text='<%# Bind("NAME") %>' ID="lbtTask" meta:resourcekey="lbtTaskResource1"></asp:LinkButton>
            </ItemTemplate>
            <HeaderStyle Wrap="false" />            
        </asp:TemplateField>
        <asp:BoundField DataField="STATUS" HeaderText="狀態" meta:resourcekey="BoundFieldResource1">
        <HeaderStyle Wrap="False" />
        <ItemStyle Wrap="False" />
        </asp:BoundField>
        <asp:BoundField DataField="PROGRESS" HeaderText="進度" meta:resourcekey="BoundFieldResource2">
        <HeaderStyle Wrap="false" />
        </asp:BoundField>
        <asp:BoundField DataField="EXPECTED_START_DATE" HeaderText="預計時程" meta:resourcekey="BoundFieldResource3">
        <HeaderStyle Wrap="false" />        
        </asp:BoundField>
        <asp:BoundField DataField="PRACTICAL_START_DATE" HeaderText="實際時程" meta:resourcekey="BoundFieldResource4">
        <HeaderStyle Wrap="false" />        
        </asp:BoundField>
        <asp:BoundField HeaderText="起始日期相差值" meta:resourcekey="BoundFieldResource7">
            <ControlStyle Width="120px" />
        <HeaderStyle Wrap="false" />        
        </asp:BoundField>
        <asp:BoundField HeaderText="結束日期相差值" meta:resourcekey="BoundFieldResource8">
            <ControlStyle Width="120px" />
        <HeaderStyle Wrap="false" />        
        </asp:BoundField>
        <asp:TemplateField HeaderText="負責人" meta:resourcekey="TemplateFieldResource3">
            <ItemTemplate>
                <asp:Label runat="server" ID="lblDirectorNames" meta:resourcekey="lblDirectorNamesResource1"></asp:Label>
            </ItemTemplate>
            <ControlStyle Width="80px" />
        <HeaderStyle Wrap="false" />        
        </asp:TemplateField>
        <asp:TemplateField HeaderText="專案名稱" meta:resourcekey="TemplateFieldResource4">
            <ItemTemplate>
                <asp:LinkButton runat="server" Text='<%# Bind("PROJECT_NAME") %>' ID="lbtProj2" meta:resourcekey="lbtProj2Resource1"></asp:LinkButton>
            </ItemTemplate>
            <ControlStyle Width="120px" />
        <HeaderStyle Wrap="false" />        
        </asp:TemplateField>
        <asp:BoundField DataField="PROJECT_GUID" HeaderText="PROJECT_GUID" Visible="False"
            meta:resourcekey="BoundFieldResource5" />
        <asp:BoundField DataField="GUID" HeaderText="GUID" Visible="False" meta:resourcekey="BoundFieldResource6" />
    </Columns>
    <EnhancePagerSettings ShowHeaderPager="True" />
</Fast:Grid>
<asp:Label ID="lblLaterMsg1" runat="server" Text="(逾時" Visible="False" meta:resourcekey="lblLaterMsg1Resource1"></asp:Label>
<asp:Label ID="lblLaterMsg2" runat="server" Text="天)" Visible="False" meta:resourcekey="lblLaterMsg2Resource1"></asp:Label>
<asp:Label ID="lblAuditMsg" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblAuditMsgResource1"></asp:Label>
<asp:Label ID="lblCompletedMsg" runat="server" Text="已完成" Visible="False" meta:resourcekey="lblCompletedMsgResource1"></asp:Label>
<asp:Label ID="lblNotYetBeginMsg" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginMsgResource1"></asp:Label>
<asp:Label ID="lblProceedingMsg" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingMsgResource1"></asp:Label>
<asp:HiddenField ID="hidGridPaging" runat="server" value="false" />
<asp:HiddenField ID="hidShowProjectFirstColumn" runat="server" value="false" />
