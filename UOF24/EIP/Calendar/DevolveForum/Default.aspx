<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.DevolveForum.Default" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/EIP/Calendar/DevolveForum/UC_DevolveForumArticle.ascx" TagPrefix="uc1" TagName="UC_DevolveForumArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblDevolveDeleteMsg" runat="server" Text="此交辦已被刪除" Visible="False" ForeColor="Red" meta:resourcekey="lblDevolveDeleteMsgResource1" ></asp:Label>
    <uc1:UC_DevolveForumArticle runat="server" id="UC_DevolveForumArticle" />
    <asp:Label ID="lbHome" runat="server" Text="我的首頁" Visible="False" meta:resourcekey="lbHomeResource1" ></asp:Label>
    <asp:Label ID="lblCalendar" runat="server" Text="行事曆" Visible="False" meta:resourcekey="lblCalendarResource1" ></asp:Label>
    <asp:Label ID="lbDevolveForum" runat="server" Text="交辦討論" Visible="False" meta:resourcekey="lbDevolveForumResource1" ></asp:Label>
</asp:Content>