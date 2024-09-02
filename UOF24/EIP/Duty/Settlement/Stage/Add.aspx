<%@ Page Title="維護期別" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Settlement_Stage_Add" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Add.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" id="igClientScript">
        function startDate_OnLoad(sender) {
            $('#<%=lbYear.ClientID %>').html(sender.get_selectedDate().format('yyyy'));
        }

        function rdStartDate_OnDateSelected(sender, args) {

            var endDateChooser = $find('<%=rdEndDate.ClientID %>');
            var d1 = sender.get_selectedDate();
            var d2 = endDateChooser.get_selectedDate();
            $('#Year').html(d1.format('yyyy'));

            if (d1 > d2) {
                endDateChooser.set_selectedDate(d1);
            }
        }
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
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
    <table width="100%" class="PopTable" cellspacing="1">   
         <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server" 
                    Text="年度" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbYear" runat="server" meta:resourcekey="lbYearResource1"></asp:Label>
            </td>
        </tr>   
        <tr>
            <td>
                <span style="color: #ff0000">*</span>
                <asp:Label ID="Label3" runat="server"  Text="期別" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdStage" runat="server" MinValue="1" MaxValue="1000" Width="94px" DataType="System.Int32" Value="1" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="37px" meta:resourcekey="rdStageResource1">
                    <NumberFormat ZeroPattern="" DecimalDigits="0"></NumberFormat>
                    <ClientEvents OnKeyPress="NewKeyPress"/>
                </telerik:RadNumericTextBox>
                <asp:Label ID="lbStage" runat="server" Visible="False" meta:resourcekey="lbStageResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="Label5" runat="server" 
                    Text="開始日期" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="rdStartDate" runat="server" meta:resourcekey="rdStartDateResource1">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                    <DateInput  LabelWidth="40%" ClientEvents-OnValueChanging="OnValueChanging" ClientEvents-OnLoad="startDate_OnLoad"></DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    <ClientEvents OnDateSelected="rdStartDate_OnDateSelected"/>
                </telerik:RadDatePicker> 
                     <asp:Label ID="lbStartDate" runat="server" Visible="False"
                      meta:resourcekey="lbStartDateResource1"></asp:Label>         
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="Label8" runat="server" 
                    Text="結束日期" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdEndDate" runat="server"  meta:resourcekey="rdEndDateResource1">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                                <DateInput LabelWidth="40%" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            &nbsp;&nbsp;
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="rdEndDate" ForeColor="Red"
                                Display="Dynamic" ErrorMessage="結束日期不能早於開始日期" 
                                OnServerValidate="CustomValidator1_ServerValidate" 
                                meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
    </table>        
    <asp:HiddenField ID="hfSettID" runat="server" />
    <asp:Label ID="lblNoSettMsg" runat="server" Text="沒有結算類別，無法新增。" Visible="False" meta:resourcekey="lblNoSettMsgResource1"></asp:Label>
</asp:Content>

