<%@ Page Title="新增/維護津貼" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Allowance_Add" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Add.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                var subTotal1 = ["0", "0"];
                $('#<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal1));
            }
            else if (committeeAmount == '' && companyAmount != '') {
                var subTotal2 = ["0", companyAmount];
                $('#<%= lblSubTotalAmount.ClientID  %>').val($uof.pageMethod.sync("GetTotalAmount", subTotal2));
            }
            else if (committeeAmount != '' && companyAmount == '') {
                var subTotal3 = [committeeAmount, "0"];
                $('#<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal3));
            }
            else {
                var subTotal4 = [committeeAmount, companyAmount];
                $('#<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal4));
            }
}
else {
    if (committeeAmount == '') {
        var subTotal5 = ["0", oldValue];
        $('$<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal5));
            }
            else {
                var subTotal6 = [committeeAmount, oldValue];
                $('$<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal6));
            }
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
            if (committeeAmount == '' && companyAmount == '') {
                var subTotal1 = ["0", "0"];
                $('#<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal1));
            }
            else if (committeeAmount == '' && companyAmount != '') {
                var subTotal2 = ["0", companyAmount];
                $('#<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal2));
            }
            else if (committeeAmount != '' && companyAmount == '') {
                var subTotal3 = [committeeAmount, "0"];
                $('#<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal3));
            }
            else {
                var subTotal4 = [committeeAmount, companyAmount];
                $('#<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal4));
            }
}
else {
    if (companyAmount == '') {
        var subTotal5 = [oldValue, "0"];
        $('#<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal5));
            }
            else {
                var subTotal6 = [oldValue, companyAmount];
                $('#<%= lblSubTotalAmount.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", subTotal6));
            }
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
        .RightAligned {
            text-align: right;
        }
    </style>

    <table class="PopTable" width="100%">
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label1" runat="server" Text="類別"
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblClassName" runat="server"
                    meta:resourcekey="lblClassNameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label21" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label21Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="津貼代碼"
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCode" runat="server" meta:resourcekey="txtCodeResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="請輸入津貼代碼" Display="Dynamic" ControlToValidate="txtCode"
                    meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvCodeRepeat" runat="server"
                    ErrorMessage="代碼已存在" Display="Dynamic"
                    meta:resourcekey="cvCodeRepeatResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap" style="height: 26px">
                <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label11Resource1"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="津貼名稱"
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style="height: 26px">
                <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="請輸入津貼名稱" Display="Dynamic" ControlToValidate="txtName"
                    meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label22" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label22Resource1"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="單次申請數量上限"
                    meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdMaxApplyCount" runat="server" MaxLength="3" Value="1" MinValue="1" Width="40px" DataType="System.Int32" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="rdMaxApplyCountResource1">
                    <NumberFormat GroupSeparator="" DecimalDigits="0"></NumberFormat>
                    <ClientEvents OnKeyPress="NewKeyPress" OnValueChanging="OnValueChanging" />
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label27" runat="server" Text="(1 ~ 999)"
                    meta:resourcekey="Label27Resource1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="請輸入申請數量上限" Display="Dynamic" ControlToValidate="rdMaxApplyCount" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label23" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label23Resource1"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="公司津貼金額"
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdCompanyAmount" runat="server" Width="80px" DataType="System.Int32" MaxLength="5" MinValue="0" Value="0" MaxValue="99999" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="32px" meta:resourcekey="rdCompanyAmountResource1">
                    <NumberFormat GroupSeparator="" DecimalDigits="0"></NumberFormat>
                    <ClientEvents OnKeyPress="NewKeyPress" OnValueChanging="OnValueChanging" OnValueChanged="rdCompanyAmount_OnValueChanged" />
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label13" runat="server" Text="元"
                    meta:resourcekey="Label13Resource1"></asp:Label>
                <asp:Label ID="Label28" runat="server" Text="(0 ~ 99999)"
                    meta:resourcekey="Label28Resource1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ErrorMessage="請輸入公司津貼金額" Display="Dynamic"
                    ControlToValidate="rdCompanyAmount"
                    meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label24" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label24Resource1"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="福委津貼金額"
                    meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdCommitteeAmount" runat="server" Width="80px" MinValue="0" MaxValue="99999" MaxLength="5" Value="0" CssClass="RightAligned" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1" LabelWidth="32px" meta:resourcekey="rdCommitteeAmountResource1">
                    <NumberFormat GroupSeparator="" DecimalDigits="0"></NumberFormat>
                    <ClientEvents OnKeyPress="NewKeyPress" OnValueChanging="OnValueChanging" OnValueChanged="rdCommitteeAmount_OnValueChanged" />
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label14" runat="server" Text="元"
                    meta:resourcekey="Label14Resource1"></asp:Label>
                <asp:Label ID="Label29" runat="server" Text="(0 ~ 99999)"
                    meta:resourcekey="Label29Resource1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ErrorMessage="請輸入福委津貼金額" Display="Dynamic"
                    ControlToValidate="rdCommitteeAmount"
                    meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label7" runat="server" Text="合計"
                    meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblSubTotalAmount" runat="server" Text="0"
                    meta:resourcekey="lblSubTotalAmountResource1"></asp:Label>
                <asp:Label ID="Label15" runat="server" Text="元"
                    meta:resourcekey="Label15Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label25" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label25Resource1"></asp:Label>
                <asp:Label ID="Label8" runat="server" Text="額外補助金額"
                    meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdAdditionalAmount" runat="server" Width="80px" MinValue="0" MaxValue="99999" MaxLength="5" Value="0" CssClass="RightAligned" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1" LabelWidth="32px" meta:resourcekey="rdAdditionalAmountResource1">
                    <NumberFormat GroupSeparator="" DecimalDigits="0"></NumberFormat>
                    <ClientEvents OnKeyPress="NewKeyPress" OnValueChanging="OnValueChanging" />
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label16" runat="server" Text="元"
                    meta:resourcekey="Label16Resource1"></asp:Label>
                <asp:Label ID="Label30" runat="server" Text="(0 ~ 99999)"
                    meta:resourcekey="Label30Resource1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage="請輸入額外補助金額" Display="Dynamic"
                    ControlToValidate="rdAdditionalAmount"
                    meta:resourcekey="RequiredFieldValidator7Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label26" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label26Resource1"></asp:Label>
                <asp:Label ID="Label9" runat="server" Text="開放申請時間"
                    meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td nowrap="nowrap">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text="實際發生日前" meta:resourcekey="Label17Resource1"></asp:Label>
                            <telerik:RadNumericTextBox ID="rdApplyBefore" runat="server" Width="40px" CssClass="RightAligned" DataType="System.Int32" Value="0" MaxLength="2" MaxValue="99" MinValue="0" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="rdApplyBeforeResource1">
                                <NumberFormat GroupSeparator="" DecimalDigits="0"></NumberFormat>
                                <ClientEvents OnKeyPress="NewKeyPress" OnValueChanging="OnValueChanging" />
                            </telerik:RadNumericTextBox>
                            <asp:Label ID="Label19" runat="server" Text="天(0 ~ 99)，可開放申請"
                                meta:resourcekey="Label19Resource1"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                ErrorMessage="請輸入天數" Display="Dynamic" ControlToValidate="rdApplyBefore"
                                meta:resourcekey="RequiredFieldValidator8Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label18" runat="server" Text="實際發生日後" meta:resourcekey="Label18Resource1"></asp:Label>
                            <telerik:RadNumericTextBox ID="rdApplyAfter" runat="server" Width="40px" CssClass="RightAligned" DataType="System.Int32" Value="0" MaxLength="2" MaxValue="99" MinValue="0" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="rdApplyAfterResource1">
                                <NumberFormat GroupSeparator="" DecimalDigits="0"></NumberFormat>
                                <ClientEvents OnKeyPress="NewKeyPress" OnValueChanging="OnValueChanging" />
                            </telerik:RadNumericTextBox>
                            <asp:Label ID="Label20" runat="server" Text="天(0 ~ 99)，可開放申請"
                                meta:resourcekey="Label20Resource1"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                ErrorMessage="請輸入天數" Display="Dynamic" ControlToValidate="rdApplyAfter"
                                meta:resourcekey="RequiredFieldValidator9Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label10" runat="server" Text="備註" meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRemark" runat="server" Height="45px" TextMode="MultiLine" Width="100%" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>