<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_PreAdditional_MaintainAlertSite" Codebehind="MaintainAlertSite.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable" cellspacing="1" width="100%">
        <tbody>
            <tr>
                <td style="height: 27px" class="PopTableHeader" align="center" colspan="4">
                <center>
                    <asp:Label ID="lblSiteSignTitle" runat="server" meta:resourcekey="lblSiteSignTitleResource1"
                        Text="使用者自訂知會站點"></asp:Label></center></td>
            </tr>
            
            <tr>
                <td class="PopTableLeftTD" style="width: 20%; height: 27px">
                    <asp:Label ID="lblGeneralSingers" runat="server" 
                        Text="知會人員" meta:resourcekey="lblGeneralSingersResource2"></asp:Label></td>
                <td class="PopTableRightTD" style="width: 30%; height: 27px" colspan=3 >
                    <asp:CustomValidator ID="CustomValidatorSigner" runat="server" 
                        Display="Dynamic" meta:resourcekey="CustomValidatorSignerResource1"></asp:CustomValidator>
                    <uc1:UC_ChoiceList ID="UC_ChoiceList_Alert" runat="server" ShowMember="False" />
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Label ID="lblRequireMsg" runat="server" Text="請選擇知會人員!" Visible="False" 
        meta:resourcekey="lblRequireMsgResource1" ></asp:Label>
    &nbsp;
    <asp:Label ID="lblComment" runat="server" Text="註：此為觀看頁面，若要修改站點資訊，請至「設定自訂流程」維護。" Visible="False" meta:resourcekey="lblCommentResource1"></asp:Label>
</asp:Content>

