<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Audit_Track" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Track.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="padding-left: 0px; padding-top: 0px">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Red" ForeColor="White" meta:resourcekey="ValidationSummary1Resource1" />
    </div>
 <div style="padding-left: 0px; padding-top: 3px">  
    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"  EnhancePager="True" OnRowDataBound="Grid1_RowDataBound" PageSize="15"   Width="100%"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False"   >
        <EnhancePagerSettings
            ShowHeaderPager="True" />

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:BoundField DataField="AUDIT_GUID" Visible="False" meta:resourcekey="BoundFieldResource1" />
            <asp:TemplateField HeaderText="審核結果" meta:resourcekey="TemplateFieldResource1">
                <itemtemplate>
<asp:Label runat="server" ID="lblOutcome" meta:resourcekey="lblOutcomeResource1"></asp:Label>

</itemtemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="審核意見" meta:resourcekey="TemplateFieldResource2"  >                            
                <itemtemplate>
<table>
    <tr><td style="word-wrap:break-word" width="150">
         <asp:Literal runat="server" ID="litOpinion" meta:resourcekey="litOpinionResource1"></asp:Literal>

    </td></tr>
</table>                
</itemtemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="審核者" meta:resourcekey="TemplateFieldResource3">
                <itemtemplate>
<asp:Label runat="server" ID="lblAuditor" meta:resourcekey="lblAuditorResource1"></asp:Label>

</itemtemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="審核時間" meta:resourcekey="BoundFieldResource2">
                <itemtemplate>
                    <asp:Label runat="server" ID="lblAUDIT_TIME"></asp:Label>
                </itemtemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidGUID" runat="server" />
    <asp:HiddenField ID="hidType" runat="server" />
    <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None"
        ForeColor="White" Visible="False" Width="80px" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
    <asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有操作權限。" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
    <asp:Label ID="lblOutcomeYes" runat="server" Visible="False" Text="通過" meta:resourcekey="lblOutcomeYesResource1"></asp:Label>
    <asp:Label ID="lblOutcomeNo" runat="server" Visible="False" Text="不通過" meta:resourcekey="lblOutcomeNoResource1"></asp:Label>
</div>
</asp:Content>

