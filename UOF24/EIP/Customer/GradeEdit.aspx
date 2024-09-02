<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_GradeEdit" Title="等級維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="GradeEdit.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function NewKeyPress(sender, args) {

            var keyCharacter = args.get_keyCharacter();

            if (keyCharacter == sender.get_numberFormat().DecimalSeparator ||
                keyCharacter == sender.get_numberFormat().NegativeSign) {

                args.set_cancel(true);
            }
        }
    </script>
    <style type="text/css"> 
    .RightAligned 
    { 
        text-align: right; 
    } 
    </style>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <table class ="PopTable">
        <tr>
            <td style="width:30%">
              <asp:Label ID="Label19" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label19Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="等級名稱:" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="width:70%">
                <asp:TextBox ID="txtGradeName" runat="server" Width="100%" MaxLength="50"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width:25%">
              <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label5Resource1"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="等級:" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td style="width:75%">
                <telerik:RadNumericTextBox ID="rdGrade" Runat="server" MaxLength="2" MaxValue="99" MinValue="1" Width="80px" CssClass="RightAligned">
                    <numberformat decimaldigits="0" zeropattern="n"></numberformat>
                    <clientevents onkeypress="NewKeyPress"></clientevents>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label4" runat="server" Text="(1~99)" meta:resourcekey="Label4Resource1"></asp:Label><br />
                <asp:Label ID="lblGradeNote" runat="server" Text="最高等級：99；最低等級：1" meta:resourcekey="lblGradeNoteResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width:25%">
                <asp:Label ID="Label2" runat="server" Text="備註:" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td style="width:75%">
                <asp:TextBox ID="txtRemark" runat="server" MaxLength="255" Width="100%"></asp:TextBox></td>
        </tr>
    </table>
           
            <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None"
                ForeColor="White" Visible="False"></asp:CustomValidator><asp:Label ID="lblExist"
                    runat="server" Text="等級名稱已經存在!" Visible="False" meta:resourcekey="lblExistResource1"></asp:Label><asp:Label ID="lblDBFail"
                        runat="server" Text="資料更新失敗" Visible="False" meta:resourcekey="lblDBFailResource1"></asp:Label>
        <asp:Label ID="lblInt" runat="server" Text="等級不能為空值" Visible="False" meta:resourcekey="lblIntResource1"></asp:Label>
        <asp:Label ID="lblEmpty" runat="server" Text="等級名稱不能為空值" Visible="False" meta:resourcekey="lblEmptyResource1"></asp:Label>
   </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

