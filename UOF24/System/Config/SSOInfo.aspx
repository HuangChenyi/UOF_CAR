<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SSOInfo.aspx.cs" Inherits="System_Config_SSOInfo" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table>
      <tr>
          <td>
             <ol style="color:black; margin-left: 20px;">
               <li style="word-break: break-all">
                 <asp:Label ID="lblIPRangeDesc1" runat="server" Text="啟用前請先將主機(AP Server)加入AD網域中" meta:resourcekey="lblIPRangeDesc1Resource1"></asp:Label>
               </li>
               <li style="word-break: break-all">
                 <asp:Label ID="lblIPRangeDesc" runat="server" meta:resourcekey="lblIPRangeDescResource1" Text="啟用後當使用者的IP位址在上列區段中時系統會嘗試讓使用者以SSO的方式登入,例如:設定192.168.1.0~192.168.1.255,而使用者的IP為192.168.1.10時會優先使用SSO登入"></asp:Label>
               </li>
               <li style="word-break: break-all">
                 <asp:Label ID="lblIPRangeDesc4" runat="server" Text="以SSO方式登入失敗時,使用者仍可以使用標準的驗證方式或者使用AD整合式驗證(需先完成設定)" meta:resourcekey="lblIPRangeDesc4Resource1"></asp:Label>
               </li>
               <li style="word-break: break-all"> 
                 <asp:Label ID="lblIPRangeDesc2" runat="server" Text="啟用用戶端憑證SSO時:" meta:resourcekey="lblIPRangeDesc2Resource1"></asp:Label><br>
               </li>
                  <asp:Label ID="lblIPInfo1" runat="server" Text="(1)請務必啟用IIS中UOF站台的ADAuth目錄裡的SSL的設定。"  meta:resourcekey="lblIPInfo1Resource1"></asp:Label><br>
                  <asp:Label ID="lblIPInfo2" runat="server" Text="(2)IP範圍內的人員需設定個人用戶端憑證。" meta:resourcekey="lblIPInfo2Resource1"></asp:Label>
               <li style="word-break: break-all">
                 <asp:Label ID="lblIPRangeDesc3" runat="server" Text="啟用Azure AD SSO時:" meta:resourcekey="lblIPRangeDesc3Resource1"></asp:Label><br>    
               </li>
                  <asp:Label ID="lblIPInfo3" runat="server" Text="(1)IP範圍內的人員需擁有Microsoft 365的使用者帳戶。" meta:resourcekey="lblIPInfo3Resource1"></asp:Label><br>
                  <asp:Label ID="lblIPInfo4" runat="server" Text="(2)人員帳號資訊中請勿設定網域。" meta:resourcekey="lblIPInfo4Resource1"></asp:Label>
             </ol>
         </td>
      </tr>
</table>
</asp:Content>
