<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Plant_CreateBorrow" Title="新增借用" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="CreateBorrow.aspx.cs" %>

<%@ Register Src="../Calendar/Common/UC_CreateBorrow.ascx" TagName="UC_CreateBorrow" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../Calendar/Common/UC_RepeatRange.ascx" TagName="UC_RepeatRange" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table width="100%">
        <tr>
            <td valign="top" width="100%">
                <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="設備已被預訂,無法新增借用" ForeColor="Red" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                
                <table class="PopTable" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <span style="color: #ff0000">*</span><asp:Label ID="lbLeftTopic" runat="server" Text="主旨" meta:resourcekey="lbLeftTopicResource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txbTopic" runat="server" Width="100%" meta:resourcekey="txbTopicResource1" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbTopic" ForeColor="Red"
                                Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbLeftDesc" runat="server" Text="說明" Width="100%" meta:resourcekey="lbLeftDescResource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txbDesc" runat="server" TextMode="MultiLine" Width="100%" Rows="6" meta:resourcekey="txbDescResource1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="lbLeftCreator" runat="server" Text="建立人員" meta:resourcekey="lbLeftCreatorResource1"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbCreator" runat="server" meta:resourcekey="lbCreatorResource1"></asp:Label>
                            <asp:Label ID="lbCreatorGuid" runat="server" Visible="False" meta:resourcekey="lbCreatorGuidResource1"></asp:Label></td>
                    </tr>
                    <tr id="trRepeat" runat="server">
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="週期性" meta:resourcekey="Label6Resource1"></asp:Label>
                        </td>
                        <td>
                            <uc2:UC_RepeatRange ID="UC_RepeatRange1" runat="server" />
                            <asp:Label ID="lblMeetingRepeatLimit" runat="server" CssClass="SizeMemo"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server"
                                Text="場地設備" meta:resourcekey="Label1Resource1"></asp:Label></td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="請選擇欲借用的場地設備" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                        <asp:CustomValidator ID="CustomValidator3" runat="server" ForeColor="Red"
                                            Display="Dynamic" ErrorMessage="請填入開始時間"
                                            meta:resourcekey="CustomValidator3Resource2"></asp:CustomValidator>
                                        <asp:CustomValidator ID="CustomValidator4" runat="server"
                                            Display="Dynamic" ErrorMessage="請填入結束時間" ForeColor="Red"
                                            meta:resourcekey="CustomValidator4Resource2"></asp:CustomValidator>
                                        <asp:CustomValidator ID="CustomValidator5" runat="server"
                                            Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" ForeColor="Red"
                                            meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" Width="100%"
                                            meta:resourcekey="Panel1Resource1">
                                            <uc1:UC_CreateBorrow ID="UC_CreateBorrow1" runat="server"></uc1:UC_CreateBorrow>
                                            <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ErrorMessage="" ForeColor="Red" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
                                            <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ErrorMessage=""></asp:CustomValidator>
                                        </asp:Panel>
                                    </td>

                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblMsg1" runat="server" Text="只允許新增{0}天內借用，另欲新增週期性借用，請先選擇週期設定" Visible="False" meta:resourcekey="lblMsg1Resource1"></asp:Label>
    <asp:Label ID="lblMsg2" runat="server" Text="只允許新增當日借用，另欲新增週期性借用，請先選擇週期設定" Visible="False" meta:resourcekey="lblMsg2Resource1"></asp:Label>
    <asp:Label ID="lblSelfBrorrow" runat="server" Text="借用時間重覆, 無法新增,明細如下:" Visible="False" meta:resourcekey="lblSelfBrorrowResource1"></asp:Label>
    <asp:Label ID="lblSelfDetailBrorrow" runat="server" Text="<br />{0} 和 {1}" Visible="False" meta:resourcekey="lblSelfDetailBrorrowResource1"></asp:Label>
    <asp:Label ID="lblErr" runat="server" Text="{0}({1})設備已被預訂,無法新增借用,借用明細如下:" Visible="False" meta:resourcekey="lblErrResource1"></asp:Label>
    <asp:Label ID="lblErrDetail" runat="server" Text=" <br />借用主旨:{0}<br />借用時間:{1}<br />借用者:{2}<br />" Visible="False" meta:resourcekey="lblErrDetailResource1"></asp:Label>
    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>
    <asp:HiddenField ID="hfSelfError" runat="server" />
    <asp:HiddenField ID="hfError" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfAuthErrMsg" runat="server" />
    <asp:Label ID="lblSampleShowLimitMsg" runat="server" Text="設備{0}只開放今天後{1}天內借用(可借用到{2})。" Visible="false" meta:resourcekey="lblSampleShowLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblAuthErrMsg" runat="server" Text="您沒有借用{0}的權限，請重新選取。<br />" Visible="false" meta:resourcekey="lblAuthErrMsgResource1"></asp:Label>
    <asp:Label ID="lblLimitMsg" runat="server" Text="{0}只開放借用到{1}，無法新增。" Visible="false" meta:resourcekey="lblLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblRangeLimitMsg" runat="server" Text="{0}{1}~{2}不開放借用，無法新增。" Visible="false" meta:resourcekey="lblRangeLimitMsgResource1"></asp:Label>
</asp:Content>

