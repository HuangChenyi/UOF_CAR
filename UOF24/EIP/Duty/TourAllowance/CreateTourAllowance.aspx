<%@ Page Title="產生旅遊補助資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_TourAllowance_CreateTourAllowance" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CreateTourAllowance.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        function CopyFiled() {
            //Add code to handle your event here.
            clipboardData.setData("Text", $('#<%= txtMsg.ClientID %>').val());
        }

        function PopConfirm() {
            return confirm('<%=lblAlert.Text %>');
        }
    </script>
<table class="PopTable" width="100%">
    <tr>
        <td class="PopTableHeader" colspan="2" style="text-align:center">
            <center>
            <asp:Label ID="Label3" runat="server" Text="旅遊補助產生設定" meta:resourcekey="Label3Resource1"></asp:Label>
            </center>
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" style="width:25%">
            <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="年度" meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlYear" runat="server" meta:resourcekey="ddlYearResource1">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="PopTableRightTD" colspan="2">
            <asp:Label ID="lblCount" runat="server"  CssClass="SizeMemo" Width="100%" 
                style="text-align:left" Visible="False" meta:resourcekey="lblCountResource1" ></asp:Label>
            <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Width="100%" 
                Height="150px" Visible="False" meta:resourcekey="txtMsgResource1"></asp:TextBox>
             <asp:Label ID="lblClick" runat="server" Text="*點擊這裡可複製錯誤訊息" CssClass="SizeMemo" 
                Width="100%" style="text-align:left" Visible="False" meta:resourcekey="lblClickResource1" ></asp:Label>
        </td>
    </tr>
    </table>
    <asp:Label ID="lblCountText" runat="server" Text="產生{0}筆，未產生{1}筆" Width="100%" Visible="False" meta:resourcekey="lblCountTextResource1"></asp:Label>
    <asp:Label ID="lblNotGroupLeaveDays" runat="server" Text=" 所在部門沒有部門旅遊補助資訊" Visible="False" meta:resourcekey="lblNotGroupLeaveDaysResource1"></asp:Label>
    <asp:Label ID="lblNotArraveDate" runat="server" Text=" 沒有設定到職日" Visible="False" meta:resourcekey="lblNotArraveDateResource1"></asp:Label>
    <asp:Label ID="lblNotSetDate" runat="server" Text=" 沒有設定起算基準日" Visible="False" meta:resourcekey="lblNotSetDateResource1"></asp:Label>
    <asp:Label ID="lblNotYet" runat="server" Text=" 尚未到職" Visible="False" meta:resourcekey="lblNotYetResource1"></asp:Label>
    <asp:Label ID="lblUsed" runat="server" Text=" 該年度旅遊補助已使用" Visible="False" meta:resourcekey="lblUsedResource1"></asp:Label>
    <asp:Label ID="lblEMsg" runat="server" Style="display: none" ForeColor="Red" Text="，錯誤訊息如下:" meta:resourcekey="lblEMsgResource1"></asp:Label>
    <asp:Label ID="lblAlert" runat="server" Text="已產生過的旅遊補助資訊將會被覆蓋，是否確定要產生?" Visible="False" meta:resourcekey="lblAlertResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>


