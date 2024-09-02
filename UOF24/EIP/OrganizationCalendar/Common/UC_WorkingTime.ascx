<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_OrganizationCalendar_Common_UC_WorkingTime" Codebehind="UC_WorkingTime.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>    
    
<script language="javascript" type="text/javascript">
function CheckTxtstatus(checkid)
{
    if(checkid=="chkSunday")
    {
        if ($("#<%=chkSunday.ClientID %>").is(":checked") == true) {
            $("#<%=txtSunday.ClientID %>").disabled = false;
        }
        else 
        {
            $("#<%=txtSunday.ClientID %>").disabled = true;
            $("#<%=txtSunday.ClientID %>").val("0");
        }   
    }
    if(checkid=="chkMonday")
    {
        if ($("#<%=chkMonday.ClientID %>").is(":checked") == true) {
            $("#<%=txtMonday.ClientID %>").disabled = false;
            
        }
        else 
        {
            $("#<%=txtMonday.ClientID %>").disabled = true;
            $("#<%=txtMonday.ClientID %>").val("0");
        }        
    }
    if(checkid=="chkTuesday")
    {
        if ($("#<%=chkTuesday.ClientID %>").is(":checked") == true) {
            $("#<%=txtTuesday.ClientID %>").disabled = false;
            
        }
        else 
        {
            $("#<%=txtTuesday.ClientID %>").disabled = true;
            $("#<%=txtTuesday.ClientID %>").val("0");
        }      
    }
    if(checkid=="chkWednesday")
    {
        if ($("#<%=chkWednesday.ClientID %>").is(":checked") == true) 
        {
            $("#<%=txtWednesday.ClientID %>").disabled = false;  
        }
        else 
        {
            $("#<%=txtWednesday.ClientID %>").disabled = true;
            $("#<%=txtWednesday.ClientID %>").val("0");
        }      
    }
    if(checkid=="chkThursday")
    {
        if ($("#<%=chkThursday.ClientID %>").is(":checked") == true) {
            $("#<%=txtThursday.ClientID %>").disabled = false;
            
        }
        else {
            $("#<%=txtThursday.ClientID %>").disabled = true;
            $("#<%=txtThursday.ClientID %>").val("0");
        }     
    }
    if(checkid=="chkFriday")
    {
        if ($("#<%=chkFriday.ClientID %>").is(":checked") == true) {
            $("#<%=txtFriday.ClientID %>").disabled = false;
            
        }
        else {
            $("#<%=txtFriday.ClientID %>").disabled = true;
            $("#<%=txtFriday.ClientID %>").val("0");
        }   
    }
    if(checkid=="chkSaturday")
    {
        if ($("#<%=chkSaturday.ClientID %>").is(":checked") == true) {
            $("#<%=txtSaturday.ClientID %>").disabled = false;
            
        }
        else {
            $("#<%=txtSaturday.ClientID %>").disabled = true;
            $("#<%=txtSaturday.ClientID %>").val("0");
        }    
    }
}

function CheckSunday(source, arguments) {
    var chkSunday = $("#<%=chkSunday.ClientID %>");
    var txtSunday =$("#<%=txtSunday.ClientID %>");

    if (chkSunday.is(":checked")) {
        if (txtSunday.val()== '') {
            arguments.IsValid = false;
        } else {
            arguments.IsValid = true;
        }
    }
}

function CheckMonday(source, arguments) {
    var chkMonday = $("#<%=chkMonday.ClientID %>");
    var txtMonday = $("#<%=txtMonday.ClientID %>");

    if (chkMonday.is(":checked")) {
        if (txtMonday.val() == '') {
            arguments.IsValid = false;
        } else {
            arguments.IsValid = true;
        }
    }
}

function CheckTuesday(source, arguments) {
    var chkTuesday = $("#<%=chkTuesday.ClientID %>");
    var txtTuesday = $("#<%=txtTuesday.ClientID %>");

    if (chkTuesday.is(":checked")) {
        if (txtTuesday.val() == '') {
            arguments.IsValid = false;
        } else {
            arguments.IsValid = true;
        }
    }
}

function CheckWednesday(source, arguments) {
    var chkWednesday =$("#<%=chkWednesday.ClientID %>");
    var txtWednesday = $("#<%=txtWednesday.ClientID %>");

    if (chkWednesday.is(":checked")) {
        if (txtWednesday.val() == '') {
            arguments.IsValid = false;
        } else {
            arguments.IsValid = true;
        }
    }
}

function CheckThursday(source, arguments) {
    var chkThursday = $("#<%=chkThursday.ClientID %>");
    var txtThursday = $("#<%=txtThursday.ClientID %>");

    if (chkThursday.is(":checked")) {
        if (txtThursday.val() == '') {
            arguments.IsValid = false;
        } else {
            arguments.IsValid = true;
        }
    }
}

function CheckFriday(source, arguments) {
    var chkFriday = $("#<%=chkFriday.ClientID %>");
    var txtFriday = $("#<%=txtFriday.ClientID %>");

    if (chkFriday.is(":checked")) {
        if (txtFriday.val() == '') {
            arguments.IsValid = false;
        } else {
            arguments.IsValid = true;
        }
    }
}
function CheckSaturday(source, arguments) {
    var chkSaturday = $("#<%=chkSaturday.ClientID %>");
    var txtSaturday = $("#<%=txtSaturday.ClientID %>");

    if (chkSaturday.is(":checked")) {
        if (txtSaturday.val() == '') {
            arguments.IsValid = false;
        } else {
            arguments.IsValid = true;
        }
    }
}
</script>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <telerik:RadButton ID="rbtnSave" runat="server" Text="" 
                onclick="rbtnSave_Click">
            </telerik:RadButton>
            <asp:CheckBox ID="CheckBox2" runat="server" Text="使用上一部門設定" AutoPostBack="True" OnCheckedChanged="CheckBox2_CheckedChanged" meta:resourcekey="CheckBox2Resource1" />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="沒有權限設定" ForeColor="Red"  meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請先點選部門" ForeColor="Red"  meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator></td>
          </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="CheckBox2" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="rbtnSave" EventName="Click" />
            </Triggers> 
          </asp:UpdatePanel>
          </td>
    </tr>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
   <ContentTemplate>
    <tr>
        <td >
            <asp:Label ID="Label1" runat="server" Text="日" meta:resourcekey="Label1Resource1"></asp:Label></td>
        <td >
            <asp:CheckBox ID="chkSunday" runat="server" Text="上班" onclick="CheckTxtstatus('chkSunday')" meta:resourcekey="chkSundayResource1" /></td>
        <td width="80%">
            <asp:Label ID="Label2" runat="server" Text="工時：" meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:TextBox ID="txtSunday" runat="server" Width="40px" 
                meta:resourcekey="txtSundayResource1" Text="0"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="小時" meta:resourcekey="Label3Resource1"></asp:Label>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtSunday"
                Display="Dynamic" ErrorMessage="請輸入0到24" MaximumValue="24" ForeColor="Red"   
                MinimumValue="0" Type="Double" meta:resourcekey="RangeValidator1Resource1" ValidationGroup=""></asp:RangeValidator>
            <asp:CustomValidator  ID="cvSundayMsg" runat="server"  Display="Dynamic" ControlToValidate="txtSunday" ValidateEmptyText="True" ErrorMessage="請輸入0到24" ForeColor="Red"  ClientValidationFunction="CheckSunday"  meta:resourcekey="cvSundayMsgResource"  ></asp:CustomValidator>
            
            </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label21" runat="server" Text="一" meta:resourcekey="Label21Resource1"></asp:Label></td>
        <td>
            <asp:CheckBox ID="chkMonday" runat="server" Text="上班" onclick="CheckTxtstatus('chkMonday')" meta:resourcekey="chkMondayResource1" /></td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="工時：" meta:resourcekey="Label4Resource1"></asp:Label>
            <asp:TextBox ID="txtMonday" runat="server" Width="40px" 
                meta:resourcekey="txtMondayResource1" Text="0"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="小時" meta:resourcekey="Label5Resource1"></asp:Label>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtMonday"
                Display="Dynamic" ErrorMessage="請輸入0到24" MaximumValue="24" ForeColor="Red"  
                MinimumValue="0" Type="Double" meta:resourcekey="RangeValidator2Resource1"></asp:RangeValidator>
           <asp:CustomValidator ID="cvMondayMsg" runat="server" Display="Dynamic" ErrorMessage="請輸入0到24" ForeColor="Red" meta:resourcekey="cvMondayMsgResource" ControlToValidate="txtMonday" ValidateEmptyText="True" ClientValidationFunction="CheckMonday"></asp:CustomValidator>
</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label6" runat="server" Text="二" meta:resourcekey="Label6Resource1"></asp:Label></td>
        <td>
            <asp:CheckBox ID="chkTuesday" runat="server" Text="上班" onclick="CheckTxtstatus('chkTuesday')" meta:resourcekey="chkTuesdayResource1"/></td>
        <td>
            <asp:Label ID="Label7" runat="server" Text="工時：" meta:resourcekey="Label7Resource1"></asp:Label>
            <asp:TextBox ID="txtTuesday" runat="server" Width="40px" 
                meta:resourcekey="txtTuesdayResource1" Text="0"></asp:TextBox>
            <asp:Label ID="Label9" runat="server" Text="小時" meta:resourcekey="Label9Resource1"></asp:Label>
            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtTuesday"
                Display="Dynamic" ErrorMessage="請輸入0到24" MaximumValue="24" ForeColor="Red" 
                MinimumValue="0" Type="Double" meta:resourcekey="RangeValidator3Resource1"></asp:RangeValidator>
            <asp:CustomValidator ID="cvTuesdayMsg" runat="server" Display="Dynamic" ClientValidationFunction="CheckTuesday" ControlToValidate="txtTuesday" ValidateEmptyText="True" ErrorMessage="請輸入0到24" ForeColor="Red" meta:resourcekey="cvTuesdayMsgResource"></asp:CustomValidator>
</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label8" runat="server" Text="三" meta:resourcekey="Label8Resource1"></asp:Label></td>
        <td>
            <asp:CheckBox ID="chkWednesday" runat="server" Text="上班" onclick="CheckTxtstatus('chkWednesday')" meta:resourcekey="chkWednesdayResource1" /></td>
        <td>
            <asp:Label ID="Label10" runat="server" Text="工時：" meta:resourcekey="Label10Resource1"></asp:Label>
            <asp:TextBox ID="txtWednesday" runat="server" Width="40px" 
                meta:resourcekey="txtWednesdayResource1" Text="0"></asp:TextBox>
            <asp:Label ID="Label11" runat="server" Text="小時" meta:resourcekey="Label11Resource1"></asp:Label>
            <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txtWednesday"
                Display="Dynamic" ErrorMessage="請輸入0到24" MaximumValue="24" ForeColor="Red"  
                MinimumValue="0" Type="Double" meta:resourcekey="RangeValidator4Resource1"></asp:RangeValidator>
            <asp:CustomValidator ID="cvWednesdayMsg" runat="server" Display="Dynamic" ErrorMessage="請輸入0到24" ForeColor="Red"  ClientValidationFunction="CheckWednesday" ValidateEmptyText="True" ControlToValidate="txtWednesday" meta:resourcekey="cvWednesdayMsgResource"></asp:CustomValidator>
                </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label12" runat="server" Text="四" meta:resourcekey="Label12Resource1"></asp:Label></td>
        <td>
            <asp:CheckBox ID="chkThursday" runat="server" Text="上班" onclick="CheckTxtstatus('chkThursday')" meta:resourcekey="chkThursdayResource1" /></td>
        <td>
            <asp:Label ID="Label13" runat="server" Text="工時：" meta:resourcekey="Label13Resource1"></asp:Label>
            <asp:TextBox ID="txtThursday" runat="server" Width="40px" 
                meta:resourcekey="txtThursdayResource1" Text="0"></asp:TextBox>
            <asp:Label ID="Label14" runat="server" Text="小時" meta:resourcekey="Label14Resource1"></asp:Label>
            <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="txtThursday"
                Display="Dynamic" ErrorMessage="請輸入0到24" MaximumValue="24" ForeColor="Red" 
                MinimumValue="0" Type="Double" meta:resourcekey="RangeValidator5Resource1"></asp:RangeValidator>
           <asp:CustomValidator ID="cvThursdayMsg" runat="server" Display="Dynamic" ControlToValidate="txtThursday" ValidateEmptyText="True" ClientValidationFunction="CheckThursday"  ErrorMessage="請輸入0到24" ForeColor="Red" meta:resourcekey="cvThursdayMsgResource"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label15" runat="server" Text="五" meta:resourcekey="Label15Resource1"></asp:Label></td>
        <td>
            <asp:CheckBox ID="chkFriday" runat="server" Text="上班" onclick="CheckTxtstatus('chkFriday')" meta:resourcekey="chkFridayResource1" /></td>
        <td>
            <asp:Label ID="Label16" runat="server" Text="工時：" meta:resourcekey="Label16Resource1"></asp:Label>
            <asp:TextBox ID="txtFriday" runat="server" Width="40px" 
                meta:resourcekey="txtFridayResource1" Text="0"></asp:TextBox>
            <asp:Label ID="Label17" runat="server" Text="小時" meta:resourcekey="Label17Resource1"></asp:Label>
            <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="txtFriday"
                Display="Dynamic" ErrorMessage="請輸入0到24" MaximumValue="24" ForeColor="Red"  
                MinimumValue="0" Type="Double" meta:resourcekey="RangeValidator6Resource1"></asp:RangeValidator>
            <asp:CustomValidator ID="cvFridayMsg" runat="server" Display="Dynamic" ClientValidationFunction="CheckFriday" ControlToValidate="txtFriday" ValidateEmptyText="True" ErrorMessage="請輸入0到24" ForeColor="Red" meta:resourcekey="cvFridayMsgResource"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label18" runat="server" Text="六" meta:resourcekey="Label18Resource1"></asp:Label></td>
        <td>
            <asp:CheckBox ID="chkSaturday" runat="server" Text="上班" onclick="CheckTxtstatus('chkSaturday')" meta:resourcekey="chkSaturdayResource1" /></td>
        <td>
            <asp:Label ID="Label19" runat="server" Text="工時：" meta:resourcekey="Label19Resource1"></asp:Label>
            <asp:TextBox ID="txtSaturday" runat="server" Width="40px" 
                meta:resourcekey="txtSaturdayResource1" Text="0"></asp:TextBox>
            <asp:Label ID="Label20" runat="server" Text="小時" meta:resourcekey="Label20Resource1"></asp:Label>
            <asp:RangeValidator ID="RangeValidator7" runat="server" ControlToValidate="txtSaturday"
                Display="Dynamic" ErrorMessage="請輸入0到24" MaximumValue="24" ForeColor="Red" 
                MinimumValue="0" Type="Double" meta:resourcekey="RangeValidator7Resource1"></asp:RangeValidator>
            <asp:CustomValidator ID="cvSaturdayMsg" runat="server" Display="Dynamic" ControlToValidate="txtSaturday" ValidateEmptyText="True" ClientValidationFunction="CheckSaturday" ErrorMessage="請輸入0到24" ForeColor="Red" meta:resourcekey="cvSaturdayMsgResource"></asp:CustomValidator>
                </td>
    </tr>
    </ContentTemplate> 
  <Triggers>
   <asp:AsyncPostBackTrigger ControlID="CheckBox2" EventName="CheckedChanged" />
    <asp:AsyncPostBackTrigger ControlID="rbtnSave" EventName="Click" />
  </Triggers> 
    </asp:UpdatePanel>
</table>
<asp:HiddenField ID="hideGroupid" runat="server" />
<asp:Label ID="msgSave" runat="server" meta:resourcekey="msgSaveResource1" Text="儲存"
    Visible="False"></asp:Label>
