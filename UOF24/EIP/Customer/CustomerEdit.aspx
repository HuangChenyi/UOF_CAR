<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_CustomerEdit" Title="維護客戶資料" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CustomerEdit.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function rdbtnSelectClass_OnClientClicked(sender, args) {
           
            var getclassID =  $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidClassID.Value,true)%>');
            $uof.dialog.open2("~/EIP/Customer/SelectClass.aspx", sender, "", 300, 450, SelectClassDialogResult, { "strClassID": getclassID });

        }

        function rdbtnArea_OnClientClicked(sender, args) {
            $uof.dialog.open2("~/EIP/Customer/SelectArea.aspx", sender, "", 300, 500, OpenDialogResult, { "Mode": "Insert" });
        }

        function rdbtnCustomer_OnClientClicked(sender, args) {
            $uof.dialog.open2("~/EIP/Customer/QueryCustomerData.aspx", sender, "", 800, 450, OpenDialogResult);
        }

        function checkCustData() {
            var hiddenflag =  $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hiddenModify.Value,true)%>');
            var CustID = $('#<%=txtCusID.ClientID %>').val();
            var Abbreviation = $('#<%=txtAbbreviation.ClientID %>').val();
            var CustName = $('#<%=txtCusName.ClientID %>').val();
            var alertStr = "";
            var retID;
            var retName;
            var retAbb;
            var flag;

            if (hiddenflag == "Modify") {
                flag = "Update";
            }
            else {
                flag = "Add";
                if (CustID != "") {
                    var adddata = [CustID];
                    retID = $uof.pageMethod.sync("CheckCustomerID", adddata);
                    if (retID == "true") {
                        $('#<%=txtCusID.ClientID %>').get(0).style.color = "Red";
                alertStr += "<%=lblCustIDExist.Text %>" + "\r\n";
            }
            else
                $('#<%=txtCusID.ClientID %>').get(0).style.color = "Black";
        }
    }

    if (CustName != '') {
        var retNamedata = [flag, CustID, CustName];
        retName = $uof.pageMethod.sync("CheckCustomerName", retNamedata);
    }

    if (Abbreviation != '') {
        var retAbbdata = [flag, CustID, Abbreviation];
        retAbb = $uof.pageMethod.sync("CheckCustomerAbb", retAbbdata);
    }

    if (retName == "true") {
        $('#<%=txtCusName.ClientID %>').get(0).style.color = "Red";
        alertStr += "<%=lblCustNameExist.Text %>" + "\r\n";
    }
    else {
        $('#<%=txtCusName.ClientID %>').get(0).style.color = "Black";
    }

    if (retAbb == "true") {
        $('#<%=txtAbbreviation.ClientID %>').get(0).style.color = "Red";
        alertStr += "<%=lblCustAbbExist.Text %>" + "\r\n";
    }
    else
        $('#<%=txtAbbreviation.ClientID %>').get(0).style.color = "Black";

    if (alertStr != "") {
        alert(alertStr);
    }
}

function userToolBarButtonClicking(sender, args) {
    var key = args.get_item().get_value();
    switch (key) {
        case "btnAdd":
            args.set_cancel(true);
            var CustID = $('#<%=txtCusID.ClientID %>').val();
            $uof.dialog.open2("~/EIP/Customer/ContactEdit.aspx", args.get_item(), "<%=lblAddContact.Text%>", 725, 650, OpenDialogResult, { "Mode": "Insert", "CustID": CustID });
            break;
        case "btnDelete":
            var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                if (CheckedData == "") {
                    alert("<%= lblhiddenDelete.Text %>");
                    args.set_cancel(true);
                    return;
                }
                else {
                    var data = [CheckedData];
                    var haveAccount = $uof.pageMethod.sync("CheckHaveAccount", data);
                    if (haveAccount == "true") {
                        if (!window.confirm('<%=lblDelHaveAccountConfirmMsg.Text %>')) {
	                        args.set_cancel(true);
	                    }
	                }
	                else {
	                    if (!window.confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
	                        args.set_cancel(true);
	                    }
	                }
                }
                break;
            case "btnCreate":
                var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                var CustID = $('#<%=txtCusID.ClientID %>').val();
                if (CheckedData == "") {
                    alert("<%= lblhiddenCreate.Text %>");
                    args.set_cancel(true);
                    return;
                }
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Customer/CreateExternalAccountByBat.aspx", args.get_item(), "<%=lblCreateAccount.Text %>", 700, 520, CreateDialogResult, { "CONTACT_ID": CheckedData, "CustID": CustID });

                break;
        }
}
        function memoToolBarButtonClicking(sender, args) {

            var key = args.get_item().get_value();
            switch (key) {
                case "btnEdit":
                    args.set_cancel(true);
                    var CustID = $('#<%=txtCusID.ClientID %>').val();
                    var MemoContent = $('#<%=lblMemoContent.ClientID %>').val();
                    $uof.dialog.open2("~/EIP/Customer/CustomerMemoEditor.aspx", args.get_item(), "<%=lblOpenEdit.Text %>", 0, 0, EditDialogResult, { "Mode": "Edit", "CustID": CustID, "MemoContent": MemoContent });
                    break;
            }
        }
        function EditDialogResult(returnValue) {
            if (typeof (returnValue) === 'undefined' || returnValue === null) {
                return false;
            }
            else {
                return true;
            }
        }
    function SelectClassDialogResult(returnValue) {
        if (typeof (returnValue) !== 'undefined') {
            $("#<%=hidClassID.ClientID %>").val(returnValue);
                return true;
            }
            else
                return false;
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) === 'undefined' || returnValue === null) {
                return false;
            }
            else {
                return true;
            }
        }

        function CreateDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined" || returnValue === null) {
                return false;
            }
            else if (returnValue === "AlreadyCreate") {
                alert("<%= lblAlreadyCreate.Text %>");
            }
            else {
                return true;
            }
    }
    </script>

    <script type="text/javascript">

        function getClassID() {
            return $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidClassID.Value,true)%>'); 
        }

        //去除字串左邊的空白虛格
        function ltrim(instr) {
            return instr.replace(/^[\s]*/gi, "");
        }

        //去除字串右邊的空白虛格
        function rtrim(instr) {
            return instr.replace(/[\s]*$/gi, "");
        }

        //去除字串前後的空白虛格
        function trim(instr) {
            instr = ltrim(instr);
            instr = rtrim(instr);
            return instr;
        }

        //點選同公司地址按鈕,複製到發票地址, 也複製公司的郵遞區號到發票的郵遞區號
        function lbtnComAddress() {
            var CompanyAddress = $('#<%=txtCompanyAddress.ClientID %>');
            var InvoiceAddress = $('#<%=txtInvoiceAddress.ClientID %>');
            var CompanyZipCode = $('#<%=txtCompanyCode.ClientID %>');
            var InvoiceZipCode = $('#<%=txtInvoiceCode.ClientID %>');

            if (trim(CompanyAddress.val()) == "") {
                alert("<%=lblAlertCompanyMsg.Text %>");
            }
            else {
                InvoiceAddress.val(CompanyAddress.val());
                InvoiceZipCode.val(CompanyZipCode.val());
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
        span.JustAddBorder table tr td {
            border-width: 1px;
            border-style: solid;
        }
    </style>
    <telerik:RadTabStrip ID="rdTabs" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" OnTabClick="rdTabs_TabClick" meta:resourcekey="rdTabsResource1">
        <Tabs>
            <telerik:RadTab runat="server" Text="客戶資料" PageViewID="rdPageView1" Selected="true" meta:resourcekey="RadTabResource4">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="聯絡人資料" PageViewID="rdPageView2" meta:resourcekey="RadTabResource5">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="客戶備忘錄" PageViewID="rdPageView3" meta:resourcekey="RadTabResource6">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPage1Resource1">
        <telerik:RadPageView ID="rdPageView1" runat="server" Width="100%" Selected="True" meta:resourcekey="rdPageView1Resource1">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourceKey="ValidationSummary1Resource1"></asp:ValidationSummary>
                    <table cellspacing="1" class="PopTable" style="width: 100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label19" runat="server" ForeColor="Red" meta:resourceKey="Label19Resource1" Text="*"></asp:Label><asp:Label ID="Label1" runat="server" meta:resourceKey="Label1Resource1" Text="客戶代號"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCusID" runat="server" MaxLength="50" meta:resourceKey="txtCusIDResource1"></asp:TextBox><telerik:RadButton ID="rdbtnCustomer" runat="server" CausesValidation="False" meta:resourcekey="rdbtnCustomerResource1" OnClientClicked="rdbtnCustomer_OnClientClicked" Text="查詢客戶資料"></telerik:RadButton>
                            </td>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="Label20" runat="server" ForeColor="Red" meta:resourceKey="Label20Resource1" Text="*"></asp:Label><asp:Label ID="Label3" runat="server" meta:resourceKey="Label3Resource1" Text="客戶簡稱"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtAbbreviation" runat="server" MaxLength="50" meta:resourceKey="txtAbbreviationResource1"></asp:TextBox></td>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="Label4" runat="server" meta:resourceKey="Label4Resource1" Text="統一編號"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtUnifiedID" runat="server" MaxLength="50" meta:resourceKey="txtUnifiedIDResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label22" runat="server" ForeColor="Red" meta:resourceKey="Label22Resource1" Text="*"></asp:Label><asp:Label ID="Label2" runat="server" meta:resourceKey="Label2Resource1" Text="客戶名稱"></asp:Label></td>
                            <td colspan="3">
                                <asp:TextBox ID="txtCusName" runat="server" MaxLength="255" meta:resourceKey="txtCusNameResource1" Width="540px"></asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label21" runat="server" meta:resourceKey="Label21Resource1" Text="資料狀態"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPublic" runat="server" meta:resourceKey="lblPublicResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" meta:resourceKey="Label5Resource1" Text="客戶英文名稱"></asp:Label></td>
                            <td colspan="3">
                                <asp:TextBox ID="txtEngName" runat="server" MaxLength="255" meta:resourceKey="txtEngNameResource1" Width="540px"></asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label27" runat="server" Text="保固日期" meta:resourceKey="Label27Resource1"></asp:Label></td>
                            <td>
                                <telerik:RadDatePicker ID="rdWarrantyDate" runat="server" SkinID="AllowEmpty"></telerik:RadDatePicker>
                                </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="Label23" runat="server" ForeColor="Red" meta:resourceKey="Label23Resource1" Text="*"></asp:Label><asp:Label ID="Label6" runat="server" meta:resourceKey="Label6Resource1" Text="客戶類別"></asp:Label></td>
                            <td valign="top">
                                <asp:Panel ID="Panel1" runat="server" meta:resourceKey="Panel1Resource1">
                                    <telerik:RadButton ID="rdbtnSelectClass" runat="server"  meta:resourcekey="rdbtnSelectClassResource1" OnClick="rdbtnSelectClass_Click" OnClientClicked="rdbtnSelectClass_OnClientClicked" Text="選擇客戶類別"></telerik:RadButton>
                                    <asp:HiddenField ID="HiddenField1" runat="server"></asp:HiddenField>
                                    <telerik:RadTreeView ID="classtree" runat="server" Height="100px" EnableNodeTextHtmlEncoding="true" meta:resourcekey="classtreeResource1" Width="180px"></telerik:RadTreeView>
                                </asp:Panel>
                            </td>
                            <td valign="top">
                                <asp:Label ID="Label26" runat="server" meta:resourceKey="Label26Resource1" Text="地區別"></asp:Label></td>
                            <td align="left" valign="top">
                                <asp:Panel ID="Panel2" runat="server" meta:resourceKey="Panel2Resource1">
                                    <telerik:RadButton ID="rdbtnArea" runat="server" meta:resourcekey="rdbtnAreaResource1" OnClick="rdbtnArea_Click" OnClientClicked="rdbtnArea_OnClientClicked" Text="選擇地區別"></telerik:RadButton>
                                    <telerik:RadButton ID="rdbtnClearArea" runat="server" CausesValidation="False" meta:resourcekey="rdbtnClearAreaResource1" OnClick="rdbtnClearArea_Click" Text="清除地區別"></telerik:RadButton>
                                    <telerik:RadTreeView ID="areatree" runat="server" Height="100px"  EnableNodeTextHtmlEncoding="true" meta:resourcekey="areatreeResource1" Width="180px"></telerik:RadTreeView>
                                </asp:Panel>
                            </td>
                            <td valign="top">
                                <asp:Label ID="Label7" runat="server" meta:resourceKey="Label7Resource1" Text="行業別"></asp:Label></td>
                            <td valign="top">
                                <asp:DropDownList ID="ddlIndustry" runat="server" meta:resourceKey="ddlIndustryResource1" Width="150px">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" meta:resourceKey="Label8Resource1" Text="負責人"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtOwner" runat="server" MaxLength="50" meta:resourceKey="txtOwnerResource1"></asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label13" runat="server" meta:resourceKey="Label13Resource1" Text="資本額"></asp:Label></td>
                            <td>
                                <telerik:RadNumericTextBox ID="rdNumCapitalization" runat="server" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" MaxLength="10" MaxValue="9999999999" meta:resourcekey="rdNumCapitalizationResource1">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n"></NumberFormat>

                                    <ClientEvents OnKeyPress="NewKeyPress"></ClientEvents>
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox><asp:Label ID="Label25" runat="server" meta:resourceKey="Label25Resource1" Text="千"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label17" runat="server" meta:resourceKey="Label17Resource1" Text="客戶等級"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="ddlGrade" runat="server" meta:resourceKey="ddlGradeResource1" Width="150px">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label9" runat="server" meta:resourceKey="Label9Resource1" Text="公司電話1"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtTel1" runat="server" MaxLength="50" meta:resourceKey="txtTel1Resource1"></asp:TextBox></td>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="Label14" runat="server" meta:resourceKey="Label14Resource2" Text="公司電話2"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtTel2" runat="server" MaxLength="50" meta:resourceKey="txtTel2Resource1"></asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label18" runat="server" meta:resourceKey="Label18Resource1" Text="公司傳真"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtFax" runat="server" MaxLength="50" meta:resourceKey="txtFaxResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label10" runat="server" meta:resourceKey="Label10Resource1" Text="郵遞區號"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtCompanyCode" runat="server" MaxLength="50" meta:resourceKey="txtCompanyCodeResource1"></asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label15" runat="server" meta:resourceKey="Label15Resource1" Text="公司地址"></asp:Label></td>
                            <td colspan="3">
                                <asp:TextBox ID="txtCompanyAddress" runat="server" MaxLength="255" meta:resourceKey="txtCompanyAddressResource1" Width="370px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label11" runat="server" meta:resourceKey="Label11Resource1" Text="發票郵遞區號"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtInvoiceCode" runat="server" MaxLength="50" meta:resourceKey="txtInvoiceCodeResource1"></asp:TextBox></td>
                            <td>
                                <asp:Label ID="Label16" runat="server" meta:resourceKey="Label16Resource1" Text="發票地址"></asp:Label></td>
                            <td colspan="3" style="width: 100%">
                                <asp:LinkButton ID="lbtnComAddress" runat="server" CausesValidation="False" meta:resourceKey="lbtnComAddressResource1" Text="同公司地址"></asp:LinkButton><br />
                                <asp:TextBox ID="txtInvoiceAddress" runat="server" MaxLength="255" meta:resourceKey="txtInvoiceAddressResource1" Width="370px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label12" runat="server" meta:resourceKey="Label12Resource1" Text="公司網址"></asp:Label></td>
                            <td colspan="5">
                                <asp:TextBox ID="txtWebURL" runat="server" MaxLength="255" meta:resourceKey="txtWebURLResource1" Width="540px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="Label32" runat="server" ForeColor="Red" meta:resourceKey="Label32Resource1" Text="*"></asp:Label><asp:Label ID="Label24" runat="server" meta:resourceKey="Label24Resource1" Text="資料歸屬"></asp:Label></td>
                            <td colspan="2" valign="top">
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" TreeHeight="80px"></uc1:UC_ChoiceList>
                            </td>
                            <td align="right" class="PopTableLeftTD" valign="top">
                                <asp:Label ID="Label28" runat="server" meta:resourceKey="Label28Resource1" Text="備註"></asp:Label></td>
                            <td align="left" class="PopTableRightTD" colspan="2" valign="top">
                                <asp:TextBox ID="txtRemark" runat="server" Height="112px" meta:resourceKey="txtRemarkResource1" TextMode="MultiLine" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:TextBox ID="txtOption1" runat="server" MaxLength="50" meta:resourceKey="txtOption1Resource1" Text="其他1" Width="97px"></asp:TextBox></td>
                            <td colspan="2">
                                <asp:TextBox ID="txtOption1Value" runat="server" MaxLength="255" meta:resourceKey="txtOption1ValueResource1" Width="230px"></asp:TextBox></td>
                            <td align="right" class="PopTableLeftTD" style="white-space: nowrap;">
                                <asp:TextBox ID="txtOption2" runat="server" MaxLength="50" meta:resourceKey="txtOption2Resource1" Text="其他2" Width="97px"></asp:TextBox></td>
                            <td align="left" class="PopTableRightTD" colspan="2">
                                <asp:TextBox ID="txtOption2Value" runat="server" MaxLength="255" meta:resourceKey="txtOption2ValueResource1" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtOption3" runat="server" MaxLength="50" meta:resourceKey="txtOption3Resource1" Text="其他3" Width="97px"></asp:TextBox></td>
                            <td colspan="2">
                                <asp:TextBox ID="txtOption3Value" runat="server" MaxLength="255" meta:resourceKey="txtOption3ValueResource1" Width="230px"></asp:TextBox></td>
                            <td align="right" class="PopTableLeftTD">
                                <asp:TextBox ID="txtOption4" runat="server" MaxLength="50" meta:resourceKey="txtOption4Resource1" Text="其他4" Width="97px"></asp:TextBox></td>
                            <td align="left" class="PopTableRightTD" colspan="2">
                                <asp:TextBox ID="txtOption4Value" runat="server" MaxLength="255" meta:resourceKey="txtOption4ValueResource1" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtOption5" runat="server" MaxLength="50" meta:resourceKey="txtOption5Resource1" Text="其他5" Width="97px"></asp:TextBox></td>
                            <td colspan="2">
                                <asp:TextBox ID="txtOption5Value" runat="server" MaxLength="255" meta:resourceKey="txtOption5ValueResource1" Width="230px"></asp:TextBox></td>
                            <td align="right" class="PopTableLeftTD">
                                <asp:TextBox ID="txtOption6" runat="server" MaxLength="50" meta:resourceKey="txtOption6Resource1" Text="其他6" Width="97px"></asp:TextBox></td>
                            <td align="left" class="PopTableRightTD" colspan="2">
                                <asp:TextBox ID="txtOption6Value" runat="server" MaxLength="255" meta:resourceKey="txtOption6ValueResource1" Width="230px"></asp:TextBox></td>
                        </tr>
                    </table>
                    <asp:Label ID="lblNote" runat="server" ForeColor="Red" meta:resourceKey="lblNoteResource1" Text="注意: 1.要先儲存客戶資料, 才能新增聯絡人資料;2.如要發佈客戶, 必須先儲存客戶資料"></asp:Label><asp:Label ID="lblShowMessage" runat="server" meta:resourceKey="lblShowMessageResource1" Visible="False"></asp:Label><asp:Label ID="lblCreateTime" runat="server" meta:resourceKey="lblCreateTimeResource1" Text="建立日期:" Visible="False"></asp:Label><asp:Label ID="lblCreater" runat="server" meta:resourceKey="lblCreaterResource1" Text="建立人:" Visible="False"></asp:Label><asp:Label ID="lblModifyTime" runat="server" meta:resourceKey="lblModifyTimeResource1" Text="修改日期:" Visible="False"></asp:Label><asp:Label ID="lblModifier" runat="server" meta:resourceKey="lblModifierResource1" Text="修改人:" Visible="False"></asp:Label><br />
                    <asp:HiddenField ID="HiddenField2" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="HiddenField3" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="HiddenField4" runat="server"></asp:HiddenField>
                    <asp:HiddenField ID="hiddenConfirmPublish" runat="server" meta:resourceKey="hiddenConfirmPublishResource1" Value="此客戶資料目前尚未建立聯絡人資料, 是否確定發佈?"></asp:HiddenField>
                    <asp:HiddenField ID="hiddenConfirmDelete" runat="server" meta:resourceKey="hiddenConfirmDeleteResource1" Value="是否確定要刪除客戶資料?"></asp:HiddenField>
                    <asp:HiddenField ID="hidCustID" runat="server"></asp:HiddenField>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rdPageView2" runat="server" Width="100%" meta:resourcekey="rdPageView2Resource1">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <telerik:RadToolBar ID="userToolBar" runat="server" meta:resourcekey="userToolBarResource1" OnButtonClick="userToolBar_OnButtonClick" OnClientButtonClicking="userToolBarButtonClicking" Width="100%" SingleClick="None">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif" ImageUrl="~/Common/Images/Icon/icon_m59.gif" meta:resourceKey="TBarButtonResource1" Text="新增聯絡人" Value="btnAdd"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourceKey="TBarButtonResource2" Text="刪除聯絡人" Value="btnDelete"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif" ImageUrl="~/Common/Images/Icon/icon_m59.gif" meta:resourceKey="TBarButtonResource3" Text="建立外部會員帳號" Value="btnCreate"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sp1" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton  runat="server" Value="Title" meta:resourcekey="RadToolBarButtonResource7">
                                            <ItemTemplate>
                                                     <asp:Label runat="server" ID="lblTitle" Text="關鍵字(姓名/電子郵件/外部會員帳號)" meta:resourcekey="lblTitleResource2"></asp:Label>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" value="Keyword" meta:resourcekey="RadToolBarButtonResource8" >
                                            <ItemTemplate>
                                                    <asp:TextBox ID="txtKeyword" runat="server" Width="120px" meta:resourcekey="txtKeywordResource2"    ></asp:TextBox>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>               
                                        <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Value="btndSearch" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" meta:resourcekey="RadToolBarButtonResource9" ></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                                <Fast:Grid ID="grd" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"  DataKeyNames="CONTACT_ID" DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="grdResource2" OnRowDataBound="grd_RowDataBound" PageSize="15"   Width="100%" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                    <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                    <Columns>
                                        <asp:TemplateField HeaderText="姓名" meta:resourceKey="TemplateFieldResource1" SortExpression="CONTACT_NAME">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn" runat="server" meta:resourceKey="lbtnResource1" OnClick="lbtn_Click" Text='<%#: Eval("CONTACT_NAME") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="主要聯絡人" meta:resourceKey="TemplateFieldResource2" SortExpression="IS_MAIN_CONTACT">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIsMainContact" runat="server" Text='<%#: Eval("IS_MAIN_CONTACT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sex" HeaderText="性別" meta:resourceKey="BoundFieldResource1" SortExpression="SEX">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DEPARTMENT" HeaderText="單位" meta:resourceKey="BoundFieldResource2" SortExpression="DEPARTMENT">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TITLE" HeaderText="職稱" meta:resourceKey="BoundFieldResource3" SortExpression="TITLE">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TEL" HeaderText="電話" meta:resourceKey="BoundFieldResource9" SortExpression="TEL">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EXT_NUM" HeaderText="分機" meta:resourceKey="BoundFieldResource5" SortExpression="EXT_NUM">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MOBILE_PHONE" HeaderText="手機" meta:resourceKey="BoundFieldResource10" SortExpression="MOBILE_PHONE">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" meta:resourceKey="BoundFieldResource7" SortExpression="EMAIL">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EBACCOUNT" HeaderText="外部會員帳號" meta:resourceKey="BoundFieldResource8" SortExpression="EBACCOUNT">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows" OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetContactDataSetByCustID_Count" SelectMethod="GetContactDataSetByCustID" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.Customer.UCO.CUSContactUCO">
                                    <SelectParameters>
                                        <asp:Parameter Name="CustID" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="intStartIndex" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="intMaxRows" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="strSortExpression" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Keyword" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rdPageView3" runat="server" Width="100%" meta:resourcekey="rdPageView3Resource1">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <table  style="width: 100%">
                        <tr>
                            <td>
                                <telerik:RadToolBar ID="memoToolBar" Width="100%" OnClientButtonClicking="memoToolBarButtonClicking" OnButtonClick="memoToolBar_ButtonClick" runat="server" meta:resourcekey="memoToolBarResource1" SingleClick="None">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" meta:resourceKey="ToolBarButtonResource1" CheckedImageUrl="~/Common/Images/Icon/icon_m57.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m57.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m57.gif" ImageUrl="~/Common/Images/Icon/icon_m57.gif" Text="編輯" Value="btnEdit"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMemoContent" runat="server" Text="" class="editorcontentstyle JustAddBorder" meta:resourcekey="lblMemoContentResource1"></asp:Label>
                                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter"/>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None" ForeColor="White" Visible="False" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
    <asp:Label ID="lblOpenEdit" runat="server" Text="編輯" Visible="False" meta:resourcekey="lblOpenEditResource1"></asp:Label>
    <asp:Label ID="lblExist" runat="server" Text="客戶代號、客戶簡稱及客戶名稱已經存在" Visible="False" meta:resourcekey="lblExistResource1"></asp:Label>
    <asp:Label ID="lblDBFail" runat="server" Text="資料操作失敗" Visible="False" meta:resourcekey="lblDBFailResource1"></asp:Label>
    <asp:Label ID="lblEmpty" runat="server" Text="有*號欄位為必輸欄位, 不能為空值" Visible="False" meta:resourcekey="lblEmptyResource1"></asp:Label>
    <asp:HiddenField ID="hiddenDelete" runat="server" Value="沒有挑選要刪除的項目" />
    <asp:HiddenField ID="hiddenModify" runat="server" />
    <asp:HiddenField ID="HiddenMemoContent" runat="server" />
    <asp:Label ID="lblContact" runat="server" Text="必須要有一筆聯絡人資料" Visible="False" meta:resourcekey="lblContactResource1"></asp:Label>
    <asp:Label ID="lblEdit" runat="server" Text="修改聯絡人資料" Visible="False" meta:resourcekey="lblEditResource1"></asp:Label>
    <asp:Label ID="lblArea" runat="server" Text="地區別" Visible="False" meta:resourcekey="lblAreaResource1"></asp:Label>
    <asp:Label ID="lblHasPublish" runat="server" Text="已發佈" Visible="False" meta:resourcekey="lblHasPublishResource1"></asp:Label>
    <asp:Label ID="lblUnPublish" runat="server" Text="未發佈" Visible="False" meta:resourcekey="lblUnPublishResource1"></asp:Label>
    <asp:Label ID="Label29" runat="server" Text="維護聯絡人資料前，請先儲存客戶資料！" Visible="False" meta:resourcekey="Label29Resource1"></asp:Label>
    <asp:Label ID="lblSelectError" runat="server" Text="維護聯絡人資料前，請先儲存客戶資料！" Visible="False" meta:resourcekey="lblSelectErrorResource1"></asp:Label>
    <asp:Label ID="lblAlertCompanyMsg" runat="server" Text="請輸入公司地址" Visible="False" meta:resourcekey="lblAlertCompanyMsgResource1"></asp:Label>
    <asp:Label ID="lblAlertZipCodeMsg" runat="server" Text="請輸入公司郵遞區號" Visible="False" meta:resourcekey="lblAlertZipCodeMsgResource1"></asp:Label>
    <asp:Label ID="lblAddContact" runat="server" Text="新增聯絡人" Visible="False" meta:resourcekey="lblAddContactResource1"></asp:Label>
    <asp:Label ID="lblSave" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="發佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblDeleteFailure" runat="server" Text="删除资料失败" Visible="False" meta:resourcekey="lblDeleteFailureResource1"></asp:Label>
    <asp:Label ID="lblDDLItem" runat="server" Text="暫不分類" Visible="False" meta:resourcekey="lblDDLItemResource1"></asp:Label>
    <asp:Label ID="lblMale" runat="server" Text="男" Visible="False" meta:resourcekey="lblMaleResource1"></asp:Label>
    <asp:Label ID="lblFemale" runat="server" Text="女" Visible="False" meta:resourcekey="lblFemaleResource1"></asp:Label>
    <input id="hidClassID" runat="server" style="width: 76px" type="hidden" enableviewstate="true" />
    <asp:Label ID="lblCustIDExist" runat="server" Text="客戶代號已存在" Visible="False" meta:resourcekey="lblCustIDExistResource1"></asp:Label>
    <asp:Label ID="lblCustAbbExist" runat="server" Text="客戶簡稱已存在" Visible="False" meta:resourcekey="lblCustAbbExistResource1"></asp:Label>
    <asp:Label ID="lblCustNameExist" runat="server" Text="客戶名稱已存在" Visible="False" meta:resourcekey="lblCustNameExistResource1"></asp:Label>
    <asp:Label ID="lblExistMsg" runat="server" Text="請點選[查詢客戶資料],查詢客戶資料是否已存在" Visible="False" meta:resourcekey="lblExistMsgResource1"></asp:Label>
    <asp:Label ID="lblhiddenDelete" runat="server" Text="沒有挑選要刪除的項目" Visible="False" meta:resourcekey="lblhiddenDeleteResource1"></asp:Label>
    <asp:Label ID="lblTab0" runat="server" Text="客戶資料" Visible="False" meta:resourcekey="lblTab0Resource1"></asp:Label>
    <asp:Label ID="lblTab1" runat="server" Text="聯絡人資料" Visible="False" meta:resourcekey="lblTab1Resource1"></asp:Label>
    <asp:Label ID="lblTab2" runat="server" Text="客戶備忘錄" Visible="False" meta:resourcekey="lblTab2Resource1"></asp:Label>
    <asp:Label ID="lblhiddenCreate" runat="server" Text="沒有挑選要建立的項目" Visible="False" meta:resourcekey="lblhiddenCreateResource1"></asp:Label>
    <asp:Label ID="lblCreateAccount" runat="server" Text="建立帳號" Visible="False" meta:resourcekey="lblCreateAccountResource1"></asp:Label>
    <asp:Label ID="lblAlreadyCreate" runat="server" Text="挑選的項目裡已有建立外部會員帳號,請選擇尚未建立帳號的項目" Visible="False" meta:resourcekey="lblAlreadyCreateResource1"></asp:Label>
    <asp:Label ID="lblDelRemark" runat="server" Text="註:以上聯絡人擁有外部會員帳號，在客戶資料庫已被刪除，但是外部會員帳號仍然存在，請斟酌處理。" Visible="False" meta:resourcekey="lblDelRemarkResource1"></asp:Label>
    <asp:Label ID="lbldelNameMsg" runat="server" Text="姓名" Visible="False" meta:resourcekey="lbldelNameMsgResource1"></asp:Label>
    <asp:Label ID="lbldelAccountMsg" runat="server" Text="帳號" Visible="False" meta:resourcekey="lbldelAccountMsgResource1"></asp:Label>
    <asp:Label ID="lbldelFllowMsg" runat="server" Text="已刪除聯絡人如下:" Visible="False" meta:resourcekey="lbldelFllowMsgResource1"></asp:Label>
    <asp:Label ID="lbldelCompanyNameMsg" runat="server" Text="公司名稱:" Visible="False" meta:resourcekey="lbldelCompanyNameMsgResource1"></asp:Label>
    <asp:Label ID="lbldelTitleMsg" runat="server" Text="客戶資料庫-刪除聯絡人訊息通知" Visible="False" meta:resourcekey="lbldelTitleMsgResource1"></asp:Label>
    <asp:Label ID="lblDelHaveAccountConfirmMsg" runat="server" Text="挑選的項目裡已有建立外部會員帳號，確定要刪除嗎?" Visible="False" meta:resourcekey="lblDelHaveAccountConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="false" meta:resourcekey="lblYesResource1"></asp:Label>
</asp:Content>
