<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_SMS_SMSConfig" Title="簡訊管理" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SMSConfig.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="upTree" runat="server">
        <ContentTemplate>
            <telerik:RadTreeView ID="tree" runat="server" OnNodeClick="tree_NodeClick"></telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <table cellspacing="1" class="PopTable">
        <tr>
            <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">
                <asp:UpdatePanel ID="upDescription" runat="server" RenderMode="Inline">
                    <ContentTemplate>
                        <asp:Label ID="lblDescription" runat="server" Text="角色說明:"
                            meta:resourcekey="lblDescriptionResource1"></asp:Label>
                        <asp:Label ID="lblRoleDesc" runat="server"
                            meta:resourcekey="lblRoleDescResource1"></asp:Label>&nbsp; 
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="pnlSetPwd" runat="server" meta:resourcekey="pnlSetPwdResource1">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick" Width="100%" meta:resourcekey="RadToolBar1Resource1">
                                            <Items>
                                                <telerik:RadToolBarButton runat="server" Text="連線測試" Value="ConnectTest"
                                                    ClickedImageUrl="~/Common/Images/Icon/icon_m112.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m112.gif"
                                                    HoveredImageUrl="~/Common/Images/Icon/icon_m112.gif" ImageUrl="~/Common/Images/Icon/icon_m112.gif" meta:resourcekey="RadToolBarButtonResource1">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" Text="儲存" Value="Save"
                                                    ClickedImageUrl="~/Common/Images/Icon/icon_m66.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m66.gif"
                                                    HoveredImageUrl="~/Common/Images/Icon/icon_m66.gif" ImageUrl="~/Common/Images/Icon/icon_m66.gif" meta:resourcekey="RadToolBarButtonResource3">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                                </telerik:RadToolBarButton>
                                            </Items>
                                        </telerik:RadToolBar>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="PopTable" cellpadding="0" cellspacing="1" style="width: 200px">
                                            <tr>
                                                <td class="PopTableLeftTD">
                                                    <asp:Label ID="Label2" runat="server" Text="帳號"
                                                        meta:resourcekey="Label2Resource1"></asp:Label>
                                                </td>
                                                <td class="PopTableRightTD">
                                                    <asp:TextBox ID="txtAccount" runat="server"
                                                        meta:resourcekey="txtAccountResource1" Width="150px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="PopTableLeftTD">
                                                    <asp:Label ID="Label3" runat="server" Text="密碼"
                                                        meta:resourcekey="Label3Resource1"></asp:Label>
                                                </td>
                                                <td class="PopTableRightTD">
                                                    <asp:TextBox ID="txtPWD" runat="server" meta:resourcekey="txtPWDResource1"
                                                        TextMode="Password" autocomplete="off" Width="150px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="PopTableRightTD">
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"
                                                        ErrorMessage="無法連接到簡訊伺服器,請稍候再試或洽您的系統管理人員." meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                                    <asp:Label ID="lbException" runat="server" BackColor="Red" meta:resourcekey="lbExceptionResource1" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnlSMSManager" runat="server" meta:resourcekey="pnlSMSManagerResource1">
                            <uc1:UC_ChoiceList ID="UC_ChoiceListManager" runat="server" IsAllowEdit="false" />
                        </asp:Panel>
                        <asp:Panel ID="pnlSMSUser" runat="server" meta:resourcekey="pnlSMSUserResource1" Height="100%">
                            <uc1:UC_ChoiceList ID="UC_ChoiceListUser" runat="server" TreeHeight="300px" TreeWidth="300px" ExpandToUser="false" />
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblSetPwd" runat="server" Text="設定簡訊發送的帳號及密碼。" Visible="False" meta:resourcekey="lblSetPwdResource1"></asp:Label>
    <asp:Label ID="lblSMSManager" runat="server" Text="簡訊管理者，可發送簡訊，及設定擁有發送簡訊權限之使用者。" Visible="False" meta:resourcekey="lblSMSManagerResource1"></asp:Label>
    <asp:Label ID="lblSMSUser" runat="server" Text="簡訊使用者，可使用簡訊的發送。" Visible="False" meta:resourcekey="lblSMSUserResource1"></asp:Label>
    <asp:Label ID="lblSucc" runat="server" Text="帳號密碼正確" Visible="False" meta:resourcekey="lblSuccResource1"></asp:Label>
    <asp:Label ID="lblFial" runat="server" Text="帳號密碼有誤" Visible="False" meta:resourcekey="lblFialResource1"></asp:Label>
    <asp:Label ID="lblSave" runat="server" Text="儲存成功" Visible="False" meta:resourcekey="lblSaveResource1"></asp:Label>
    <asp:Label ID="lblSetAccount" runat="server" Text="設定帳號密碼" Visible="False" meta:resourcekey="lblSetAccountResource1"></asp:Label>
    <asp:Label ID="lblSMSUserRole" runat="server" Text="簡訊使用者" Visible="False" meta:resourcekey="lblSMSUserRoleResource1"></asp:Label>
    <asp:Label ID="lblTitle" Visible="false" runat="server" Text="權限列表" meta:resourcekey="Label1Resource1"></asp:Label>
</asp:Content>


