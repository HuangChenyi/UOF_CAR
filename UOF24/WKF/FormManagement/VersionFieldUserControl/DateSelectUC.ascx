<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_DateSelectUC" CodeBehind="DateSelectUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<script type="text/javascript">

    Sys.Application.add_load(function () {

        SetHfValueAndCvDisplay_<%=this.VersionField.FieldID%>();
    })
    function ClientValidate_<%=this.VersionField.FieldID%>(sender, args) {
        
        var radDatePicker1 = $find("<%= RadDatePicker1.ClientID %>");

        if (radDatePicker1 != null && radDatePicker1._validationInput.value !== "") {
            args.IsValid = true;
        }
        else if (radDatePicker1 != null && radDatePicker1._validationInput.value == "") {
            args.IsValid = false;
            radDatePicker1.get_dateInput().focus();
        }
        else {
            args.IsValid = true;
        }
    }
    function ClientValidate2_<%=this.VersionField.FieldID%>(sender, args) {

        var isValid = SetHfValueAndCvDisplay_<%=this.VersionField.FieldID%>();

        args.IsValid = isValid;
    }
    function SetHfValueAndCvDisplay_<%=this.VersionField.FieldID%>() {

        var radDatePicker1 = $find("<%= RadDatePicker1.ClientID %>");
        var hfCv2Value = $("#<%= hfCv2Value.ClientID %>").val();

        // 如果日期元件有值，則清除HiddenField的值，以通過驗證
        if (radDatePicker1 !== null && radDatePicker1._validationInput.value !== "") {
            hfCv2Value = "";
            $('#<%= CustomValidator2.ClientID %>').css('display', 'none');
        }
        if (hfCv2Value !== null && hfCv2Value !== undefined && hfCv2Value.length > 0 && !radDatePicker1.get_enabled()) {
            $('#<%= CustomValidator1.ClientID %>').css('display', 'none');
            return false;
        }
        else
            return true;
    }
</script>

<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<table border="0" cellpadding="0" cellspacing="0" id="tbField" runat="server">
    <tr>
        <td id="tdInvisible" runat="server">
            <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
        </td>
        <td id="tdField" runat="server" nowrap>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td nowrap>
                        <asp:LinkButton ID="lnk_Edit" runat="server" CausesValidation="false" OnClick="lnk_Edit_Click"
                            Visible="False" meta:resourcekey="lnk_EditResource1"
                            Text="[修改]"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Cannel" runat="server" CausesValidation="false" OnClick="lnk_Cannel_Click"
                            Visible="False" meta:resourcekey="lnk_CannelResource1"
                            Text="[取消]"></asp:LinkButton>
                        <asp:LinkButton ID="lnk_Submit" runat="server" CausesValidation="false" OnClick="lnk_Submit_Click"
                            Visible="False" meta:resourcekey="lnk_SubmitResource1"
                            Text="[確定]"></asp:LinkButton>
                    </td>
                    <td nowrap>
                        <telerik:RadDatePicker ID="RadDatePicker1" runat="server" MaxDate="9999-12-31" MinDate="1911-01-01" 
                            SkinID="AllowEmpty">
                        </telerik:RadDatePicker>
                        <asp:Label ID="lblDateChooser" runat="server" Visible="False" meta:resourcekey="lblDateChooserResource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <div id="divWS" runat="server">
                <asp:Button ID="Button1" runat="server" meta:resourcekey="Button1Resource1" OnClick="Button1_Click"   
                    Text="取得值" Visible="False" CausesValidation="False" />      
                
                <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="false" Display="Dynamic"
                    ErrorMessage="不允許空白" ClientValidationFunction="ClientValidate" meta:resourcekey="CustomValidator1Resource1" >
                </asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" Visible ="false" Display="Dynamic" 
                    ErrorMessage="預設值不在允許範圍內" ClientValidationFunction="ClientValidate2" meta:resourcekey="CustomValidator2Resource1" >
                </asp:CustomValidator>
            </div>
            <asp:Label ID="lblHasNoAuthority" runat="server" ForeColor="Red" Text="無填寫權限" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
            <asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
            <asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
            <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
            <asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
            <asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
            <asp:Label ID="lblReadonly" runat="server" meta:resourcekey="lblReadonlyResource1" Text="唯讀" Visible="False"></asp:Label>
            <asp:Label ID="lblField" runat="server" Text="外部資料訊息:" Visible="False" meta:resourcekey="lblFieldResource1" Font-Bold="False" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblShowWSMsg" meta:resourcekey="lblShowWSMsgResource1" runat="server" Font-Bold="False" ForeColor="Red" Visible="False"></asp:Label>
            <asp:Label ID="lblWebServiceMsg" runat="server" Text="資料格式錯誤" meta:resourcekey="lblWebServiceMsgResource1" Visible="False" Font-Bold="False" ForeColor="Red"></asp:Label>
            <asp:Label ID="lblotherMSG" runat="server" ForeColor="Red" Text="呼叫外部資料時發生錯誤" Visible="False" meta:resourcekey="lblotherMSGResource1"></asp:Label>
            <asp:HiddenField ID="hfCv2Value" runat="server" />
        </td>
    </tr>
</table>
        </ContentTemplate>
</asp:UpdatePanel>
