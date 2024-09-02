<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_EquipmentDetail.ascx.cs" Inherits="Ede.Uof.Web.EIP.Plant.UC_EquipmentDetail" %>
<script type="text/javascript">
    function rdbarBorrow_ButtonClicking_<%=ClientID %>(sender, args) {
        var key = args.get_item().get_value();
        if (key === "create") {
            $uof.dialog.open2("~/EIP/Plant/SelectEquipment.aspx", args.get_item(), "<%=lblDialogTitle.Text%>", 500, 700, OpenDialogResult,
                {
                    "HiddenClientID": "<%=hfPlantGuid.ClientID%>", "IsNodeEnable": "true", "StartTime": "<%=hfStartTime.Value%>",
                    "EndTime": "<%=hfEndTime.Value%>",
                    "BorrowGuid": "<%=hfBorrowGuid.Value%>"
                });
        }
    }
    function OpenDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null) {
            return false;
        }
        else {
            return true;
        }
    }
</script>
<telerik:RadToolBar ID="rdbarBorrow" runat="server" CausesValidation="False" Width="100%" OnClientButtonClicking="rdbarBorrow_ButtonClicking" OnButtonClick="rdbarBorrow_ButtonClick" meta:resourcekey="rdbarBorrowResource1" SingleClick="None">
    <Items>
        <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m31.gif" 
                                  ImageUrl="~/EIP/Personal/icon_images/icon_m31.gif" Value="create" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                                  Text="新增借用" CausesValidation="false" meta:resourcekey="RadToolBarButtonResource1">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" >
        </telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>  
<asp:UpdatePanel ID="panel1" runat="server">
    <ContentTemplate>           
        <asp:Table ID="detailDT" runat="server" Width="60%" CellPadding="0" CellSpacing="0" BorderWidth="0px" meta:resourcekey="detailDTResource1"></asp:Table>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblClassName" runat="server" Text="類別" Visible="False" meta:resourcekey="lblClassNameResource1"></asp:Label>
<asp:Label ID="lblNo" runat="server" Text="編號" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
<asp:Label ID="lblName" runat="server" Text="設備" Visible="False" meta:resourcekey="lblNameResource1"></asp:Label>
<asp:Label ID="lblStatus" runat="server" Text="借用狀態" Visible="False" meta:resourcekey="lblStatusResource1"></asp:Label>
<asp:Label ID="lblUser" runat="server" Text="借用人員" Visible="False" meta:resourcekey="lblUserResource1"></asp:Label>
<asp:Label ID="lblOperate" runat="server" Text="操作" Visible="False" meta:resourcekey="lblOperateResource1"></asp:Label>
<asp:Label ID="lblDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
<asp:Label ID="lblDialogTitle" runat="server" Text="借用設備" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
<asp:HiddenField ID="hfBorrowGuid" runat="server" />
<asp:HiddenField ID="hfStartTime" runat="server" />
<asp:HiddenField ID="hfEndTime" runat="server" />
<asp:HiddenField ID="hfNotAllowNO" Value="true" runat="server" />
<asp:HiddenField ID="hfPlantGuid" runat="server" />
<asp:HiddenField ID="hfCurrentUser" runat="server" />

<asp:Label ID="lblStateLoaned" runat="server" Text="已借出" Visible="False" meta:resourcekey="lblStateLoanedResource1"></asp:Label>
<asp:Label ID="lblStateBooking" runat="server" Text="預約" Visible="False" meta:resourcekey="lblStateBookingResource1"></asp:Label>
<asp:Label ID="lblStateReturned" runat="server" Text="歸還" Visible="False" meta:resourcekey="lblStateReturnedResource1"></asp:Label>
<asp:Label ID="lblStateRejected" runat="server" Text="被拒絕" Visible="False" meta:resourcekey="lblStateRejectedResource1"></asp:Label>
<asp:Label ID="lblStateSigning" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblStateSigningResource1"></asp:Label>
<asp:Label ID="lblOverTime" runat="server" Text="超過可預約時間" Visible="False" meta:resourcekey="lblOverTimeResource1"></asp:Label>
<asp:Label ID="lblAuthErrMsg" runat="server" Text="沒有借用權限" Visible="false"  meta:resourcekey="lblAuthErrMsgResource1"></asp:Label>         
<asp:Label ID="lblNoBorrow" runat="server" Text="不開放借用" Visible="False" meta:resourcekey="lblNoBorrowResource1"></asp:Label>

