<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Chat_RoomConfig" Title="修改權限" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="RoomConfig.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" class="PopTable" width="100%">
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="對話室名稱" 
                    meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td><asp:Label ID="lblRoomName" runat="server" Text="" 
                    ></asp:Label></td>
        
            <td><asp:Label ID="Label2" runat="server" Text="主席" 
                    meta:resourcekey="Label2Resource1"></asp:Label></td>            
            <td><asp:Label ID="lblChairName" runat="server" Text="" 
                    ></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="期間" 
                    meta:resourcekey="Label3Resource1"></asp:Label></td>            
            <td>
                <asp:Label ID="lblCreateDate" runat="server" Text="" 
                    ></asp:Label>
                ～
                <asp:Label ID="lblCloseDate" runat="server" Text="" 
                    ></asp:Label>
            </td>        
            <td><asp:Label ID="Label4" runat="server" Text="結束原因" 
                    meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblCloseReason" runat="server" Text="" 
                   ></asp:Label>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="Label5" runat="server" Text="成員讀取權限" 
                    meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td colspan="3">
               
                <asp:CheckBoxList ID="cblMember" runat="server" RepeatColumns="5" 
                    meta:resourcekey="cblMemberResource1">
                </asp:CheckBoxList>
               
            </td>
        </tr>        
    </table>
<asp:CustomValidator ID="cvCheckRule" runat="server"  
        ErrorMessage="" ></asp:CustomValidator>
<asp:Label ID="lblChairMustBeSelected" runat="server" Text="主席必須被選取" 
        Visible="False" meta:resourcekey="lblChairMustBeSelectedResource1"></asp:Label>
 <asp:Label ID="lblMsgNull" runat="server" Text="正在使用" Visible="False" 
        meta:resourcekey="lblMsgNullResource1"></asp:Label>
    <asp:Label ID="lblMsgNormal" runat="server" Text="正常關閉" Visible="False" 
        meta:resourcekey="lblMsgNormalResource1"></asp:Label>
    <asp:Label ID="lblMsgTimeout" runat="server" Text="逾時" Visible="False" 
        meta:resourcekey="lblMsgTimeoutResource1"></asp:Label>
</asp:Content>

