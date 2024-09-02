<%@ Page Title="強制結案" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Responsible_EndForm" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="EndForm.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td class="PopTableHeader" style="height: 25px;width:100px; text-align:center;margin-left:4%;margin-right:40%" colspan="2"><asp:Label ID="lblTitle" runat="server" Text="表單強制結案" meta:resourcekey="lblTitleResource1"></asp:Label></td> 
        </tr>
        <tr>
            <td style="height: 25px; text-align:left" class="PopTableRightTD" colspan="2">
                    <asp:RadioButton ID="rbApproveForm" runat="server" GroupName="rbEndForm" Checked="True" meta:resourcekey="rbApproveFormResource1" Text="結案狀態設定為『同意』" />
                    <br />
                    <asp:RadioButton ID="rbRejectForm" runat="server" GroupName="rbEndForm" meta:resourcekey="rbRejectFormResource1" Text="結案狀態設定為『否決』" />
            </td> 
        </tr>
        <tr>
                <td style="height: 35px;" class="PopTableLeftTD" nowrap="nowrap"><asp:Label ID="lblEndForm" runat="server" Text="結案原因" meta:resourcekey="lblEndFormFormResource1" style="text-align: center"></asp:Label></td>
                <td style="height: 35px;" class="PopTableRightTD" nowrap="nowrap">
                    <asp:TextBox ID="EndFormComment" runat="server" Height="60px" 
                        TextMode="MultiLine" Width="300px" meta:resourcekey="EndFormCommentResource1"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="EndFormComment" Display="Dynamic" ErrorMessage="請填寫結案原因" 
                        SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1">請填寫結案原因</asp:RequiredFieldValidator>
                </td>
        </tr>
    </table>
    
    <asp:Label ID="lblSuccessunEndForm" runat="server" Text="表單已成功結案" 
        meta:resourcekey="lblSuccessunEndFormResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblFailunEndForm" runat="server" Text="表單強制結案失敗" 
        meta:resourcekey="lblFailunEndFormResource1" Visible="False"></asp:Label>

    <asp:Label ID="lblFormEndFormForBackgoundProcessing" runat="server" Text="此表單正在進行背景簽核，無法強制結案" meta:resourcekey="lblFormEndFormForBackgoundProcessingResource1" Visible="False"></asp:Label>

</asp:Content>

