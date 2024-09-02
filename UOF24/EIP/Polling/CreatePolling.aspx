<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Polling_CreatePolling" Title="新增投票議題" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreatePolling.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <script type="text/javascript">
        function OpenRePollingDialog()
       {
            var ID =$("#<%=hideTopicId.ClientID %>").val();
            $uof.dialog.open2("~/EIP/Polling/CreatePolling.aspx", this, "", 700, 600, OpenDialogReturn, { "id": ID, "Mode": "RePoll" });
            return false;
        }

       function OpenDialogReturn(returnValue) {
           
       }
   </script> 
    <table width="100%" class=PopTable cellspacing=1>
        <tr>
            <td  >
                <span style="color: #ff0000">*</span><asp:Label ID="lbTopic" runat="server" Text="議題內容" meta:resourcekey="lbTopicResource1"></asp:Label></td>
            <td   >
                <asp:TextBox ID="txbTopic" runat="server" Height="77px" TextMode="MultiLine" Width="100%" meta:resourcekey="txbTopicResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbTopic"
                    Display="Dynamic" ErrorMessage="議題內容不允許空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lbPollDate" runat="server" Text="投票期間" meta:resourcekey="lbPollDateResource1"></asp:Label></td>
            <td  >
                <table>
                    <tr>
                        <td>
                            <telerik:RadDateTimePicker ID="rdtpStartDate" runat="server">
                            </telerik:RadDateTimePicker>
                        </td>
                        <td>
                            ~</td>
                        <td>
                            <telerik:RadDateTimePicker ID="rdtpEndDate" runat="server">
                            </telerik:RadDateTimePicker>
                        </td>
                    </tr>
                </table>
                <asp:CustomValidator ID="dateValidator2" runat="server" Display="Dynamic" ErrorMessage="請輸入投票期間" meta:resourcekey="dateValidator2Resource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbPostTime" runat="server" Text="下架日期" meta:resourcekey="lbPostTimeResource1"></asp:Label></td>
            <td >
            <table border="0">
            <tr><td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td  >
                            <telerik:RadDatePicker ID="rdpPostEndDate" Runat="server">
                            </telerik:RadDatePicker>
                        </td>
                        <td >  
                            <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="下架日期不可早於投票截止日"
                                OnServerValidate="CustomValidator3_ServerValidate" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator></td>
                    </tr>
                </table></td></tr></table>
                <asp:CustomValidator ID="dateValidator1" runat="server" Display="Dynamic" ErrorMessage="請輸入下架日期" meta:resourcekey="dateValidator1Resource1"></asp:CustomValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbReg" runat="server" Text="記名否" meta:resourcekey="lbRegResource1"></asp:Label></td>
            <td  >
                <asp:RadioButton ID="rbUnReg" runat="server" Text="不記名" GroupName="registered" Checked="True" meta:resourcekey="rbUnRegResource1"/><asp:RadioButton ID="rbReg" runat="server" Text="記名" GroupName="registered" meta:resourcekey="rbRegResource1" /></td>
        </tr>
        <tr>
            <td >
                <span style="color: #ff0000">*</span><asp:Label ID="lbItems" runat="server" Text="議題項目" meta:resourcekey="lbItemsResource1"></asp:Label></td>
            <td  >
                <table width="100%" id="tbItem" runat="server">
                    <tr>
                        <td colspan="2">
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="議題項目至少需2項" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td>
                    </tr>
                    <tr>
                        <td width="50%" >
                            1.<asp:TextBox ID="txbItem01" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem01Resource1"></asp:TextBox></td>
                        <td >
                            2.<asp:TextBox ID="txbItem02" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem02Resource1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td width="50%">
                            3.<asp:TextBox ID="txbItem03" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem03Resource1"></asp:TextBox></td>
                        <td >
                            4.<asp:TextBox ID="txbItem04" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem04Resource1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td width="50%" >
                            5.<asp:TextBox ID="txbItem05" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem05Resource1"></asp:TextBox></td>
                        <td >
                            6.<asp:TextBox ID="txbItem06" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem06Resource1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td width="50%" >
                            7.<asp:TextBox ID="txbItem07" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem07Resource1"></asp:TextBox></td>
                        <td >
                            8.<asp:TextBox ID="txbItem08" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem08Resource1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td width="50%" >
                            9.<asp:TextBox ID="txbItem09" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem09Resource1"></asp:TextBox></td>
                        <td >
                            10.<asp:TextBox ID="txbItem10" runat="server" MaxLength="255" Width="90%" meta:resourcekey="txbItem10Resource1"></asp:TextBox></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="lbChoice" runat="server" Text="投票對象設定" meta:resourcekey="lbChoiceResource1"></asp:Label></td>
            <td  >
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請選取投票對象" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator></td>
                    </tr>
                    <tr>
                        <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="False" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <asp:Panel ID="panCreate" runat="server" >
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="發起人" meta:resourcekey="Label1Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblAnnouncer" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="建立時間" meta:resourcekey="Label2Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblCreateTime" runat="server" Text=""></asp:Label></td>
            </tr>
        </asp:Panel>
    </table>
    <input id="hideTopicId" type="hidden" runat="server" /> 
    <asp:Label ID="lbRePoll" runat="server" Text="發起新投票" Visible="False" meta:resourcekey="lbRePollResource1"></asp:Label>
</asp:Content>

