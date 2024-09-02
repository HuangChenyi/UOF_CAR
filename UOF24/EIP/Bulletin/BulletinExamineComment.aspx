<%@ Page Title="拒絕發佈意見填寫" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_BulletinExamineComment" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="BulletinExamineComment.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" class="PopTable" width="100%">
        <tr>
            <td colspan="2" style="text-align: center" class="PopTableHeader">
                <div style="text-align: center;">
                    <asp:Label ID="Label2" runat="server" Text="拒絕發佈"
                        meta:resourcekey="Label2Resource1"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style=" white-space:nowrap;">
                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*" 
                    meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="意見內容" 
                    meta:resourcekey="Label1Resource1" ></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtComment" runat="server" Rows="5" TextMode="MultiLine" Width="100%" meta:resourcekey="txtCommentResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請填寫意見內容" ControlToValidate="txtComment" 
                    Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        </table>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>