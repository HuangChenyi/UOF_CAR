<%@ Page Title="新增/維護年休天(時)數" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Configuration_LeaveDays_Add" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Add.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function OnValueChanging(sender, args) {
        if (args.get_newValue() == "0") {
            args.set_newValue(0);
        }
        else if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }
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
<table width="100%" class="PopTable" cellspacing="0">       
        <tr>
            <td style="width: 120px; white-space: nowrap;">
                <asp:Label ID="Label4" runat="server" Text="部門" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td >
                <asp:Label ID="lbGroupName" runat="server"  meta:resourcekey="lbGroupNameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 120px; white-space: nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server"  Text="年資" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <telerik:radnumerictextbox ID="rdtxtYear" runat="server" DataType="System.Int32" MaxValue="100" MinValue="0" Width="100px" Value="0" CssClass="RightAligned">
                    <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                    <ClientEvents OnValueChanging="OnValueChanging" OnKeyPress="NewKeyPress" />
                </telerik:radnumerictextbox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="rdtxtYear" Display="Dynamic" ErrorMessage="年資重複請重新輸入" ForeColor="Red" onservervalidate="CustomValidator1_ServerValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>  
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdtxtYear" Display="Dynamic" ForeColor="Red" ErrorMessage="請輸入年資" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>              
            </td>
        </tr>       
        <tr>
            <td style="width: 120px; white-space: nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="Label8" runat="server" Text="可休天(時)數" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td>
                <telerik:radnumerictextbox ID="rdtxtDays" runat="server" xmlns:telerik="telerik.web.ui" MinValue="0" MaxValue="365" Width="100px" value="1" DataType="System.Decimal" CssClass="RightAligned">
                    <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                    <ClientEvents OnValueChanging="OnValueChanging" />
                </telerik:radnumerictextbox>                
            </td>
        </tr>
      
    </table>
</asp:Content>

