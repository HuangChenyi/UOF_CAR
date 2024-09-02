<%@ Page Title="表單作廢" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Responsible_CancelForm" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CancelForm.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td class="PopTableHeader" align="center" style="height: 25px" colspan="2"><asp:Label ID="lblTitle" runat="server" Text="表單作廢" meta:resourcekey="lblTitleResource1"></asp:Label></td> 
        </tr>
        <tr>
                <td style="height: 35px;" class="PopTableLeftTD" nowrap="nowrap"><asp:Label ID="lblCancelForm" runat="server" Text="作廢原因" meta:resourcekey="lblCancelFormResource1" style="text-align: center"></asp:Label></td>
                <td style="height: 35px;" class="PopTableRightTD" nowrap="nowrap">
                    <asp:TextBox ID="CancelFormComment" runat="server" 
                        Width="100%" MaxLength="50" 
                        meta:resourcekey="CancelFormCommentResource1"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="CancelFormComment" Display="Dynamic" ErrorMessage="請填寫作廢原因" 
                        SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1">請填寫作廢原因</asp:RequiredFieldValidator>
                </td>
        </tr>
    </table>
    
    <asp:Label ID="lblSuccessCancelForm" runat="server" Text="表單已成功作廢" 
        meta:resourcekey="lblSuccessCancelFormResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblFailCancelForm" runat="server" Text="表單作廢失敗" 
        meta:resourcekey="lblFailCancelFormResource1" Visible="False"></asp:Label>
        <asp:Label ID="lblFormGetBackExaminedForBackgoundProcessing" runat="server" Text="此表單正在進行背景簽核，無法作廢" Visible="False" meta:resourcekey="lblFormGetBackExaminedForBackgoundProcessingResource1"></asp:Label>

</asp:Content>

