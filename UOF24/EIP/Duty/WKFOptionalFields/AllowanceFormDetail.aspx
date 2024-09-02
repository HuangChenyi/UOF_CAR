<%@ Page Title="新增\維護津貼" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_WKFOptionalFields_AllowanceFormDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="AllowanceFormDetail.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function rdNumApplyCountValueChanged(edit, value) {

            //Add code to handle your event here.
            var oldValue = "";
            if (value.get_oldValue() != null || value.get_oldValue() != '') {
                oldValue = value.get_oldValue();
            }

            var applyCount = value.get_newValue();
            var subTotal = $('#<%= lblSubTotal.ClientID  %>').text();
            var addtitomalAmount = $('#<%= lblAdditionalAmount.ClientID  %>').text();
            if (oldValue != applyCount) {
                //my code goes here          
                if (applyCount == '') {
                    var totledata1 = [subTotal, addtitomalAmount, "0"];
                    $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", totledata1));
                }
                else {
                    var totledata2 = [subTotal, addtitomalAmount, applyCount];
                    $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", totledata2));
                }
            }
            else {
                var totledata3 = [subTotal, addtitomalAmount, oldValue];
                $('#<%= lblTotal.ClientID  %>').text($uof.pageMethod.sync("GetTotalAmount", totledata3));
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
  <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
    <table class="PopTable" width="100%">
        <tr>
            <td nowrap="nowrap" style="width:25%">
                <asp:Label ID="Label2" runat="server" Text="津貼名稱" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAllowanceName" runat="server" 
                    meta:resourcekey="lblAllowanceNameResource1"></asp:Label>
                <telerik:RadDropDownList ID="rddlAllowanceName" runat="server"
                    AutoPostBack="true" CausesValidation="false"
                    OnSelectedIndexChanged="rddlAllowanceName_SelectedIndexChanged"
                    meta:resourcekey="rddlAllowanceNameResource1">
                </telerik:RadDropDownList>
                <asp:CustomValidator ID="cvAllowanceName" runat="server" ErrorMessage="請選擇津貼" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:CustomValidator>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="rddlAllowanceName" ErrorMessage="請選擇津貼" 
                    meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>--%>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="公司津貼金額" 
                    meta:resourcekey="Label12Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblCompantAmount" runat="server" Text="0" 
                    meta:resourcekey="lblCompantAmountResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="福委津貼金額" 
                    meta:resourcekey="Label14Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblCommitteeAmount" runat="server" Text="0" 
                    meta:resourcekey="lblCommitteeAmountResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label5" runat="server" Text="小計" 
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td nowrap="nowrap">
                <asp:Label ID="lblSubTotal" runat="server" Text="0" 
                    meta:resourcekey="lblSubTotalResource1"></asp:Label><br/>
                <asp:Label ID="Label10" runat="server" Text="小計 = 公司津貼金額 + 福委津貼金額" 
                    ForeColor="Gray" meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap" >
                <asp:Label ID="Label7" runat="server" Text="申請數量" 
                    meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td style="height: 26px">
                <asp:Label ID="lblApplyCount" runat="server" 
                    meta:resourcekey="lblApplyCountResource1"></asp:Label>
                <telerik:RadNumericTextBox ID="rdNumApplyCount" runat="server" Width="40px" MinValue="1" DataType="System.Int16">
                    <NumberFormat GroupSeparator="" DecimalDigits="0" ></NumberFormat>
                    <ClientEvents OnValueChanged="rdNumApplyCountValueChanged" OnKeyPress="NewKeyPress"/> 
                </telerik:RadNumericTextBox>
                <asp:Label ID="lblMaxCount" runat="server" 
                    meta:resourcekey="lblMaxCountResource1"></asp:Label>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="rdNumApplyCount" Display="Dynamic" ErrorMessage="必須在範圍裡" 
                    Type="Integer" meta:resourcekey="RangeValidator1Resource1"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="rdNumApplyCount" Display="Dynamic" ErrorMessage="請輸入申請數量" 
                    meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
             <td nowrap="nowrap">
                <asp:Label ID="Label1" runat="server" Text="額外補助金額" 
                     meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAdditionalAmount" runat="server" Text="0" 
                    meta:resourcekey="lblAdditionalAmountResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label8" runat="server" Text="總計" 
                    meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblTotal" runat="server" Text="0" 
                    meta:resourcekey="lblTotalResource1"></asp:Label><br/>
                <asp:Label ID="Label26" runat="server" ForeColor="Gray" 
                    Text="總計 = 小計 * 申請數量 + 額外補助金額" meta:resourcekey="Label26Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label9" runat="server" Text="發生日" 
                    meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td>
                <table width="100%">
                    <tr>
                        <td style="width:5%">
                            <telerik:RadDatePicker ID="rdActualDate" runat="server" >
                                <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                </calendar>
                                <dateinput  labelwidth="40%">
                                </dateinput>
                                <datepopupbutton hoverimageurl="" imageurl="" />
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvActualDate" runat="server" 
                            ControlToValidate="rdActualDate" Display="Dynamic" Visible="False"
                            ErrorMessage="請輸入發生日" meta:resourcekey="rfvActualDateResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label3" runat="server" Text="若申請婚禮禮金，則需填寫實際結婚日期" 
                                ForeColor="Gray" meta:resourcekey="Label3Resource1"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" ForeColor="Gray" 
                                Text="若申請教育補助，則需填寫獎學金申請學年結業日" meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label6" runat="server" Text="注意事項" 
                    meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAllowanceRemark" runat="server" 
                    meta:resourcekey="lblAllowanceRemarkResource1"></asp:Label>
            </td>
        </tr>
    </table>
        <asp:CustomValidator ID="CustomValidator1" runat="server" 
            ErrorMessage="該津貼主檔已被刪除，請重新選擇或洽系統管理員" Display="Dynamic" 
            meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:Label ID="lblSelected" runat="server" Text="請選擇" Visible="False" 
            meta:resourcekey="lblSelectedResource1"></asp:Label>
<%--    </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

