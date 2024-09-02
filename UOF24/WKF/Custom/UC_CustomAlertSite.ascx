<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Custom_UC_CustomAlertSite" Codebehind="UC_CustomAlertSite.ascx.cs" %>

<script type="text/javascript" id="telerikClientEvents1">
    function WebImageButton_DeleteSite_Clicking(sender, args) {
        args.set_cancel(!confirm('<%=lblDelete.Text %>?'));
    }
</script>

<script id="CustomAlertSitejs" type="text/javascript">

    function UltraWebMenu1_ItemClick(menuId, itemId) {
        alert(igmenu_getItemById(itemId).getText());
    }
</script>

<div style="text-align: center">
    <table border="0" cellpadding="0" cellspacing="0" width="90%" style="margin: 0px auto; ">
        <tbody>
            <tr>
                <td align="center" style="height: 30px">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif"
                        meta:resourcekey="Image1Resource1" /></td>
            </tr>
            <tr>
                <td>
                    <div style="text-align: center">
                        <table border="0" cellpadding="1" cellspacing="1" class="PopTable" width="500px">
                            <tr>
                                <td align="center" class="PopTableLeftTD" style="height: 24px; text-align: center;" >
                                     <asp:Label ID="lblAlsetSite" runat="server" Text="知會站點" 
                                         meta:resourcekey="lblAlsetSiteResource1" ></asp:Label>
                               </td>
                            </tr>
                        </table>
                        <asp:Panel ID="PanelOperator" runat="server" Width="100%" meta:resourcekey="PanelOperatorResource1">
                            <table align="right" cellpadding="0" cellspacing="0" width="500">
                                <tr>
                                    <td align="right">
                                        <telerik:RadButton ID="WebImageButton_UPSite" runat="server" 
                                            meta:resourcekey="WebImageButton_UPSiteResource1" Text="↑" Width="20px" 
                                            OnClick="WebImageButton_UPSite_Click1">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="WebImageButton_DownSite" runat="server" Text="↓" Width="20px"
                                            meta:resourcekey="WebImageButton_DownSiteResource1" OnClick="WebImageButton_DownSite_Click1">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="WebImageButton_InsertSite" runat="server" 
                                            meta:resourcekey="WebImageButton_InsertSiteResource1" OnClick="WebImageButton_InsertSite_Click1">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="WebImageButton_ModifySite" runat="server" 
                                            meta:resourcekey="WebImageButton_ModifySiteResource1">
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="WebImageButton_DeleteSite" runat="server" 
                                            meta:resourcekey="WebImageButton_DeleteSiteResource1" OnClick="WebImageButton_DeleteSite_Click1" 
                                            OnClientClicking="WebImageButton_DeleteSite_Clicking">
                                        </telerik:RadButton>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>

<asp:Label ID="lblSite" runat="server" Text="插入站點" Visible="False" meta:resourcekey="lblSiteResource1"></asp:Label>
<asp:Label ID="lblSet" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetResource1"></asp:Label>
<asp:Label ID="lblDeleteSite" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
<asp:Label ID="lblDelete" runat="server" Text="確定刪除站點?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
<asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1"></asp:Label>
<asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblAndResource1"></asp:Label>
<asp:Label ID="lblAnd" runat="server" Text="會簽" Visible="False" meta:resourcekey="lblOrResource1"></asp:Label>
<asp:Label ID="lblAssign" runat="server" Text="指定" Visible="False" meta:resourcekey="lblAssignResource1"></asp:Label>
<asp:Label ID="lblAddCustSiteMsg" runat="server" Text="新增使用者自訂站點" Visible="False" meta:resourcekey="lblAddCustSiteMsgResource1"></asp:Label>
<asp:Label ID="lblModifyCustSiteMsg" runat="server" Text="維護使用者自訂站點" Visible="False" meta:resourcekey="lblModifyCustSiteMsgResource1"></asp:Label></div>