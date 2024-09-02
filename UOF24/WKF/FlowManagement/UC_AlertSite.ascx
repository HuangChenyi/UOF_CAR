<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_AlertSite" Codebehind="UC_AlertSite.ascx.cs" %>

<script type="text/javascript" id="telerikClientEvents1">
//<![CDATA[

	function WebImageButton_DeleteSite_Clicking(sender,args)
	{
	    args.set_cancel(!confirm('<%=lblDelete.Text %>?'));
	}
//]]>
</script>

<script type="text/javascript">

    //<!--

    function UltraWebMenu1_ItemClick(menuId, itemId) {
        alert(igmenu_getItemById(itemId).getText());
    }
    // -->
</script>

<table border="0" cellpadding="0" cellspacing="0" width="90%" align="center" style="margin: 0px auto; ">
    <tr>
        <td align="center" style="height: 30px">&nbsp;<asp:Image ID="Image1" runat="server"
            ImageUrl="~/Common/Images/Icon/icon_m54.gif" meta:resourcekey="Image1Resource1"/></td>
    </tr>
    <tr>
        <td style="height: 100px">
            <div style="text-align: center">
                <table id="TABLE1" runat="server" border="0" cellpadding="0" cellspacing="1" class="PopTable"
                    width="572">
                    <tr>
                        <td align="center" class="PopTableLeftTD" style="height: 20px; text-align: center">
                            <asp:Label ID="LabelTitle" runat="server"
                                Text="知會站點" meta:resourcekey="LabelTitleResource1"></asp:Label></td>
                    </tr>
                </table>
                <asp:Panel ID="PanelOperator" runat="server"
                    Width="100%" meta:resourcekey="PanelOperatorResource1">
                    <table  style="width:100%;text-align:right;padding:0px" >
                        <tr>
                            <td style="text-align: right; width: 100%">
                                <table style="width:100%">
                                    <tr>
                                        <td style="width: 1%"></td>
                                        <td style="text-align:right">
                                            <telerik:RadButton ID="WebImageButton_UPSite" runat="server" Text="↑" Width="20px"
                                                 OnClick="WebImageButton_UPSite_Click1" meta:resourcekey="WebImageButton_UPSiteResource1" ></telerik:RadButton>
                                    
                                            <telerik:RadButton ID="WebImageButton_DownSite" runat="server" 
                                                 Text="↓" Width="20px" OnClick="WebImageButton_DownSite_Click1" meta:resourcekey="WebImageButton_DownSiteResource1"></telerik:RadButton>
                                   
                                            <telerik:RadButton ID="WebImageButton_InsertSite" runat="server"
                                                OnClick="WebImageButton_InsertSite_Click1" meta:resourcekey="WebImageButton_InsertSiteResource1"></telerik:RadButton>
                               
                                            <telerik:RadButton ID="WebImageButton_ModifySite" runat="server" meta:resourcekey="WebImageButton_ModifySiteResource1"></telerik:RadButton>
                             
                                            <telerik:RadButton ID="WebImageButton_DeleteSite" runat="server" OnClick="WebImageButton_DeleteSite_Click1" OnClientClicking="WebImageButton_DeleteSite_Clicking" meta:resourcekey="WebImageButton_DeleteSiteResource1"></telerik:RadButton>
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

<asp:Label ID="lblSite" runat="server" Text="插入站點" Visible="False" meta:resourcekey="lblSiteResource1"></asp:Label>
<asp:Label ID="lblSet" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetResource1"></asp:Label>
<asp:Label ID="lblDeleteSite" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteSiteResource1"></asp:Label>
<asp:Label ID="lblDelete" runat="server" Text="確定刪除站點?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>