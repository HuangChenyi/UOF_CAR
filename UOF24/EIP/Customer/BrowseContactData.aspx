<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_BrowseContactData" Title="瀏覽聯絡人資料" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="BrowseContactData.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/jscript">			
    	function CopyToClipBoard()
    	{	
    	    clipboardData.setData("Text",event.srcElement.innerText);
    	}
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class ="PopTable" cellspacing="1">
                <tr>
                    <td align="right">
                        <asp:Label ID="Label22" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label22Resource1"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="姓名:" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td colspan="2" align="left">
                        <asp:Label ID="lblName" runat="server" Width="150px" meta:resourcekey="lblNameResource1"></asp:Label>
                    </td>
                    <td align="right">
                        <asp:Label ID="lblMainContactTitle" runat="server" Text="主要聯絡人" meta:resourcekey="lblMainContactTitleResource1"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:CheckBox ID="cbIsMainContact" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label3" runat="server" Text="性別:" meta:resourcekey="Label3Resource1" ></asp:Label>
                    </td>
                    <td colspan="2" align="left">
                        <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblResource1">
                            <asp:ListItem Value="M" Selected="True" meta:resourcekey="ListItemResource1" Text="男"></asp:ListItem>
                            <asp:ListItem Value="F" meta:resourcekey="ListItemResource2" Text="女"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td align="right">
                        <asp:Label ID="Label4" runat="server" Text="生日:" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td colspan="2" align="left">
                        <telerik:RadDatePicker ID="rdDate" Runat="server" SkinID="AllowEmpty" Enabled="False" ></telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label5" runat="server" Text="單位:" meta:resourcekey="Label5Resource1"></asp:Label></td>
                    <td colspan="2" style="width:45%">
                        <asp:Label ID="lblDept" runat="server" meta:resourcekey="lblDeptResource1"></asp:Label></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label6" runat="server" Text="職稱:" meta:resourcekey="Label6Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD" style="width:45%">
                        <asp:Label ID="lblTitle" runat="server" meta:resourcekey="lblTitleResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label7" runat="server" Text="公司電話:" Width="71px" meta:resourcekey="Label7Resource1"></asp:Label></td>
                    <td colspan="2" align="left" style="width:45%">
                        <asp:Label ID="lblTel" runat="server" meta:resourcekey="lblTelResource1"></asp:Label></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label8" runat="server" Text="分機:" meta:resourcekey="Label8Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD" style="width:45%">
                        <asp:Label ID="lblExt" runat="server" meta:resourcekey="lblExtResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label23" runat="server" Text="手機:" meta:resourcekey="Label23Resource1"></asp:Label></td>
                    <td colspan="2" align="left" style="width:45%">
                        <asp:Label ID="lblPhone" runat="server" meta:resourcekey="lblPhoneResource1"></asp:Label></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label24" runat="server" Text="電子郵件:" meta:resourcekey="Label24Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD" style="width:45%">
                        <asp:Label ID="lblEmail" runat="server" meta:resourcekey="lblEmailResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label9" runat="server" Text="電子郵件1:" meta:resourcekey="Label9Resource1"></asp:Label></td>
                    <td colspan="2" align="left" style="width:45%">
                        <asp:Label ID="lblEmail1" runat="server" meta:resourcekey="lblEmail1Resource1"></asp:Label></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label10" runat="server" Text="電子郵件2:" meta:resourcekey="Label10Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD" style="width:45%">
                        <asp:Label ID="lblEmail2" runat="server" meta:resourcekey="lblEmail2Resource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label11" runat="server" Text="主管名稱:" meta:resourcekey="Label11Resource1"></asp:Label></td>
                    <td colspan="2" align="left" style="width:45%">
                        <asp:Label ID="lblDirector" runat="server" 
                            meta:resourcekey="lblDirectorResource1"></asp:Label></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label13" runat="server" Text="助理名稱:" meta:resourcekey="Label13Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD" style="width:45%">
                        <asp:Label ID="lblAssitant" runat="server" 
                            meta:resourcekey="lblAssitantResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label14" runat="server" Text="Skype:" meta:resourcekey="Label14Resource1"></asp:Label></td>
                    <td colspan="2" align="left" style="width:45%">
                        <asp:Label ID="lblSkype" runat="server" meta:resourcekey="lblSkypeResource1" ></asp:Label></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label12" runat="server" CssClass="HiddenUserUnusedColumn" Text="MSN:" meta:resourcekey="Label12Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD" style="width:45%">
                        <asp:Label ID="lblMsn" runat="server" CssClass="HiddenUserUnusedColumn" meta:resourcekey="lblMsnResource1"></asp:Label></td>
                </tr>
                <tr class="HiddenUserUnusedColumn">
                    <td align="right">
                        <asp:Label ID="Label15" runat="server" Text="YAHOO即時通:" meta:resourcekey="Label15Resource1"></asp:Label></td>
                    <td colspan="2" align="left" style="width:45%">
                        <asp:Label ID="lblYahoo" runat="server" meta:resourcekey="lblYahooResource1"></asp:Label></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label16" runat="server" Text="QQ:" meta:resourcekey="Label16Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD" style="width:45%">
                        <asp:Label ID="lblQQ" runat="server" meta:resourcekey="lblQQResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label17" runat="server" Text="公司名稱:" meta:resourcekey="Label17Resource1"></asp:Label></td>
                    <td colspan="5">
                        <asp:Label ID="lblCompName" runat="server" 
                            meta:resourcekey="lblCompNameResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label18" runat="server" Text="統一編號:" meta:resourcekey="Label18Resource1"></asp:Label></td>
                    <td colspan="2" align="left" style="width:45%">
                        <asp:Label ID="lblUnifiedID" runat="server" 
                            meta:resourcekey="lblUnifiedIDResource1" ></asp:Label></td>
                    <td align="right" class="PopTableLeftTD">
                        <asp:Label ID="Label19" runat="server" Text="公司傳真:" meta:resourcekey="Label19Resource1"></asp:Label></td>
                    <td colspan="2" align="left" class="PopTableRightTD" style="width:45%">
                        <asp:Label ID="lblFax" runat="server" meta:resourcekey="lblFaxResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label20" runat="server" Text="地址:" meta:resourcekey="Label20Resource1"></asp:Label></td>
                    <td colspan="5">
                        <asp:Label ID="lblAddr" runat="server" meta:resourcekey="lblAddrResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label21" runat="server" Text="備注:" meta:resourcekey="Label21Resource1"></asp:Label></td>
                    <td colspan="5">
                        <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Width="100%" 
                            Height="100px" ReadOnly="True" meta:resourcekey="txtRemarkResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label1" runat="server" Text="外部會員帳號:" 
                            meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td colspan="5">
                        <asp:Label ID="lblEBAccount" runat="server" 
                            meta:resourcekey="lblEBAccountResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblShowMessage" runat="server" meta:resourcekey="lblShowMessageResource1"></asp:Label>
            <asp:Label ID="lblCreateTime" runat="server" Text="建立日期:" Visible="False" meta:resourcekey="lblCreateTimeResource1"></asp:Label>
            <asp:Label ID="lblCreater" runat="server" Text="建立人:" Visible="False" meta:resourcekey="lblCreaterResource1"></asp:Label>
            <asp:Label ID="lblModifyTime" runat="server" Text="修改日期:" Visible="False" meta:resourcekey="lblModifyTimeResource1"></asp:Label>
            <asp:Label ID="lblModifier" runat="server" Text="修改人:" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
