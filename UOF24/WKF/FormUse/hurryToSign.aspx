<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_hurryToSign" Title="跟催" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="hurryToSign.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td class="PopTableHeader" align="center" style="height: 21px">
                <center>
                    <asp:Label ID="lblCurrentSignerTitle" runat="server" Text="目前簽核者" meta:resourcekey="lblCurrentSignerTitleResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblParallalSiteCantHurryToSignTip" runat="server" Text="目前的簽核者站點屬於平行流程站點，不提供跟催簽核者功能。" Visible="false" ForeColor="Blue" meta:resourcekey="lblParallalSiteCantHurryToSignTipResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <Fast:Grid ID="DGCurrentSiteList" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" OnRowDataBound="DGCurrentSiteList_RowDataBound" DataKeyNames="ORIGINAL_SIGNER,AGENT_USER_GUID" Width="100%" meta:resourcekey="DGCurrentSiteListResource1" DataKeyOnClientWithCheckBox="False"  DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15"  >
                    <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>
                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:TemplateField HeaderText="應簽核者" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblORIGINAL_SIGNER" meta:resourceKey="lblUserResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="代理人" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblAGENT_USER" meta:resourceKey="lblUserResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="簽核者" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblACTUAL_SIGNER" meta:resourceKey="lblUserResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="簽核狀態" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblSignStatus" meta:resourceKey="lblSignStatusResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="tbSendMsg" runat="server" style="margin-left:2px;margin-right:2px;margin-top:2px;" Height="60px" 
                    TextMode="MultiLine" Width="99%" meta:resourcekey="tbSendMsgResource1">
                </asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td><br /></td>
        </tr>
        <tr>
            <td class="PopTableHeader" align="center" style="height: 21px; border:inset;border-left:none;border-right:none; ">
                <center>
                    <asp:Label ID="lblNotifyOther" runat="server" Text="通知其他人員" meta:resourcekey="lblNotifyOtherResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="height: 25px">
                <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False" />
            </td>
        </tr> 
        <tr>
            <td>
                <hr style="margin-bottom:2px;"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="tbSendMsg2" runat="server" style="margin-left:2px;margin-right:2px;margin-top:2px;" Height="60px" 
                    TextMode="MultiLine" Width="99%" meta:resourcekey="tbSendMsgResource1">
                </asp:TextBox>
                <asp:CustomValidator ID="cvNoReceiver" runat="server" Display="Dynamic" ErrorMessage="尚未選擇要跟催的簽核者或通知人員，請確認" meta:resourcekey="cvNoReceiverResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblAgree" runat="server" Text="核准" Visible="False" meta:resourcekey="lblAgreeResource1"></asp:Label>
    <asp:Label ID="lblDisagree" runat="server" Text="不同意" Visible="False" meta:resourcekey="lblDisagreeResource1"></asp:Label>
    <asp:Label ID="lblBack" runat="server" Text="退簽" Visible="False" meta:resourcekey="lblBackResource1"></asp:Label>
    <asp:Label ID="lblNoComment" runat="server" Text="沒意見" Visible="False" meta:resourcekey="lblNoCommentResource1"></asp:Label>
    <asp:Label ID="lblNull" runat="server" Text="未簽核" Visible="False" meta:resourcekey="lblNullResource1"></asp:Label>
    <asp:Label ID="lblMsgSend" runat="server" Text="訊息已送出" Visible="False" meta:resourcekey="lblMsgSendResource1"></asp:Label>
    <asp:Label ID="lblDefaultMsg" runat="server" Text="請盡快簽核，謝謝" Visible="False" meta:resourcekey="lblDefaultMsgResource1"></asp:Label>
    <asp:Label ID="lblOtherDefaultMsg" runat="server" Text="請協助通知簽核者盡快完成表單簽核，謝謝" Visible="False" meta:resourcekey="lblOtherDefaultMsgResource1"></asp:Label>
</asp:Content>