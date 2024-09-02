<%@ Page Title="維護年休資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_YearLeaveDays_MaintainYearLeave" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainYearLeave.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function NewKeyPress(sender, args) {

            var keyCharacter = args.get_keyCharacter();

            if (keyCharacter == sender.get_numberFormat().DecimalSeparator ||
                keyCharacter == sender.get_numberFormat().NegativeSign) {

                args.set_cancel(true);
            }

        }

        function ConfirmDelete() {
            if (!confirm('<%= lblConfirmMsg.Text%>'))
                return false;
        }
    </script>
    <style type="text/css"> 
    .RightAligned 
    { 
        text-align: right; 
    } 
</style>
    <table class="PopTable" cellpadding="0" cellspacing="1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="姓名" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserNameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="帳號" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAccount" runat="server" meta:resourcekey="lblAccountResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="到職日" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblArriveDate" runat="server" meta:resourcekey="lblArriveDateResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label18" runat="server" Text="來源" meta:resourcekey="Label18Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblSources" runat="server" meta:resourcekey="lblSourcesResource1"></asp:Label>
            </td>
        </tr>
                <tr>
            <td>
                <asp:Label ID="Label23" runat="server" Text="年度" meta:resourcekey="Label23Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblYear" runat="server" meta:resourcekey="lblYearResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label11Resource1"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="年資" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdYearth" runat="server" Width="100px" DataType="System.Int32" MaxLength="2" MinValue="0" MaxValue="99" CssClass="RightAligned" Culture="zh-TW">
                    <NumberFormat GroupSeparator="" DecimalDigits="0" ></NumberFormat>                    
                    <ClientEvents OnKeyPress="NewKeyPress" />
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="不可空白" ControlToValidate="rdYearth" Display="Dynamic" meta:resourcekey="RequiredFieldValidator7Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label12" runat="server" Text="*" ForeColor=Red meta:resourcekey="Label12Resource1"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="本年度可休數" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdLeaveDays" runat="server" Width="100px" DataType="System.Decimal" MaxLength="5" MinValue="0" MaxValue="9999" CssClass="RightAligned" Culture="zh-TW">
                    <NumberFormat GroupSeparator="" DecimalDigits="1" ></NumberFormat>                    
                </telerik:RadNumericTextBox>
                <asp:Label ID="lblThisYearUnit" runat="server"  Text="天" meta:resourcekey="lblThisYearUnitResource1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ErrorMessage="不可空白" ControlToValidate="rdLeaveDays" Display="Dynamic" meta:resourcekey="RequiredFieldValidator8Resource1"></asp:RequiredFieldValidator>
                <table>
                    <tr>
                        <td>
                            <asp:CustomValidator ID="cvLeaveDays" runat="server" ErrorMessage="" Display="Dynamic"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label13Resource1"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="起" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdLeaveDaysBegin" runat="server">
                            </telerik:RadDatePicker>
                        </td>
                        <td style=" white-space:nowrap;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="不可空白" ControlToValidate="rdLeaveDaysBegin" Display="Dynamic" 
                            meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ControlToCompare="rdLeaveDaysBegin" ControlToValidate="rdLeaveDaysEnd" Display="Dynamic" ErrorMessage="訖日不可早於起日" Operator="GreaterThanEqual" 
                            Type="Date" meta:resourcekey="CompareValidator1Resource1"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="*" ForeColor=Red meta:resourcekey="Label14Resource1"></asp:Label>
                <asp:Label ID="Label8" runat="server" Text="訖" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td>
                <table cellpadding=0 cellspacing=0>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdLeaveDaysEnd" runat="server">
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="不可空白" ControlToValidate="rdLeaveDaysEnd" Display="Dynamic" 
                            meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td nowrap=nowrap>
                <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label15Resource1"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="去年度保留數" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdLastLeaveDays" runat="server" Width="100px" DataType="System.Decimal" MaxLength="5" MinValue="0" MaxValue="9999" CssClass="RightAligned" Culture="zh-TW">
                    <NumberFormat GroupSeparator="" DecimalDigits="1" ></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="lblLastYearUnit" runat="server"  Text="天" meta:resourcekey="lblLastYearUnitResource1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="不可空白" ControlToValidate="rdLastLeaveDays" Display="Dynamic" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                <table>
                    <tr>
                        <td>
                            <asp:CustomValidator ID="cvLastLeaveDays" runat="server" ErrorMessage="" Display="Dynamic"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label16" runat="server" Text="*" ForeColor=Red meta:resourcekey="Label16Resource1"></asp:Label>
                <asp:Label ID="Label9" runat="server" Text="起" meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td>
                <table cellpadding=0 cellspacing=0>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdLastYearLeaveDaysBegin" runat="server" >
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="不可空白" ControlToValidate="rdLastYearLeaveDaysBegin" 
                            Display="Dynamic" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ForeColor="Red" ControlToCompare="rdLastYearLeaveDaysBegin" ControlToValidate="rdLastYearLeaveDaysEnd" Display="Dynamic" 
                            ErrorMessage="訖日不可早於起日" Operator="GreaterThanEqual" Type="Date" meta:resourcekey="CompareValidator2Resource1"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label17" runat="server" Text="*" ForeColor=Red meta:resourcekey="Label17Resource1"></asp:Label>
                <asp:Label ID="Label10" runat="server" Text="訖" meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
            <td>
                <table cellpadding=0 cellspacing=0>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdLastYearLeaveDaysEnd" runat="server" >
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="不可空白" ControlToValidate="rdLastYearLeaveDaysEnd" 
                            Display="Dynamic" meta:resourcekey="RequiredFieldValidator6Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label19" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label19Resource1"></asp:Label>
                <asp:Label ID="Label20" runat="server" Text="異動原因" meta:resourcekey="Label20Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <table Width="100%">
                    <tr>
                        <td>
                            <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Rows="4" Width="100%" meta:resourcekey="txtReasonResource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="異動原因必填" 
                                ControlToValidate="txtReason" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>                    
                </table>
            </td>
        </tr>
    </table>
    <table border="0">
        <tr id="trModifyTime" runat="server">
            <td>
                <asp:Label ID="Label21" runat="server" Text="修改時間:" meta:resourcekey="Label21Resource1"></asp:Label>
                <asp:Label ID="lblModifyTime" runat="server"></asp:Label>
            </td>
        </tr>
        <tr id="trModifer" runat="server">
            <td>
                <asp:Label ID="Label22" runat="server" Text="修改者:" meta:resourcekey="Label22Resource1"></asp:Label>
                <asp:Label ID="lblModifyUser" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label25" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvCheckNewestYearLeave" runat="server" ErrorMessage="該人員已產生下一年度年休，不可刪除。" Display="Dynamic" meta:resourcekey="cvCheckNewestYearLeaveResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvCheckYearLeaveUsed" runat="server" ErrorMessage="該人員已使用此年度年休，不可刪除。" Display="Dynamic" meta:resourcekey="cvCheckYearLeaveUsedResource1"></asp:CustomValidator>
            </td>
        </tr>
         <tr>
            <td>
                <asp:CustomValidator ID="cvCheckYearLeaveIsSign" runat="server" ErrorMessage="尚有審核中的年休假單,不可產生年休假資訊!" Display="Dynamic" meta:resourcekey="cvCheckYearLeaveIsSignResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
<asp:Label ID="lblNotAllowCreate" runat="server" Text="不可維護舊年度的資料，已存在更新年度的資料" Visible="false" meta:resourcekey="lblNotAllowCreateResource1"></asp:Label>  
<asp:Label ID="lblHour" runat="server"  Visible="False"  Text="小時" meta:resourcekey="lblHourResource1" ></asp:Label>
<asp:Label ID="lblDay" runat="server" Visible="False" Text="天" meta:resourcekey="lblDayResource1"  ></asp:Label>
<asp:Label ID="lblNotAllowYearDays" runat="server" Visible="False" Text="不可小於已用天(時)數:已用" meta:resourcekey="lblNotAllowYearDaysResource1"></asp:Label>
<asp:Label ID="lblImport" runat="server" Visible="False" Text="匯入" meta:resourcekey="lblImportResource1"></asp:Label>
<asp:Label ID="lblSystemInsert" runat="server" Visible="False" Text="系統產生" meta:resourcekey="lblSystemInsertResource1"></asp:Label>
<asp:Label ID="lblManualInsert" runat="server" Visible="False" Text="手動新增" meta:resourcekey="lblManualInsertResource1"></asp:Label>
<asp:Label ID="lblDelete" runat="server" Visible="False" Text="刪除" meta:resourcekey="lblDeleteResource1"></asp:Label>
<asp:Label ID="lblConfirmMsg" runat="server" Style="display: none" Text="將刪除該人員此年度年休資料，確定刪除？" meta:resourcekey="lblConfirmMsgResource1"></asp:Label>
<asp:Label ID="lblReason" runat="server" Text="刪除年休" Visible="False" meta:resourcekey="lblReasonResource1"></asp:Label>
<asp:HiddenField ID="hfThisYearUnit" runat="server" />
<asp:HiddenField ID="hfLastYearUnit" runat="server" />
<asp:HiddenField ID="hfCurrentUser" runat="server" />
<asp:HiddenField ID="hfOldYearLeaveDay" runat="server" />
<asp:HiddenField ID="hfIsFirstTime" runat="server" Value="false"/>
<asp:HiddenField ID="hfSources" runat="server"/>
    
</asp:Content>

