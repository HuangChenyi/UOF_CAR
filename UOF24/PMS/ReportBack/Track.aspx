<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_ReportBack_Track" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Track.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc6" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Fast:Grid ID="grd" runat="server" DataKeyNames="RB_GUID" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" OnRowDataBound="grd_RowDataBound" Width="100%" AllowSorting="True" DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15" OnSorting="grd_Sorting">
                <Columns>
                    <asp:BoundField DataField="TASK_GUID" HeaderText="GUID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                    <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text='<%# Bind("NAME") %>' ID="lbtName" meta:resourcekey="lbtNameResource1"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="回報狀態" SortExpression="STATUS" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStatus" meta:resourcekey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="進度" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("PROGRESS_RATE") %>' ID="lblProgressRate" meta:resourcekey="lblProgressRateResource1"></asp:Label>
                            <asp:Label runat="server" Text="%" ID="labStartEndTime" meta:resourcekey="labStartEndTimeResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="附件" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <uc6:UC_FileCenter runat="server" ID="UC_FileCenter" Editable="false" UploadEnabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="回報人" SortExpression="REPORTER" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblReporter" meta:resourcekey="lblReporterResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="回報時間" meta:resourcekey="BoundFieldResource2" SortExpression="REPORT_TIME">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblReportTime"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="說明" meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="word-wrap: break-word" width="250">
                                        <asp:Literal runat="server" ID="litDescription" meta:resourcekey="litDescriptionResource1"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle Wrap="false" />
                <EnhancePagerSettings
                    ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblNotYetBeginMsg" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="lblNotYetBeginMsgResource1"></asp:Label>
    <asp:Label ID="lblProceedingMsg" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingMsgResource1"></asp:Label>
    <asp:Label ID="lblCompletedMsg" runat="server" Text="已完成" Visible="False" meta:resourcekey="lblCompletedMsgResource1"></asp:Label>
    <asp:HiddenField ID="hidGUID" runat="server" />
    <asp:HiddenField ID="hidType" runat="server" />
    <asp:HiddenField ID="hidProjGUID" runat="server" />
</asp:Content>

