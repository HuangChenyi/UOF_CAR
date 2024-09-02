<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Agent_AddAgentTime" Title="啟動代理時間" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="AddAgentTime.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function oncbAssignAgentChecked() {
            if ($('#<%=cbAssignAgent.ClientID%>').is(':checked')) {
            $('#<%=pnlAgent.ClientID  %>').show();
        }
        else {
            $('#<%=pnlAgent.ClientID  %>').hide();
            }


        }
    </script>

    <table width="100%" class="PopTable" cellspacing="1">
        <colgroup class="PopTableLeftTD"></colgroup>
        <colgroup class="PopTableRightTD"></colgroup>
        <tr>
            <td class="PopTableHeader" align="center" colspan="2" style="height: 25px">
                <asp:Label ID="lblAgentTimeSet" runat="server" Text="設定代理時間" meta:resourcekey="lblAgentTimeSetResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStartTime" runat="server" Text="時間起" meta:resourcekey="lblStartTimeResource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadDateTimePicker ID="StartTimeWDC" runat="server"></telerik:RadDateTimePicker>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StartTimeWDC"
                                Display="Dynamic" ErrorMessage="請輸入開始日期" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="cvDataRepeat" runat="server" Display="Dynamic" ErrorMessage="資料重覆" meta:resourcekey="cvDataRepeatResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEndTime" runat="server" Text="時間訖" meta:resourcekey="lblEndTimeResource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadDateTimePicker ID="EndTimeWDC" runat="server"></telerik:RadDateTimePicker>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EndTimeWDC"
                                Display="Dynamic" ErrorMessage="請輸入結束日期" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="cvEndTimeGreaterThanStartTime" runat="server" Display="Dynamic" ErrorMessage="結束時間必須大於起始時間" meta:resourcekey="cvEndTimeGreaterThanStartTimeResource1"></asp:CustomValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="StartTimeWDC" Visible="false"
                                ControlToValidate="EndTimeWDC" Display="Dynamic" ErrorMessage="結束時間必須大於起始時間"
                                meta:resourcekey="CompareValidator1Resource1" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                            <asp:CustomValidator ID="cvTimeRangeRepeat" runat="server" Display="Dynamic" ErrorMessage="代理起訖時間重覆" meta:resourcekey="cvTimeRangeRepeatResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="設定代理人" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbAssignAgent" runat="server" Text="指定代理人" onclick="oncbAssignAgentChecked()" meta:resourcekey="cbAssignAgentResource1" />
                <asp:Panel ID="pnlAgent" runat="server">
                    <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" ButtonText="選取人員" meta:resourcekey="UC_BtnChoiceOnce1Resource1" />
                    <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblUserGuid" runat="server" Text="" Visible="false"></asp:Label>
                </asp:Panel>
                <asp:CustomValidator ID="CustomValidator1" Display="Dynamic" runat="server" ErrorMessage="請指定代理人" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="cvCheckSetting" runat="server" Display="Dynamic" ErrorMessage="代理人不可設定為自己" meta:resourcekey="cvCheckSettingResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblAgentGuid" runat="server" Text="" Visible="false"></asp:Label>
    <div>
        <asp:Label ID="lblNoneOfGeneralAgent" runat="server" Text="啟動代理時間需設定代理人，請擇一設定指定代理人、角色代理人、表單代理人或一般代理人" Visible="false" ForeColor="Blue" meta:resourcekey="lblNoneOfGeneralAgentResource1"></asp:Label>
    </div>

    <asp:Label ID="lblInsertSuccess" runat="server" Text="新增成功" Visible="False" ForeColor="Red" meta:resourcekey="lblInsertSuccessResource1"></asp:Label>







</asp:Content>
