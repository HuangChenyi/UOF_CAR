<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ChooseDateDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.SendDoc.ChooseDateDialog" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td style="width: 20%">
                        <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lblTimeHeader" runat="server" Text="開會時間"></asp:Label>
                    </td>
                    <td style="width: 80%">
                        <telerik:RadDatePicker ID="rdpDate" runat="server"></telerik:RadDatePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="rdpDate"
                            Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                        <telerik:RadTimePicker ID="rtpTime" runat="server"></telerik:RadTimePicker>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="rtpTime"
                            Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvDateTime"  Display="Dynamic" runat="server"></asp:CustomValidator>
                    </td>
                </tr>
            </table>

            <asp:HiddenField ID="hfSendDocId" runat="server" />
            <asp:HiddenField ID="hfDocType" runat="server" />
            <asp:HiddenField ID="hfActionType" runat="server" />

            <asp:Label ID="lblSmnHeader" runat="server" Text="會勘時間" Visible="false"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
