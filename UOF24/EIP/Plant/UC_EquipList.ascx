<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_EquipList.ascx.cs" Inherits="Ede.Uof.Web.EIP.Plant.UC_EquipList" %>

<script type="text/javascript">
    function UC_EquipList_checkKeyPress(sender, args) {
        var keyCharacter = args.get_keyCharacter();

        if (keyCharacter == sender.get_numberFormat().DecimalSeparator ||
            keyCharacter == sender.get_numberFormat().NegativeSign) {

            args.set_cancel(true);
        }
    }
</script>
<asp:DataList ID="DLEquipment" runat="server" OnItemDataBound="DLEquipment_ItemDataBound">
    <ItemTemplate>
        <table>
            <tr>
                <td style="width:100px;white-space:nowrap">
                    <asp:CheckBox ID="cbEquipment" runat="server" Text='<%#: Eval("EQUIP_NAME") %>' />
                </td>
                <td style="text-align:left;white-space:nowrap">
                    <asp:Label ID="lblCount" runat="server" Text="數量：" meta:resourcekey="lblCountResource1"></asp:Label>
                    <telerik:RadNumericTextBox ID="RadQuantity" runat="server" MinValue="1" Width="100px" NumberFormat-DecimalDigits="0">
                        <ClientEvents OnKeyPress="UC_EquipList_checkKeyPress" />
                    </telerik:RadNumericTextBox>
                </td>
                <td>
                    <asp:HiddenField ID="hfEquipID" runat="server" Value='<%#: Eval("EQUIP_GUID") %>' />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>

<asp:DataList ID="DLEquipmentView" runat="server" OnItemDataBound="DLEquipmentView_ItemDataBound">
    <ItemTemplate>
        <table>
            <tr>
                <td style="width:100px;white-space:nowrap">
                    <asp:Label ID="lblEquipName" runat="server" Text='<%#: Eval("EQUIP_NAME") %>'></asp:Label>
                </td>
                <td style="text-align:left;white-space:nowrap">
                    <asp:Label ID="lblCount" runat="server" Text="數量：" meta:resourcekey="lblCountResource1"></asp:Label>                    
                </td>
                <td>
                    <asp:HiddenField ID="hfEquipID" runat="server" Value='<%#: Eval("EQUIP_GUID") %>' />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>