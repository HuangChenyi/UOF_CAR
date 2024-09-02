<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_EquipmentEdit.ascx.cs" Inherits="Ede.Uof.Web.EIP.Plant.UC_EquipmentEdit" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<script type="text/javascript">
    function ToolBar_Click(sender, args) {
        var key = args.get_item().get_value();
        if (key == "create"){
            $uof.dialog.open2("~/EIP/Plant/SelectEquipment.aspx", args.get_item(), "<%=lblDialogTitle.Text%>", 500, 700, OpenDialogResult,
                { "HiddenClientID" : '<%=hfReturnValue.ClientID%>'});
        }
        else if (key == "delete") {
            if (!confirm('<%=lblDelConfirm.Text%>')) {
                args.set_cancel(true);            
            }          
        }
    }

    function OpenDialogResult(returnValue) {
        if (typeof (returnValue) == "undefined" || returnValue == null) {
            return false;
        }
        else {
            return true;
        }
    }
 </script>
<table style="width:100%">
    <tr>
        <td>
            <telerik:RadToolBar ID="RadToolBar1" runat="server"  CausesValidation="False"  Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="ToolBar_Click" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                        ImageUrl="~/EIP/Personal/icon_images/icon_m31.gif" Value="create" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                        Text="新增借用" CausesValidation="false" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>                                    
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" CausesValidation="false"
                        ImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" Value="delete" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m03.gif"
                        Text="刪除借用" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>         
        </td>
    </tr>
    <tr>
        <td>
            <asp:UpdatePanel ID="updateGrid"  runat="server">
                <ContentTemplate>
                    <Fast:Grid ID="grdEquipmentList" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                        DataKeyNames="PLANT_GUID" Width="100%" AllowSorting="True" OnRowDataBound="grdEquipmentList_RowDataBound"
                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnhancePager="True" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="grdEquipmentListResource1" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:BoundField DataField="CLASS_NAME" HeaderText="類別" meta:resourcekey="BoundFieldResource1" ></asp:BoundField>
                            <asp:BoundField DataField="SERIAL_NO" HeaderText="編號" meta:resourcekey="BoundFieldResource2"></asp:BoundField>
                            <asp:BoundField DataField="PLANT_NAME" HeaderText="名稱" meta:resourcekey="BoundFieldResource3"></asp:BoundField>    
                            <asp:TemplateField HeaderText="是否為會議室" Visible="False" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>                                  
                                    <asp:Label ID="lblIsMeetingRoom" runat="server" Text='<%#: Eval("IS_MEETINGROOM") %>' meta:resourcekey="lblIsMeetingRoomResource1"></asp:Label>      
                                    <asp:Label ID="lblPlantName" runat="server" Text='<%#: Eval("PLANT_NAME") %>' meta:resourcekey="lblPlantNameResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField >
                        </Columns>
                        <HeaderStyle Wrap="False" />
                    </Fast:Grid>
                     <asp:HiddenField ID="hfReturnValue" runat="server" />
                     <asp:HiddenField ID="hfRepeatType" runat="server" /> 
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>
<asp:Label ID="lblDialogTitle" Text="借用設備" runat="server" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
<asp:Label ID="lblDelConfirm" Text="確定要刪除該筆借用?" runat="server" Visible="False" meta:resourcekey="lblDelConfirmResource1"></asp:Label>
