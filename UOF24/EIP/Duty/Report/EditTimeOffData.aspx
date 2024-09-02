<%@ Page Title="補休時數維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EditTimeOffData.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Report.EditTimeOffData" meta:resourcekey="PageResource1" culture="auto" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function compareHours(sender, args) {
            var rnhours = $("#<%=rnHours.ClientID%>").val();
            var rnUsedhours = $("#<%=rnUsedHours.ClientID%>").val();            
            if (rnhours - rnUsedhours < 0) {
                args.IsValid = false;
            }
        }

        function compareDate(sender, args) {            
            var rdStartDate = $find("<%=rdStartDate.ClientID%>").get_dateInput().get_selectedDate();
            var rdEndDate = $find("<%=rdEndDate.ClientID%>").get_dateInput().get_selectedDate();
            if (rdStartDate > rdEndDate) {
                args.IsValid = false;
            }
        }

        function changehours(sender, args) {            
            if (args.get_newValue() === "") {
                args.set_newValue(args.get_oldValue())
            }            
        }
    </script>

    <table class="PopTable" border="1">
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label1" runat="server" Text="帳號" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblAccount" runat="server" meta:resourcekey="lblAccountResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label2" runat="server" Text="姓名" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserNameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label15" runat="server" Text="來源" meta:resourcekey="Label15Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblSources" runat="server"  meta:resourcekey="lblSourcesResource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trDocNbr">
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label17" runat="server" Text="加班單號" meta:resourcekey="Label17Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblDocNbr" runat="server"  meta:resourcekey="lblDocNbrResource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trOTtype">
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label9" runat="server" Text="加班類型" meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblOverTimeType" runat="server"  meta:resourcekey="lblOverTimeTypeResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="開始日" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <telerik:RadDatePicker ID="rdStartDate" runat="server" Width="120px"  meta:resourcekey="rdStartDateResource1">
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label4" runat="server" Text="到期日" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <telerik:RadDatePicker ID="rdEndDate" runat="server" Width="120px"  meta:resourcekey="rdEndDateResource1">
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label5" runat="server" Text="可用時數" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <telerik:RadNumericTextBox runat="server" ID="rnHours" MinValue="0" Culture="zh-TW" DbValueFactor="1" LabelWidth="100px" Width="100px" MaxValue="999" meta:resourcekey="rnHoursResource1">
                    <NumberFormat DecimalDigits="2" />
                    <ClientEvents OnValueChanging="changehours" />
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label7" runat="server" Text="小時" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label6" runat="server" Text="已用時數" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <telerik:RadNumericTextBox runat="server" ID="rnUsedHours" MinValue="0" Culture="zh-TW" DbValueFactor="1" LabelWidth="100px" Width="100px" Enabled="false" meta:resourcekey="rnUsedHoursResource1">
                    <NumberFormat DecimalDigits="2" />
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label8" runat="server" Text="小時" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trRemark">
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label10" runat="server" Text="備註" meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Rows="4" Width="100%" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label12Resource1"></asp:Label>
                <asp:Label ID="Label11" runat="server" Text="異動原因" meta:resourcekey="Label11Resource1"></asp:Label>
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
                <asp:Label ID="Label13" runat="server" Text="修改時間:" meta:resourcekey="Label13Resource1"></asp:Label>
                <asp:Label ID="lblModifyTime" runat="server"></asp:Label>
            </td>
        </tr>
        <tr id="trModifer" runat="server">
            <td>
                <asp:Label ID="Label14" runat="server" Text="修改者:" meta:resourcekey="Label14Resource1"></asp:Label>
                <asp:Label ID="lblModifyUser" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    <asp:Customvalidator ID="checkEndDate" runat="server" ErrorMessage="到期日不可早於開始日<br>" ClientValidationFunction="compareDate" Display="Dynamic" meta:resourcekey="checkEndDateResource1"></asp:Customvalidator>
    <asp:Customvalidator ID="checkrnHours" runat="server" ErrorMessage="可用時數不可小於已用時數" ClientValidationFunction="compareHours" Display="Dynamic" meta:resourcekey="checkrnHoursResource1"></asp:Customvalidator>
    <asp:Label ID="lblBefore" runat="server" Text="修改前" Visible="False" meta:resourcekey="lblBeforeResource1"></asp:Label>
    <asp:Label ID="lblAfter" runat="server" Text="修改後" Visible="False" meta:resourcekey="lblAfterResource1"></asp:Label>
    <asp:Label ID="lblModifier" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
    <asp:Label ID="lblEmotion" runat="server" Text="動作" Visible="False" meta:resourcekey="lblEmotionResource1"></asp:Label>
    <asp:Label ID="lblModify" runat="server" Text="修改" Visible="False" meta:resourcekey="lblModifyResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkTypeWorkDayResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblWorkTypeDayoffResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblWorkTypeRoutineResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeOrgHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblWorkTypeOrgHolidayResource1"></asp:Label>
    <asp:Label ID="lblOverTime" runat="server" Text="加班" Visible="False" meta:resourcekey="lblOverTimeResource1"></asp:Label>
    <asp:Label ID="lblImport" runat="server" Text="匯入" Visible="False" meta:resourcekey="lblImportResource1"></asp:Label>

</asp:Content>
