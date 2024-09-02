<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_UC_LimitChoice2" Codebehind="UC_LimitChoice2.ascx.cs" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>
<script type="text/javascript">
    function <%=JavaScriptFuncName1%>() { 
        if ( $('#<%=this.rbLimit.ClientID%>').prop('checked') == true) {
            $('#<%=this.pnlUserControlSetting.ClientID%>').show();
        }
        else {
            $('#<%=this.pnlUserControlSetting.ClientID%>').hide();
        }
    
    }
</script>
<asp:Panel ID="pnlLimit" runat="server" meta:resourcekey="pnlLimitResource1">
<table border="0" width="100%" >
    <tr>
        <td colspan="2" style="text-align: left">
            <asp:RadioButton ID="rbGernal" runat="server" GroupName="UserControlType" 
                Text="不限定"  Checked="True" meta:resourcekey="rbGernalResource1"/><br />
            <asp:RadioButton ID="rbLimit" runat="server" GroupName="UserControlType" 
                Text="只限定下列人員" meta:resourcekey="rbLimitResource1" />
        </td>
    </tr>
    <tr>
         <td width="10px">
        </td>
        <td style="text-align: left">
            <asp:Panel ID="pnlUserControlSetting" runat="server" 
                meta:resourcekey="pnlUserControlSettingResource1">
            <asp:CheckBox ID="cbIsWithSamedep" runat="server" Text="包含簽核者同部門人員" 
                    meta:resourcekey="cbIsWithSamedepResource1" />
            <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="False" 
                    ShowMember="False" />           
            </asp:Panel>
        </td>
    </tr>
</table>
</asp:Panel>
