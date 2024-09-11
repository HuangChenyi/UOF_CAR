<%@ Control Language="C#" AutoEventWireup="true" CodeFile="optionField2.ascx.cs" Inherits="WKF_OptionalFields_optionField2" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<script>

    function CheckedData(source, arguments) {

        
      var amount = $find("<%=rnumAmount.ClientID%>").get_value();
        var item = $("#<%=txtItem.ClientID%>").val();
      //靜態的使用方式
        //if (amount > 200 && item == '') {
        //    arguments.IsValid = false;
        //    return;
        //}
        //else {
        //                arguments.IsValid = true;
        //}



        var data = [item,(amount+"")];
        var result = $uof.pageMethod.syncUc("CDS/WKF_Fields/optionField2.ascx", "CheckedData", data);

        if (result != '') {
            arguments.IsValid = false;
            $('#<%=CustomValidator1.ClientID%>').text(result);
        }
        else {
            arguments.IsValid = true;
        }


        return;
    }

</script>

<table class="PopTable" style="width:500px">
    <tr>
        <td norwap>
        <asp:Label ID="Label1" runat="server" Text="類別"></asp:Label></td>
        <td>
            <asp:RadioButtonList ID="rbListType" runat="server" RepeatDirection="Horizontal" >
                <asp:ListItem>A</asp:ListItem>
                  <asp:ListItem>B</asp:ListItem>
                  <asp:ListItem>C</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
        <tr>
        <td norwap>
        <asp:Label ID="Label2" runat="server" Text="品項"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtItem" runat="server"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator1" 
                display="Dynamic"  ClientValidationFunction="CheckedData"
                runat="server" ErrorMessage="金額大於200必填!"></asp:CustomValidator>
        </td>
    </tr>
        <tr>
    <td norwap>
    <asp:Label ID="Label3" runat="server" Text="金額"></asp:Label></td>
    <td>
        <telerik:RadNumericTextBox ID="rnumAmount"
            Value="0" MinValue="0" MaxValue="9999" runat="server"></telerik:RadNumericTextBox>
       
    </td>
                </tr>
        <tr>
                <td norwap>
    <asp:Label ID="Label4" runat="server" Text="負責人"></asp:Label></td>
    <td>
        <uc1:UC_ChoiceList runat="server" ID="uc_Owner" />
        
    </td>
</tr>
            <tr>
                <td norwap>
    <asp:Label ID="Label5" runat="server" Text="執行內容回覆"></asp:Label></td>
    <td>
        
        <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine"
            Rows="3" Width="300px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtContent" Display="Dynamic"
            ErrorMessage="執行內容回覆必填"></asp:RequiredFieldValidator>
    </td>
</tr>
</table>

<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>