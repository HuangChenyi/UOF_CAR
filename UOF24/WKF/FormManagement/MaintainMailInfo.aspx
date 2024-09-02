<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_MaintainMailInfo" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="MaintainMailInfo.aspx.cs" %>

<%@ Register Src="~/WKF/Common/UC_VariableList.ascx" TagName="UC_VariableList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .Silk .reDropdown{
            background-color:white;
        }
        .Silk .reTool_disabled.reDropdown:hover span {
        color: #767676
        }
        .Silk .reDropdown:hover span {
            color: white
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" class="PopTable" cellspacing="0" cellpadding="0">
                <colgroup class="PopTableLeftTD"></colgroup>
                <colgroup class="PopTableRightTD"></colgroup>
                <tr>
                    <td class="PopTableHeader" colspan="2" align="center">
                        <center>
                            <asp:Label ID="Label1" runat="server" Text="郵件樣板維護" 
                                meta:resourcekey="Label1Resource1"></asp:Label>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap">
                        <asp:Label ID="Label3" runat="server" Text="型態"
                            meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblAlertType" runat="server" Text=""></asp:Label>
                        
                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"
                            ErrorMessage="該類型郵件已存在" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap">
                        <asp:Label ID="Label2" runat="server" Text="語系"
                            meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCulture" runat="server" Text=""></asp:Label>

                        <asp:CheckBox ID="cbDefault" runat="server" Text="當系統找不到其他語系時,以此語系發送"
                            meta:resourcekey="cbDefaultResource1" />

                        <asp:CustomValidator ID="cvDefault" runat="server" Display="Dynamic"
                            ErrorMessage="該郵件內容未有預設語系,請先設定預設語系"
                            meta:resourcekey="cvDefaultResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap">
                        <asp:Label ID="Label4" runat="server" Text="郵件主旨"
                            meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSubjuct" runat="server" Width="1100px"
                            meta:resourcekey="txtSubjuctResource1"></asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="郵件主旨不可空白" ControlToValidate="txtSubjuct" Display="Dynamic"
                            meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap">
                        <asp:Label ID="Label5" runat="server" Text="郵件內容"
                            meta:resourcekey="Label5Resource1"></asp:Label>

                    </td>
                    <td>
                        <telerik:RadEditor ID="wheMailContent" runat="server" Height="450px" Width="1100px"></telerik:RadEditor>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="郵件內容不可空白" ControlToValidate="wheMailContent"
                            Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <uc1:UC_VariableList ID="UC_VariableList1" runat="server" />

            <asp:Label ID="lblType" runat="server" Visible="False"
                meta:resourcekey="lblTypeResource1"></asp:Label>
            <asp:Label ID="lblSign" runat="server" Text="簽核通知" Visible="False"
                meta:resourcekey="lblSignResource1"></asp:Label>
            <asp:Label ID="lblAlert" runat="server" Text="表單知會" Visible="False"
                meta:resourcekey="lblAlertResource1"></asp:Label>
            <asp:Label ID="lblFinish" runat="server" Text="表單結案" Visible="False"
                meta:resourcekey="lblFinishResource1"></asp:Label>
            <asp:Label ID="lblCancel" runat="server" Text="表單作廢" Visible="False"
                meta:resourcekey="lblCancelResource1"></asp:Label>
            <asp:Label ID="lblBackSign" runat="server" Text="表單退簽" Visible="False"
                meta:resourcekey="lblBackSignResource1"></asp:Label>
            <asp:Label ID="lblAgree" runat="server" Text="表單核准" Visible="False"
                meta:resourcekey="lblAgreeResource1"></asp:Label>
            <asp:Label ID="lblReject" runat="server" Text="表單否決" Visible="False"
                meta:resourcekey="lblRejectResource1"></asp:Label>
            <asp:Label ID="lblFormForum" runat="server" Text="表單討論" Visible="False"
                meta:resourcekey="lblFormForumResource1"></asp:Label>
            <asp:Label ID="lblFormRetrieve" runat="server" Text="表單取回" Visible="False"
                meta:resourcekey="lblFormRetrieveResource1"></asp:Label>
            <asp:Label ID="lblFormInquiry" runat="server" Text="表單徵詢" Visible="False"
                meta:resourcekey="lblFormInquiryResource1"></asp:Label>
            <asp:Label ID="lblFormUnlock" runat="server" Text="表單解除鎖定" Visible="False"
                meta:resourcekey="lblFormUnlockResource1"></asp:Label>
            <asp:Label ID="lblFormApplyByDelegate" runat="server" Text="表單代填寫" Visible="False"
                meta:resourcekey="lblFormApplyByDelegateResource1"></asp:Label>
            <asp:Label ID="lblReturnSignAlert" runat="server" Text="表單退簽知會" Visible="False"
                meta:resourcekey="lblReturnSignAlertResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

