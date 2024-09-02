<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_SubFlow" Codebehind="UC_SubFlow.ascx.cs" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_SignableSite_Sub.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_CustDesignFlowSite.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_FieldSite_Sub.ascx" %>
<%@ Reference Control="~/WKF/FlowManagement/UC_AlertSite.ascx" %>

<script type="text/javascript" id="telerikClientEvents1">
//<![CDATA[

    function WebImageButton_InsertFirstSite_Clicking(sender, args) {
        args.set_cancel(!confirm('<%=insertConfirmStr %>?'));

    }
//]]>
</script>

<div style="text-align: center; width:100%">
    
        <table style=" width:100%; border:0;"  cellpadding="0" cellspacing="0"  >
            <tr>
                <td align="center"></td>
            </tr>
            <tr>
                <td align="center" style="height: 80px; width:100%" valign="top">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 84px;">
                        <tr>
                            <td style="width: 40%; height: 70px;"></td>
                            <td align="center" style="width: 20%; height: 70px;" valign="top">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_user.gif"
                                    meta:resourcekey="Image1Resource1" /></td>
                            <td style="width: 40%; height: 70px;" valign="bottom">&nbsp;
                                <telerik:RadButton ID="WebImageButton_InsertFirstSite" runat="server" 
                                      meta:resourcekey="WebImageButton_InsertFirstSiteResource1" OnClick="WebImageButton_InsertFirstSite_Click1" OnClientClicking="WebImageButton_InsertFirstSite_Clicking" ></telerik:RadButton>
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text="請注意！副流程不允許沒有站點，請新增站點否則此流程將無使用權限！"
                        meta:resourcekey="lblErrorMsgResource1" Visible="False"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Table ID="Table1" runat="server" Width="100%" meta:resourcekey="Table1Resource1" EnableViewState="false" >
                    </asp:Table>
                    <br />
                </td>
            </tr>
        </table>
        
        <asp:Label ID="lblinsertConfirmStr" runat="server" Text="確定新增站點?" Visible="False"
            meta:resourcekey="lblinsertConfirmStrResource1"></asp:Label>
        <asp:Label ID="lblInsertFirstSite" runat="server" Text="新增站點" Visible="False" meta:resourcekey="lblInsertFirstSiteResource1"></asp:Label>
   
</div>
