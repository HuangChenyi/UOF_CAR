<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_CreateSubject" Title="新增討論" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateSubject.aspx.cs" %>
<%@ Register Src="../../Common/HtmlEditor/UC_HtmlEditor.ascx" TagName="UC_HtmlEditor" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="無張貼權限" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="參數不允許空白" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <table style="width:100%"  class="PopTable" cellspacing="0">
        <tr>
            <td style="width:100px;white-space:nowrap;">
                <asp:Label ID="Label2" runat="server" Text="張貼者" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td >
                <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width:100px;white-space:nowrap;">
                <asp:Label ID="Label3" runat="server" Text="主題" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td >
                <asp:TextBox ID="txtSubject" runat="server" Width="100%" MaxLength="255" meta:resourcekey="txtSubjectResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
                    Display="Dynamic" ForeColor="Red" ErrorMessage="不可為空值" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width:100px;white-space:nowrap;">
                <asp:Label ID="Label4" runat="server" Text="內容" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td >
              
                 <uc2:UC_HtmlEditor ID="UC_HtmlEditor1" runat="server" Width="100%" Height="510" />             
            </td>
        </tr>
       
    </table>
</asp:Content>

