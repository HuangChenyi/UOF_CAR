<%@ Page Title="新增/維䕶公益活動" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Leave_CharityLeave_MaintainCharityLeave" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainCharityLeave.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function CheckNumberText() {
            //48 ~ 57 -----> 0~9  
            //8 -----------> Backpace  
            //13-----------> Enter  
            if (window.event.keyCode == 45 || window.event.keyCode == 46) {     //0-->空字元
                window.event.keyCode = 0;

            }
        }
        function num_TextChange(oEdit, newText, oEvent) {
            oEdit.decimals = 1;

            var oldValue = "";
            if (oEdit.elemValue.defaultValue != "")
                oldValue = parseInt(oEdit.elemValue.defaultValue);

            var newValue = newText;

            if (newValue.split('.').length > 1 && newValue.split('.')[1].length >= 1) {

                oldValue = newValue.split('.')[0] + '.' + newValue.split('.')[1].substring(0, 1);

                oEdit.setValue(oldValue);
            }
            else if (newValue == "") {
                oEdit.setValue(0);
            }
        }
        function OnValueChanging(sender, args) {

            if (new String(args.get_newValue()) == "" && new String(args.get_newValue()) != "0") {
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
    <table class="PopTable" >
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" 
                    meta:resourcekey="Label5Resource1"></asp:Label>
                <asp:Label ID="lblEnable" runat="server" Text="是否啟用" 
                    meta:resourcekey="lblEnableResource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="rblEnable" runat="server" RepeatDirection="Horizontal" 
                                meta:resourcekey="rblEnableResource1" >
                                <asp:ListItem Value="Y" Text="是" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                <asp:ListItem Value="N" Text="否" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="revEnable" runat="server" 
                                ErrorMessage="必填欄位" ControlToValidate="rblEnable" Display="Dynamic" 
                                meta:resourcekey="revEnableResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red" 
                    meta:resourcekey="Label6Resource1"></asp:Label>
                <asp:Label ID="lblName" runat="server" Text="活動名稱" 
                    meta:resourcekey="lblNameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="revNmae" runat="server" ForeColor="Red"
                    ErrorMessage="必填欄位" ControlToValidate="txtName" Display="Dynamic" 
                    meta:resourcekey="revNmaeResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red" 
                    meta:resourcekey="Label9Resource1"></asp:Label>
                <asp:Label ID="lblBeginTime" runat="server" Text="活動時間(起)" 
                    meta:resourcekey="lblBeginTimeResource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdBeginDate" runat="server">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                                <DateInput LabelWidth="40%" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            &nbsp;<asp:DropDownList ID="ddlBeginTime" runat="server" 
                                meta:resourcekey="ddlBeginTimeResource1">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="revBeginTime" runat="server" ForeColor="Red" ErrorMessage="必填欄位" ControlToValidate="rdBeginDate" Display="Dynamic" meta:resourcekey="revBeginTimeResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" 
                    meta:resourcekey="Label8Resource1"></asp:Label>
                <asp:Label ID="lblEndTime" runat="server" Text="活動時間(訖)" 
                    meta:resourcekey="lblEndTimeResource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdEndDate" runat="server">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                                <DateInput LabelWidth="40%" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            &nbsp;<asp:DropDownList ID="ddlEndTime"   runat="server" 
                                meta:resourcekey="ddlEndTimeResource1">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="必填欄位" runat="server" ForeColor="Red" ErrorMessage="必填欄位" ControlToValidate="rdEndDate" Display="Dynamic" meta:resourcekey="必填欄位Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
        <tr id="trTimezone" runat="server">
            <td>
                <asp:Label ID="Label14" runat="server" Text="活動時區" meta:resourcekey="Label14Resource1"></asp:Label>
            </td>
            <td>
                 <asp:DropDownList ID="ddlTimeZone" runat="server" meta:resourcekey="ddlTimeZoneResource1"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label13Resource1" 
                   ></asp:Label>
                <asp:Label ID="lblActivityHours" runat="server" Text="活動時數" meta:resourcekey="lblActivityHorusResource1" 
                    ></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdActivityHours" runat="server" DataType="System.Decimal" CssClass="RightAligned" Width="100px">
                    <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                    <ClientEvents  OnValueChanging="OnValueChanging"/>
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="revActivityHours" runat="server" ForeColor="Red"
                    ErrorMessage="必填欄位" ControlToValidate="rdActivityHours" Display="Dynamic" 
                    meta:resourcekey="revActivityHoursResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red" 
                    meta:resourcekey="Label10Resource1"></asp:Label>
                <asp:Label ID="lblHours" runat="server" Text="公益時數" 
                    meta:resourcekey="lblHoursResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdHours" runat="server" DataType="System.Decimal" CssClass="RightAligned" Width="100px">
                    <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                    <ClientEvents  OnValueChanging="OnValueChanging"/>
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="revHours" runat="server" ForeColor="Red" ErrorMessage="必填欄位" ControlToValidate="rdHours" Display="Dynamic" meta:resourcekey="revHoursResource1"></asp:RequiredFieldValidator>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" 
                    meta:resourcekey="Label7Resource1"></asp:Label>
                <asp:Label ID="lblPlace" runat="server" Text="活動地點" 
                    meta:resourcekey="lblPlaceResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPlace" runat="server" meta:resourcekey="txtPlaceResource1" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="revPlace" runat="server" ForeColor="Red"
                    ErrorMessage="必填欄位" ControlToValidate="txtPlace" Display="Dynamic" 
                    meta:resourcekey="revPlaceResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblContent" runat="server" Text="活動內容" 
                    meta:resourcekey="lblContentResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtContent" runat="server" meta:resourcekey="txtContentResource1" TextMode="MultiLine" Width="100%" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                
                <asp:Label ID="lblPlaces" runat="server" Text="活動名額" 
                    meta:resourcekey="lblPlacesResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdPlaces" runat="server"  CssClass="RightAligned" Width="100px">
                    <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                    <ClientEvents OnKeyPress="NewKeyPress" />
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red" 
                    meta:resourcekey="Label11Resource1"></asp:Label>
                <asp:Label ID="lblApplyTime" runat="server" Text="開放申請時間" 
                    meta:resourcekey="lblApplyTimeResource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;">
                <table>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="活動時間(起)前" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="rdApplyBeginDate" runat="server" MaxLength="2"  Width="40px" CssClass="RightAligned">
                                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                                            <ClientEvents OnKeyPress="NewKeyPress" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="天，可開放申請" meta:resourcekey="Label2Resource1"></asp:Label>
                                        <asp:RequiredFieldValidator ID="revApplyBeginDate" runat="server" ErrorMessage="必填欄位" ControlToValidate="rdApplyBeginDate" Display="Dynamic" meta:resourcekey="revApplyBeginDateResource1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="活動時間(訖)後" meta:resourcekey="Label3Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadNumericTextBox ID="rdApplyEndDate" runat="server" Width="40px" MaxLength="2" CssClass="RightAligned">
                                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                                            <ClientEvents  OnKeyPress="NewKeyPress" />
                                        </telerik:RadNumericTextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="天，可開放申請" meta:resourcekey="Label4Resource1"></asp:Label>
                                        <asp:RequiredFieldValidator ID="revApplyEndDate" runat="server" ErrorMessage="必填欄位" ControlToValidate="rdApplyEndDate" Display="Dynamic" meta:resourcekey="revApplyEndDateResource1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <asp:Label ID="lblMessage" runat="server" Text="※開放申請時間如不限制請填入0" CssClass="SizeMemo" meta:resourcekey="lblMessageResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:CustomValidator ID="cvHoursError" runat="server" ErrorMessage="公益時數不可大於活動時數。" ForeColor="Red"
                    Display="Dynamic"  meta:resourcekey="cvHoursErrorResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvDateError" runat="server" Display="Dynamic" ForeColor="Red"
                    ErrorMessage="活動時間(起)需早於活動時間(訖)！"  meta:resourcekey="cvDateErrorResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
        </tr>
    </table>
    
        
    
    <asp:HiddenField ID="hfType" runat="server" />
    <asp:HiddenField ID="hfCharityGuid" runat="server" />
</asp:Content>

