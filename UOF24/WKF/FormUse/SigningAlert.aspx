<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SigningAlert.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.SigningAlert" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc2" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="0" cellspacing="1" style="border: 0; width: 100%;" class="PopTable">
        <tr style="vertical-align: top;">
            <td class="PopTableHeader" style="text-align: center;" colspan="2">
                <center><asp:Label ID="Label2" runat="server" 
                            Text="選擇人員" meta:resourcekey="Label2Resource1"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td>

                <asp:Label ID="lblNotice" runat="server" Text="知會人員"
                    meta:resourcekey="lblNoticeResource1"></asp:Label>

            </td>
            <td class="PopTableRightTD" style="text-align: left">
                <div style="text-align: left;">

                    <asp:panel id="Panel5" runat="server" height="100px"
                        meta:resourcekey="Panel5Resource1" horizontalalign="Left">
                        <uc2:uc_choicelist runat="server" id="UC_ChoiceList" treeheight="60px" showmember="False" treewidth="100%" />
                    </asp:panel>
                </div>
                <asp:label id="lblNoAlerter" runat="server" text="請選擇知會人員" forecolor="Red" meta:resourcekey="lblNoAlerterResource1" visible="false"></asp:label>
            </td>
        </tr>
    </table>
</asp:Content>
