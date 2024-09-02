<%@ Page Title="選擇已核准的設備" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ChoiceApprovePlant.aspx.cs" Inherits="Ede.Uof.Web.EIP.Plant.ChoiceExaminePlant" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        Sys.Application.add_init(function () {
            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }

            if (pd) {
                $("#<%=hfborrowplant.ClientID%>").val($("#<%=Request.QueryString["borrowPlants"]%>", pd).val());
                doPostBack();
            }
            
        });

        function doPostBack() {
            $("#<%=Button1.ClientID%>").click();
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width:100%">
                <tr>
                    <td>
                        <asp:Label ID="lblShowMeetingTime" runat="server" meta:resourcekey="lblShowMeetingTimeResource1"></asp:Label>
                        <asp:Button ID="Button1" runat="server" Text="Button" Style="display: none" OnClick="Button1_Click" meta:resourcekey="Button1Resource1"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Ede:Grid ID="grdApprovePlant" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                            DataKeyNames="DETAIL_GUID" Width="100%" AllowSorting="True" OnRowDataBound="grdApprovePlant_RowDataBound"
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="START_TIME" EnhancePager="True" AllowPaging="True" OnPageIndexChanging="grdApprovePlant_PageIndexChanging"
                            OnSorting="grdApprovePlant_Sorting" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" PageSize="15" meta:resourcekey="grdApprovePlantResource1">
                            <EnhancePagerSettings
                                ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:BoundField DataField="CLASS_NAME" HeaderText="類別" SortExpression="CLASS_NAME" meta:resourcekey="BoundFieldResource1"></asp:BoundField>
                                <asp:BoundField DataField="SERIAL_NO" HeaderText="編號" SortExpression="SERIAL_NO" meta:resourcekey="BoundFieldResource2"></asp:BoundField>
                                <asp:BoundField DataField="PLANT_NAME" HeaderText="名稱" SortExpression="PLANT_NAME" meta:resourcekey="BoundFieldResource3"></asp:BoundField>
                                <asp:TemplateField HeaderText="狀態" SortExpression="BORROW_STATE" meta:resourcekey="BoundFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="START_TIME" HeaderText="開始時間" Visible="False" meta:resourcekey="BoundFieldResource5"/>
                                <asp:TemplateField HeaderText="DETAIL_GUID" Visible="False" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDetailGuid" runat="server" Text='<%# Eval("DETAIL_GUID") %>' meta:resourcekey="lblDetailGuidResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BORROW_GUID" Visible="False" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBorrowGuid" runat="server" Text='<%# Eval("BORROW_GUID") %>' meta:resourcekey="lblBorrowGuidResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PLANT_GUID" Visible="False" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPlantGuid" runat="server" Text='<%# Eval("PLANT_GUID") %>' meta:resourcekey="lblPlantGuidResource1"></asp:Label>
                                        <asp:Label ID="lblIsMeetingRoom" runat="server" Text='<%# Eval("IS_MEETINGROOM") %>' meta:resourcekey="lblIsMeetingRoomResource1"></asp:Label>
                                        <asp:Label ID="lblPlantName" runat="server" Text='<%# Eval("PLANT_NAME") %>' meta:resourcekey="lblPlantNameResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="借用時間" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBorrowTime" runat="server" meta:resourcekey="lblBorrowTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle Wrap="False" />
                        </Ede:Grid>
                    </td>
                </tr>
            </table>
            
            <asp:HiddenField ID="hfborrowplant" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblSteteBooking" runat="server" Text="預約" Visible="False" meta:resourcekey="lblSteteBookingResource1"></asp:Label>
    <asp:Label ID="lblSteteLoaned" runat="server" Text="已借出" Visible="False" meta:resourcekey="lblSteteLoanedResource1"></asp:Label>
    <asp:Label ID="lblMeetingTime" runat="server" Text="會議時間：" Visible="False" meta:resourcekey="lblMeetingTimeResource1"></asp:Label>
</asp:Content>
