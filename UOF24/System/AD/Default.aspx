<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_AD_Default" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class=PopTable width="100%">
        <tr>
            <td colspan="4" class="PopTableHeader" style="text-align: center; width:25%;">
            <center>
                <asp:Label ID="lbADServerConfig" runat="server" Text="Active Directory Server 設定" meta:resourcekey="lbADServerConfigResource1"></asp:Label>&nbsp;
                </center>
                </td>
        </tr>
        <tr>
            <td style="width:25%">
            </td>
            <td >
                <asp:CheckBox ID="cbADEnable" runat="server"  Text = "啟用" 
                    meta:resourcekey="cbADEnableResource1" 
                    oncheckedchanged="cbADEnable_CheckedChanged"/></td>
            <td style="width:25%">
            </td>
            <td style="width:25%">
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font><asp:Label ID="lbEmplADServer" runat="server" Text="內部員工AD Server" meta:resourcekey="lbEmplADServerResource1"></asp:Label></td>
            <td >
                <asp:TextBox ID="txtEmplADServer" runat="server" meta:resourcekey="txtEmplADServerResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvEmplADServer" runat="server" ControlToValidate="txtEmplADServer"
                    Display="Dynamic" ErrorMessage="請輸入AD Server" meta:resourcekey="rvEmplADServerResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvEmplADServerLinkErr" runat="server" Display="Dynamic"
                    ErrorMessage="AD Server連線失敗" meta:resourcekey="cvEmplADServerLinkErrResource1"
                    OnServerValidate="cvEmplADServerLinkErr_ServerValidate"></asp:CustomValidator></td>
            <td ></td>
            <td ></td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font><asp:Label ID="lblEmplADUserName" runat="server" Text="連線帳號" meta:resourcekey="lblEmplADUserNameResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtEmplADUserName" runat="server" meta:resourcekey="txtEmplADUserNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvEmplADUserName" runat="server" ControlToValidate="txtEmplADUserName"
                    Display="Dynamic" ErrorMessage="請輸入連線帳號" meta:resourcekey="rvEmplADUserNameResource1"></asp:RequiredFieldValidator></td>
            <td>
                <asp:Label ID="lblEmplADpw" runat="server" Text="連線密碼" meta:resourcekey="lblEmplADpwResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtEmplADpw" runat="server" TextMode ="Password" autocomplete="off" meta:resourcekey="txtEmplADpwResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font><asp:Label ID="lbMembADServer" runat="server" Text="外部會員AD Server" meta:resourcekey="lbMembADServerResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtMembADServer" runat="server" meta:resourcekey="txtMembADServerResource1"></asp:TextBox>
                <asp:CheckBox ID="cbShareAD" runat="server" AutoPostBack="True" OnCheckedChanged="cbShareAD_CheckedChanged"
                    Text="AD Server 同上" meta:resourcekey="cbShareADResource1" />
                <asp:RequiredFieldValidator ID="rvMembADServer" runat="server" ControlToValidate="txtMembADServer"
                    Display="Dynamic" ErrorMessage="請輸入AD Server" meta:resourcekey="rvMembADServerResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvMembADServerLinkErr" runat="server" Display="Dynamic"
                    ErrorMessage="AD Server連線失敗" meta:resourcekey="cvMembADServerLinkErrResource1"
                    OnServerValidate="cvMembADServerLinkErr_ServerValidate"></asp:CustomValidator></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td style="height: 21px">
                <font color="red">*</font><asp:Label ID="lblMembADUserName" runat="server" Text="連線帳號" meta:resourcekey="lblMembADUserNameResource1"></asp:Label></td>
            <td style="height: 21px">
                <asp:TextBox ID="txtMembADUserName" runat="server" meta:resourcekey="txtMembADUserNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvMembADUserName" runat="server" ControlToValidate="txtMembADUserName"
                    Display="Dynamic" ErrorMessage="請輸入連線帳號" meta:resourcekey="rvMembADUserNameResource1"></asp:RequiredFieldValidator></td>
            <td style="height: 21px">
                <asp:Label ID="lblMembADpw" runat="server" Text="連線密碼" meta:resourcekey="lblMembADpwResource1"></asp:Label></td>
            <td style="height: 21px">
                <asp:TextBox ID="txtMembADpw" runat="server" TextMode ="Password" meta:resourcekey="txtMembADpwResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center" class="PopTableHeader">
            <center>
                <asp:Label ID="lbColumnMapping" runat="server" Text="欄位對應" meta:resourcekey="lbColumnMappingResource1"></asp:Label>
                </center>
                </td>
        </tr>
        <tr>
            <td style="height: 24px">
                <asp:Label ID="lblAccount" runat="server" Text="帳號" meta:resourcekey="lblAccountResource1"></asp:Label></td>
            <td style="height: 24px">
                <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" meta:resourcekey="DropDownList1Resource1">
                    <asp:ListItem meta:resourcekey="ListItemResource1" Text="帳號"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="height: 24px">
            </td>
            <td style="height: 24px">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbUserName" runat="server" Text="名稱" meta:resourcekey="lbUserNameResource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlUserName" runat="server" meta:resourcekey="ddlUserNameResource1">
                </asp:DropDownList></td>
            <td>
                <asp:Label ID="lblEmail" runat="server" Text="電子郵件" meta:resourcekey="lblEmailResource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" Enabled="False" meta:resourcekey="DropDownList2Resource1">
                    <asp:ListItem meta:resourcekey="ListItemResource2" Text="電子郵件"></asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 21px; text-align: center">
                <asp:Label ID="lblEmpl" runat="server" Text="內部員工欄位" meta:resourcekey="lblEmplResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbEmplMobile" runat="server" Text="行動電話" meta:resourcekey="lbEmplMobileResource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlEmplMobile" runat="server" meta:resourcekey="ddlEmplMobileResource1">
                </asp:DropDownList></td>
            <td>
                <asp:Label ID="lbEmplEmergency" runat="server" Text="緊急電話" meta:resourcekey="lbEmplEmergencyResource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlEmplEmergency" runat="server" meta:resourcekey="ddlEmplEmergencyResource1">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbEmplExtNum" runat="server" Text="分機" meta:resourcekey="lbEmplExtNumResource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlEmplExtNum" runat="server" meta:resourcekey="ddlEmplExtNumResource1">
                </asp:DropDownList></td>
            <td>
                <asp:Label ID="lbEmplSignature" runat="server" Text="簽名" meta:resourcekey="lbEmplSignatureResource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlEmplSignature" runat="server" meta:resourcekey="ddlEmplSignatureResource1">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbEmplAddress" runat="server" Text="地址" meta:resourcekey="lbEmplAddressResource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlEmplAddress" runat="server" meta:resourcekey="ddlEmplAddressResource1">
                </asp:DropDownList></td>
            <td>
                <asp:Label ID="lblEmplBlog" runat="server" Text="BLOG" meta:resourcekey="lblEmplBlogResource1"></asp:Label>
                </td>
            <td>
                <asp:DropDownList ID="ddlEmplBlog" runat="server" meta:resourcekey="DropDownList3Resource1">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 21px; text-align: center">
                <asp:Label ID="lblMemb" runat="server" Text="外部會員欄位" meta:resourcekey="lblMembResource1"></asp:Label></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lbMembCompanyName" runat="server" Text="公司名稱" meta:resourcekey="lbMembCompanyNameResource1"></asp:Label></td>
            <td >
                <asp:DropDownList ID="ddlMembCompanyName" runat="server" meta:resourcekey="ddlMembCompanyNameResource1">
                </asp:DropDownList></td>
            <td >
                <asp:Label ID="lblMembCompanyAddress" runat="server" Text="公司地址" meta:resourcekey="lblMembCompanyAddressResource1"></asp:Label></td>
            <td >
                <asp:DropDownList ID="ddlMembCompanyAddress" runat="server" meta:resourcekey="ddlMembCompanyAddressResource1">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMembPhone" runat="server" Text="電話" meta:resourcekey="lblMembPhoneResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlMembPhone" runat="server" meta:resourcekey="ddlMembPhoneResource1">
                </asp:DropDownList></td>
            <td>
                <asp:Label ID="lblMembExtNum" runat="server" Text="分機" meta:resourcekey="lblMembExtNumResource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlMembExtNum" runat="server" meta:resourcekey="ddlMembExtNumResource1">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lbMembCompanyFax" runat="server" Text="公司傳真" meta:resourcekey="lbMembCompanyFaxResource1"></asp:Label></td>
            <td >
                <asp:DropDownList ID="ddlMembCompanyFax" runat="server" meta:resourcekey="ddlMembCompanyFaxResource1">
                </asp:DropDownList></td>
            <td >
                <asp:Label ID="lblMembSignature" runat="server" Text="簽名" meta:resourcekey="lblMembSignatureResource1"></asp:Label></td>
            <td >
                <asp:DropDownList ID="ddlMembSignature" runat="server" meta:resourcekey="ddlMembSignatureResource1">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center; height: 36px;">
                <telerik:RadButton ID="rbtnSave" runat="server" Text="儲存" 
                    meta:resourcekey="btSaveResource1" onclick="rbtnSave_Click">
                </telerik:RadButton>
                <asp:Label ID="lblSaveSuccess" runat="server" CssClass="SizeSB" ForeColor="Blue"
                    Text="儲存成功" Visible="False" meta:resourcekey="lblSaveSuccessResource1"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

