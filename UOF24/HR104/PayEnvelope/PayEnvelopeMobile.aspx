<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="PayEnvelopeMobile.aspx.cs" Inherits="Ede.Uof.Web.HR104.PayEnvelope.PayEnvelopeMobile" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:Label ID="lbl104PortalUrlRequired" Text="未設定104Portal站台網址，請洽系統管理員" Visible="False" runat="server" meta:resourcekey="lbl104PortalUrlRequiredResource1"></asp:Label>
     <asp:Label ID="lblMsg" Text="失敗,請洽系統管理員" Visible="False" runat="server" meta:resourcekey="lblMsgResource1"></asp:Label>
     <asp:Label ID="lblUBINoMsg" Text="取得註冊統編失敗,請洽系統管理員" Visible="False" runat="server" meta:resourcekey="lblUBINoMsgResource1"></asp:Label>
     <asp:Label ID="lblNotAllowUse104Pay" Text="不允許查詢個人電子薪資袋，請洽系統管理員" Visible="False" runat="server" meta:resourcekey="lblNotAllowUse104Resource1"></asp:Label>
     <asp:Label ID="lblNotEnabledForEmployee" Text="未啟用104電子薪資袋功能選單" Visible="False" runat="server" meta:resourcekey="lblNotEnabledForEmployeeResource1"></asp:Label>
</asp:Content>
