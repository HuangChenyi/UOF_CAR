<%@ Page Title="新增/維護自訂屬性" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DMSPropertyCustomizeEdit.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.DMSPropertyCustomizeEdit" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function AlertExistPropertyName() {
            alert('<%=lblPropertyNameExist.Text%>');
        }

        function RepeatColumnsChanging(sender, args) {
            if (args.get_newValue() == "" || isNaN(args.get_newValue())) {
                args.set_newValue(args.get_oldValue());
            }
        }

        function OptionEdit_clicking(sender, args) {           
            var hfListItemsId = "<%=hfListItems.ClientID %>";                       
            $uof.dialog.open2("~/DMS/DocStore/DMSPropertyCustomizeOptionEdit.aspx", sender, '<%=lblOptionEdit.Text%>', 400, 500, PropertyCustomizeEdit_OpenDialogResult, { 'hfListItemsId': hfListItemsId });
        } 

        function PropertyCustomizeEdit_OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined")
                return false;
            else
                return true;
        }

        function rntRepeatColumns_OnBlur(sender, args) {
            $("#<%=btnBindOptions.ClientID%>").click();            
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td style="white-space: nowrap;width: 30%;">
                        <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource2"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="屬性標題" meta:resourcekey="Label2Resource2"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPropertyName" runat="server" meta:resourcekey="txtPropertyNameResource2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rftxtPropertyName" runat="server" ErrorMessage="不可空白" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPropertyName" meta:resourcekey="rftxtPropertyNameResource2"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource2"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="屬性型態" meta:resourcekey="Label4Resource2"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPropertyType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPropertyType_SelectedIndexChanged"  meta:resourcekey="ddlPropertyTypeResource2">
                            <asp:ListItem Value="TextBox" Text="文字" meta:resourcekey="ListItemResource5"></asp:ListItem>
                            <asp:ListItem Value="Date" Text="日期" meta:resourcekey="ListItemResource6"></asp:ListItem>
                            <asp:ListItem Value="RadioButtonList" Text="單選" meta:resourcekey="ddlPropertyTypeRadioButtonListResource1"></asp:ListItem>
                            <asp:ListItem Value="CheckBoxList" Text="複選" meta:resourcekey="ddlPropertyTypeCheckBoxListResource1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label5Resource2"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text="是否必填" meta:resourcekey="Label6Resource2"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblIsMandatory" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" meta:resourcekey="rblIsMandatoryResource2">
                            <asp:ListItem Value="True" Text="是" Selected="True" meta:resourcekey="ListItemResource7"></asp:ListItem>
                            <asp:ListItem Value="False" Text="否" meta:resourcekey="ListItemResource8"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <asp:Panel runat="server" ID="panelListItemType" Visible="False">
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource2"></asp:Label>
                        <asp:Label ID="lblRowItemCount" runat="server" Text="每列顯示選項個數" meta:resourcekey="lblRowItemCountResource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rntRepeatColumns" runat="server" Width="40px" Value="6" MinValue="1" MaxValue="9" MaxLength="1" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                            <ClientEvents OnValueChanging="RepeatColumnsChanging" OnBlur="rntRepeatColumns_OnBlur" />
                        </telerik:RadNumericTextBox>

                        <asp:Label ID="lblRowItemCountMemo" runat="server" Text="*輸入範圍為1~9" CssClass="SizeMemo" meta:resourcekey="lblRowItemCountMemoResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource2"></asp:Label>
                        <asp:Label ID="lblOptionList" runat="server" Text="選項" meta:resourcekey="lblOptionListResource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadButton runat="server" ID="rbOptionEdit" Text="設定" CausesValidation="False" OnClientClicking="OptionEdit_clicking" OnClick="rbOptionEdit_Click" meta:resourcekey="rbOptionEditResource1"></telerik:RadButton>
                        <asp:CheckBoxList ID="cblOptionList" runat="server" RepeatDirection="Horizontal" RepeatColumns="6" Visible="False"></asp:CheckBoxList>
                        <asp:RadioButtonList ID="rblOptionList" runat="server" RepeatDirection="Horizontal" RepeatColumns="6" Visible="False"></asp:RadioButtonList>
                        <asp:CustomValidator ID="cvOptionList" runat="server" ErrorMessage="選項不可為空" Display="Dynamic" meta:resourcekey="cvOptionListResource1"></asp:CustomValidator>
                    </td>
                </tr>
                </asp:Panel>
            </table>

            <asp:Button runat="server" ID="btnBindOptions" Text="" OnClick="btnBindOptions_Click" CausesValidation="false" style="display: none;" meta:resourcekey="btnBindOptionsResource1"/>
            <asp:HiddenField runat="server" ID="hfListItems" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblOptionEdit" runat="server" Text="選項設定" Visible="false" meta:resourcekey="lblOptionEditResource1"></asp:Label>
    <asp:Label ID="lblPropertyNameExist" runat="server" Text="屬性標題重複" Visible="false" meta:resourcekey="lblPropertyNameExistResource1"></asp:Label>
</asp:Content>
