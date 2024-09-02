<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_OverTimeCarrySetting.ascx.cs" Inherits="EIP_Duty_Configuration_OverTime_UC_OverTimeCarrySetting" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script id="carrySettingJS" type="text/javascript">
    function Setting_chbParentCarrySetting_Click() {
        var toolbarbutton = $find("<%=carrySettingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentCarrySetting"));
        if (settingCheckBox.checked) {
            if (!confirm('<%=lbConfirmCheckBox.Text%>'))
                settingCheckBox.checked = false;
            return false;
        }
    }

    function CopyWorkDayLevel1UpHoursToDown(e, args) {
        $find("<%=rncWorkDayLevel2Down.ClientID%>").set_value(args.get_newValue());
        $find("<%=rncWorkDayLevel1Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyWorkDayLevel2UpHoursToDown(e, args) {
        $find('<%=rncWorkDayLevel3Down.ClientID %>').set_value(args.get_newValue());
        $find("<%=rncWorkDayLevel2Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyWorkDayLevel3UpHoursToDown(e, args) {
        $find("<%=rncWorkDayLevel3Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyDayoffLevel1UpHoursToDown(e, args) {
        $find('<%=rncDayoffLevel2Down.ClientID %>').set_value(args.get_newValue());
        $find("<%=rncDayoffLevel1Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyDayoffLevel2UpHoursToDown(e, args) {
        $find('<%=rncDayoffLevel3Down.ClientID %>').set_value(args.get_newValue());
        $find("<%=rncDayoffLevel2Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyDayoffLevel3UpHoursToDown(e, args) {
        $find("<%=rncDayoffLevel3Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyRoutineLevel1UpHoursToDown(e, args) {
        $find('<%=rncRoutineLevel2Down.ClientID %>').set_value(args.get_newValue());
        $find("<%=rncRoutineLevel1Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyRoutineLevel2UpHoursToDown(e, args) {
        $find('<%=rncRoutineLevel3Down.ClientID %>').set_value(args.get_newValue());
        $find("<%=rncRoutineLevel2Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyRoutineLevel3UpHoursToDown(e, args) {
        $find("<%=rncRoutineLevel3Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyHolidayLevel1UpHoursToDown(e, args) {
        $find('<%=rncHolidayLevel2Down.ClientID %>').set_value(args.get_newValue());
        $find("<%=rncHolidayLevel1Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyHolidayLevel2UpHoursToDown(e, args) {
        $find('<%=rncHolidayLevel3Down.ClientID %>').set_value(args.get_newValue());
        $find("<%=rncHolidayLevel2Set.ClientID%>").set_value(args.get_newValue());
    }

    function CopyHolidayLevel3UpHoursToDown(e, args) {
        $find("<%=rncHolidayLevel3Set.ClientID%>").set_value(args.get_newValue());
    }

    function CheckWorkDaySetting(e, args) {
        var level1Up = $find("<%=rncWorkDayLevel1Up.ClientID%>").get_value();
        var level1Set = $find("<%=rncWorkDayLevel1Set.ClientID%>").get_value();
        var level2Up = $find("<%=rncWorkDayLevel2Up.ClientID%>").get_value();
        var level2Set = $find("<%=rncWorkDayLevel2Set.ClientID%>").get_value();
        var level3Up = $find("<%=rncWorkDayLevel3Up.ClientID%>").get_value();
        var level3Set = $find("<%=rncWorkDayLevel3Set.ClientID%>").get_value();

        var level1Down = $find('<%=rncWorkDayLevel1Down.ClientID %>').get_value();
        var level2Down = $find("<%=rncWorkDayLevel2Down.ClientID%>").get_value();
        var level3Down = $find('<%=rncWorkDayLevel3Down.ClientID %>').get_value();

        //判斷訖跟進位後的值都要填
        if ((level1Up === '' && level1Set != '') ||
            (level1Up != '' && level1Set === '') ||
            (level2Up === '' && level2Set != '') ||
            (level2Up != '' && level2Set === '') ||
            (level3Up === '' && level3Set != '') ||
            (level3Up != '' && level3Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷第一階或第二階沒填，就不能填第三階。
        if ((level3Up != '' || level3Set != '') && (level1Up === '' || level1Set === '' || level2Up === '' || level2Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷第一階沒填，就不能填第二階。
        if ((level2Up != '' || level2Set != '') && (level1Up === '' || level1Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷設定值訖不能大於起
        if ((level1Up != '' && level1Up <= level1Down) ||
            (level2Up != '' && level2Up <= level2Down) ||
            (level3Up != '' && level3Up <= level3Down)) {
            args.IsValid = false;
            return;
        }
    }

    function CheckDayoffSetting(e, args) {
        var level1Up = $find("<%=rncDayoffLevel1Up.ClientID%>").get_value();
        var level1Set = $find("<%=rncDayoffLevel1Set.ClientID%>").get_value();
        var level2Up = $find("<%=rncDayoffLevel2Up.ClientID%>").get_value();
        var level2Set = $find("<%=rncDayoffLevel2Set.ClientID%>").get_value();
        var level3Up = $find("<%=rncDayoffLevel3Up.ClientID%>").get_value();
        var level3Set = $find("<%=rncDayoffLevel3Set.ClientID%>").get_value();

        var level1Down = $find('<%=rncDayoffLevel1Down.ClientID %>').get_value();
        var level2Down = $find('<%=rncDayoffLevel2Down.ClientID %>').get_value();
        var level3Down = $find('<%=rncDayoffLevel3Down.ClientID %>').get_value();

        //判斷訖跟進位後的值都要填
        if ((level1Up === '' && level1Set != '') ||
            (level1Up != '' && level1Set === '') ||
            (level2Up === '' && level2Set != '') ||
            (level2Up != '' && level2Set === '') ||
            (level3Up === '' && level3Set != '') ||
            (level3Up != '' && level3Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷第一階或第二階沒填，就不能填第三階。
        if ((level3Up != '' || level3Set != '') && (level1Up === '' || level1Set === '' || level2Up === '' || level2Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷第一階沒填，就不能填第二階。
        if ((level2Up != '' || level2Set != '') && (level1Up === '' || level1Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷設定值訖不能大於起
        if ((level1Up != '' && level1Up <= level1Down) ||
            (level2Up != '' && level2Up <= level2Down) ||
            (level3Up != '' && level3Up <= level3Down)) {
            args.IsValid = false;
            return;
        }
    }

    function CheckRoutineSetting(e, args) {
        var level1Up = $find("<%=rncRoutineLevel1Up.ClientID%>").get_value();
        var level1Set = $find("<%=rncRoutineLevel1Set.ClientID%>").get_value();
        var level2Up = $find("<%=rncRoutineLevel2Up.ClientID%>").get_value();
        var level2Set = $find("<%=rncRoutineLevel2Set.ClientID%>").get_value();
        var level3Up = $find("<%=rncRoutineLevel3Up.ClientID%>").get_value();
        var level3Set = $find("<%=rncRoutineLevel3Set.ClientID%>").get_value();

        var level1Down = $find('<%=rncRoutineLevel1Down.ClientID %>').get_value();
        var level2Down = $find('<%=rncRoutineLevel2Down.ClientID %>').get_value();
        var level3Down = $find('<%=rncRoutineLevel3Down.ClientID %>').get_value();

        //判斷訖跟進位後的值都要填
        if ((level1Up === '' && level1Set != '') ||
            (level1Up != '' && level1Set === '') ||
            (level2Up === '' && level2Set != '') ||
            (level2Up != '' && level2Set === '') ||
            (level3Up === '' && level3Set != '') ||
            (level3Up != '' && level3Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷第一階或第二階沒填，就不能填第三階。
        if ((level3Up != '' || level3Set != '') && (level1Up === '' || level1Set === '' || level2Up === '' || level2Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷第一階沒填，就不能填第二階。
        if ((level2Up != '' || level2Set != '') && (level1Up === '' || level1Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷設定值訖不能大於起
        if ((level1Up != '' && level1Up <= level1Down) ||
            (level2Up != '' && level2Up <= level2Down) ||
            (level3Up != '' && level3Up <= level3Down)) {
            args.IsValid = false;
            return;
        }
    }

    function CheckHolidaySetting(e, args) {
        var level1Up = $find("<%=rncHolidayLevel1Up.ClientID%>").get_value();
        var level1Set = $find("<%=rncHolidayLevel1Set.ClientID%>").get_value();
        var level2Up = $find("<%=rncHolidayLevel2Up.ClientID%>").get_value();
        var level2Set = $find("<%=rncHolidayLevel2Set.ClientID%>").get_value();
        var level3Up = $find("<%=rncHolidayLevel3Up.ClientID%>").get_value();
        var level3Set = $find("<%=rncHolidayLevel3Set.ClientID%>").get_value();

        var level1Down = $find('<%=rncHolidayLevel1Down.ClientID %>').get_value();
        var level2Down = $find('<%=rncHolidayLevel2Down.ClientID %>').get_value();
        var level3Down = $find('<%=rncHolidayLevel3Down.ClientID %>').get_value();

        //判斷訖跟進位後的值都要填
        if ((level1Up === '' && level1Set != '') ||
            (level1Up != '' && level1Set === '') ||
            (level2Up === '' && level2Set != '') ||
            (level2Up != '' && level2Set === '') ||
            (level3Up === '' && level3Set != '') ||
            (level3Up != '' && level3Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷第一階或第二階沒填，就不能填第三階。
        if ((level3Up != '' || level3Set != '') && (level1Up === '' || level1Set === '' || level2Up === '' || level2Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷第一階沒填，就不能填第二階。
        if ((level2Up != '' || level2Set != '') && (level1Up === '' || level1Set === '')) {
            args.IsValid = false;
            return;
        }

        //判斷設定值訖不能大於起
        if ((level1Up != '' && level1Up <= level1Down) ||
            (level2Up != '' && level2Up <= level2Down) ||
            (level3Up != '' && level3Up <= level3Down)) {
            args.IsValid = false;
            return;
        }
    }
</script>
<style type="text/css">
    .RightAligned {
        text-align: right;
    }
</style>
<telerik:RadToolBar ID="carrySettingToolBar" runat="server" Width="100%" OnButtonClick="carrySettingToolBar_ButtonClick" SingleClick="None" meta:resourcekey="carrySettingToolBarResource1">
    <Items>
        <telerik:RadToolBarButton runat="server" Value="useParent" meta:resourcekey="RadToolBarButtonResource1">
            <ItemTemplate>
                <asp:CheckBox ID="chbParentCarrySetting" runat="server" Text="使用上一部門設定" AutoPostBack="True"
                    OnCheckedChanged="chbParentCarrySetting_CheckedChanged" onClick="Setting_chbParentCarrySetting_Click()" meta:resourcekey="chbParentCarrySettingResource1" />
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="儲存" Value="Save" ValidationGroup="vgCheckInputDays"
            CheckedImageUrl="~/Common/Images/Icon/icon_m01.png"
            DisabledImageUrl="~/Common/Images/Icon/icon_m01.png"
            HoveredImageUrl="~/Common/Images/Icon/icon_m01.png"
            ImageUrl="~/Common/Images/Icon/icon_m01.png" meta:resourcekey="RadToolBarButtonResource3">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>

<table width="100%" class="PopTable">
    <tr>
        <td>
            <asp:Label ID="Label24" runat="server" Text="工作日" meta:resourcekey="Label24Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td style=" white-space:nowrap;">
                        <telerik:RadNumericTextBox ID="rncWorkDayLevel1Down" runat="server" CssClass="RightAligned" MinValue="0" Value="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncWorkDayLevel1DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label29" runat="server" Text="小時" meta:resourcekey="Label29Resource1"></asp:Label>
                        <asp:Label ID="Label30" runat="server" Text="~" meta:resourcekey="Label30Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncWorkDayLevel1Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncWorkDayLevel1UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyWorkDayLevel1UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label35" runat="server" Text="小時(含)" meta:resourcekey="Label35Resource1"></asp:Label>
                        <asp:Label ID="Label41" runat="server" Text="，以" meta:resourcekey="Label41Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncWorkDayLevel1Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncWorkDayLevel1SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label38" runat="server" Text="小時" meta:resourcekey="Label38Resource1"></asp:Label>
                        <asp:Label ID="Label46" runat="server" Text="計算" meta:resourcekey="Label46Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rncWorkDayLevel2Down" runat="server" CssClass="RightAligned" MinValue="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncWorkDayLevel2DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label31" runat="server" Text="小時" meta:resourcekey="Label31Resource1"></asp:Label>
                        <asp:Label ID="Label32" runat="server" Text="~" meta:resourcekey="Label32Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncWorkDayLevel2Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncWorkDayLevel2UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyWorkDayLevel2UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label36" runat="server" Text="小時(含)" meta:resourcekey="Label36Resource1"></asp:Label>
                        <asp:Label ID="Label42" runat="server" Text="，以" meta:resourcekey="Label42Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncWorkDayLevel2Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncWorkDayLevel2SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label39" runat="server" Text="小時" meta:resourcekey="Label39Resource1"></asp:Label>
                        <asp:Label ID="Label45" runat="server" Text="計算" meta:resourcekey="Label45Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rncWorkDayLevel3Down" runat="server" CssClass="RightAligned" MinValue="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncWorkDayLevel3DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label33" runat="server" Text="小時" meta:resourcekey="Label33Resource1"></asp:Label>
                        <asp:Label ID="Label34" runat="server" Text="~" meta:resourcekey="Label34Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncWorkDayLevel3Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncWorkDayLevel3UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyWorkDayLevel3UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label37" runat="server" Text="小時(含)" meta:resourcekey="Label37Resource1"></asp:Label>
                        <asp:Label ID="Label43" runat="server" Text="，以" meta:resourcekey="Label43Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncWorkDayLevel3Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncWorkDayLevel3SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label40" runat="server" Text="小時" meta:resourcekey="Label40Resource1"></asp:Label>
                        <asp:Label ID="Label44" runat="server" Text="計算" meta:resourcekey="Label44Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="cvCheckWorkDay" runat="server" ErrorMessage="時數進位設定不正確" Display="Dynamic" ClientValidationFunction="CheckWorkDaySetting" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckWorkDayResource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label25" runat="server" Text="休息日" meta:resourcekey="Label25Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td style=" white-space:nowrap;">
                        <telerik:RadNumericTextBox ID="rncDayoffLevel1Down" runat="server" CssClass="RightAligned" MinValue="0" Value="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncDayoffLevel1DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label47" runat="server" Text="小時" meta:resourcekey="Label47Resource1"></asp:Label>
                        <asp:Label ID="Label48" runat="server" Text="~" meta:resourcekey="Label48Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncDayoffLevel1Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncDayoffLevel1UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyDayoffLevel1UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label53" runat="server" Text="小時(含)" meta:resourcekey="Label53Resource1"></asp:Label>
                        <asp:Label ID="Label54" runat="server" Text="，以" meta:resourcekey="Label54Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncDayoffLevel1Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncDayoffLevel1SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label59" runat="server" Text="小時" meta:resourcekey="Label59Resource1"></asp:Label>
                        <asp:Label ID="Label60" runat="server" Text="計算" meta:resourcekey="Label60Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rncDayoffLevel2Down" runat="server" CssClass="RightAligned" MinValue="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncDayoffLevel2DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label49" runat="server" Text="小時" meta:resourcekey="Label49Resource1"></asp:Label>
                        <asp:Label ID="Label50" runat="server" Text="~" meta:resourcekey="Label50Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncDayoffLevel2Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncDayoffLevel2UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyDayoffLevel2UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label55" runat="server" Text="小時(含)" meta:resourcekey="Label55Resource1"></asp:Label>
                        <asp:Label ID="Label56" runat="server" Text="，以" meta:resourcekey="Label56Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncDayoffLevel2Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncDayoffLevel2SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label61" runat="server" Text="小時" meta:resourcekey="Label61Resource1"></asp:Label>
                        <asp:Label ID="Label62" runat="server" Text="計算" meta:resourcekey="Label62Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rncDayoffLevel3Down" runat="server" CssClass="RightAligned" MinValue="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncDayoffLevel3DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label51" runat="server" Text="小時" meta:resourcekey="Label51Resource1"></asp:Label>
                        <asp:Label ID="Label52" runat="server" Text="~" meta:resourcekey="Label52Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncDayoffLevel3Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncDayoffLevel3UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyDayoffLevel3UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label57" runat="server" Text="小時(含)" meta:resourcekey="Label57Resource1"></asp:Label>
                        <asp:Label ID="Label58" runat="server" Text="，以" meta:resourcekey="Label58Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncDayoffLevel3Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncDayoffLevel3SetResource1" >
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label63" runat="server" Text="小時" meta:resourcekey="Label63Resource1"></asp:Label>
                        <asp:Label ID="Label64" runat="server" Text="計算" meta:resourcekey="Label64Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="cvCheckDayoff" runat="server" ErrorMessage="時數進位設定不正確" Display="Dynamic" ClientValidationFunction="CheckDayoffSetting" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckDayoffResource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label26" runat="server" Text="例假日" meta:resourcekey="Label26Resource1"></asp:Label>
        </td>
        <td>
            <table>
               <tr>
                    <td style=" white-space:nowrap;">
                        <telerik:RadNumericTextBox ID="rncRoutineLevel1Down" runat="server" CssClass="RightAligned" MinValue="0" Value="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncRoutineLevel1DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label65" runat="server" Text="小時" meta:resourcekey="Label65Resource1"></asp:Label>
                        <asp:Label ID="Label66" runat="server" Text="~" meta:resourcekey="Label66Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncRoutineLevel1Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncRoutineLevel1UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyRoutineLevel1UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label71" runat="server" Text="小時(含)" meta:resourcekey="Label71Resource1"></asp:Label>
                        <asp:Label ID="Label72" runat="server" Text="，以" meta:resourcekey="Label72Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncRoutineLevel1Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncRoutineLevel1SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label77" runat="server" Text="小時" meta:resourcekey="Label77Resource1"></asp:Label>
                        <asp:Label ID="Label78" runat="server" Text="計算" meta:resourcekey="Label78Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rncRoutineLevel2Down" runat="server" CssClass="RightAligned" MinValue="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncRoutineLevel2DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label67" runat="server" Text="小時" meta:resourcekey="Label67Resource1"></asp:Label>
                        <asp:Label ID="Label68" runat="server" Text="~" meta:resourcekey="Label68Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncRoutineLevel2Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncRoutineLevel2UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyRoutineLevel2UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label73" runat="server" Text="小時(含)" meta:resourcekey="Label73Resource1"></asp:Label>
                        <asp:Label ID="Label74" runat="server" Text="，以" meta:resourcekey="Label74Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncRoutineLevel2Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncRoutineLevel2SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label79" runat="server" Text="小時" meta:resourcekey="Label79Resource1"></asp:Label>
                        <asp:Label ID="Label80" runat="server" Text="計算" meta:resourcekey="Label80Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rncRoutineLevel3Down" runat="server" CssClass="RightAligned" MinValue="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncRoutineLevel3DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label69" runat="server" Text="小時" meta:resourcekey="Label69Resource1"></asp:Label>
                        <asp:Label ID="Label70" runat="server" Text="~" meta:resourcekey="Label70Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncRoutineLevel3Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncRoutineLevel3UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyRoutineLevel3UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label75" runat="server" Text="小時(含)" meta:resourcekey="Label75Resource1"></asp:Label>
                        <asp:Label ID="Label76" runat="server" Text="，以" meta:resourcekey="Label76Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncRoutineLevel3Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncRoutineLevel3SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label81" runat="server" Text="小時" meta:resourcekey="Label81Resource1"></asp:Label>
                        <asp:Label ID="Label82" runat="server" Text="計算" meta:resourcekey="Label82Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="cvCheckRoutine" runat="server" ErrorMessage="時數進位設定不正確" Display="Dynamic" ClientValidationFunction="CheckRoutineSetting" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckRoutineResource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label27" runat="server" Text="國定假日" meta:resourcekey="Label27Resource1"></asp:Label>
        </td>
        <td>
            <table>
                <tr>
                    <td style=" white-space:nowrap;">
                        <telerik:RadNumericTextBox ID="rncHolidayLevel1Down" runat="server" CssClass="RightAligned" MinValue="0" Value="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncHolidayLevel1DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label83" runat="server" Text="小時" meta:resourcekey="Label83Resource1"></asp:Label>
                        <asp:Label ID="Label84" runat="server" Text="~" meta:resourcekey="Label84Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncHolidayLevel1Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncHolidayLevel1UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyHolidayLevel1UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label89" runat="server" Text="小時(含)" meta:resourcekey="Label89Resource1"></asp:Label>
                        <asp:Label ID="Label90" runat="server" Text="，以" meta:resourcekey="Label90Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncHolidayLevel1Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncHolidayLevel1SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label95" runat="server" Text="小時" meta:resourcekey="Label95Resource1"></asp:Label>
                        <asp:Label ID="Label96" runat="server" Text="計算" meta:resourcekey="Label96Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rncHolidayLevel2Down" runat="server" CssClass="RightAligned" MinValue="0" Value="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncHolidayLevel2DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label85" runat="server" Text="小時" meta:resourcekey="Label85Resource1"></asp:Label>
                        <asp:Label ID="Label86" runat="server" Text="~" meta:resourcekey="Label86Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncHolidayLevel2Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncHolidayLevel2UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyHolidayLevel2UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label91" runat="server" Text="小時(含)" meta:resourcekey="Label91Resource1"></asp:Label>
                        <asp:Label ID="Label92" runat="server" Text="，以" meta:resourcekey="Label92Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncHolidayLevel2Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncHolidayLevel2SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label97" runat="server" Text="小時" meta:resourcekey="Label97Resource1"></asp:Label>
                        <asp:Label ID="Label98" runat="server" Text="計算" meta:resourcekey="Label98Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadNumericTextBox ID="rncHolidayLevel3Down" runat="server" CssClass="RightAligned" MinValue="0" Value="0" ReadOnly="True" BorderStyle="None" Width="45px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncHolidayLevel3DownResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label87" runat="server" Text="小時" meta:resourcekey="Label87Resource1"></asp:Label>
                        <asp:Label ID="Label88" runat="server" Text="~" meta:resourcekey="Label88Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncHolidayLevel3Up" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncHolidayLevel3UpResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                            <ClientEvents OnValueChanging="CopyHolidayLevel3UpHoursToDown"/>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label93" runat="server" Text="小時(含)" meta:resourcekey="Label93Resource1"></asp:Label>
                        <asp:Label ID="Label94" runat="server" Text="，以" meta:resourcekey="Label94Resource1"></asp:Label>
                        <telerik:RadNumericTextBox ID="rncHolidayLevel3Set" runat="server" CssClass="RightAligned" MinValue="0" Width="50px" MaxValue="24" MaxLength="4" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rncHolidayLevel3SetResource1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:Label ID="Label99" runat="server" Text="小時" meta:resourcekey="Label99Resource1"></asp:Label>
                        <asp:Label ID="Label100" runat="server" Text="計算" meta:resourcekey="Label100Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="cvCheckHoliday" runat="server" ErrorMessage="時數進位設定不正確" Display="Dynamic" ClientValidationFunction="CheckHolidaySetting" ValidationGroup="vgCheckInputDays" meta:resourcekey="cvCheckHolidayResource1"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="說明" meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="Label102" runat="server" Text="1.未輸入表示以實際加班時數計算" CssClass="SizeMemo" meta:resourcekey="Label102Resource1"></asp:Label>
        </td>
    </tr>
</table>

<asp:Label ID="lbConfirmCheckBox" runat="server"
    Text="確定要使用上一部門設定?     \r\n注意:確認後會刪除此部門所有的自訂資料!!" Visible="False" meta:resourcekey="lbConfirmCheckBoxResource1"></asp:Label>
<asp:HiddenField ID="hfUserGuid" runat="server" />
