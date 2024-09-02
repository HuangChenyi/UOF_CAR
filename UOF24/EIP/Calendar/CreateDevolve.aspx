<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_CreateDevolve" Title="新增交辦" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="CreateDevolve.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/EIP/Calendar/Common/UC_RepeatRange.ascx" TagPrefix="uc1" TagName="UC_RepeatRange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
        //只有第一次從工作轉交辦過來要載入
        if ($("#<%=hfFirstLoad.ClientID%>").val() == 'True') {
            $("#<%=hfFirstLoad.ClientID%>").val('False');

            var subject = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["Subject"],true) %>');
            var description = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["Description"],true) %>');
            if (subject && description != '') {
                var curwindow = $uof.dialog.getOpener();
                var pd;
                if (curwindow) {
                    pd = curwindow.document;
                } else if (typeof (dialogArguments) != "undefined") {
                    pd = dialogArguments.document;
                }

                if (pd) {
                    $("#<%=txbSubject.ClientID%>").val($("#" + subject, pd).val());
                    $("#<%=txbDescription.ClientID%>").val($("#" + description, pd).val());
                }
            }
        }
    });

    function Button3Click() {
        return confirm('<%= lbConfirmDelete.Text %>');
    }

    function Button4Click() {
        return confirm('<%= lblConfirmCopy.Text %>');
    }

    </script>
    <asp:CustomValidator ID="cvReadAuthority" runat="server" ErrorMessage="您不是此交辦的知會人員, 因此不可檢視交辦" Visible="False" meta:resourcekey="cvReadAuthorityResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="儲存失敗" Display="Dynamic" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <table class="PopTable" cellspacing="0" style="border-spacing: 1px;">

        <tr>
            <td align="right">
                <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server" Text="主旨" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="height: 24px">
                <asp:TextBox ID="txbSubject" runat="server" Width="100%" meta:resourcekey="txbSubjectResource1" MaxLength="255"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不允許空白" ControlToValidate="txbSubject" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label2" runat="server" Text="說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txbDescription" runat="server" Height="100px" TextMode="MultiLine" Width="100%" meta:resourcekey="txbDescriptionResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right">
                <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server" Text="負責人" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" TreeHeight="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="負責人不允許空白" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td align="right" style="white-space: nowrap;">
                <asp:Label ID="lblCompInfoUserSet" runat="server" Text="知會人員" meta:resourcekey="lblCompInfoUserSetResource1"></asp:Label></td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList2" runat="server" TreeHeight="100px" />
            </td>
        </tr>        
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="開始時間" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdpDateStart" runat="server"></telerik:RadDatePicker>
                            <asp:Label ID="lblStartTime" runat="server" Visible="false"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadTimePicker ID="rdpTimeStart" runat="server"></telerik:RadTimePicker>
                        </td>
                        <td>
                            <asp:CheckBox ID="cbxAllDay" runat="server" Text="全天" AutoPostBack="True" OnCheckedChanged="cbxAllDay_CheckedChanged" style="margin-left:5px" meta:resourcekey="cbxAllDayResource1" />
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label5" runat="server" Text="結束時間" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdpDateEnd" runat="server"></telerik:RadDatePicker>
                        </td>
                        <td>
                            <telerik:RadTimePicker ID="rdpTimeEnd" runat="server"></telerik:RadTimePicker>
                            <asp:Label ID="lblEndTime" runat="server" Visible="false"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間"
                                meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填入開始時間" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="cvRepeatDate" runat="server" Display="Dynamic" ErrorMessage="週期性事件僅限當日" OnServerValidate="cvRepeatDate_ServerValidate" meta:resourcekey="cvRepeatDateResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>                
            </td>
        </tr>
        <asp:Panel runat="server" ID="panelRepeatRange">
        <tr>
            <td>
                <asp:Label ID="lblRepeatRangeTitle" runat="server" Text="週期性" meta:resourcekey="lblRepeatRangeTitleResource1"></asp:Label>
            </td>
            <td>
                <uc1:uc_repeatrange ID="UC_RepeatRange1" runat="server" />
                <asp:Label ID="lblDevolveRepeatLimit" runat="server" CssClass="SizeMemo"
                    meta:resourcekey="lblDevolveRepeatLimitResource1"></asp:Label>
                <asp:CustomValidator ID="cvRepeatCheckLater" runat="server" Display="Dynamic" ErrorMessage="結束時間不可早於開始時間" OnServerValidate="cvRepeatCheckLater_ServerValidate" meta:resourcekey="cvRepeatCheckLaterResource1"></asp:CustomValidator>
            </td>
        </tr>
        </asp:Panel>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="附件" meta:resourcekey="Label12Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="EIP" />
            </td>            
        </tr>
        <tr>
            <td align="right">
                <span style="color: #ff0000">*</span><asp:Label ID="Label7" runat="server" Text="交辦人" meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
                    <ContentTemplate>
                        <input id="hideDirector" type="hidden" runat="server" />
                        <asp:Label ID="lblDirector" runat="server"></asp:Label>
                        <uc2:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" ButtonText="選擇" meta:resourcekey="UC_BtnChoiceOnce1Resource1" />
                        <asp:CustomValidator ID="cusValiDirector" runat="server" ErrorMessage="交辦人不允許空白" Display="Dynamic" meta:resourcekey="cusValiDirectorResource1"></asp:CustomValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label6" runat="server" Text="建立人員" meta:resourcekey="Label6Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lbCreateUser" runat="server" meta:resourcekey="lbCreateUserResource1"></asp:Label></td>
        </tr>
        <tr id="viewWorkTR" runat="server">
            <td align="right"></td>
            <td>
                <asp:LinkButton ID="btnViewWorkProgress" runat="server" meta:resourcekey="btnViewWorkProgressResource1" Text="查看工作進度" OnClick="btnViewWorkProgress_Click"></asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton ID="lbtnDovolveForum" runat="server" Text="交辦討論" OnClick="lbtnDovolveForum_Click" meta:resourcekey="lbtnDovolveForumResource1"></asp:LinkButton>
            </td>
        </tr>
    </table>

    <asp:Label ID="lbDevolveGuid" runat="server" Visible="False" meta:resourcekey="lbDevolveGuidResource1"></asp:Label>
    <asp:Label ID="lbMeetingGuid" runat="server" Visible="False" meta:resourcekey="lbMeetingGuidResource1"></asp:Label>
    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
    <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lbDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lbDeleteResource1"></asp:Label>
    <asp:Label ID="lblTempMessage" runat="server" Text="儲存失敗"  Visible="False" meta:resourcekey="lblTempMessageResource1"></asp:Label>
    <asp:Label ID="lblForumTitle" runat="server" Text="交辦討論" Visible="False" meta:resourcekey="lblForumTitleResource1"></asp:Label>
    <asp:Label ID="lblCopyButton" runat="server" Text="複製" Visible="False" meta:resourcekey="lblCopyButtonResource1"></asp:Label>
    <asp:Label ID="lblConfirmCopy" runat="server" Text="確定要複製?" Visible="False" meta:resourcekey="lblConfirmCopyResource1"></asp:Label>
    <asp:Label ID="lblContinueButton" runat="server" Text="確定後複製" Visible="False" meta:resourcekey="lblContinueButtonResource1"></asp:Label>
    <asp:Label ID="lblNotExist" runat="server" Text="此交辦已被刪除" Visible="false" meta:resourcekey="lblNotExistResource1"></asp:Label>
    <asp:Label ID="lblMsg1" runat="server" Text="只允許新增{0}天內交辦" Visible="False" 
        meta:resourcekey="lblMsg1Resource1"></asp:Label>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfFirstLoad" Value="True" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
  
            


</asp:Content>

