<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Duty_Configuration_Setting_UC_Setting" CodeBehind="UC_Setting.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script id="settingJS" type="text/javascript">
    function OnValueChanging(sender, args) {
        if (args.get_newValue() === "" || isNaN(args.get_newValue())) {
            args.set_newValue(args.get_oldValue());
        }
    }
    function NewKeyPress(sender, args) {

        var keyCharacter = args.get_keyCharacter();

        if (keyCharacter == sender.get_numberFormat().DecimalSeparator ||
            keyCharacter == sender.get_numberFormat().NegativeSign) {

            args.set_cancel(true);
        }
    }
    function Setting_chbParentSetting_Click() {
        var toolbarbutton = $find("<%=settingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentSetting"));
        if (settingCheckBox.checked) {
            if (!confirm('<%=lbConfirmCheckBox.Text%>'))
                settingCheckBox.checked = false;
            return false;
        }
    }
</script>
<style type="text/css">
    .RightAligned {
        text-align: right;
    }
</style>
<telerik:RadToolBar ID="settingToolBar" runat="server" Width="100%" OnButtonClick="settingToolBar_OnButtonClick" meta:resourcekey="settingToolBarResource1" SingleClick="None">
    <Items>
        <telerik:RadToolBarButton runat="server" Value="useParent" meta:resourcekey="RadToolBarButtonResource1">
            <ItemTemplate>
                <asp:CheckBox ID="chbParentSetting" runat="server" Text="使用上一部門設定" AutoPostBack="True"
                    OnCheckedChanged="chbParentSetting_CheckedChanged" onClick="Setting_chbParentSetting_Click()" meta:resourcekey="chbParentSettingResource1" />
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="儲存" Value="Save" ValidationGroup="vgCheckInputDays"
            CheckedImageUrl="~/Common/Images/Icon/icon_m01.png"
            DisabledImageUrl="~/Common/Images/Icon/icon_m01.png"
            HoveredImageUrl="~/Common/Images/Icon/icon_m01.png"
            ImageUrl="~/Common/Images/Icon/icon_m01.png"
            meta:resourcekey="settingToolBarSaveResource1">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>
<table width="100%" class="PopTable">
    <tr>
        <td>
            <span style="color: #ff0000">*</span><asp:Label ID="Label8" runat="server"
                Text="每日允許遲到分鐘數" meta:resourcekey="Label8Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rdLateMin" runat="server" CssClass="RightAligned" Value="0" MaxValue="999" MinValue="0" Width="100px" MaxLength="3" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdLateMinResource1">
                            <NumberFormat GroupSeparator="" DecimalDigits="0"></NumberFormat>
                            <ClientEvents OnValueChanging="OnValueChanging" OnKeyPress="NewKeyPress" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="分鐘"
                            meta:resourcekey="Label16Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <span style="color: #ff0000">*</span><asp:Label ID="Label4" runat="server"
                Text="每期可遲到次數" meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rdLateTimes" runat="server" CssClass="RightAligned" Value="0" MaxValue="999" MinValue="0" Width="100px" MaxLength="3" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdLateTimesResource1">
                            <NumberFormat GroupSeparator="" DecimalDigits="0"></NumberFormat>
                            <ClientEvents OnValueChanging="OnValueChanging" OnKeyPress="NewKeyPress" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="次"
                            meta:resourcekey="Label6Resource1"></asp:Label>
                        <asp:Label ID="Label7" runat="server"
                            Text="(若遲到次數在允許次數之內,該次遲到列入遲到記錄,但不需要請假.如果超出次數,該次遲到不列入遲到記錄,且以曠職計)"
                            CssClass="SizeMemo" meta:resourcekey="Label7Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <span style="color: #ff0000">*</span><asp:Label ID="Label10" runat="server"
                Text="工時" meta:resourcekey="Label10Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label" runat="server" Text="全天:"
                            meta:resourcekey="LabelResource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdAllDayHours" runat="server" CssClass="RightAligned" MinValue="0.5" Width="100px" MaxValue="24" MaxLength="4" Value="8" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdAllDayHoursResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="2"></NumberFormat>
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="小時"
                            meta:resourcekey="Label13Resource1"></asp:Label>
                    </td>
                    <td width="30"></td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="半天:"
                            meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rdHalfDayHours" runat="server" CssClass="RightAligned" MinValue="0.5" Width="100px" MaxValue="24" Value="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdHalfDayHoursResource1">
                            <ClientEvents OnValueChanging="OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text="小時" meta:resourcekey="Label14Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<asp:Label ID="lbConfirmCheckBox" runat="server"
    Text="確定要使用上一部門設定?     \r\n注意:確認後會刪除此部門所有的自訂資料!!" Visible="False"
    meta:resourcekey="lbConfirmCheckBoxResource1"></asp:Label>
<asp:Label runat="server" ID="lblTimeOffExampleTitle" Text="補休假可用期限範例說明" Visible="False" meta:resourcekey="lblTimeOffExampleTitleResource1"></asp:Label>
<asp:HiddenField ID="hfUserGuid" runat="server" />