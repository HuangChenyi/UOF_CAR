<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_ChangeAuthor" Title="變更作者" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChangeAuthor.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce"
    TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <script type="text/jscript">

        function ConfirmChange() {
            try {
                var hidAuthorName = $("#<%=hidAuthorName.ClientID %>");
                var hidAuthorID = $("#<%=hidAuthorID.ClientID %>");
                var hidReader = $("#<%=hidReader.ClientID%>");

                if (hidAuthorID.val() == "" && hidReader.val() == "") {
                    alert('<%=labChoiceAuthor.Text %>');

                    return false;
                }

                if (window.confirm('<%=labChangeConfirm.Text %>')) {
                    return true;
                }
                else {
                    return false;
                }
            }
            catch (e) {
                return false;
            }
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table class="PopTable" style="width: 100%" cellspacing="1">
                <colgroup class="PopTableLeftTD"></colgroup>
                <colgroup class="PopTableRightTD"></colgroup>
                <colgroup class="PopTableLeftTD"></colgroup>
                <colgroup class="PopTableRightTD"></colgroup>
                <tr>
                    <td style="width: 15%">
                        <asp:Label ID="Label1" runat="server" Text="作者"
                            meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td style="width: 85%">
                        <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" width="100%" />
                        <asp:Label ID="lblUser" runat="server"></asp:Label>
                        <asp:HiddenField ID="hidAuthorName" runat="server" />
                        <asp:HiddenField ID="hidAuthorID" runat="server" />

                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">
                        <asp:Label ID="Label2" runat="server" Text="讀者"
                            meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td style="width: 85%">
                        <uc2:UC_ChoiceList ID="UC_Reader" runat="server" ChioceType="All"
                            ShowMember="False" ExpandToUser="False" TreeHeight="65" width="100%"/>

                        <asp:HiddenField ID="hidReader" runat="server" />
                        <asp:HiddenField ID="HiddenField2" runat="server" />

                    </td>
                </tr>
            </table>
            <br />

        </ContentTemplate>
    </asp:UpdatePanel>
    <center>
    <asp:Label ID="labAlertChoiceUser" runat="server" ForeColor="Red" Text="請先勾選要變更作者或讀者的文件" meta:resourcekey="labAlertChoiceUserResource1"></asp:Label>
        <asp:Label ID="labChoiceAuthor" runat="server" Text="請選擇作者或讀者" Visible="False" meta:resourcekey="labChoiceAuthorResource1"></asp:Label>
        <asp:Label ID="labChangeConfirm" runat="server" Text="是否要將所勾選的文件做變更" Visible="False" meta:resourcekey="labChangeConfirmResource1"></asp:Label>
        <asp:Label ID="labChAuthor" runat="server" Text="選擇作者" Visible="False" meta:resourcekey="labChAuthorResource1"></asp:Label></center>
</asp:Content>

