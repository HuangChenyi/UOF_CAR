<%@ Page Title="已計入上限時數" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CountedUpperLimit.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields.CountedUpperLimit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
                $("#<%=hfUsers.ClientID %>").val($("#<%=Request.QueryString["Users"]%>", pd).val());
                if ($('#<%= hidPostBack.ClientID%>').val() === "First") {
                    $('#<%= btnLoad.ClientID%>').click();
                }
            }
        });
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="grdCountedUpperLimit" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AllowPaging="True"
                    AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" 
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" 
                PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%"
                OnPageIndexChanging="grdCountedUpperLimit_PageIndexChanging" OnRowDataBound="grdCountedUpperLimit_RowDataBound" meta:resourcekey="grdCountedUpperLimitResource1">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:BoundField HeaderText="加班人員" DataField="DISPLAY_NAME" meta:resourcekey="BoundFieldResource1"/>
                    <asp:TemplateField HeaderText="本日加班(平日上限)" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblWDayOverTime" runat="server" meta:resourcekey="lblWDayOverTimeResource1"></asp:Label>
                            <asp:Label ID="lblWDayLimit" runat="server" meta:resourcekey="lblWDayLimitResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"/>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="本日加班(假日上限)" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblHDayOverTime" runat="server" meta:resourcekey="lblHDayOverTimeResource1"></asp:Label>
                            <asp:Label ID="lblHDayLimit" runat="server" meta:resourcekey="lblHDayLimitResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"/>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已計入時數(每月上限)" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblMonthOverTime" runat="server" meta:resourcekey="lblMonthOverTimeResource1"></asp:Label>
                            <asp:Label ID="lblMonthLimit" runat="server" meta:resourcekey="lblMonthLimitResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"/>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="已計入時數(每季上限)" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblSeasonOverTime" runat="server" meta:resourcekey="lblSeasonOverTimeResource1"></asp:Label>
                            <asp:Label ID="lblSeasonLimit" runat="server" meta:resourcekey="lblSeasonLimitResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"/>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="說明" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblIsOver" runat="server" meta:resourcekey="lblIsOverResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
                </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hidPostBack" runat="server" />
    <asp:HiddenField ID="hfUsers" runat="server" />
    <div style="display: none">
        <asp:Button ID="btnLoad" runat="server" onclick="btnLoad_Click" meta:resourcekey="btnLoadResource1" />    
    </div>
    <asp:Label ID="lblHours" runat="server" Text="{0}小時" Visible="False" meta:resourcekey="lblHoursResource1"></asp:Label>
    <asp:Label ID="lblWDay" runat="server" Text="平日" Visible="False" meta:resourcekey="lblWDayResource1"></asp:Label>
    <asp:Label ID="lblHDay" runat="server" Text="假日" Visible="False" meta:resourcekey="lblHDayResource1"></asp:Label>
    <asp:Label ID="lblMonth" runat="server" Text="每月" Visible="False" meta:resourcekey="lblMonthResource1"></asp:Label>
    <asp:Label ID="lblSeason" runat="server" Text="每季" Visible="False" meta:resourcekey="lblSeasonResource1"></asp:Label>
    <asp:Label ID="lblOverLimit" runat="server" Text="已超出{0}上限" Visible="False" meta:resourcekey="lblOverLimitResource1"></asp:Label>
</asp:Content>
