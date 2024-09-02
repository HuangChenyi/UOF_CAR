<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_InquiryStatistics" Title="查詢徵詢結果" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="InquiryStatistics.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td colspan="2" class="PopTableHeader" >
                <div style=" text-align:center;">
                    <asp:Label ID="Label6" runat="server" Text="徵詢結果統計" meta:resourcekey="Label6Resource2"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td style=" width:10%;">
                <asp:Label ID="Label11" runat="server" Text="會議時段" meta:resourcekey="Label11Resource2"></asp:Label></td>
            <td style=" width:90%;">
                <Fast:Grid ID="Grid4" runat="server" AutoGenerateCheckBoxColumn="False"
                    AutoGenerateColumns="False"
                    AllowSorting="True"
                    DataKeyOnClientWithCheckBox="False"
                    PageSize="15"
                    EnhancePager="True"
                    OnRowDataBound="Grid4_RowDataBound" Width="400px"
                    DefaultSortDirection="Ascending"  EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="Grid4Resource2"  >
                    <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:TemplateField HeaderText="時段" meta:resourcekey="TemplateFieldResource15">
                            <ItemTemplate>
                                <asp:Label ID="lblNum" runat="server" meta:resourcekey="lblNumResource3"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="會議時間"
                            meta:resourcekey="TemplateFieldResource16">
                            <ItemTemplate>
                                <asp:Label ID="lblInquiryTime" runat="server" meta:resourcekey="lblInquiryTimeResource2"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="參加人數"
                            meta:resourcekey="TemplateFieldResource17">
                            <ItemTemplate>
                                <asp:Label ID="lblUserNum" runat="server" meta:resourcekey="lblUserNumResource2"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="會議開始時間" Visible="False" meta:resourcekey="TemplateFieldResource18">
                            <ItemTemplate>
                                <asp:Label ID="lblStartTime" runat="server" Text='<%# Eval("START_TIME") %>' meta:resourcekey="lblStartTimeResource2"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="會議結束時間" Visible="False" meta:resourcekey="TemplateFieldResource19">
                            <ItemTemplate>
                                <asp:Label ID="lblEndTime" runat="server" Text='<%# Eval("END_TIME") %>' meta:resourcekey="lblEndTimeResource2"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
        <tr>
            <td style=" width:10%;">
                <asp:Label ID="Label12" runat="server" Text="參加" meta:resourcekey="Label12Resource2"></asp:Label>
            </td>
            <td style=" width:90%;">
                <asp:Label ID="Label13" runat="server" meta:resourcekey="Label13Resource2"></asp:Label>
            </td>
        </tr>
        <tr id="joinTR" runat="server">
            <td style=" width:10%;"></td>
            <td style="WORD-BREAK: break-all;width:90%;">
                <asp:Label ID="Label18" runat="server" meta:resourcekey="Label18Resource2"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style=" width:10%;">
                <asp:Label ID="Label14" runat="server" Text="不參加" meta:resourcekey="Label14Resource2"></asp:Label>
            </td>
            <td style=" width:90%;">
                <asp:Label ID="Label15" runat="server" meta:resourcekey="Label15Resource2"></asp:Label></td>
        </tr>
        <tr id="noJoinTR" runat="server">
            <td style=" width:10%;"></td>
            <td style="WORD-BREAK: break-all;width:90%;">
                <asp:Label ID="Label19" runat="server" meta:resourcekey="Label19Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style=" width:10%;">
                <asp:Label ID="Label16" runat="server" Text="尚未回覆" meta:resourcekey="Label16Resource2"></asp:Label>
            </td>
            <td style=" width:90%;">
                <asp:Label ID="Label17" runat="server" meta:resourcekey="Label17Resource2"></asp:Label>
            </td>
        </tr>
        <tr id="noReplyTR" runat="server">
            <td style=" width:10%;"></td>
            <td style=" width:90%;">
                <asp:Label ID="Label20" runat="server" meta:resourcekey="Label20Resource2"></asp:Label>
            </td>
        </tr>
    </table>
    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False"
        AutoGenerateColumns="False"
        Width="100%" AllowSorting="True"
        DataKeyOnClientWithCheckBox="False"
        PageSize="100" EnhancePager="True" DataKeyNames="INQUIRY_TIME_GUID"
        OnRowDataBound="Grid1_RowDataBound"
        Visible="False" DefaultSortDirection="Ascending"  EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="Grid1Resource3"  >
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:BoundField DataField="START_TIME" HeaderText="會議開始時間" meta:resourcekey="BoundFieldResource3" />
            <asp:BoundField DataField="END_TIME" HeaderText="會議結束時間" meta:resourcekey="BoundFieldResource4" />
            <asp:TemplateField HeaderText="參加人員"
                meta:resourcekey="TemplateFieldResource20">
                <ItemTemplate>
                    <asp:Label ID="lblUser1" runat="server" meta:resourcekey="lblUser1Resource2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="時段" meta:resourcekey="TemplateFieldResource21">
                <ItemTemplate>
                    <asp:Label ID="lblSection" runat="server" meta:resourcekey="lblSectionResource3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="人數" meta:resourcekey="TemplateFieldResource22">
                <ItemTemplate>
                    <asp:Label ID="lblNum" runat="server" meta:resourcekey="lblNumResource4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
    <Fast:Grid ID="Grid2" runat="server" AutoGenerateCheckBoxColumn="False"
        AutoGenerateColumns="False"
        Width="100%"
        AllowSorting="True"
        DataKeyOnClientWithCheckBox="False"
        PageSize="200"
        EnhancePager="True" DataKeyNames="USER_GUID"
        OnRowDataBound="Grid2_RowDataBound"
        Visible="False" DefaultSortDirection="Ascending"  EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="Grid2Resource2"  >
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="參加者" meta:resourcekey="TemplateFieldResource23">
                <ItemTemplate>
                    <asp:Label ID="lblUser2" runat="server" Text='<%#: Eval("USER_GUID") %>' meta:resourcekey="lblUser2Resource2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="意見" meta:resourcekey="TemplateFieldResource24">
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" Text='<%#: Eval("DESCRIPTION") %>' meta:resourcekey="lblDescriptionResource3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="USER_GUID" meta:resourcekey="TemplateFieldResource25">
                <ItemTemplate>
                    <asp:Label ID="lblUserGuid" runat="server" Text='<%#: Eval("USER_GUID") %>' meta:resourcekey="lblUserGuidResource2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SECTION" meta:resourcekey="TemplateFieldResource26">
                <ItemTemplate>
                    <asp:Label ID="lblSection" runat="server" meta:resourcekey="lblSectionResource4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
    <Fast:Grid ID="Grid3" runat="server" AutoGenerateCheckBoxColumn="False"
        AutoGenerateColumns="False"
        Width="100%"
        AllowSorting="True" DataKeyOnClientWithCheckBox="False"
        PageSize="100"
        EnhancePager="True" OnRowDataBound="Grid3_RowDataBound"
        DataKeyNames="USER_GUID"
        Visible="False" DefaultSortDirection="Ascending"  EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="Grid3Resource2"  >
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="不參加者"
                meta:resourcekey="TemplateFieldResource27">
                <ItemTemplate>
                    <asp:Label ID="lblUser3" runat="server" Text='<%#: Eval("USER_GUID") %>' meta:resourcekey="lblUser3Resource2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="意見" meta:resourcekey="TemplateFieldResource28">
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" Text='<%#: Eval("DESCRIPTION") %>' meta:resourcekey="lblDescriptionResource4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
    <asp:Label ID="lblInquiryGuid" runat="server" Visible="False" meta:resourcekey="lblInquiryGuidResource2"></asp:Label>
    <asp:Label ID="lblSectionNum" Text="0" runat="server" Visible="False" meta:resourcekey="lblSectionNumResource2"></asp:Label>
    <asp:Label ID="lblSectionNumB" Text="0" runat="server" Visible="False" meta:resourcekey="lblSectionNumBResource2"></asp:Label>
    <asp:Label ID="lblMsgUnit" runat="server" Text="人" Visible="False" meta:resourcekey="lblMsgUnitResource1"></asp:Label>
    <asp:Label ID="lblJoinTime" runat="server" Text="參加時段：" Visible="False" meta:resourcekey="lblJoinTimeResource1"></asp:Label>
</asp:Content>