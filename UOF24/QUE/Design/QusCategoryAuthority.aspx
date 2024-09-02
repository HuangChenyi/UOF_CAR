<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_QusCategoryAuthority" CodeBehind="QusCategoryAuthority.aspx.cs" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function AlertMsg() {
            var categoryIsChecked = $("#<%= cbxWithChildCategory.ClientID %>").is(":checked");
            var examineIsChecked = $("#<%= cbxWithChildExamine.ClientID %>").is(":checked"); 
            var designIsChecked = $("#<%= cbxWithChildDesigner.ClientID %>").is(":checked");
            var statisticsIsChecked = $("#<%= cbxWithChildStatistics.ClientID%>").is(":checked");

            if (categoryIsChecked || examineIsChecked || designIsChecked || statisticsIsChecked)
                return confirm("<%= lblSyncMsg.Text%>");
            else
                return true;
        }
    </script>
    <asp:CustomValidator ID="cvError" runat="server" ErrorMessage="儲存失敗" Display="Dynamic" meta:resourcekey="cvErrorResource1"></asp:CustomValidator>
    <table class="PopTable">
        <tr>
            <td style="white-space:nowrap; width:25%">
                <asp:Label ID="Label3" runat="server" Text="類別" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblCategory" runat="server" meta:resourcekey="lblCategoryResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label1" runat="server" Text="類別管理員" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbxWithChildCategory" runat="server" Text="同步修改子類別" meta:resourcekey="cbxWithChildCategoryResource1" />
                <uc1:UC_ChoiceList runat="server" ID="adminChoiceList" ShowMember="false" ExpandToUser="false" />
                <asp:Label ID="lblClassManagerRemark" runat="server" Text="具有類別管理員權限的人員，可同時維護該類別與子類別的設定。" ForeColor="Blue" meta:resourcekey="lblClassManagerRemarkResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label2" runat="server" Text="問卷審核" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox ID="cbxWithChildExamine" runat="server" Text="同步修改子類別" meta:resourcekey="cbxWithChildExamineResource1" /><br />
                        <asp:CheckBox ID="cbxIsExamine" runat="server" Text="問卷發佈之前必須經過審核(任一審核人員通過即發佈)" AutoPostBack="True" OnCheckedChanged="cbxIsExamine_CheckedChanged" meta:resourcekey="cbxIsExamineResource1" />
                        <uc1:UC_ChoiceList runat="server" ID="auditChoiceList" ShowMember="false" ExpandToUser="false" Visible="False" />
                        <asp:CustomValidator ID="cvAuditIsEmpty" runat="server" Display="Dynamic" ErrorMessage="請選擇審核人員" meta:resourcekey="cvAuditIsEmptyResource1"></asp:CustomValidator>
                        <br />
                        <asp:CustomValidator ID="chCheckClassHasExamine" runat="server" Display="Dynamic" ErrorMessage=""></asp:CustomValidator>
                        <asp:Label ID="lblCheckClassHasExamineMsg" runat="server" Text="以下類別內尚有審核中的問卷，請設定審核者進行審核:<br />{0}" Visible="false" meta:resourcekey="lblCheckClassHasExamineMsgResource1"></asp:Label>
                        <asp:Label ID="lblNeedExamineClassName" runat="server" Text="" Visible="false"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="cbxIsExamine" EventName="CheckedChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label4" runat="server" Text="問卷製作者" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbxWithChildDesigner" runat="server" Text="同步修改子類別" meta:resourcekey="cbxWithChildCategoryResource1" />
                <uc1:UC_ChoiceList runat="server" ID="designerChoiceList" ShowMember="false" ExpandToUser="false" />
                <asp:Label ID="Label6" runat="server" Text="在目前類別中可維護填寫人屬性、製作問卷、發送問卷及統計製作的問卷" ForeColor="Blue" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label7" runat="server" Text="瀏覽問卷統計者" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbxWithChildStatistics" runat="server" Text="同步修改子類別" meta:resourcekey="cbxWithChildCategoryResource1" />
                <uc1:UC_ChoiceList runat="server" ID="statisticsChoiceList" ShowMember="false" ExpandToUser="false" />
                <asp:Label ID="Label5" runat="server" Text="在目前類別中可觀看全部問卷的統計結果，但沒有權限製作問卷、發送問卷及維護填寫人屬性" ForeColor="Blue" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Label ID="Label8" runat="server" Text="同步修改子類別:系統管理員及問卷管理員會將設定同步所有子類別，類別管理員只能同步所屬權限的子類別" ForeColor="Blue" meta:resourcekey="Label8Resource1"></asp:Label>
    <asp:Label ID="lblSyncMsg" runat="server" Visible="False" Text="類別權限會同步至有權限的子類別" meta:resourcekey="lblSyncMsgResource1"></asp:Label>
    <asp:Label ID="lblRootName" runat="server" Visible="False" Text="全部類別" meta:resourcekey="lblRootNameResource1"></asp:Label>
</asp:Content>

