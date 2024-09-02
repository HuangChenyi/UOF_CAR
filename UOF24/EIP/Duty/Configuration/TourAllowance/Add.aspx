<%@ Page Title="新增/維護旅遊補助" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Configuration_TourAllowance_Add" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Add.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function rdCompanyAmount_OnValueChanged(oEdit, value) {

        //Add code to handle your event here.

        var oldValue = "";
        if (value.get_oldValue != null || value.get_oldValue() != '') {
            oldValue = value.get_oldValue();
        }
        var committeeAmount = new String($find('<%= rdCommitteeAmount.ClientID  %>').get_value());
        var companyAmount = value.get_newValue();
        if (oldValue != companyAmount) {
            //my code goes here
            if (committeeAmount == '' && companyAmount == '') {
                var total1 = ["0", "0"];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total1));
            }
            else if (committeeAmount == '' && companyAmount != '') {
                var total2 = ["0", companyAmount];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total2));
            }
            else if (committeeAmount != '' && companyAmount == '') {
                var total3 = [committeeAmount, "0"];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total3));
            }
            else {
                var total4 = [committeeAmount, companyAmount];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total4));
            }
        }
        else {
            if (committeeAmount == '') {
                var total5 = ["0", oldValue];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total5));
            }
            else {
                var total6 = [committeeAmount, oldValue];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total6));
            }
        }

    }

    function rdCommitteeAmount_OnValueChanged(oEdit, value) {

        //Add code to handle your event here.

        var oldValue = "";
        if (value.get_oldValue != null || value.get_oldValue() != '') {
            oldValue = value.get_oldValue();
        }
        
        var committeeAmount = value.get_newValue();;
        var companyAmount = new String($find('<%= rdCompanyAmount.ClientID  %>').get_value());

        if (oldValue != committeeAmount) {
            //my code goes here
            if (committeeAmount == '' && companyAmount == '') {
                var total1 = ["0", "0"];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total1));
            }
            else if (committeeAmount == '' && companyAmount != '') {
                var total2 = ["0", companyAmount];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total2));
            }
            else if (committeeAmount != '' && companyAmount == '') {
                var total3 = [committeeAmount, "0"];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total3));
            }
            else {
                var total4 = [committeeAmount, companyAmount];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total4));
            }
        }
        else {
            if (companyAmount == '') {
                var total5 = [oldValue, "0"];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total5));
            }
            else {
                var total6 = [oldValue, companyAmount];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", total6));
            }
        }

    }

    function OnValueChanging(sender, args) {

        if (args.get_newValue() == "" && args.get_newValue() != 0) {
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
            <asp:Label ID="Label1" runat="server" Text="部門" 
                meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lbGroupName" runat="server" 
                meta:resourcekey="lbGroupNameResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red" 
                meta:resourcekey="Label13Resource1"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="年資" 
                meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td>
            <telerik:RadNumericTextBox ID="rdYear" runat="server" MaxValue="99" MinValue="0" Width="100px" MaxLength="2" Value="0" DataType="System.Int32" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdYearResource1">
                <NumberFormat GroupSeparator="" DecimalDigits="0" ></NumberFormat>
                <ClientEvents OnValueChanging="OnValueChanging" OnKeyPress="NewKeyPress" />
            </telerik:RadNumericTextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="rdYear" Display="Dynamic" ErrorMessage="請輸入年資" 
                ForeColor="Red" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ControlToValidate="rdYear" ForeColor="Red"
                    Display="Dynamic" ErrorMessage="年資重複請重新輸入" 
                    onservervalidate="CustomValidator1_ServerValidate" 
                meta:resourcekey="CustomValidator1Resource1" ></asp:CustomValidator>  
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label14" runat="server" Text="*" ForeColor="Red" 
                meta:resourcekey="Label14Resource1"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="公司補助金額" 
                meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td style="white-space:nowrap;">
            <telerik:RadNumericTextBox ID="rdCompanyAmount" runat="server" Value="0" MinValue="0" MaxValue="999999" Width="100px" MaxLength="6" DataType="System.Int32" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdCompanyAmountResource1">
                <NumberFormat GroupSeparator="" DecimalDigits="0" ></NumberFormat>
                <ClientEvents OnValueChanged="rdCompanyAmount_OnValueChanged" OnValueChanging="OnValueChanging" OnKeyPress="NewKeyPress"/>
            </telerik:RadNumericTextBox>
            <asp:Label ID="Label10" runat="server" Text="元" 
                meta:resourcekey="Label10Resource1"></asp:Label>
            <asp:Label ID="Label7" runat="server" Text="(0 ~ 999999)" 
                meta:resourcekey="Label7Resource1"></asp:Label><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="rdCompanyAmount" Display="Dynamic" 
                ErrorMessage="請輸入公司補助金額" ForeColor="Red" 
                meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red" 
                meta:resourcekey="Label15Resource1"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text="福委會補助金額" 
                meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td style="white-space:nowrap;">
            <telerik:RadNumericTextBox ID="rdCommitteeAmount" runat="server" Value="0"  MinValue="0" MaxValue="999999" Width="100px" MaxLength="6" DataType="System.Int32" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="40px" meta:resourcekey="rdCommitteeAmountResource1">
                <NumberFormat GroupSeparator="" DecimalDigits="0" ></NumberFormat>
                <ClientEvents OnValueChanged="rdCommitteeAmount_OnValueChanged" OnValueChanging="OnValueChanging" OnKeyPress="NewKeyPress"/>
            </telerik:RadNumericTextBox>
            <asp:Label ID="Label11" runat="server" Text="元" 
                meta:resourcekey="Label11Resource1"></asp:Label>
            <asp:Label ID="Label8" runat="server" Text="(0 ~ 999999)" 
                meta:resourcekey="Label8Resource1"></asp:Label><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="rdCommitteeAmount" Display="Dynamic" 
                ErrorMessage="請輸入福委會補助金額" ForeColor="Red" 
                meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label5" runat="server" Text="合計" 
                meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblTotal" runat="server" Text="0" 
                meta:resourcekey="lblTotalResource1"></asp:Label>
            <asp:Label ID="Label12" runat="server" Text="元" 
                meta:resourcekey="Label12Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label6" runat="server" Text="備註" 
                meta:resourcekey="Label6Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtRemark" runat="server" Height="45px" TextMode="MultiLine" 
                Width="100%" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
        </td>
    </tr>
</table>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

