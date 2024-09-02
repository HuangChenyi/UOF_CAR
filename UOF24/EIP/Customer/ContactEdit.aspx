<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_ContactEdit" Title="編輯聯絡人資料" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ContactEdit.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        //去除字串左邊的空白虛格
        function ltrim(instr) {
            return instr.replace(/^[\s]*/gi, "");
        }

        //去除字串右邊的空白虛格
        function rtrim(instr) {
            return instr.replace(/[\s]*$/gi, "");
        }

        //去除字串前後的空白虛格
        function trim(instr) {
            instr = ltrim(instr);
            instr = rtrim(instr);
            return instr;
        }

        //點選同公司地址按鈕,複製到聯絡人地址
        function lbtnComAddress() {
            var CompanyAddress = $uof.tool.htmlDecode( $('#<%=lblCompanyAddress.ClientID %>').html());
            var ContactAddress = $('#<%=txtAddr.ClientID %>');
            ContactAddress.val(CompanyAddress);
        }

        //點選同發票地址按鈕,複製到聯絡人地址
        function lbtnInvoiceAddress() {
            var InvoiceAddress = $uof.tool.htmlDecode( $('#<%=lblInvoiceAddress.ClientID %>').html());
    var ContactAddress = $('#<%=txtAddr.ClientID %>');
    ContactAddress.val(InvoiceAddress);
}
//點選同公司電話1,複製到聯絡人電話
function lbtnTEL1() {
    var TEL1 = $uof.tool.htmlDecode( $('#<%=lblTEL1.ClientID %>').html());
    var TEL = $('#<%=txtTel.ClientID %>');
    TEL.val(TEL1);
}

//點選同公司電話2,複製到聯絡人電話
function lbtnTEL2() {
    var TEL2 = $uof.tool.htmlDecode( $('#<%=lblTEL2.ClientID %>').html());
    var TEL = $('#<%=txtTel.ClientID %>');
    TEL.val(TEL2);
}

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" cellspacing="1" style="width: 100%;">
                <tr>
                    <td align="right">
                        <asp:Label ID="Label22" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label22Resource1"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="姓名" meta:resourcekey="Label2Resource1"></asp:Label></td>
                    <td colspan="2">
                        <asp:TextBox ID="txtName" runat="server" Width="150px" MaxLength="50" meta:resourcekey="txtNameResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfCheckName" runat="server" ControlToValidate="txtName" ErrorMessage="請輸入姓名" Display="Dynamic" meta:resourcekey="rfCheckNameResource1"></asp:RequiredFieldValidator>
                    </td>
                    <td align="right">
                        <asp:Label ID="lblMainContactTitle" runat="server" Text="主要聯絡人" meta:resourcekey="lblMainContactTitleResource1"></asp:Label></td>
                    <td colspan="2">
                        <asp:CheckBox ID="cbIsMainContact" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="white-space: nowrap;">
                        <asp:Label ID="Label3" runat="server" Text="性別" meta:resourcekey="Label3Resource1"></asp:Label></td>
                    <td colspan="2">
                        <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal"
                            meta:resourcekey="rblResource1">
                            <asp:ListItem Value="M" meta:resourcekey="ListItemResource1" Text="男"></asp:ListItem>
                            <asp:ListItem Value="F" meta:resourcekey="ListItemResource2" Text="女"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td align="right" style="white-space: nowrap;">
                        <asp:Label ID="Label4" runat="server" Text="生日" meta:resourcekey="Label4Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD">
                        <telerik:RadDatePicker ID="rdDate" runat="server" Width="150px" SkinID="AllowEmpty"></telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label5" runat="server" Text="單位:" meta:resourcekey="Label5Resource1"></asp:Label></td>
                    <td colspan="2" style="width: 45%">
                        <asp:TextBox ID="txtDept" runat="server" Width="100%" MaxLength="50"
                            meta:resourcekey="txtDeptResource1"></asp:TextBox></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label6" runat="server" Text="職稱" meta:resourcekey="Label6Resource1"></asp:Label></td>
                    <td colspan="2" class="PopTableRightTD" align="left" style="width: 45%">
                        <asp:TextBox ID="txtTitle" runat="server" Width="100%" MaxLength="50"
                            meta:resourcekey="txtTitleResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label7" runat="server" Text="公司電話" meta:resourcekey="Label7Resource1"></asp:Label></td>
                    <td colspan="2" style="width: 45%">
                        <asp:LinkButton ID="lbtnTel1" runat="server" CausesValidation="False"
                            meta:resourcekey="lbtnTel1Resource1" Text="同公司電話1"></asp:LinkButton>
                        <asp:LinkButton ID="lbtnTel2" runat="server" CausesValidation="False"
                            meta:resourcekey="lbtnTel2Resource1" Text="同公司電話2"></asp:LinkButton>
                        <asp:TextBox ID="txtTel" runat="server" Width="66%" MaxLength="50"
                            meta:resourcekey="txtTelResource1"></asp:TextBox></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label8" runat="server" Text="分機" meta:resourcekey="Label8Resource1"></asp:Label></td>
                    <td colspan="2" class="PopTableRightTD" align="left" style="width: 45%">
                        <asp:TextBox ID="txtExt" runat="server" Width="100%" MaxLength="10"
                            meta:resourcekey="txtExtResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label23" runat="server" Text="手機" meta:resourcekey="Label23Resource1"></asp:Label></td>
                    <td colspan="2" align="left" style="width: 45%">
                        <asp:TextBox ID="txtPhone" runat="server" Width="100%" MaxLength="50"
                            meta:resourcekey="txtPhoneResource1"></asp:TextBox></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label24" runat="server" Text="電子郵件" meta:resourcekey="Label24Resource1"></asp:Label></td>
                    <td colspan="2" class="PopTableRightTD" align="left" style="width: 45%">
                        <asp:TextBox ID="txtEmail" runat="server" Width="100%" MaxLength="50" meta:resourcekey="txtEmailResource1"></asp:TextBox>
                        <asp:CustomValidator ID="cvValidatorEmail" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmail_ServerValidate" meta:resourcekey="cvValidatorEmailResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label9" runat="server" Text="電子郵件1" meta:resourcekey="Label9Resource1"></asp:Label></td>
                    <td colspan="2" style="width: 45%">
                        <asp:TextBox ID="txtEmail1" runat="server" Width="100%" MaxLength="50" meta:resourcekey="txtEmail1Resource1"></asp:TextBox>
                        <asp:CustomValidator ID="cvValidatorEmailA" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailA_ServerValidate" meta:resourcekey="cvValidatorEmailAResource1"></asp:CustomValidator>
                    </td>
                    <td align="right" class="PopTableLeftTD" style="white-space: nowrap;">
                        <asp:Label ID="Label10" runat="server" Text="電子郵件2" meta:resourcekey="Label10Resource1"></asp:Label></td>
                    <td colspan="2" class="PopTableRightTD" align="left" style="width: 45%">
                        <asp:TextBox ID="txtEmail2" runat="server" Width="100%" MaxLength="50" meta:resourcekey="txtEmail2Resource1"></asp:TextBox>
                        <asp:CustomValidator ID="cvValidatorEmailB" runat="server" ErrorMessage="格式不正確" Display="Dynamic" OnServerValidate="cvValidatorEmailB_ServerValidate" meta:resourcekey="cvValidatorEmailBResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label11" runat="server" Text="主管名稱" meta:resourcekey="Label11Resource1"></asp:Label></td>
                    <td colspan="2" style="width: 45%">
                        <asp:TextBox ID="txtDirector" runat="server" Width="100%" MaxLength="50"
                            meta:resourcekey="txtDirectorResource1"></asp:TextBox></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label13" runat="server" Text="助理名稱" meta:resourcekey="Label13Resource1"></asp:Label></td>
                    <td colspan="2" class="PopTableRightTD" align="left" style="width: 45%">
                        <asp:TextBox ID="txtAssistant" runat="server" Width="100%" MaxLength="50"
                            meta:resourcekey="txtAssistantResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label14" runat="server" Text="Skype" meta:resourcekey="Label14Resource1"></asp:Label></td>
                    <td colspan="2" style="width: 45%">
                        <asp:TextBox ID="txtSkype" runat="server" Width="100%" MaxLength="50"
                            meta:resourcekey="txtSkypeResource1"></asp:TextBox></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label12" runat="server" CssClass="HiddenUserUnusedColumn" Text="MSN" meta:resourcekey="Label12Resource1"></asp:Label></td>
                    <td colspan="2" class="PopTableRightTD" align="left" style="width: 45%">
                        <asp:TextBox ID="txtMsn" runat="server" CssClass="HiddenUserUnusedColumn" Width="100%" MaxLength="50"
                            meta:resourcekey="txtMsnResource1"></asp:TextBox></td>
                </tr>
                <tr class="HiddenUserUnusedColumn">
                    <td align="right" style="white-space: nowrap">
                        <asp:Label ID="Label15" runat="server" Text="YAHOO即時通" meta:resourcekey="Label15Resource1"></asp:Label></td>
                    <td colspan="2" style="width: 45%">
                        <asp:TextBox ID="txtYahoo" runat="server" Width="100%" MaxLength="50"
                            meta:resourcekey="txtYahooResource1"></asp:TextBox></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label16" runat="server" Text="QQ" meta:resourcekey="Label16Resource1"></asp:Label></td>
                    <td colspan="2" class="PopTableRightTD" align="left" style="width: 45%">
                        <asp:TextBox ID="txtQQ" runat="server" Width="100%" MaxLength="50"
                            meta:resourcekey="txtQQResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label17" runat="server" Text="公司名稱" meta:resourcekey="Label17Resource1"></asp:Label></td>
                    <td colspan="5" rowspan="1">
                        <asp:Label ID="lblCompName" runat="server"
                            meta:resourcekey="lblCompNameResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label18" runat="server" Text="統一編號" meta:resourcekey="Label18Resource1"></asp:Label></td>
                    <td colspan="2" style="width: 45%">
                        <asp:Label ID="lblUnifiedID" runat="server"
                            meta:resourcekey="lblUnifiedIDResource1"></asp:Label></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label19" runat="server" Text="公司傳真" meta:resourcekey="Label19Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD" style="width: 45%">
                        <asp:TextBox ID="txtFax" runat="server" Width="100%" MaxLength="50"
                            meta:resourcekey="txtFaxResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label20" runat="server" Text="地址" meta:resourcekey="Label20Resource1"></asp:Label></td>
                    <td colspan="5">
                        <asp:LinkButton ID="lbtnComAddress" runat="server" CausesValidation="False"
                            meta:resourcekey="lbtnComAddressResource1" Text="同公司地址"></asp:LinkButton>
                        <asp:LinkButton ID="lbtnInvoiceAddress" runat="server" CausesValidation="False"
                            meta:resourcekey="lbtnInvoiceAddressResource1" Text="同發票地址"></asp:LinkButton>
                        <asp:TextBox ID="txtAddr" runat="server" Width="100%" MaxLength="255"
                            meta:resourcekey="txtAddrResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label21" runat="server" Text="備註" meta:resourcekey="Label21Resource1"></asp:Label></td>
                    <td colspan="5">
                        <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Width="100%"
                            Height="100px" meta:resourcekey="txtRemarkResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label1" runat="server" Text="外部會員帳號" meta:resourcekey="Label1Resource1"></asp:Label></td>
                    <td colspan="5">
                        <asp:Label ID="lblEBAccount" runat="server" meta:resourcekey="lblEBAccountResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblShowMessage" runat="server" Visible="False" meta:resourcekey="lblShowMessageResource1"></asp:Label>            
            <asp:Label ID="lblEmpty" runat="server" Text="請輸入姓名" Visible="False" meta:resourcekey="lblEmptyResource1"></asp:Label>           
            <asp:Label ID="lblCreateTime" runat="server" Text="建立日期:" Visible="False" meta:resourcekey="lblCreateTimeResource1"></asp:Label>
            <asp:Label ID="lblCreater" runat="server" Text="建立人:" Visible="False" meta:resourcekey="lblCreaterResource1"></asp:Label>
            <asp:Label ID="lblModifyTime" runat="server" Text="修改日期:" Visible="False" meta:resourcekey="lblModifyTimeResource1"></asp:Label>
            <asp:Label ID="lblModifier" runat="server" Text="修改人:" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
            <div style="visibility: hidden">
                <asp:Label ID="lblCompanyAddress" runat="server" meta:resourcekey="lblCompanyAddressResource1"></asp:Label>
                <asp:Label ID="lblInvoiceAddress" runat="server" meta:resourcekey="lblInvoiceAddressResource1"></asp:Label>
                <asp:Label ID="lblTEL1" runat="server" meta:resourcekey="lblTEL1Resource1"></asp:Label>
                <asp:Label ID="lblTEL2" runat="server" meta:resourcekey="lblTEL2Resource1"></asp:Label>
            </div>
            <asp:Label ID="lblPublish" runat="server" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

