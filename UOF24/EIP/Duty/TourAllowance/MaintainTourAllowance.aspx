<%@ Page Title="維護旅遊補助" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_TourAllowance_MaintainTourAllowance" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainTourAllowance.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function rdCompanyAmount_OnValueChanged(oEdit, value) {

        //Add code to handle your event here.
        var oldValue = "";
        if (value.get_oldValue != null || value.get_oldValue() != '') {
            oldValue = value.get_oldValue();
        }

        var companyAmount = value.get_newValue();
        var committeeAmount = new String($find('<%= rdCommitteeAmount.ClientID  %>').get_value());
        if (oldValue != companyAmount) {
            //my code goes here          
            if (companyAmount == '') {
                var total1 = [committeeAmount, "0"];
                $('#<%= lblTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total1));
            }
            else {
                var total2 = [committeeAmount, companyAmount];
                $('#<%= lblTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total2));
            }
        }
        else {
            var total3 = [committeeAmount, oldValue];
            $('#<%= lblTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total3));
        }

    }

    function rdCommitteeAmount_OnValueChanged(oEdit, value) {

        //Add code to handle your event here.

        var oldValue = "";
        if (value.get_oldValue != null || value.get_oldValue() != '') {
            oldValue = value.get_oldValue();
        }

        var committeeAmount = value.get_newValue();
        var companyAmount = new String($find('<%= rdCompanyAmount.ClientID  %>').get_value());
        if (oldValue != committeeAmount) {
            //my code goes here          
            if (committeeAmount == '') {
                var total1 = [companyAmount, "0"];
                $('#<%= lblTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total1));
            }
            else {
                var total2 = [companyAmount, committeeAmount];
                $('#<%= lblTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total2));
            }
        }
        else {
            var total3 = [companyAmount, oldValue];
            $('#<%= lblTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total3));
        }

    }
    function NewKeyPress(sender, args) {
        var keyCharacter = args.get_keyCharacter();

        if (keyCharacter == sender.get_numberFormat().DecimalSeparator ||
            keyCharacter == sender.get_numberFormat().NegativeSign) {

            args.set_cancel(true);
        }
    }

    function OnValueChanging(sender, args) {
        if (args.get_newValue() === "") {
            args.set_newValue(args.get_oldValue());
        }
    }
</script>
<style type="text/css"> 
    .RightAligned 
    { 
        text-align: right; 
    } 
</style>
<table class="PopTable" width="100%">
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label1" runat="server" Text="年度" 
                meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblYear" runat="server" meta:resourcekey="lblYearResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label2" runat="server" Text="姓名" 
                meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label3" runat="server" Text="帳號" 
                meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblAccount" runat="server" 
                meta:resourcekey="lblAccountResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label4" runat="server" Text="到職日" 
                meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblArriveDate" runat="server" 
                meta:resourcekey="lblArriveDateResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label5" runat="server" Text="年資" 
                meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
        <td>
            <telerik:RadNumericTextBox ID="rdYearth" runat="server" Width="100px" DataType="System.Int32" MaxLength="2" MinValue="0" Value="0" MaxValue="99" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdYearthResource1">
                 <NumberFormat GroupSeparator="" DecimalDigits="0" ></NumberFormat>
                <ClientEvents OnKeyPress="NewKeyPress" OnValueChanging="OnValueChanging" />
            </telerik:RadNumericTextBox>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label8" runat="server" Text="公司補助金額" 
                meta:resourcekey="Label8Resource1"></asp:Label>
        </td>
        <td>
            <telerik:RadNumericTextBox ID="rdCompanyAmount" runat="server" Width="100px" DataType="System.Int32" MaxLength="5" MinValue="0" Value="0" MaxValue="99999" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdCompanyAmountResource1" >
                 <NumberFormat GroupSeparator="" DecimalDigits="0" ></NumberFormat>
                <ClientEvents OnKeyPress="NewKeyPress" OnValueChanging="OnValueChanging" OnValueChanged="rdCompanyAmount_OnValueChanged"/>
            </telerik:RadNumericTextBox>

            <asp:Label ID="Label16" runat="server" Text="(0~999999)" 
                meta:resourcekey="Label16Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label9" runat="server" Text="福委補助金額" 
                meta:resourcekey="Label9Resource1"></asp:Label>
        </td>
        <td>
            <telerik:RadNumericTextBox ID="rdCommitteeAmount" runat="server" Width="100px" MinValue="0" MaxValue="99999" MaxLength="5" Value="0" CssClass="RightAligned"  DataType="System.Int32" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdCommitteeAmountResource1" >
                <NumberFormat GroupSeparator="" DecimalDigits="0" ></NumberFormat>
                <ClientEvents OnKeyPress="NewKeyPress" OnValueChanging="OnValueChanging" OnValueChanged="rdCommitteeAmount_OnValueChanged"/>
            </telerik:RadNumericTextBox>
            <asp:Label ID="Label17" runat="server" Text="(0~999999)" 
                meta:resourcekey="Label17Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label6" runat="server" Text="可補助總金額" 
                meta:resourcekey="Label6Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblTotalAmount" runat="server" Text="0" 
                meta:resourcekey="lblTotalAmountResource1"></asp:Label>
            <asp:Label ID="Label15" runat="server" Text="元" 
                meta:resourcekey="Label15Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label7" runat="server" Text="使用狀況" 
                meta:resourcekey="Label7Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblActive" runat="server" meta:resourcekey="lblActiveResource1"></asp:Label>
        </td>
    </tr>
    </table>
    <asp:Label ID="lblNotUse" runat="server" Text="未使用" Visible="False" 
        meta:resourcekey="lblNotUseResource1"></asp:Label>
    <asp:Label ID="lblUsed" runat="server" Text="已使用" Visible="False" 
        meta:resourcekey="lblUsedResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

