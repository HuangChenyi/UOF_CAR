<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_CustomMenu_AddParameter" Title="新增參數" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="AddParameter.aspx.cs" %>
   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td style="white-space:nowrap">
                <span style="color: #FF0000">*</span><asp:Label ID="Label1" runat="server" 
                    Text="參數名稱" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength="50" 
                    meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtName" Display="Dynamic" ErrorMessage="請輸入參數名稱" 
                    SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" 
                    ControlToValidate="txtName" Display="Dynamic" ErrorMessage="名稱重覆,請重新輸入" 
                    ClientValidationFunction="CheckParaName" SetFocusOnError="True" 
                    meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="資料來源" 
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButton ID="rbSource1" runat="server" GroupName="type" 
                    Text="資料庫-人員欄位" meta:resourcekey="rbSource1Resource1" />
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:ListBox ID="lbColumn" runat="server" meta:resourcekey="lbColumnResource1">
                        <asp:ListItem Value="ACCOUNT" meta:resourcekey="ListItemResource1">帳號(Account)</asp:ListItem>
                        <asp:ListItem Value="NAME" meta:resourcekey="ListItemResource2">姓名(Name))</asp:ListItem>
                        <asp:ListItem Value="EMAIL" meta:resourcekey="ListItemResource3">電子郵件(EMAIL)</asp:ListItem>
                        <asp:ListItem Value="SID" meta:resourcekey="ListItemResource4">身分證字號(SID)</asp:ListItem>
                        <asp:ListItem Value="OPTION1" meta:resourcekey="ListItemResource5">Option(Option1)</asp:ListItem>
                        <asp:ListItem Value="OPTION2" meta:resourcekey="ListItemResource6">Option(Option2)</asp:ListItem>
                        <asp:ListItem Value="OPTION3" meta:resourcekey="ListItemResource7">Option(Option3)</asp:ListItem>
                        <asp:ListItem Value="OPTION4" meta:resourcekey="ListItemResource8">Option(Option4)</asp:ListItem>
                        <asp:ListItem Value="OPTION5" meta:resourcekey="ListItemResource9">Option(Option5)</asp:ListItem>
                        <asp:ListItem Value="OPTION6" meta:resourcekey="ListItemResource10">Option(Option6)</asp:ListItem>
                        <asp:ListItem Value="PERSONAL1" meta:resourcekey="ListItemResource14">Personal(Personal1)</asp:ListItem>
                        <asp:ListItem Value="PERSONAL2" meta:resourcekey="ListItemResource15">Personal(Personal2)</asp:ListItem>
                        <asp:ListItem Value="PERSONAL3" meta:resourcekey="ListItemResource16">Personal(Personal3)</asp:ListItem>
                        <asp:ListItem Value="PERSONAL4" meta:resourcekey="ListItemResource17">Personal(Personal4)</asp:ListItem>
                        <asp:ListItem Value="PERSONAL5" meta:resourcekey="ListItemResource18">Personal(Personal5)</asp:ListItem>
                        <asp:ListItem Value="PERSONAL6" meta:resourcekey="ListItemResource19">Personal(Personal6)</asp:ListItem>
                </asp:ListBox>
                <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" 
                    ErrorMessage="請選擇欄位" onservervalidate="CustomValidator4_ServerValidate" 
                    meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                <br />
                <asp:RadioButton ID="rbSource2" runat="server" Text="系統時間" GroupName="type" 
                    meta:resourcekey="rbSource2Resource1"  />
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlFormat" runat="server" 
                    meta:resourcekey="ddlFormatResource1">
                    <asp:ListItem Value="yyyyMMdd" meta:resourcekey="ListItemResource11">年月日(yyyyMMdd)</asp:ListItem>
                    <asp:ListItem Value="HHmmss" meta:resourcekey="ListItemResource12">時分秒(HHmmss)</asp:ListItem>
                    <asp:ListItem Value="yyyyMMddHHmmss" meta:resourcekey="ListItemResource13">年月日時分秒(yyyyMMddHHmmss)</asp:ListItem>
                </asp:DropDownList>
                <br />
                 <asp:RadioButton ID="rbSource3" runat="server" Text="固定值" GroupName="type" 
                    meta:resourcekey="rbSource3Resource1"  />
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtFixedValue" runat="server" 
                    meta:resourcekey="txtFixedValueResource1"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" 
                    ErrorMessage="請輸入內容" onservervalidate="CustomValidator1_ServerValidate" 
                    SetFocusOnError="True" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                <br />
                <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" 
                    ErrorMessage="請至少選擇一個資料來源" 
                    onservervalidate="CustomValidator3_ServerValidate" 
                    meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label2" runat="server" Text="啟用加密" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                
                <asp:CheckBox ID="cbEncryption" runat="server" 
                    meta:resourcekey="cbEncryptionResource1" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Downloads.aspx" 
                    Target="_blank" Text="下載加解密範例" meta:resourcekey="HyperLink1Resource1"></asp:HyperLink>
            </td>
        </tr>
      
    </table>

    <input type="hidden" name="CurrentParameterNames" id="CurrentParameterNames" runat="server" />
    <script>



        function CheckParaName(src,args)
        {
            var orgName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(orgName,true)%>');;
            var isExists = window.parent.parent.CheckParameterName(args.Value, orgName);
            if(isExists)
            {
                args.IsValid=false;
            }

            if ($get('<%=CurrentParameterNames.ClientID %>').value.indexOf("{" + args.Value + "}") > -1) 
            {
                args.IsValid = false;
            }
        }
    </script>
</asp:Content>
