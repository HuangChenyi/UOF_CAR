<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_FlowSite" Codebehind="UC_FlowSite.ascx.cs" %>

<script type="text/javascript" id="telerikClientEvents1">
    function WebImageButton_DeleteSite_Clicking(sender, args) {
        args.set_cancel(!confirm('<%=lblDelete.Text %>?'));
    }
</script>

<script id="menujs" type="text/javascript">
    function UltraWebMenu1_ItemClick(menuId, itemId) {
        alert(igmenu_getItemById(itemId).getText());
    }
</script>

<div style="text-align: center">
    <table border="0" cellpadding="0" cellspacing="0" width="90%" align="center" style="margin: 0px auto;">
        <tr>
            <td style="height: 30px" align="center">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif"
                    meta:resourcekey="Image1Resource1" /></td>
        </tr>
        <tr>
            <td style="vertical-align: middle; text-align: center">
                <div style="text-align: center;">
                    <table width="500" border="0" cellpadding="1" cellspacing="1" id="TABLE1" runat="server"
                        class="PopTable">
                        <tr>
                            <td align="center" class="PopTableLeftTD" style="width: 250; text-align: center;">
                                <asp:Label ID="lblTypeTitle" runat="server" Text="型態" meta:resourcekey="lblTypeTitleResource1"></asp:Label></td>
                            <td align="center" class="PopTableLeftTD" style="text-align: center; width: 250;">
                                <asp:Label ID="lblSubFlowTitle" runat="server" Text="流程名稱" meta:resourcekey="lblSubFlowTitleResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="center" class="PopTableRightTD" style="width: 250; vertical-align: middle; text-align: center;">
                                <asp:Label ID="lblSubFlow" runat="server" Text="副流程站點" meta:resourcekey="lblSubFlowResource1"></asp:Label></td>
                            <td align="center" class="PopTableRightTD" style="width: 250; text-align: center;">
                                <asp:Label ID="lblFlowName" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="PanelOperator" runat="server" Width="100%" meta:resourcekey="PanelOperatorResource1">
                        <table  style="width:100%;padding:0px;text-align:right" >
                            <tr>
                                <td style="text-align: right; width: 100%">
                                    <table style="width:100%">
                                        <tr>
                                            <td style="width: 1%">&nbsp;</td>
                                            <td style="text-align:right">
                                                <telerik:RadButton ID="WebImageButton_UPSite" runat="server" 
                                                    Text="↑" Width="20px" meta:resourcekey="WebImageButton_UPSiteResource1" OnClick="WebImageButton_UPSite_Click1"></telerik:RadButton>
                                       
                                                <telerik:RadButton ID="WebImageButton_DownSite" runat="server"
                                                    Text="↓" Width="20px" meta:resourcekey="WebImageButton_DownSiteResource1" OnClick="WebImageButton_DownSite_Click1"></telerik:RadButton>
                                           
                                                <telerik:RadButton ID="WebImageButton_InsertSite" runat="server" 
                                                    meta:resourcekey="WebImageButton_InsertSiteResource1" OnClick="WebImageButton_InsertSite_Click1"></telerik:RadButton>
                                           
                                                <telerik:RadButton ID="WebImageButton_ModifySite" runat="server" 
                                                    meta:resourcekey="WebImageButton_ModifySiteResource1"></telerik:RadButton>
                                        
                                                <telerik:RadButton ID="WebImageButton_DeleteSite" runat="server" 
                                                    meta:resourcekey="WebImageButton_DeleteSiteResource1" OnClientClicking="WebImageButton_DeleteSite_Clicking" OnClick="WebImageButton_DeleteSite_Click1"></telerik:RadButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblDelete" runat="server" Text="確定刪除站點?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblSite" runat="server" Text="插入站點" Visible="False" meta:resourcekey="lblSiteResource1"></asp:Label>
    <asp:Label ID="lblSet" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetResource1"></asp:Label>
    <asp:Label ID="lblDeleteSite" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
</div>
