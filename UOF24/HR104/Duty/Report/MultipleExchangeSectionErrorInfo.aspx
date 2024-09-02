<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="MultipleExchangeSectionErrorInfo.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.MultipleExchangeSectionErrorInfo" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .cssHidden{
            display: none;
        }

        .cssPreline {
            white-space: pre-line;
        }
    </style>

    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var curwindow = $uof.dialog.getOpener();

            var parentDoc;
            if (curwindow) {
                parentDoc = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                parentDoc = dialogArguments.document;
            }

            var errorInfo = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["errorInfo"], true)%>');
            var hfVal = $("#" + errorInfo, parentDoc).val();
            if (parentDoc) {
                $("#<%=hfDataJson.ClientID%>").val(hfVal);
            }
            
            var isMobileUI = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["isMobileUI"], true)%>');
            $("#<%=hfIsMobileUI.ClientID%>").val(isMobileUI);

            if ($("#<%=hfDoClick.ClientID%>").val() === 'true') {
                $("#<%=btnClickBindGrid.ClientID%>").click();
            }
        });
    </script>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <asp:Button ID="btnClickBindGrid" OnClick="btnClickBindGrid_Click" runat="server" style="display: none;" meta:resourcekey="btnClickBindGridResource1"/>

            <Ede:Grid ID="grdErrorInfo" PageSize="15" EmptyDataText="沒有資料" Width="100%" EnhancePager="True" DataKeyNames="NAME" runat="server"
                DefaultSortDirection="Ascending" DefaultSortColumnName="GROUP_NAME, NAME"
                AllowSorting="True" OnSorting="grdErrorInfo_Sorting"
                AllowPaging="True" OnPageIndexChanging="grdErrorInfo_PageIndexChanging"
                OnBeforeExport="grdErrorInfo_BeforeExport"
                KeepSelectedRows="False" AutoGenerateCheckBoxColumn="False" DataKeyOnClientWithCheckBox="False" CustomDropDownListPage="False"
                SelectedRowColor="" UnSelectedRowColor="" AutoGenerateColumns="False" meta:resourcekey="grdErrorInfoResource1">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="True"></ExportExcelSettings>
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="FULL_NAME" SortExpression="FULL_NAME" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" Width="10%" />
                    </asp:BoundField>

                    <asp:BoundField DataField="GROUP_NAME" HeaderText="人員部門Hidden" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle CssClass="cssHidden" />
                        <ItemStyle CssClass="cssHidden" />
                    </asp:BoundField>

                    <asp:BoundField DataField="NAME" HeaderText="人員姓名Hidden" meta:resourcekey="BoundFieldResource3">
                        <HeaderStyle CssClass="cssHidden" />
                        <ItemStyle CssClass="cssHidden" />
                    </asp:BoundField>

                    <asp:BoundField HeaderText="錯誤訊息" DataField="ERROR_MESSAGE" meta:resourcekey="BoundFieldResource4">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="90%" CssClass="cssPreline"/>
                    </asp:BoundField>
                </Columns>
            </Ede:Grid>

            <asp:HiddenField ID="hfDataJson" runat="server" />
            <asp:HiddenField ID="hfIsMobileUI" runat="server" />
            <asp:HiddenField ID="hfSortExp" runat="server" />
            <asp:HiddenField ID="hfDoClick" runat="server" Value="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
