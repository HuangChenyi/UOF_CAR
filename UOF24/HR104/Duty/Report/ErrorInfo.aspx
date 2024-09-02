<%@ Page Title="錯誤資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ErrorInfo.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.ErrorInfo" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }
            if (pd) {
                var requestErrorUsers = "#<%=Request.QueryString["ErrorUsers"]%>";
                if (requestErrorUsers !== '#') {
                    var errorUsers = $(requestErrorUsers, pd).val();

                    if (errorUsers !== '') {
                        $("#<%=hidErrorUser.ClientID %>").val(errorUsers);
                        if ($('#<%= hidPostBack.ClientID%>').val() === "First") {
                            $('#<%= btnLoadUser.ClientID%>').click();
                        }
                    }
                }
                var requestPassUsers = "#<%=Request.QueryString["PassUsers"]%>";
                if (requestPassUsers !== '#') {
                    var passUsers = $(requestPassUsers, pd).val();

                    if (passUsers !== '') {
                        $("#<%=hidPassUser.ClientID %>").val(passUsers);
                        if ($('#<%= hidPostBack.ClientID%>').val() === "First") {
                            $('#<%= btnLoadUser.ClientID%>').click();
                        }
                    }
                }
            }
        });
        
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="girdData" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                       DefaultSortDirection="Ascending" EmptyDataText="沒有資料" OnSorting="girdData_Sorting"
                       EnhancePager="True" KeepSelectedRows="False" PageSize="15"
                       Width="100%" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="girdDataResource1">
                <EnhancePagerSettings
                                      ShowHeaderPager="True"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
            </Ede:Grid>
            <asp:HiddenField ID="hidPostBack" runat="server" />
            <asp:HiddenField ID="hidPassUser" runat="server" />
            <asp:HiddenField ID="hidErrorUser" runat="server" />
            <asp:HiddenField ID="hidSort" runat="server" Value="時數" />

            <div style="display: none">
                <asp:Button ID="btnLoadUser" runat="server" onclick="btnLoadUser_Click" meta:resourcekey="btnLoadUserResource1" />    
            </div>
            <asp:Label ID="lblDisplayName" runat="server" Text="姓名" Style="display:none;" meta:resourcekey="lblDisplayNameResource1"></asp:Label>
            <asp:Label ID="lblTime" runat="server" Text="時數" Style="display:none;" meta:resourcekey="lblTimeResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
