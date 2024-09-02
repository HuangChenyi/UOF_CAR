<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Common_UC_LimitChoice" CodeBehind="UC_LimitChoice.ascx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<script type="text/javascript">

    Sys.Application.add_load(function () {
        <%=JavaScriptFuncName1%>();

        // 預設
        if ($('#<%=hfViewType.ClientID%>').val() == '0') {
            $('#<%=divShowNoLimit.ClientID%>').show();
            $("#<%=divShowAdditionalSign.ClientID%>").hide();
            $("#<%=divShowIQY.ClientID%>").hide();

        }
        // 徵詢
        if ($('#<%=hfViewType.ClientID%>').val() == '1') {

            $('#<%=divShowNoLimit.ClientID%>').hide(); // 不限定
            $('#<%=divShowLimit.ClientID%>').hide(); // 只限定下列人員
            $("#<%=divShowAdditionalSign.ClientID%>").hide(); // 加簽

            $("#<%=divShowIQY.ClientID%>").show(); // 徵詢

            //選人元件
            $('#<%=pnlUserControlSetting.ClientID  %>').show();
            $("#<%=divExpandToUser.ClientID%>").hide();
        }

        // 加簽
        if ($('#<%=hfViewType.ClientID%>').val() == '2') {

            $('#<%=divShowNoLimit.ClientID%>').hide(); // 不限定
            $('#<%=divShowLimit.ClientID%>').hide(); // 只限定下列人員
            $("#<%=divShowIQY.ClientID%>").hide(); // 徵詢

            $("#<%=divShowAdditionalSign.ClientID%>").show(); // 加簽

            //選人元件
            $('#<%=pnlUserControlSetting.ClientID  %>').show();
            $("#<%=divExpandToUser.ClientID%>").hide();

        }
    })

    //控制限定選人UI顯示用
    function <%=JavaScriptFuncName1%>() {

        if ($('#<%=rbLimit.ClientID%>').is(":checked") == true) {

            $('#<%=pnlUserControlSetting.ClientID  %>').show();
            $("#<%=divExpandToUser.ClientID%>").hide();
        }
        else {
            $('#<%=pnlUserControlSetting.ClientID  %>').hide();
            $("#<%=divExpandToUser.ClientID%>").show();
        }

        //只有在人員組織欄位設定才開啟展開人員選項，其他地方(EX:新增、維護表單)一律隱藏
        if ("<%=IsSetupField%>" === "False") {
            $("#<%=divExpandToUser.ClientID%>").hide();
        }
    }



</script>
<style>
    .ExpandToUser {
        margin-left: 10px
    }

    .ExpandToUser2 {
        margin-left: 20px
    }

    .cssHidden {
        display: none;
    }
</style>
<asp:Panel ID="pnlLimit" runat="server" meta:resourcekey="pnlLimitResource1">
    <table border="0" width="100%">
        <tr>
            <td colspan="2">
                <div id="divShowNoLimit" runat="server">
                    <asp:RadioButton ID="rbGernal" runat="server" GroupName="UserControlType"
                        Text="不限定" Checked="True" meta:resourcekey="rbGernalResource1" /><br />
                </div>
                <div id="divExpandToUser" runat="server">
                    <asp:CheckBox ID="cbExpandToUser" runat="server" Text="不限定人員範圍時，將選取的組織項目展為人員名稱" CssClass="ExpandToUser"
                        meta:resourcekey="cbExpandToUserResource1" />
                </div>

                <div id="divShowAdditionalSign" runat="server">
                    <asp:CheckBox ID="cbAdditionalSign" runat="server" Text="限定加簽時只可選擇到下列人員"
                        meta:resourcekey="cbAdditionalSignResource1" />
                </div>

                <div id="divShowIQY" runat="server" >
                    <asp:CheckBox ID="cbIQY" runat="server" Text="限定徵詢時只可選擇到下列人員" CssClass="ExpandToUser" 
                        meta:resourcekey="cbIQYResource1" />
                </div>

                <div id="divShowLimit" runat="server">
                    <asp:RadioButton ID="rbLimit" runat="server" GroupName="UserControlType"
                        Text="只限定下列人員" meta:resourcekey="rbLimitResource1" />
                </div>

            </td>
        </tr>
        <tr>
            <td id="tdUserControlSetting" runat="server"></td>
            <td>
                <asp:Panel ID="pnlUserControlSetting" runat="server" meta:resourcekey="pnlUserControlSettingResource1">
                    <asp:CheckBox ID="cbIsWithSamedep" runat="server" Text="" />

                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="False"
                        ShowMember="False" />
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfIsSetupField" Value="false" runat="server" />
    <asp:HiddenField ID="hfViewType" Value="0" runat="server" />

    <asp:Label ID="lblShowWithSamedep1" runat="server" Text="包含簽核者同部門人員" CssClass="cssHidden" meta:resourcekey="lblShowWithSamedep1Resource1"></asp:Label>
    <asp:Label ID="lblShowWithSamedep2" runat="server" Text="包含申請者/簽核者同部門人員" CssClass="cssHidden" meta:resourcekey="lblShowWithSamedep2Resource1"></asp:Label>

</asp:Panel>
