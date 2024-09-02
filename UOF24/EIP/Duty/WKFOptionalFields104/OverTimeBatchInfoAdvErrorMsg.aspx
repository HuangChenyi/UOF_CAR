<%@ Page Title="錯誤訊息" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="OverTimeBatchInfoAdvErrorMsg.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.OverTimeBatchInfoAdvErrorMsg" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            if ($('#<%= hidPostBack.ClientID%>').val() != 'True') return;
            $('#<%=hidPostBack.ClientID%>').val('False');

            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }
            if (pd) {
                var PriorCheckResultValue = ($("#<%=Request.QueryString["hfPriorCheckResult"]%>", pd).val());
                $('#<%= hfPriorCheckResult.ClientID%>').val(PriorCheckResultValue);
                $('#<%= btnPostBack.ClientID%>').click();
            }
        });
    </script>

    <asp:UpdatePanel runat="server" ID="updatePanelErrorInfo">
        <ContentTemplate>
            <Ede:Grid ID="grdErrorInfo" runat="server" Width="100%" EnableTheming="True"
                CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" AutoGenerateColumns="False"
                AutoGenerateCheckBoxColumn="False" AllowPaging="True" OnBeforeExport="grdErrorInfo_BeforeExport" OnSorting="grdErrorInfo_Sorting" DefaultSortColumnName="sortuser" DefaultSortDirection="Ascending" OnPageIndexChanging="grdErrorInfo_PageIndexChanging"
                PageSize="15" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdErrorInfoResource1">
                <HeaderStyle Wrap="False" />
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:BoundField DataField="user" HeaderText="人員" meta:resourcekey="BFUserResource1">
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="time" HeaderText="加班時段" meta:resourcekey="BFTimeResource1">
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="msg" HeaderText="錯誤訊息" meta:resourcekey="BFMsgResource1" />
                </Columns>
            </Ede:Grid>

            <div style="display: none;">
                <asp:HiddenField ID="hfPriorCheckResult" runat="server" />
                <asp:HiddenField ID="hidPostBack" runat="server" Value="True" />
                <asp:Button ID="btnPostBack" runat="server" onclick="btnPostBack_Click" meta:resourcekey="btnPostBackResource1" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
