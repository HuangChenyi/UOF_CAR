<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_BranchSite" Codebehind="UC_BranchSite.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript" id="telerikClientEvents1">
    function WebImageButton_DeleteSite_Clicking(sender, args) {
        args.set_cancel(!confirm('<%=lblDelete.Text %>?'));
    }
</script>

<script id="js" type="text/javascript">
    function UltraWebMenu1_ItemClick(menuId, itemId) {
        alert(igmenu_getItemById(itemId).getText());
    }
</script>

<div style="text-align: center">
    <table border="0" cellpadding="0" cellspacing="0" width="90%" style="margin:0px auto;">
        <tr>
            <td style="height: 30px;" align="center">&nbsp;<asp:Image ID="Image1" runat="server"
                ImageUrl="~/Common/Images/Icon/icon_m54.gif" meta:resourcekey="Image1Resource1" /></td>
        </tr>
        <tr>
            <td style="height: 131px;">
                <div style="text-align: center">
                    <table align="center" width="572px" border="0" cellpadding="0" cellspacing="1" id="TABLE1" runat="server" class="PopTable">
                        <tr>
                            <td align="center" class="GridHeader" style="height: 20px; text-align: center;">
                                <asp:Label ID="LabelTitle" runat="server" meta:resourcekey="LabelTitleResource1" Text="條件式站點"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="PopTableRightTD" style="text-align: center; padding: 2px">
                                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AutoGenerateColumns="False" Width="100%" OnRowDataBound="Grid1_DataBound" ShowHeader="False" meta:resourcekey="Grid1Resource1">
                                    <Columns>
                                        <asp:BoundField DataField="CondInfo" meta:resourcekey="BoundFieldResource1">
                                            <ItemStyle Width="50%" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="FlowId" Visible="False" meta:resourcekey="TemplateFieldResource1">
                                            <EditItemTemplate>
                                                <asp:TextBox runat="server" Text='<%#: Bind("FlowId") %>' ID="TextBox1" meta:resourceKey="TextBox1Resource1" __designer:wfdid="w11"></asp:TextBox>


                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%#: Bind("FlowId") %>' ID="LabelFlowId" meta:resourceKey="LabelFlowIdResource1" __designer:wfdid="w10"></asp:Label>


                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="分支副流程" ShowHeader="False" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                &nbsp;<asp:LinkButton runat="server" ID="LinkBtnFlowName" Text='<%#: Eval("FlowName") %>' meta:resourceKey="LinkBtnFlowNameResource1" __designer:wfdid="w9"></asp:LinkButton>


                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="PanelOperator" runat="server" Width="100%" meta:resourcekey="PanelOperatorResource1">
                        <table cellpadding="0" cellspacing="0" width="500" align="right">
                            <tr>
                                <td style="text-align: right; width: 100%">
                                    <table style="width:100%">
                                        <tr>
                                            <td style="width: 1%">&nbsp;</td>
                                            <td style="text-align:right">
                                                <telerik:RadButton ID="WebImageButton_UPSite" runat="server" Text="↑" Width="20px"
                                                    meta:resourcekey="WebImageButton_UPSiteResource1" OnClick="WebImageButton_UPSite_Click1"></telerik:RadButton>
                                 
                                                <telerik:RadButton ID="WebImageButton_DownSite" runat="server" Text="↓" Width="20px" 
                                                    meta:resourcekey="WebImageButton_DownSiteResource1" OnClick="WebImageButton_DownSite_Click1"></telerik:RadButton>
                                         
                                                <telerik:RadButton ID="WebImageButton_InsertSite" runat="server" 
                                                    meta:resourcekey="WebImageButton_InsertSiteResource1" OnClick="WebImageButton_InsertSite_Click1"></telerik:RadButton>
                                          
                                                <telerik:RadButton ID="WebImageButton_ModifySite" runat="server" meta:resourcekey="WebImageButton_ModifySiteResource1"></telerik:RadButton>
                                      
                                                <telerik:RadButton ID="WebImageButton_DeleteSite" runat="server"
                                                    meta:resourcekey="WebImageButton_DeleteSiteResource1" OnClick="WebImageButton_DeleteSite_Click1" OnClientClicking="WebImageButton_DeleteSite_Clicking"></telerik:RadButton>
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
    <asp:Label ID="lblDelete" runat='server' Text="確定刪除站點?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
</div>
