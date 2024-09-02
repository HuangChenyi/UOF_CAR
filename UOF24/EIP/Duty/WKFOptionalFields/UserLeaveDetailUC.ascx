<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_UserLeaveDetailUC" Codebehind="UserLeaveDetailUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<script type="text/javascript">
    function UserLeaveDetail()
    {
        var APPLICANT_GUID = "<%=hfapplicant.Value%>";

        $uof.dialog.open2("~/EIP/Duty/WKFOptionalFields/UserLeaveDetail.aspx", this, '<%=lblTitle.Text%>', 800, 600, openDialogResult, { "userGuid": APPLICANT_GUID });
    }

    function openDialogResult(returnValue) {

        if (returnValue === '' || returnValue === null)
            return false;
        else
            return true;
    }
</script>
<table style="width: 100%;">
    <tr>
        <td>
            <asp:LinkButton ID="lbtnUserLeaveDetail" runat="server" 
                meta:resourcekey="lbtnUserLeaveDetailResource1">點選此處</asp:LinkButton>
        </td>       
    </tr>   
</table>
<asp:HiddenField ID="hfapplicant" runat="server" />
<asp:Label ID="lblTitle" runat="server" Text="可請假明細" Visible="False" 
    meta:resourcekey="lblTitleResource1"></asp:Label>

<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>