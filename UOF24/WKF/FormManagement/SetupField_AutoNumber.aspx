<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_12" Title="新增欄位" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupField_AutoNumber.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript">
    
        Sys.Application.add_load(function () {
            numberingRuleChecked();
        })
        
        function numberingRuleChecked() {
        
            var rbTrackNbr = $("#<%=rbTrackNbr.ClientID%>");
            var rbCustomNbr = $("#<%=rbCustomNbr.ClientID%>");
            var cvDllTypeCanEmpty = $("#<%=cvDllTypeCanEmpty.ClientID%>");
            var cvDllPathCanEmpty = $("#<%=cvDllPathCanEmpty.ClientID%>");
        
            if (rbTrackNbr.is(":checked")) {
                $("#divCustom").hide();
                $("#divTrack").show();
            }
            else if (rbCustomNbr.is(":checked")) {
                $("#divTrack").hide();
                $("#divCustom").show();
            }
        }

        function cvDllTypeCanEmptyValidation(sender, args) {

            var rbCustomNbr = $("#<%=rbCustomNbr.ClientID%>");
            var txtDllType = $("#<%=txtDllType.ClientID%>");

            if (rbCustomNbr.is(":checked") && txtDllType.val() === '')
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        function cvDllPathCanEmptyValidation(sender, args) {

            var rbCustomNbr = $("#<%=rbCustomNbr.ClientID%>");
            var txtDllPath = $("#<%=txtDllPath.ClientID%>");

            if (rbCustomNbr.is(":checked") && txtDllPath.val() === '')
                args.IsValid = false;
            else
                args.IsValid = true;
        }
    </script>

    <table width="100%" class="PopTable" cellspacing="1">
        <colgroup class="PopTableLeftTD"></colgroup>
        <colgroup class="PopTableRightTD"></colgroup>
        <colgroup class="PopTableLeftTD"></colgroup>
        <colgroup class="PopTableRightTD"></colgroup>
        <tr>
           <td align="center" class="PopTableHeader" colspan="4">
               <center>
                   <asp:Label ID="lblAutoNumber" runat="server" Text="自動編號" meta:resourcekey="lblAutoNumberResource1"></asp:Label>
               </center>
           </td>
        </tr>
        <tr>
           <td>
               <font color="red">*</font>
               <asp:Label ID="lblFieldId" runat="server" Text="欄位代號" meta:resourcekey="lblFieldIdResource1"></asp:Label>
           </td>
           <td>
               <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox>
               <br />
               <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ControlToValidate="txtFieldId"
                   Display="Dynamic" ErrorMessage="請輸入欄位代號" meta:resourcekey="RequiredFieldValidatorFieldIdResource1">
               </asp:RequiredFieldValidator>

               <asp:RegularExpressionValidator ID="RegularExpressionValidatorFieldId" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字"  ValidationExpression="\w+" meta:resourcekey="RegularExpressionValidatorFieldIdResource1">
               </asp:RegularExpressionValidator>
               
               <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" Display="Dynamic"
                   ErrorMessage="同一表單版本的欄位代號不得重複" meta:resourcekey="CustomValidatorFieldIdResource1">
               </asp:CustomValidator>
           </td>
           <td>
               <font color="red">*</font>
               <asp:Label ID="lblFieldName" runat="server" Text="欄位名稱" meta:resourcekey="lblFieldNameResource1"></asp:Label>
           </td>
           <td>
               <asp:TextBox ID="txtFieldName" runat="server" Width="200px" meta:resourcekey="txtFieldNameResource1"></asp:TextBox>
               <br />
               <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ControlToValidate="txtFieldName"
                   Display="Dynamic" ErrorMessage="請輸入欄位名稱" meta:resourcekey="RequiredFieldValidatorFieldNameResource1">
               </asp:RequiredFieldValidator>
           </td>
        </tr>
        <tr>
           <td>
               <asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label>
           </td>
           <td colspan="3">
               <asp:DropDownList ID="ddlFieldType" runat="server" meta:resourcekey="ddlFieldTypeResource1" Enabled="False">
                   <asp:ListItem Value="autoNumber" meta:resourcekey="ListItemResource12" Text="自動編號"></asp:ListItem>
               </asp:DropDownList>
           </td>
           <td style="display:none">
               <asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label>
           </td>
           <td style="display:none">
               <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
               <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                   MinValue="0" Width="40px" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="RadNumericTextBoxSeqResource1">
               </telerik:RadNumericTextBox>
           </td>
        </tr>
        <tr>
           <td>
               <asp:Label ID="lblFieldLength" runat="server" Text="欄位長度" meta:resourcekey="lblFieldLengthResource1"></asp:Label></td>
           <td colspan="3">
               <telerik:RadNumericTextBox ID="RadNumericTextBoxLength" runat="server" MaxLength="3"
                   MaxValue="999" MinValue="0" Width="40px" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="RadNumericTextBoxLengthResource1">
                   <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
               </telerik:RadNumericTextBox>
           </td>
        </tr>
        <tr>
           <td>
               <asp:Label ID="lblAutoNumberRule" runat="server" Text="自動編號規則" meta:resourcekey="lblAutoNumberRuleResource1"></asp:Label>
           </td>
           <td colspan="3">
               <asp:RadioButton ID="rbTrackNbr" runat="server" Text="選擇字軌" GroupName="NumberingRule" onclick="numberingRuleChecked()" Checked="true" meta:resourcekey="rbTrackNbrResource1" />
               <div id="divTrack">
                   <asp:DropDownList ID="ddlTrack" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTrack_SelectedIndexChanged" meta:resourcekey="ddlTrackResource1">
                       <asp:ListItem meta:resourcekey="ListItemResource21" Text="AR"></asp:ListItem>
                       <asp:ListItem meta:resourcekey="ListItemResource22" Text="AP"></asp:ListItem>
                   </asp:DropDownList>

                   <telerik:RadButton ID="WebImageButton1" runat="server" Text="字軌設定" CausesValidation="False" OnClick="WebImageButton1_Click1" meta:resourcekey="WebImageButton1Resource1"></telerik:RadButton>
                   
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlTrack"
                       Display="Dynamic" ErrorMessage="字軌不得為空值，請新增字軌！" meta:resourcekey="RequiredFieldValidator1Resource1">
                   </asp:RequiredFieldValidator>
                   <br />
                   <asp:Label ID="lblAutoNumberDesc" runat="server" Text="字軌(1~15)+年(西元年後兩碼2)+月(2碼)+流水號(5)" meta:resourcekey="lblAutoNumberDescResource1"></asp:Label>
                   <br />
                   <asp:Label ID="lblAutoNumberExample" runat="server" Text="範例：AR060200001" meta:resourcekey="lblAutoNumberExampleResource1"></asp:Label>
               </div>

               <div id="divCustomTitle" style="padding-top:10px;">
                   <asp:RadioButton ID="rbCustomNbr" runat="server" Text="自訂編號" GroupName="NumberingRule" onclick="numberingRuleChecked()" meta:resourcekey="rbCustomNbrResource1" />
                   <asp:LinkButton ID="lbtnCustomNbrExample" runat="server" Text="(範例說明)" ForeColor="Blue" meta:resourcekey="lbtnCustomNbrExampleResource1"></asp:LinkButton>
                   <br />
                   <div id="divCustom">
                       <asp:Label ID="lblDllTypeTitle" runat="server" Text="DLL 名稱：" meta:resourcekey="lblDllTypeTitleResource1"></asp:Label>
                       <asp:TextBox ID="txtDllType" runat="server" Width="450px" CssClass="txtPaddingLeft"></asp:TextBox>  

                       <asp:CustomValidator ID="cvDllTypeCanEmpty" runat="server" ErrorMessage="請輸入DLL名稱" ClientValidationFunction="cvDllTypeCanEmptyValidation"
                           Display="Dynamic" meta:resourcekey="cvDllTypeCanEmptyResource1">
                       </asp:CustomValidator>
                       <br />
                       <asp:Label ID="lblDllPathTitle" runat="server" Text="組件路徑：" meta:resourcekey="lblDllPathTitleResource1"></asp:Label>
                       <asp:TextBox ID="txtDllPath" runat="server" Width="450px"></asp:TextBox>

                       <asp:CustomValidator ID="cvDllPathCanEmpty" runat="server" ErrorMessage="請輸入組件路徑" ClientValidationFunction="cvDllPathCanEmptyValidation"
                           Display="Dynamic" meta:resourcekey="cvDllPathCanEmptyResource1">
                       </asp:CustomValidator>
                   </div>
                   <br />
               </div>
           </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan=3>
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked=True meta:resourcekey="cbxDisplayFieldNameResource1"/>
            </td>
        </tr>
        <tr>
            <td>
               <asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label>
            </td>
            <td colspan="3">
               <asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <div align=right>
        <asp:Label ID="lblAutoNumberRemark" runat="server" Text="註：自動編號欄位一律由系統帶出來不可修改。" meta:resourcekey="lblAutoNumberRemarkResource1"></asp:Label>
    </div>
    <asp:Label ID="lblWordSetup" runat="server" Text="字軌設定" Visible="False" meta:resourcekey="lblWordSetupResource1"></asp:Label>
    <asp:Label ID="lblExampleDirections" runat="server" Text="範例說明" Visible="false" meta:resourcekey="lblExampleDirectionsResource1"></asp:Label>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
</asp:Content>

