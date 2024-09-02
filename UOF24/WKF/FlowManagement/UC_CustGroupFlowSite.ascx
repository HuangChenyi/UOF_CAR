﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_CustGroupFlowSite" Codebehind="UC_CustGroupFlowSite.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

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

<table border="0" cellpadding="0" cellspacing="0" width="90%" align="center" style="margin: 0px auto;">
    <tr>
        <td align="center" style="height: 30px; text-align: center">&nbsp;<asp:Image ID="Image1" runat="server"
            ImageUrl="~/Common/Images/Icon/icon_m54.gif" meta:resourcekey="Image1Resource1" /></td>
    </tr>
    <tr>
        <td style="height: 131px; text-align: center">
            <div style="text-align: center">
                <table id="TABLE1" runat="server" border="0" cellpadding="0" cellspacing="1" class="PopTable"
                    width="572px">
                    <tr>
                        <td align="center" class="GridHeader" style="height: 20px; text-align: center">
                            <asp:Label ID="LabelTitle" runat="server" meta:resourcekey="LabelTitleResource1"
                                Text="使用者自選流程"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" style="padding-right: 2px; padding-left: 2px; padding-bottom: 2px; padding-top: 2px; text-align: center">
                            <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                AutoGenerateColumns="False" meta:resourcekey="Grid1Resource1"
                                OnRowDataBound="Grid1_DataBound" ShowHeader="False"
                                Width="100%" DataKeyOnClientWithCheckBox="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="FlowId" meta:resourcekey="TemplateFieldResource1"
                                        Visible="False">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%#: Bind("FlowId") %>' ID="TextBox1" meta:resourceKey="TextBox1Resource1" __designer:wfdid="w11"></asp:TextBox>



                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%#: Bind("FlowId") %>' ID="LabelFlowId" meta:resourceKey="LabelFlowIdResource1" __designer:wfdid="w10"></asp:Label>



                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="分支副流程" meta:resourcekey="TemplateFieldResource2" ShowHeader="False">
                                        <ItemTemplate>
                                            &nbsp;<asp:LinkButton runat="server" ID="LinkBtnFlowName" Text='<%#: Eval("FlowName") %>' meta:resourceKey="LinkBtnFlowNameResource1" __designer:wfdid="w9"></asp:LinkButton>



                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </Fast:Grid>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="PanelOperator" runat="server" meta:resourcekey="PanelOperatorResource1"
                    Width="100%">
                    <table align="right" cellpadding="0" cellspacing="0" style="width:100%">
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
                                      
                                                <telerik:RadButton ID="WebImageButton_InsertSite" runat="server" meta:resourcekey="WebImageButton_InsertSiteResource1" OnClick="WebImageButton_InsertSite_Click1"></telerik:RadButton>
                                       
                                                <telerik:RadButton ID="WebImageButton_ModifySite" runat="server" meta:resourcekey="WebImageButton_ModifySiteResource1"></telerik:RadButton>
                                        
                                                <telerik:RadButton ID="WebImageButton_DeleteSite" runat="server" meta:resourcekey="WebImageButton_DeleteSiteResource1" OnClick="WebImageButton_DeleteSite_Click1" OnClientClicking="WebImageButton_DeleteSite_Clicking"></telerik:RadButton>
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

<asp:Label ID="lblSite" runat="server" meta:resourcekey="lblSiteResource1" Text="插入站點" Visible="False"></asp:Label>
<asp:Label ID="lblSet" runat="server" meta:resourcekey="lblSetResource1" Text="設定" Visible="False"></asp:Label>
<asp:Label ID="lblDeleteSite" runat="server" meta:resourcekey="lblDeleteSiteResource1" Text="刪除" Visible="False"></asp:Label>
<asp:Label ID="lblDelete" runat="server" meta:resourcekey="lblDeleteResource1" Text="確定刪除站點?" Visible="False"></asp:Label>
<asp:Label ID="lblGroupSiteMsg" runat="server" Text="設定使用者自選站點" Visible="False" meta:resourcekey="lblGroupSiteMsgResource1"></asp:Label>
