<%@ Control Language="C#" AutoEventWireup="true" Inherits="Basic_Personal_PrivateMessage_UC_MessageClassList" Codebehind="UC_MessageClassList.ascx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script id="script" type="text/javascript">
    function SetListBarVisible_<%=RadTreeView1.ClientID %>(isVisible)
   {
        var tree = $("#<%=RadTreeView1.ClientID %>");
       if(tree != null)
      {  
           if(isVisible == 'true') 
           {
                tree.style.display='';
           } 
           else
           {
                tree.style.display='none';
           } 
      } 
    }   
</script>
    
<div id='divTree<%=RadTreeView1.ClientID %>'>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td width="190" height="30" >
                            <div class="LeftPaneTitle"><asp:Label ID="Label1" runat="server"  Text="歸檔類別列表" 
                                            meta:resourcekey="Label1Resource1" ></asp:Label></div>
                        </td>
                    </tr>
                    <tr>
                        <td height="500" valign="top" background="<%=themePath %>/images/tree_bg.gif" width="100%">
                            <table width="100%" border="0" height="100%" cellpadding="5" cellspacing="3">
                                <tr>
                                    <td style=" text-align:left; vertical-align:top;">
                                        <telerik:RadTreeView   ShowLineImages="False" ID="RadTreeView1" Runat="server" 
                                            onnodeclick="RadTreeView1_NodeClick" EnableNodeTextHtmlEncoding="true"
                                            meta:resourcekey="RadTreeView1Resource1">
                                        </telerik:RadTreeView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table> 
</div> 
<asp:Label ID="lblSysClass" runat="server" Text="系統類別" Visible="False" 
    meta:resourcekey="lblSysClassResource1" ></asp:Label>
<asp:Label ID="lblCustomClass" runat="server" Text="自訂類別" Visible="False" 
    meta:resourcekey="lblCustomClassResource1" ></asp:Label>

<asp:Label ID="lbNoClass" runat="server" Text="未歸檔" Visible="False" 
    meta:resourcekey="lbNoClassResource1" ></asp:Label> 
<asp:Label ID="lbAll" runat="server" Text="全部" Visible="False" 
    meta:resourcekey="lbAllResource1" ></asp:Label> 
<asp:Label ID="lbComplete" runat="server" Text="已完成" Visible="False" 
    meta:resourcekey="lbCompleteResource1" ></asp:Label> 
<asp:Label ID="lbUnComplete" runat="server" Text="未完成" Visible="False" 
    meta:resourcekey="lbUnCompleteResource1"></asp:Label> 
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <input id="hideClassCount" type="hidden" runat="server" > 
        </input>
        <input id="hideScheduleType" runat="server" type="hidden"></input>
            </input>
            <input id="hideOwnerGUID" runat="server" type="hidden"></input>
                </input>
                <input id="hideIsPostBack" runat="server" type="hidden" value="false"></input>
                    </input>
                    <input id="hideClassGUID" runat="server" type="hidden"></input>
                    </input>
                </input>
            </input>
        </input>
        </input>
                        </input>
  </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="RadTreeView1" EventName="NodeClick" /> 
    </Triggers>
</asp:UpdatePanel>
&nbsp;