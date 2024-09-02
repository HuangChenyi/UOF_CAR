<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_AddAgentTime" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="AddAgentTime.aspx.cs" %>

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


    <table cellspacing="1" class="PopTable" width="100%">
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <tr>
            <td align="center" class="PopTableHeader" colspan="2" style="height: 25px">
                <asp:Label ID="lblAgentTimeSet" runat="server" meta:resourcekey="lblAgentTimeSetResource1"
                    Text="設定代理時間"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStartTime" runat="server" meta:resourcekey="lblStartTimeResource1"
                    Text="時間起"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadDateTimePicker ID="StartTimeWDC" runat="server" meta:resourcekey="StartTimeWDCResource3">
                            </telerik:RadDateTimePicker>
                            <asp:CustomValidator ID="cvDataRepeat" runat="server" Display="Dynamic" ErrorMessage="資料重覆"
                                meta:resourcekey="cvDataRepeatResource1"></asp:CustomValidator>
                            <asp:RequiredFieldValidator ID="rfvStartTimeWDC" runat="server" ErrorMessage="請輸入申請日期(起)" Display="Dynamic" ControlToValidate="StartTimeWDC" meta:resourcekey="rfvStartTimeWDCResource2"></asp:RequiredFieldValidator>
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
                            <telerik:RadDateTimePicker ID="EndTimeWDC" runat="server" meta:resourcekey="EndTimeWDCResource3">
                            </telerik:RadDateTimePicker>
                            <asp:CustomValidator ID="cvTimeRangeRepeat" runat="server" Display="Dynamic" ErrorMessage="代理起訖時間重覆"
                                meta:resourcekey="cvTimeRangeRepeatResource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="cvEndTimeGreaterThanStartTime" runat="server" Display="Dynamic"
                                ErrorMessage="結束時間必須晚於起始時間" meta:resourcekey="cvEndTimeGreaterThanStartTimeResource1"></asp:CustomValidator>
                            <asp:RequiredFieldValidator ID="rfvEndTimeWDC" runat="server" ErrorMessage="請輸入申請日期(迄)" Display="Dynamic" ControlToValidate="EndTimeWDC" meta:resourcekey="rfvEndTimeWDCResource2"></asp:RequiredFieldValidator>
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
                <asp:Panel ID="pnlAgent" runat="server" meta:resourcekey="pnlAgentResource1">
                    <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" ButtonText="選取人員" />
                    <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserNameResource1"></asp:Label>
                    <asp:Label ID="lblUserGuid" runat="server" Visible="False" meta:resourcekey="lblUserGuidResource1"></asp:Label>
                </asp:Panel>
                <asp:CustomValidator ID="CustomValidator1" Display="Dynamic" runat="server" ErrorMessage="請指定代理人" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                <asp:CustomValidator ID="cvCheckSetting" runat="server" Display="Dynamic" ErrorMessage="代理人不可設定為自己" meta:resourcekey="cvCheckSettingResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblAgentGuid" runat="server" Visible="False" meta:resourcekey="lblAgentGuidResource1"></asp:Label>
    <asp:Label ID="lblInsertSuccess" runat="server" ForeColor="Red"
        meta:resourcekey="lblInsertSuccessResource1" Text="新增成功" Visible="False"></asp:Label>
    <asp:Label ID="lblNoneOfGeneralAgent" runat="server" Text="啟動代理時間需設定代理人，請擇一設定指定代理人、角色代理人、表單代理人或一般代理人" Visible="false" ForeColor="Blue" meta:resourcekey="lblNoneOfGeneralAgentResource1"></asp:Label>


    &nbsp;
    
    
    
    
</asp:Content>

