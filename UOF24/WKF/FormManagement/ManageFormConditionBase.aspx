<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ManageFormConditionBase" Title="維護判斷式" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ManageFormConditionBase.aspx.cs" %>

<%@ Register Src="VersionFieldUserControl/VersionFieldUC.ascx" TagName="VersionFieldUC" TagPrefix="uc2" %>
<%@ Register Src="VersionFieldUserControl/VersionFieldConditionUC.ascx" TagName="VersionFieldConditionUC" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="updatepanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="166px" Width="100%" meta:resourcekey="Panel1Resource1">
                <uc1:VersionFieldConditionUC ID="VersionFieldConditionUC1" runat="server"></uc1:VersionFieldConditionUC>
                <br />
                <div>
                <center>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                </center>
                </div>
            </asp:Panel>
            <asp:Label ID="lblErrorMsg" runat="server" Text="錯誤！此條件已經存在！" Visible="False" meta:resourcekey="lblErrorMsgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
