<%@ Page Title="SIP帳號新增" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_WebPhone_SIPAccountAdd" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SIPAccountAdd.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:CustomValidator ID="cuvError" runat="server" Display="Dynamic" ForeColor="Red" 
                meta:resourcekey="cuvErrorResource1"></asp:CustomValidator>
            <table class="PopTable" cellspacing="1">
                <tr>
                    <td><font color="red" >*</font>
                        <asp:Label ID="lblAccount" runat="server" Text="帳號" 
                            meta:resourcekey="lblAccountResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAccount" runat="server" 
                            meta:resourcekey="txtAccountResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAccount" runat="server" ErrorMessage="帳號必須輸入" Display="Dynamic" ForeColor="Red" 
                            ControlToValidate="txtAccount" meta:resourcekey="rfvAccountResource1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><font color="red" >*</font>
                        <asp:Label ID="lblPWD" runat="server" Text="密碼" 
                            meta:resourcekey="lblPWDResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPWD" runat="server" meta:resourcekey="txtPWDResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="密碼必須輸入" Display="Dynamic" ForeColor="Red" 
                            ControlToValidate="txtPWD" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="lblIsPrivate" runat="server" Text="公用/私用" 
                            meta:resourcekey="lblIsPrivateResource1"></asp:Label>
                    </td>
                    <td>
                        <table cellpadding="2" cellspacing="1">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="rbtIsPrivate" runat="server" RepeatDirection="Horizontal"
                                        AutoPostBack="True" 
                                        OnSelectedIndexChanged="rbtIsPrivate_SelectedIndexChanged" 
                                        meta:resourcekey="rbtIsPrivateResource1">
                                        <asp:ListItem Text="公用" Selected="True" Value="N" 
                                            meta:resourcekey="ListItemResource1"></asp:ListItem>
                                        <asp:ListItem Text="私用" Value="Y" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:Image ID="imgManHead" runat="server" Visible="False" 
                                                    ImageUrl="~/Common/Images/Icon/icon_m17.png" 
                                                    meta:resourcekey="imgManHeadResource1" />
                                            </td>
                                            <td valign="baseline">
                                                <asp:Label ID="lblVIPUser" runat="server" 
                                                    meta:resourcekey="lblVIPUserResource1"></asp:Label>
                                                <asp:HiddenField ID="hfVIPUser" runat="server" />
                                                <asp:HiddenField ID="hfVIPXML" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblAccountExistError" runat="server" Text="帳號已存在" ForeColor="Red" Visible="False" meta:resourcekey="lblAccountExistErrorResource1"></asp:Label>
    <asp:Label ID="lblOwnerMustSelect" runat="server" Text="私用帳號請指定擁有者" ForeColor="Red" Visible="False" meta:resourcekey="lblOwnerMustSelectResource1"></asp:Label>
    <asp:Label ID="lblSelect" runat="server" Text="選取人員" Visible="false" meta:resourcekey="lblSelectResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
