<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Slogan_SloganDetai" Title="新增/維護公司語錄" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SloganDetail.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="../../Common/HtmlEditor/UC_HtmlEditor.ascx" TagName="UC_HtmlEditor" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table width="100%" cellpadding="0" cellspacing="1" border="0" class="PopTable">
        <tr>
            <td style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="lblSloganNo" runat="server" Text="語錄主旨" meta:resourcekey="lblSloganNoResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSloganNo" runat="server" Width="100%" MaxLength="50" meta:resourcekey="txtSloganNoResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtSloganNo" Display="Dynamic" ErrorMessage="請輸入語錄主旨" ForeColor="Red"
                    meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label1" runat="server" Text="外部會員是否可觀看" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbMember" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font>
                <asp:Label ID="lblStartTime" runat="server" Text="開放起始" meta:resourcekey="lblStartTimeResource1"></asp:Label>
            </td>
            <td >
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <td width="14%">
                        <telerik:RadDatePicker ID="WebDCStartTime" runat="server"></telerik:RadDatePicker>
                    </td>
                    <td width="86%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="請輸入開放起始日" ControlToValidate="WebDCStartTime" ForeColor="Red"
                            Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                    </td>
                </table>
            </td>
        </tr>
        <tr>
            <td >
                <font color="red">*</font>
                <asp:Label ID="lblEndTime" runat="server" Text="開放終止" meta:resourcekey="lblEndTimeResource1"></asp:Label>
            </td>
            <td >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td style="white-space: nowrap; padding-right: 2px">
                                                <asp:RadioButton ID="rbForever" runat="server" AutoPostBack="True"
                                                    Checked="True" GroupName="Time" OnCheckedChanged="rbForever_CheckedChanged"
                                                    Text="永久開放" meta:resourcekey="rbForeverResource1" />
                                            </td>
                                            <td style="white-space: nowrap; padding-right: 2px">
                                                <asp:RadioButton ID="rbEndTime" runat="server" AutoPostBack="True"
                                                    GroupName="Time" OnCheckedChanged="rbEndTime_CheckedChanged" Text="開放終止日期"
                                                    meta:resourcekey="rbEndTimeResource1" />
                                            </td>
                                            <td style="white-space: nowrap; padding-right: 2px">
                                                <telerik:RadDatePicker ID="WebDCEndTime" runat="server"></telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </td>

                                <td style="white-space: nowrap; text-align: left; width: 50%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="WebDCEndTime" ErrorMessage="請輸入開放終止日" ForeColor="Red" Visible="False"
                                        meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>

                                </td>
                            </tr>
                        </table>
                    <asp:HiddenField ID="hfSelectDepID" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="rbForever" EventName="CheckedChanged" />
                        <asp:AsyncPostBackTrigger ControlID="rbEndTime" EventName="CheckedChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font>
                <asp:Label ID="lblSlogan" runat="server" Text="語錄" meta:resourcekey="lblSloganResource1"></asp:Label>
            </td>
            <td style="line-height: normal">
                <uc2:UC_HtmlEditor ID="UC_HtmlEditor1" runat="server" Width="100%" Height="500px" EnableInsertFiles="false" />

                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請輸入語錄" Display="Dynamic" meta:resourcekey="RequiredFieldValidator4Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblLink" runat="server" Text="影音連結" meta:resourcekey="lblLinkResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtLink" runat="server" Width="100%" meta:resourcekey="txtLinkResource1"></asp:TextBox></td>
        </tr>
    </table>
    <asp:HiddenField ID="hiddenAction" runat="server" />
    <asp:HiddenField ID="hiddenIsAllow" runat="server" />
    <asp:HiddenField ID="hiddenSloganId" runat="server" />
    <asp:HiddenField ID="hfCurrentGuid" runat="server" />
</asp:Content>

