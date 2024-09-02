<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="PlantExceptionDetail.aspx.cs" Inherits="Ede.Uof.Web.EIP.Plant.PlantExceptionDetail" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden {
            display: none;
        }

        .cssCenter {
            text-align: center;
        }
    </style>
    <script type="text/javascript">

        function OnExceptionSetClicking(sender, args) {
            if (args.get_item().get_value() == "Create") {
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Plant/PlantExceptionDialog.aspx", args.get_item(), '<%=lblCreate.Text%>', 600, 400, openDialogResult,
                    { "TYPE": "Add", "plantGuid": '<%=hfPlantId.Value%>' });
            }
            else if (args.get_item().get_value() == "Delete") {
                var int = 0;
                var checkbox = $('#' + '<%=grdExceptionList.ClientID%>' + ' input[type=checkbox][purpose=autocheck]')
                    .each(function () {
                        if ($(this).prop("checked")) { int++; }
                    });
                if (int == 0) {
                    alert("<%=lblPleaseSelectException.Text%>");
                    args.set_cancel(true);
                }
                else {
                    if (confirm('<%=lblDelete.Text%>')) {
                        args.set_cancel(false);
                    }
                    else {
                        args.set_cancel(true);
                    }
                }
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>

    <table cellspacing="0" class="PopTable">
        <telerik:RadToolBar ID="rtbExceptionSet" runat="server" Width="100%" OnButtonClick="rtbExceptionSet_ButtonClick" OnClientButtonClicking="OnExceptionSetClicking" meta:resourcekey="rtbExceptionSetResource1" SingleClick="None">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="Create" Text="新增" meta:resourcekey="RadToolBarButtonResource1"
                    ImageUrl="~/Common/Images/Icon/icon_m71.png"
                    HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                    DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                    CheckedImageUrl="~/Common/Images/Icon/icon_m71.png">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="Delete" Text="刪除" meta:resourcekey="RadToolBarButtonResource2"
                    ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                    HoveredImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                    DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                    CheckedImageUrl="~/Common/Images/Icon/icon_m03_g.gif">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <tr>
            <td style="text-align: left; font-weight: bold;">
                <asp:Label ID="lblPlantName" runat="server" meta:resourcekey="lblPlantNameResource1"></asp:Label>
            </td>
        </tr>
    </table>

    <Ede:Grid ID="grdExceptionList" runat="server" DataKeyNames="PLANT_EXCEPTION_GUID" Width="100%"
        EmptyDataText="沒有資料"
        AutoGenerateColumns="False"
        AutoGenerateCheckBoxColumn="True"
        OnSorting="grdExceptionList_Sorting"
        OnRowDataBound="grdgrdExceptionList_RowDataBound"
        CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" KeepSelectedRows="False"
        SelectedRowColor="" UnSelectedRowColor="" AllowSorting="True" DefaultSortDirection="Ascending" EnhancePager="True" meta:resourcekey="grdExceptionListResource1" PageSize="15">
        <EnhancePagerSettings ShowHeaderPager="True" />
        <HeaderStyle Wrap="False" />

        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:BoundField DataField="PLANT_EXCEPTION_GUID" HeaderText="" meta:resourcekey="BoundFieldResource1">
                <HeaderStyle CssClass="cssHidden" />
                <ItemStyle CssClass="cssHidden" />
            </asp:BoundField>

            <asp:TemplateField HeaderText="不可借用日期" SortExpression="START_DATE" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="lblDateRange" runat="server" meta:resourcekey="lblDateRangeResource1"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="50%" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="原因" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" meta:resourcekey="lblDescriptionResource1"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="False" Width="50%" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>



        </Columns>
    </Ede:Grid>

    <asp:Label ID="lblCreate" runat="server" Text="新增例外設定" Visible="False" meta:resourcekey="lblCreateResource1"></asp:Label>
    <asp:HiddenField ID="hfPlantId" runat="server" />
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblPleaseSelectException" runat="server" Text="請選擇例外設定" Visible="False" meta:resourcekey="lblPleaseSelectExceptionResource1"></asp:Label>
</asp:Content>
