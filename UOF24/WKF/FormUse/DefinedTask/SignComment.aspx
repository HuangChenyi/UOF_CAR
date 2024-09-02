<%@ Page Title="選擇罐頭意見" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_DefinedTask_SignComment" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SignComment.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" width="100%" cellspacing="1" cellpadding="0">
                <tr class="PopTableHeader" align="center">
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" Text="選擇罐頭意見" 
                            meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                </tr> 
                <tr class="PopTableRightTD" nowrap="nowrap">
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="類型：" 
                            meta:resourcekey="Label1Resource1"></asp:Label>
                        <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddlType_SelectedIndexChanged" 
                            meta:resourcekey="ddlTypeResource1">
                            <asp:ListItem Selected="True" Value="1" meta:resourcekey="ListItemResource1">系統</asp:ListItem>
                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource2">個人</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="內容：" 
                            meta:resourcekey="Label2Resource1"></asp:Label>
                        <asp:DropDownList ID="ddlContent" runat="server" 
                            meta:resourcekey="ddlContentResource1">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableHeader" align="center" colspan="2">
                        <asp:Label ID="Label4" runat="server" Text="新增個人罐頭意見" 
                            meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td class="PopTableRightTD" nowrap="nowrap" colspan="2">  
                      <asp:Label ID="Label5" runat="server" Text="意見內容" 
                            meta:resourcekey="Label5Resource1"></asp:Label>
                        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" meta:resourcekey="txtContentResource1" 
                           ></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvContent" runat="server" 
                            ErrorMessage="意見內容不可空白" ControlToValidate="txtContent" Display="Dynamic" meta:resourcekey="rfvContentResource1" 
                            ></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlType" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblSave" runat="server" Text="儲存" Visible="False" 
        meta:resourcekey="lblSaveResource1"></asp:Label>
    <asp:Label ID="lblSubmit" runat="server" Text="送出" Visible="False" 
        meta:resourcekey="lblSubmitResource1"></asp:Label>
</asp:Content>

