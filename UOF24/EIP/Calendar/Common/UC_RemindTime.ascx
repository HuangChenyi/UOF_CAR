<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="EIP_Calendar_Common_UC_RemindTime" Codebehind="UC_RemindTime.ascx.cs" %>
<script language="javascript">
function CheckRadioButtonStatus(buttonid)
{
    if(buttonid=="RadioButton1")
    {
        div1.style.display="none";
    }
    if(buttonid=="RadioButton2")
    {
        div1.style.display="";
    }
}
function CheckRadioButton()
{
    if ($("#<%=RadioButton1.ClientID %>").is(":checked") == true) {
        div1.style.display = "none";
    }
    if ($("#<%=RadioButton2.ClientID %>").is(":checked") == true) {
        div1.style.display = "";
    } 
}
</script>

<body onload="CheckRadioButton()">
<table border="0" cellpadding="0" cellspacing="0" width="100%" style="padding: 0; width: 150px;">
    <tr>
        <td colspan="2">
            <asp:RadioButton ID="RadioButton1" runat="server" Text="不提醒" GroupName="remind" onclick="CheckRadioButtonStatus('RadioButton1')" Checked="True" meta:resourcekey="RadioButton1Resource1" />
        </td>
    </tr>
    <tr>
        <td style="white-space: nowrap;">
            <asp:RadioButton ID="RadioButton2" runat="server" Text="開始前" GroupName="remind" onclick="CheckRadioButtonStatus('RadioButton2')" meta:resourcekey="RadioButton2Resource1" />            
        </td>
        <td style="white-space: nowrap;">
            <div id="div1" style="display:none">
            <asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1">
                <asp:ListItem Value="10" meta:resourcekey="ListItemResource1">10分</asp:ListItem>
                <asp:ListItem Value="30" meta:resourcekey="ListItemResource2">30分</asp:ListItem>
                <asp:ListItem Value="60" meta:resourcekey="ListItemResource3">1小時</asp:ListItem>
                <asp:ListItem Value="120" meta:resourcekey="ListItemResource4"> 2小時 </asp:ListItem>
                <asp:ListItem Value="1440" meta:resourcekey="ListItemResource5">1天</asp:ListItem>
                <asp:ListItem Value="4320" meta:resourcekey="ListItemResource6">3天</asp:ListItem>
                <asp:ListItem Value="10080" meta:resourcekey="ListItemResource7">1週</asp:ListItem>
            </asp:DropDownList>
            </div>
        </td>
    </tr>
</table>
<asp:Label ID="lblRemindMemo" Text="*設定後會發送Email和App推播提醒通知。" runat="server" ForeColor="Blue" meta:resourcekey="lblRemindMemoResource1"></asp:Label><br>
<asp:Label ID="lblRemindNotice" Text="" runat="server" ForeColor="Blue" Visible="false" ></asp:Label>
</body>
<asp:HiddenField ID="hideRemindTime" runat="server" />
