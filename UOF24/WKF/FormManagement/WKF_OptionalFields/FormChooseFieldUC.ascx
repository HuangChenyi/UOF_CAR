<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormChooseFieldUC.ascx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.WKF_OptionalFields.FormChooseFieldUC" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript">
    function ClientValidate_<%=this.VersionField.FieldID%>(source, arguments) {
        if ($('#<%=hfTaskID.ClientID %>').val() != "") {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
            $("#<%=hyperlinkFocus1.ClientID%>").focus();
        }
    }

    function ConfirmDelete() {
        if (!confirm('<%=lblReallyDelete.Text%>')) {
            return false;
        }
    }

    function ViewForm() {
        var taskId = $('#<%=hfTaskID.ClientID%>').val();
        $uof.dialog.open2('~/WKF/FormUse/ViewForm.aspx', '', '', 0, 0, function () { return false; }, { 'TASK_ID': taskId });
        return false;
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblNotSupport" runat="server" Text="此欄位不允許在App編輯" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblNotSupportResource1"></asp:Label>
                    <telerik:RadButton ID="btnChooseForm" runat="server" Text="選擇表單" CausesValidation="False" Visible="False" meta:resourcekey="btnChooseFormResource1"></telerik:RadButton>
                    <asp:CustomValidator ID="cvFormEmpty" runat="server" ClientValidationFunction="ClientValidate" ForeColor="Red" ErrorMessage="請選取表單" Display="Dynamic" meta:resourcekey="cvFormEmptyResource1"></asp:CustomValidator>
                    <asp:LinkButton ID="lbtnBtnDelete" runat="server" Text="[刪除]" CausesValidation="False" OnClick="lbtnBtnDelete_Click" OnClientClick="return ConfirmDelete();" Visible="False" meta:resourcekey="lbtnBtnDeleteResource1"></asp:LinkButton>
                    <asp:LinkButton ID="lbtnDOC_NBR" runat="server" CausesValidation="False" meta:resourcekey="lbtnDOC_NBRResource1"></asp:LinkButton>
                    <asp:Label ID="lblDOC_NBR" runat="server" Visible="False" meta:resourcekey="lblDOC_NBRResource1"></asp:Label>
                    <asp:Label ID="lblErrorTask" runat="server" Text="表單已被刪除，無法找到表單相關資訊" ForeColor="Blue" Visible="false" meta:resourcekey="lblErrorTaskResource1"></asp:Label>
                    <asp:HiddenField ID="hfTaskID" runat="server" />
                    <asp:HyperLink id="hyperlinkFocus1" NavigateUrl="#" runat="server"/>
                </td>
            </tr>
        </table>


    </ContentTemplate>

    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="lbtnDOC_NBR" EventName="Click" />
    </Triggers>

</asp:UpdatePanel>
<asp:Label ID="lblChooseForm" runat="server" Text="表單選取" Visible="False" meta:resourcekey="lblChooseFormResource1"></asp:Label>
<asp:Label ID="lblFieldValue" runat="server" Visible="False" meta:resourcekey="lblFieldValueResource1"></asp:Label>
<asp:Label ID="lblReallyDelete" runat="server" Text="是否確定刪除？" Visible="False" meta:resourcekey="lblReallyDeleteResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblViewForm" runat="server" Text="觀看表單" Visible="false" meta:resourcekey="lblViewFormResource1"></asp:Label>
<asp:HiddenField ID="hfApplicantGuid" runat="server" />