<%@ Page Title="維護他人行事曆" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_Common_OpenEditScheduleUser" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="OpenEditScheduleUser.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblNoUser" runat="server" Text="無人員行事曆可維護" Visible ="False" ForeColor="Red" meta:resourcekey="lblNoUserResource1"></asp:Label>
    <telerik:RadTreeView ID="RadTreeView1" runat="server" Width="100%"  Height="100%" EnableNodeTextHtmlEncoding="true" meta:resourcekey="RadTreeView1Resource1"></telerik:RadTreeView>
    <asp:Label ID="lbNoSelectedItemWarning" runat="server" Visible="False" 
        Text="您沒有選取任何項目,確定要關閉嗎?" meta:resourcekey="lbNoSelectedItemWarningResource1"></asp:Label>            
</asp:Content>

