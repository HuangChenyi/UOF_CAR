<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_Layout_UC_BranchSiteCond" Codebehind="UC_BranchSiteCond.ascx.cs" %>
<table border="0" style="padding:0px;width:143px;text-align:center" >
    <tr>
        <td colspan="3" height="13" style=" background-image:url(<%=themePath %>/images/wkf/annotate_top.gif); padding-bottom:0px;">
           </td>
    </tr>
    <tr>
        <td  style="background-image:url(<%=themePath %>/images/wkf/annotate_left.gif);width:20px" >
            <img height="4" src="<%=themePath %>/images/wkf/annotate_left.gif" width="20" /></td>
        <td style="width:103px;background-image:url(<%=themePath %>/images/wkf/annotate_con.gif)" >
            <p style="text-align: center">
                <asp:LinkButton ID="linkbtnSiteCond" runat="server" ForeColor=Red meta:resourcekey="linkbtnSiteCondResource1">???</asp:LinkButton>&nbsp;</p>
            <p style="text-align: center">

                <asp:LinkButton ID="lbtnsubFlowName" runat="server" ForeColor="Blue" Visible=false  ></asp:LinkButton>
        <asp:Label ID="lblsubFlowName" runat="server" ForeColor="Blue" meta:resourcekey="lblsubFlowNameResource1"></asp:Label>&nbsp;</p>
        </td>
        <td style="width:20px;background-image:url(<%=themePath %>/images/wkf/annotate_right.gif)" >
            <img height="4" src="<%=themePath %>/images/wkf/annotate_right.gif" width="20" /></td>
    </tr>
    <tr>
        <td background="\" colspan="3" height="13">
            <img height="25" src="<%=themePath %>/images/wkf/annotate_down.gif" width="143" /></td>
    </tr>
</table>
