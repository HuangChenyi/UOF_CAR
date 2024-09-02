<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="WKF_Customer_UC_CustomFlow" Codebehind="UC_CustomFlow.ascx.cs" %>
<%@ Reference Control="~/WKF/Custom/UC_CustomSite.ascx" %>
<%@ Reference Control="~/WKF/Custom/UC_CustomAlertSite.ascx" %>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td align="center">
            <table cellpadding="0" cellspacing="0" width="100%" class="PopTable">
                <tr>
                    <td width="30%" style="height: 23px" class="PopTableLeftTD">
                        <asp:Label ID="lblFlowNameTitle" runat="server" Text="流程名稱" meta:resourcekey="lblFlowNameTitleResource1"></asp:Label></td>
                    <td width="70%" style="height: 23px" class="PopTableRightTD">
                        <table>
                            <tr>
                                <td>
                                                          <asp:TextBox ID="tbxFlowName" runat="server" Width="210px" meta:resourcekey="tbxFlowNameResource1"></asp:TextBox><asp:RequiredFieldValidator Display="Dynamic"
                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入流程名稱" ControlToValidate="tbxFlowName" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                        &nbsp; &nbsp;
                                </td>
                                <td>
                                    <telerik:RadButton ID="WebImageButton_SaveFlowName" runat="server" meta:resourcekey="WebImageButton_InsertFirstSiteResource1" OnClick="WebImageButton_SaveFlowName_Click1"></telerik:RadButton>
                                </td>

                            </tr>

                        </table>
  

                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" style="height: 80px" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 84px">
                <tr>
                    <td style="width: 33%; height: 70px"></td>
                    <td align="center" style="width: 12%; height: 70px" valign="top">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_user.gif"
                            meta:resourcekey="Image2Resource1" /></td>
                    <td style="width: 34%; height: 70px; text-align:left;" valign="bottom">&nbsp;
                        <telerik:RadButton ID="WebImageButton_InsertFirstSite" runat="server" 
                            meta:resourcekey="WebImageButton_InsertFirstSiteResource1" OnClick="WebImageButton_InsertFirstSite_Click1"></telerik:RadButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Table ID="tbSiteCollection" runat="server" meta:resourcekey="Table1Resource1"
                Width="100%">
            </asp:Table>
        </td>
    </tr>
</table>
<asp:Label ID="lblinsertConfirmStr" runat="server" meta:resourcekey="lblinsertConfirmStrResource1"
    Text="確定新增站點?" Visible="False"></asp:Label><asp:Label ID="lblInsertFirstSite" runat="server"
        meta:resourcekey="lblInsertFirstSiteResource1" Text="插入站點" Visible="False"></asp:Label>
<asp:Label ID="lblSaveFlow" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveFlowResource1"></asp:Label>
<asp:Label ID="lblAddCustSiteMsg" runat="server" Text="新增使用者自訂站點" Visible="False" meta:resourcekey="lblAddCustSiteMsgResource1"></asp:Label>
