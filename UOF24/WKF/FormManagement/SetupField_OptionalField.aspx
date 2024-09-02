<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_OptionalField" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetupField_OptionalField.aspx.cs" %>
<%@ Register Src="~/WKF/FormManagement/UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register Src="~/WKF/FormManagement/UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register src="~/WKF/FormManagement/UC_ModifySel.ascx" tagname="UC_ModifySel" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script type="text/javascript">
 
    function chkexternalDataCheck_CheckedChanged() {

        if ($("#<%=this.chkexternalDataCheck.ClientID%>").prop("checked")) {
                $("#<%=this.pnlexternalData.ClientID%>").show();
        }
        else {
            $("#<%=this.pnlexternalData.ClientID%>").hide();
        }
    }

    function chkAuth_CheckedChanged() {


        if ($("#<%=this.chkAuth.ClientID%>").prop("checked")) {
          $("#<%=this.Panel1.ClientID%>").show();
      }
      else {
          $("#<%=this.Panel1.ClientID%>").hide();
      }
  }
       
</script>
<table width="100%" class="PopTable" cellspacing="1">
    <colgroup class="PopTableLeftTD"></colgroup>
    <colgroup class="PopTableRightTD"></colgroup>
    <colgroup class="PopTableLeftTD"></colgroup>
    <colgroup class="PopTableRightTD">	</colgroup>
    <tr>
        
        <td align="center" class="PopTableHeader" colspan="4"> <center><asp:Label ID="lblSingleLine" runat="server" Text="欄位名稱" meta:resourcekey="lblSingleLineResource1"></asp:Label>
       </center>
        </td>

    </tr>
    <tr>
        <td style="height: 26px"><font color="red">*</font><asp:Label ID="lblFieldId" runat="server" Text="欄位代號" meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
        <td style="height: 26px">
            <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId" Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ErrorMessage="請輸入欄位代號" ControlToValidate="txtFieldId" Display="Dynamic" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" ErrorMessage="同一表單版本的欄位代號不得重複" Display="Dynamic" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator>
        </td>
        <td style="height: 26px"><font color="red">*</font><asp:Label ID="lblFieldName" runat="server" Text="欄位名稱" meta:resourcekey="lblFieldNameResource1"></asp:Label></td>
        <td style="height: 26px">
            <asp:TextBox ID="txtFieldName" runat="server" Width="200px" meta:resourcekey="txtFieldNameResource1"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ErrorMessage="請輸入欄位名稱" ControlToValidate="txtFieldName" Display="Dynamic" meta:resourcekey="RequiredFieldValidatorFieldNameResource1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label></td>
        <td><uc3:UC_FiledDropList ID="UC_FiledDropList1" runat="server" /><asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator></td>
        <td>	<asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
        <td>	<asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
            <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px"></telerik:RadNumericTextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
        </td>
        <td colspan=3>
            <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked=true meta:resourcekey="cbxDisplayFieldNameResource1"/>
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="lblFieldControl" runat="server" Text="欄位控制" meta:resourcekey="lblFieldControlResource1"></asp:Label></td>
        <td colspan="3"><uc2:UC_FieldControl ID="UC_FieldControl1" runat="server" /></td>
    </tr>
    <tr>
        <td><asp:Label ID="lbl_FieldModify" runat="server" Text="修改權限" meta:resourcekey="lbl_FieldModifyResource1"></asp:Label></td>
        <td colspan="3"><uc4:UC_ModifySel ID="UC_ModifySel1" runat="server" /></td>
    </tr>
    <tr id="GrideDetail">
        <td><asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthRecource1"></asp:Label></td>
        <td colspan="3">
            <telerik:RadNumericTextBox ID="RadNumericViewLength" runat="server" MaxLength="5"
                MaxValue="1000" MinValue="0" NullText="0" Width="40px"></telerik:RadNumericTextBox>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="(表單顯示的限制長度，設零由系統自行調整)" meta:resourcekey="lblDisplayLengthNotifyRecource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label></td>
        <td colspan="3"><asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblexternalData" runat="server" Text="外部資料" meta:resourcekey="lblexternalDataResource1"></asp:Label></td>
        <td colspan="3">
            <asp:CheckBox ID="chkexternalDataCheck" runat="server" meta:resourcekey="chkexternalDataCheckResource1" Text="使用外部資料來源" onclick="chkexternalDataCheck_CheckedChanged()" />
            <br />
            <asp:Panel ID="pnlexternalData" runat="server"  Width="100%" meta:resourcekey="pnlexternalDataResource1">
            <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
                <tr>
                    <td style="width: 132px" nowrap><asp:Label ID="lblwsURL" runat="server" Text="WebService URL:" Width="100%" meta:resourcekey="lblwsURLResource1"></asp:Label></td>
                    <td><asp:TextBox ID="txtwsURL" runat="server" Width="300px" meta:resourcekey="txtwsURLResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 132px" nowrap><asp:Label ID="lblwsMethod" runat="server" Text="WebService Method:" Width="100%" meta:resourcekey="lblwsMethodResource1"></asp:Label></td>
                    <td><asp:TextBox ID="txtwsMethod" runat="server" Width="100px" meta:resourcekey="txtwsMethodResource1"></asp:TextBox><asp:Button ID="btnTestConn" runat="server" meta:resourcekey="btnTestConnResource1" OnClick="btnTestConn_Click" Text="測試連線" /></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Label ID="lblAuth" runat="server" meta:resourcekey="lblAuthResource1" Text="是否需要驗證:"></asp:Label><asp:CheckBox ID="chkAuth" runat="server" onclick="chkAuth_CheckedChanged()" Text="是" meta:resourcekey="chkAuthResource1" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Panel ID="Panel1" runat="server"  Width="100%" style="display:none" meta:resourcekey="Panel1Resource1">
                        <table border="0" style="width: 100%">
                            <tr>
                                <td>
                                    <asp:Label ID="lblwsAccount" runat="server" meta:resourcekey="lblwsAccountResource1" Text="WebService帳號:"></asp:Label><asp:TextBox ID="txtwsAccount" runat="server" meta:resourcekey="txtwsAccountResource1"></asp:TextBox><br />
                                    <asp:Label ID="lblwsPassword" runat="server" meta:resourcekey="lblwsPasswordResource1" Text="WebService密碼:"></asp:Label><asp:TextBox ID="txtwsPassword" runat="server" meta:resourcekey="txtwsPasswordResource1"></asp:TextBox></td>
                            </tr>
                        </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><asp:CheckBox ID="chkgetBeforeTime" runat="server" meta:resourcekey="chkgetBeforeTimeResource1" Text="是否表單填寫前先取得資料 (如不勾選，使用者需點選取得資料才可取得)" /></td> 
                </tr>
                <tr>
                    <td colspan="2"><asp:CheckBox ID="chkVariation" runat="server" meta:resourcekey="chkVariationResource1" Text="欄位內容是否需每個站點更新 (如果勾選，每次簽核時，會再次取得內容)" /></td>
                </tr>
            </table>
            </asp:Panel>
        </td>
    </tr>
</table>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
    <asp:Label ID="lblTestMsg500" runat="server" Text="呼叫Web Method錯誤" Visible="False" meta:resourcekey="lblTestMsg500Resource1"></asp:Label>
    <asp:Label ID="lblTestMsg401" runat="server" Text="無法認證通過" Visible="False" meta:resourcekey="lblTestMsg401Resource1"></asp:Label>
    <asp:Label ID="lblTestMsg404" runat="server" Text="無法呼叫asmx檔案" Visible="False" meta:resourcekey="lblTestMsg404Resource1"></asp:Label>
    <asp:Label ID="lblTestMsg99" runat="server" Text="無法連線Web Service主機" Visible="False" meta:resourcekey="lblTestMsg99Resource1"></asp:Label>
    <asp:Label ID="lblTestMsg" runat="server" Text="測試成功!!" Visible="False" meta:resourcekey="lblTestMsgResource1"></asp:Label> 
    <asp:Label ID="lblNotifyMsgA" runat="server" Text="請填寫WebService URL及WebService Method" Visible="False" meta:resourcekey="lblNotifyMsgAResource1"></asp:Label>
    <asp:Label ID="lblNotifyMsgB" runat="server" Text="請填寫WebService主機帳號" Visible="False" meta:resourcekey="lblNotifyMsgBResource1"></asp:Label>
    <asp:Label ID="lblNormalNotify" runat="server" meta:resourcekey="lblNormalNotifyResource1" Text="只測試連線，此階段無法驗證資料的正確性與否" Visible="False"></asp:Label>
    
</asp:Content>

