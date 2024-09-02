<%@ Page Title="新增知會站點" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master"
    AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupAlertSite" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetupAlertSite.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td align="center" class="PopTableHeader" style="height: 27px">
                <center>
                    <asp:Label ID="lblSiteAlretTitle" runat="server" Text="知會站點" meta:resourcekey="lblSiteAlretTitleResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td class="PopTableHeader" style="height: 27px" align="center">
                <center>
                    <asp:Label ID="lblSetupAlreterTitle" runat="server" Text="設定人員" meta:resourcekey="lblSetupAlreterTitleResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td class="popTableLeftTD">
                <div align="center">
                    <asp:Label ID="lblSpecialAlrets" runat="server" Text="特殊知會" meta:resourcekey="lblSpecialAlretsResource1"></asp:Label>
                    <br />
                    <asp:CustomValidator ID="alretCustomValidator" runat="server" Display="Dynamic" Visible="false" 
                        ErrorMessage="知會人員至少需有一位，請至少選擇一位特殊人員或一般知會" meta:resourcekey="alretCustomValidatorResource1">
                    </asp:CustomValidator>
                </div>
            </td>
        </tr>
        <tr>
            <td class="PopTableRightTD" style="text-align: left">
                <table cellpadding="0" cellspacing="0" align="left" width="100%">
                    <tr>
                        <td style="background-color: White; height: 27px" valign="top">
                            <asp:CheckBoxList ID="cblSpecialAlrets" runat="server" RepeatColumns="2" Width="100%"
                                meta:resourcekey="cblSpecialAltersResource1">
                                <asp:ListItem Value="IS_APPLYER_ALERT" Text="申請者" meta:resourcekey="ListItemResource1" ></asp:ListItem>
                                <asp:ListItem Value="IS_LAST_AGENT_ALERT" Text="上一站點代理人" meta:resourcekey="ListItemResource3" ></asp:ListItem>
                                <asp:ListItem Value="IS_APPLYER_SUPERIOR_ALERT" Text="申請者直屬主管" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                <asp:ListItem Value="IS_LAST_SUPERIOR_ALERT" Text="上一站直屬主管" meta:resourcekey="ListItemResource5"></asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <div align="center">
                    <asp:Label ID="lblGeneralAlrets" runat="server" Text="一般知會" meta:resourcekey="lblGeneralAlretsResource1"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td class="PopTableRightTD" style="text-align: center; width: 100%" align="center">
                <center style="width: 100%">
                    <div style="width: 100%">
                        <uc1:UC_ChoiceList ID="UC_ChoiceList_Alert" runat="server" ExpandToUser="false" ShowMember="False" />
                    </div>
                </center>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <div align="center">
                    <asp:Label ID="lblOrganizationAlrets" runat="server" Text="組織欄位知會" meta:resourcekey="lblOrganizationAlretsResource1"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td valign="middle" class="PopTableRightTD">
                <div align="center">
                    <table>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:TextBox ID="tbxFieldID" runat="server" Style="text-align: center" meta:resourcekey="tbxFieldIDResource1"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnSearchField" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                &nbsp;
                                <asp:Button ID="btnSearchField" runat="server" Text="...." CausesValidation="False" 
                                    Style="cursor: pointer" OnClick="btnSearchField_Click" meta:resourcekey="btnSearchFieldResource1" >
                                </asp:Button>
                                &nbsp;
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請輸入表單欄位代號" 
                                    Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1">
                                </asp:CustomValidator>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblComment" runat="server" Text="註：此為觀看頁面，若要修改站點資訊，請至「維護流程」中設定。" Visible="False" meta:resourcekey="lblCommentResource1"></asp:Label>
    <br />
    <asp:Panel ID="Panel2" runat="server" Height="50px" Visible="False" Width="125px" meta:resourcekey="Panel2Resource1">
        <asp:Label ID="lblIsEndFlow" runat="server" Text="可否結束流程" meta:resourcekey="lblIsEndFlowResource1" Visible="False"></asp:Label>
        <asp:RadioButton ID="rbAllowEndFlow" runat="server" GroupName="isEndFlow" Text="允許" meta:resourcekey="rbAllowEndFlowResource1" Visible="False" />
        <asp:RadioButton ID="rbDisallowEndFlow" runat="server" Checked="True" GroupName="isEndFlow" Text="不允許" meta:resourcekey="rbDisallowEndFlowResource1" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Visible="False" meta:resourcekey="Panel3Resource1">
        <asp:Label ID="lblIsJumpSign" runat="server" Text="可否跳簽" meta:resourcekey="lblIsJumpSignResource1"></asp:Label>
        <asp:RadioButton ID="rdAllowJumpSign" runat="server" GroupName="isJumpSign" Text="允許" meta:resourcekey="rdAllowJumpSignResource1" />
        <asp:RadioButton ID="rdDisAllowJumpSign" runat="server" GroupName="isJumpSign" Text="不允許" meta:resourcekey="rdDisAllowJumpSignResource1" Checked="True" />
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" Visible="False" meta:resourcekey="Panel1Resource1">
        <asp:Label ID="lblIsAdditionalSign" runat="server" Text="可否加簽" meta:resourcekey="lblIsAdditionalSignResource1" Visible="False"></asp:Label>
        <asp:RadioButton ID="rdAllowAdditionalSign" runat="server" GroupName="isAdditionalSign" Text="允許" meta:resourcekey="rdAllowAdditionalSignResource1" />
        <asp:RadioButton ID="rdDisallowAdditionalSign" runat="server" Checked="True" GroupName="isAdditionalSign" Text="不允許" meta:resourcekey="rdDisallowAdditionalSignResource1" />
    </asp:Panel>
    <asp:Label ID="lblSetFormField" runat="server" Text="選擇表單欄位" Visible="False" meta:resourcekey="lblSetFormFieldResource1"></asp:Label>
</asp:Content>