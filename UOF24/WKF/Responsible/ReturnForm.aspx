<%@ Page Title="結案復原" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Responsible_ReturnForm" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ReturnForm.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="Panel1" runat="server">
        <table width="100%" class="PopTable" cellspacing="1">
            <tr>
                <td class="PopTableHeader" align="center" style="height: 25px" colspan="2"><asp:Label ID="lblTitle" runat="server" Text="表單結案復原" meta:resourcekey="lblTitleResource1"></asp:Label></td> 
            </tr>
            <tr>
                    <td style="height: 35px;" class="PopTableLeftTD" nowrap="nowrap"><asp:Label ID="lblReturnForm" runat="server" Text="復原原因" meta:resourcekey="lblReturnFormResource1" style="text-align: center"></asp:Label></td>
                    <td style="height: 35px;" class="PopTableRightTD" nowrap="nowrap">
                        <asp:TextBox ID="ReturnFormComment" runat="server" Height="100px" 
                            TextMode="MultiLine" Width="100%" 
                            meta:resourcekey="ReturnFormCommentResource1"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="ReturnFormComment" Display="Dynamic" ErrorMessage="請填寫復原原因" 
                            SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1">請填寫復原原因</asp:RequiredFieldValidator>
                    </td>
            </tr>
        </table>
    </asp:Panel>
    
    <asp:Panel ID="Panel2" runat="server">
        <table width="100%" class="PopTable" cellspacing="1">
            <tr>
                <td class="PopTableHeader" align="center" style="height: 25px"><asp:Label ID="lblTitleA" runat="server" Text="表單結案復原" meta:resourcekey="lblTitleAResource1"></asp:Label></td> 
            </tr>
            <tr>
                    <td style="height: 100%;" class="PopTableRightTD" nowrap="nowrap">
                            <asp:Label ID="lblReturnFormMsg" runat="server" Text="此單為起單即為結案，無法復原！" ForeColor="Red" meta:resourcekey="lblReturnFormMsgResource1" Visible="True"></asp:Label>
                    </td>
            </tr>
        </table>
    </asp:Panel>
    
    <asp:Label ID="lblSuccessunReturnForm" runat="server" Text="表單復原狀態成功" meta:resourcekey="lblSuccessunReturnFormResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblFailunReturnForm" runat="server" Text="表單復原狀態失敗" meta:resourcekey="lblFailunReturnFormResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblFailValidatorMsg" runat="server" Text="結案復原驗證失敗，原因如下：" meta:resourcekey="lblFailValidatorMsgResource1" Visible="False"></asp:Label>
</asp:Content>

