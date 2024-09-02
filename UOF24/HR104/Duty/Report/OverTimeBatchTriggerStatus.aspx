<%@ Page Title="排程狀態" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="OverTimeBatchTriggerStatus.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.OverTimeBatchTriggerStatus" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <Ede:Grid ID="statusGrid" runat="server" AutoGenerateCheckBoxColumn="False" DataKeyOnClientWithCheckBox="False"
                    DefaultSortDirection="Descending" EmptyDataText="沒有資料"   OnSorting="statusGrid_Sorting"
                    EnhancePager="True" KeepSelectedRows="False" PageSize="15" DefaultSortColumnName="CREATE_DATE"
                    Width="100%" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" AutoGenerateColumns="False"  OnRowDataBound="statusGrid_RowDataBound" meta:resourcekey="statusGridResource1">
            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
            <Columns>
                <asp:TemplateField HeaderText="排程類型" SortExpression="FORM_TYPE" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <asp:Label ID="lblFormType" runat="server" meta:resourcekey="lblFormTypeResource1"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="狀態" SortExpression="STATE" meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="開始時間" SortExpression="EXECUTE_START_TIME" meta:resourcekey="TemplateFieldResource3">
                    <ItemTemplate>
                        <asp:Label ID="lblStartTime" runat="server" meta:resourcekey="lblStartTimeResource1"></asp:Label>
                    </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="false" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="結束時間" SortExpression="EXECUTE_END_TIME" meta:resourcekey="TemplateFieldResource4">
                    <ItemTemplate>
                        <asp:Label ID="lblEndTime" runat="server" meta:resourcekey="lblEndTimeResource1"></asp:Label>
                    </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="false" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="結果"    meta:resourcekey="TemplateFieldResource5">
                    <ItemTemplate>
                        <asp:Label ID="lblResult" runat="server" Text='<%# Eval("RESULT") %>' meta:resourcekey="lblResultResource1"></asp:Label>
                    </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                </asp:TemplateField>
            </Columns>
        </Ede:Grid>

    <asp:Label ID="lbltaskStandby" runat="server" Text="等待中" Visible="False" meta:resourcekey="lbltaskStandbyResource1" ></asp:Label>
    <asp:Label ID="lbltaskExecuting" runat="server" Text="執行中" Visible="False" meta:resourcekey="lbltaskExecutingResource1" ></asp:Label>
    <asp:Label ID="lbltaskSuccess" runat="server" Text="成功" Visible="False" meta:resourcekey="lbltaskSuccessResource1" ></asp:Label>
    <asp:Label ID="lbltaskFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lbltaskFailResource1" ></asp:Label>

        <asp:Label ID="lblformTypeStart" runat="server" Text="起單" Visible="False" meta:resourcekey="lblformTypeStartResource1" ></asp:Label>
        <asp:Label ID="lblformTypeSign" runat="server" Text="簽核中" Visible="False" meta:resourcekey="lblformTypeSignResource1" ></asp:Label>
        <asp:Label ID="lblfromTypeEnd" runat="server" Text="結案" Visible="False" meta:resourcekey="lblfromTypeEndResource1" ></asp:Label>

</asp:Content>
