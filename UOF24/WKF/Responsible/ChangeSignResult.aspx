<%@ Page Title="變更審核結果" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Responsible_ChangeSignResult" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ChangeSignResult.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td class="PopTableHeader" align="center" style="height: 25px" colspan="2"><asp:Label ID="lblTitle" runat="server" Text="變更表單審核結果" meta:resourcekey="lblTitleResource1"></asp:Label></td> 
        </tr>
        <tr>
            <td style="height: 35px; background-color:White" align="center" colspan="2">
                    <asp:Label ID="lblFormResultMsg" runat="server" Text="目前審核結果為：" meta:resourcekey="lblFormResultMsgResource1"></asp:Label>
                    <asp:Label ID="lblFormResult" runat="server" Text="同意" meta:resourcekey="lblFormResultResource1" ForeColor="Red"></asp:Label>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                        meta:resourcekey="RadioButtonList1Resource1"></asp:RadioButtonList>
            </td> 
        </tr>
        <tr>
                <td style="height: 35px;" class="PopTableLeftTD" nowrap="nowrap"><asp:Label ID="lblChangeForm" runat="server" Text="變更原因" meta:resourcekey="lblChangeFormResource1" style="text-align: center"></asp:Label></td>
                <td style="height: 35px;" class="PopTableRightTD" nowrap="nowrap">
                    <asp:TextBox ID="ChangeFormComment" runat="server"
                        Width="100%" MaxLength="50"
                        meta:resourcekey="ChangeFormCommentResource1"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ChangeFormComment" Display="Dynamic" ErrorMessage="請填寫變更原因" 
                        SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1">請填寫變更原因</asp:RequiredFieldValidator>
                </td>
        </tr>
    </table>
    
    <asp:Label ID="lblSuccessunChangeSignResultForm" runat="server" 
        Text="表單審核結果變更成功" meta:resourcekey="lblSuccessunChangeSignResultFormResource1" 
        Visible="False"></asp:Label>
    <asp:Label ID="lblFailunChangeSignResultForm" runat="server" Text="表單審核結果變更失敗" 
        meta:resourcekey="lblFailunChangeSignResultFormResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblAdopt" runat="server" Text="同意" 
        meta:resourcekey="lblAdoptResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="否決" 
        meta:resourcekey="lblRejectResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblCancel" runat="server" Text="作廢" 
        meta:resourcekey="lblCancelResource1" Visible="False"></asp:Label>
    
    <asp:Label ID="lblChangeFormToAdopt" runat="server" Text="將審核結果變更為『同意』" 
        meta:resourcekey="lblChangeFormToAdoptResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblChangeFormToReject" runat="server" Text="將審核結果變更為『否決』" 
        meta:resourcekey="lblChangeFormToRejectResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblChangeFormToCancel" runat="server" Text="將審核結果變更為『作廢』" 
        meta:resourcekey="lblChangeFormToCancelResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblFailValidatorMsg" runat="server" Text="審核結果變更驗證失敗，原因如下：" meta:resourcekey="lblFailValidatorMsgResource1" Visible="False"></asp:Label>
</asp:Content>

