<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CalendarSyncSetting.aspx.cs" Inherits="Ede.Uof.Web.Basic.Personal.Information.CalendarSyncSetting" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%">
         <tr>
            <td style="text-align: left">
                 <table border="0" class="PopTable" style="width: 100%">
                 <tr>
                     <td style="width: 3%;white-space: nowrap ;text-align:right" class="PopTableLeftTD">
                       <asp:Label ID="lblstar1" Text="*" meta:resourcekey="lblstarResource1" runat="server" ForeColor="Red"/>
                       <asp:Label ID="lblCalendarName" Text="行事曆名稱" meta:resourcekey="lblCalendarNameResource1" runat="server" ForeColor="Black"/>
                     </td>
                      <td style="width: 15%;white-space: nowrap" class="PopTableRightTD">
                        <asp:TextBox ID="txtCalendarName" Width="90%" runat="server"  MaxLength="10" meta:resourcekey="txtCalendarNameResource1"/><br>
                        <asp:Label ID="lblErrorMessage" Text="不允許空白" meta:resourcekey="lblErrorMessageResource1" runat="server" ForeColor="Red" Visible="False"/>
                        <asp:Label ID="lblErrorReplyName" Text="行事曆名稱不可重複" meta:resourcekey="lblErrorReplyNameResource1" runat="server" ForeColor="Red" Visible="False"/>
                      </td>
                 </tr>
                 <tr>
                    <td style="width: 3%;white-space: nowrap ;text-align:right" class="PopTableLeftTD">
                      <asp:Label ID="lblstar2" Text="*" meta:resourcekey="lblstar2Resource1" runat="server" ForeColor="Red"/>
                      <asp:Label ID="lblCalendarLink" Text="行事曆連結" meta:resourcekey="lblCalendarLinkResource1" runat="server" ForeColor="Black"/>
                    </td>
                    <td style="width: 15%;white-space: nowrap"  class="PopTableRightTD">
                      <asp:TextBox ID="txtCalendarLink" Width="90%" runat="server" meta:resourcekey="txtCalendarLinkResource1"/><br>
                      <asp:Label ID="lblErrorMessage2" Text="不允許空白" meta:resourcekey="lblErrorMessage2Resource1" runat="server" ForeColor="Red" Visible="False"/>
                    </td>
                 </tr>
                      <asp:CustomValidator ID="cvCalendarName" runat="server" ForeColor="Red" meta:resourcekey="cvCalendarNameResource1"></asp:CustomValidator>                    
               </table>
                 <asp:Label ID="lblCalendarInfo1" Text="1.請輸入您要訂閱的行事曆ics連結。" meta:resourcekey="lblCalendarInfo1Resource1" runat="server" ForeColor="blue" Visible="true"/><br>
                 <asp:Label ID="lblCalendarInfo3" Text="2.若[行事曆名稱]欄位設定為[Google]，行事曆事件主旨會顯示為[10:00~11:00][Google]公司月會。" meta:resourcekey="lblCalendarInfo3Resource1" runat="server" ForeColor="blue" Visible="true"/><br>
                 <asp:Label ID="lblCalendarInfo4" Text="3.若要同步iCloud行事曆，請先啟用iCloud雲端同步服務。" meta:resourcekey="lblCalendarInfo4Resource1" runat="server" ForeColor="blue" Visible="true"/>                
                <asp:HiddenField ID="hfUserGuid" runat="server" />
                <asp:HiddenField ID="hfICSGuid" runat="server" />  
            </td>
        </tr>
    </table>
</asp:Content>
