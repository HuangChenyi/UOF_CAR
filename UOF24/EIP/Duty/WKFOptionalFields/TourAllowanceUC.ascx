<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_TourAllowanceUC" Codebehind="TourAllowanceUC.ascx.cs" EnableTheming="true" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript">
    function wneUsedAmount_ValueChange(oEdit, oldValue, oEvent) {

        var temp = "ctl00_ContentPlaceHolder1_VersionFieldCollectionUsingUC1_versionFieldUC{0}_Grid1_ctl{1}_rdNumUsedAmount";
        var total = 0;

        for (var i = 0; i < $('#<%= hfCount.ClientID  %>').val() ; i++) {

            var s;
            if (i < 8) {
                s = String.format(temp, $('#<%= hfFiledSeq.ClientID  %>').val(), "0" + (i + 2))
            }
            else {
                s = String.format(temp, $('#<%= hfFiledSeq.ClientID  %>').val(), i + 2)
            }
            total += $find(s).get_value();
        }

        var data = [total];
        var totalAmount = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TourAllowanceUC.ascx", "ConvertString", data);
        $('#<%= lblTourTotalAmount.ClientID  %>').text(totalAmount);
    }

    function CheckMustHaveDetail(e, args) {
        var data = [$('#<%=txtFieldValue.ClientID %>').val()];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TourAllowanceUC.ascx", "CheckMustHaveDetail", data);
        if (result == "false")
            args.IsValid = false;
    }

    function CheckArrive(e, args) {

        var data = [$('#<%=txtFieldValue.ClientID %>').val()];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TourAllowanceUC.ascx", "CheckArrive", data);
        if (sValue != null && sValue != "" && sValue != "NotDisplay") {
            var lblErrorMessageObj = $("#<%=cvNoArrive.ClientID%>");
            lblErrorMessageObj.text(String.format(lblErrorMessageObj.text(), sValue));
            args.IsValid = false;
            return;
        }
    }

    function CheckCreate(e, args) {
        var data = [$('#<%=txtFieldValue.ClientID %>').val()];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TourAllowanceUC.ascx", "CheckCreate", data);

        if (sValue != null && sValue != "" && sValue != "NotDisplay") {
            var lblErrorMessageObj = $("#<%=cvNoCreate.ClientID%>");
            lblErrorMessageObj.text(String.format(lblErrorMessageObj.text(), sValue));
            args.IsValid = false;
            return;
        }
    }

    function CheckRepet(e, args) {

        var data = [$('#<%=txtFieldValue.ClientID %>').val(), '<%=m_TaskID %>'];
        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/TourAllowanceUC.ascx", "CheckRepet", data);

        if (sValue != null && sValue != "" && sValue != "NotDisplay") {
            var lblErrorMessageObj = $("#<%=cvFormRepet.ClientID%>");
            lblErrorMessageObj.text(String.format(lblErrorMessageObj.text(), sValue));
            args.IsValid = false;
            return;
        }
    }

    function CheckPrice(e, args) {
        var temp = "ctl00_ContentPlaceHolder1_VersionFieldCollectionUsingUC1_versionFieldUC{0}_Grid1_ctl{1}_rdNumUsedAmount";
        var errorItem = "";

        for (var i = 0; i < $('#<%= hfCount.ClientID  %>').val() ; i++) {

            var s;
            if (i < 8) {
                s = String.format(temp, $('#<%= hfFiledSeq.ClientID  %>').val(), "0" + (i + 2))
            }
            else {
                s = String.format(temp, $('#<%= hfFiledSeq.ClientID  %>').val(), i + 2)
            }

            if ($find(s) != null) {
                if ($find(s).get_value() == '0') {
                    errorItem += String.format("[{0}]", i + 1) + "、";
                }
            }
        }
        if (errorItem != null && errorItem != "") {
            errorItem = errorItem.substring(0, errorItem.length - 1);
            var lblErrorMessageObj = $("#<%=cvPrice.ClientID%>");
            var errorString = String.format($("#<%=lblErrorPrice.ClientID%>").text(), errorItem);
            lblErrorMessageObj.text(errorString);
            args.IsValid = false;
            return;
        }
    }
    function OnValueChanging(sender, args) {
        if (new String(args.get_newValue()) == "") {
            args.set_newValue(args.get_oldValue());
        }
    }

    function CheckSupportMobile(e, args) {
        var mobileUi = "<%=_MobileUI%>";
        if (mobileUi == "true") {
            args.IsValid = false;
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
        <div>
            <asp:Label ID="lblNotSupport" runat="server" Text="此欄位不允許在App編輯" Visible="False" ForeColor="Red" meta:resourcekey="lblNotSupportResource1"></asp:Label>            
            <asp:CustomValidator ID="cvCheckSupportMobile" runat="server" ForeColor="Red"
                                    ErrorMessage="此欄位不允許在App編輯" Display="Dynamic"
                                    ClientValidationFunction="CheckSupportMobile"
                                    meta:resourcekey="cvCheckSupportMobileResource1"></asp:CustomValidator>
        </div>
        <table class="PopTable" style="width: 550px">
            <tr>
                <td class="PopTableLeftTD" style=" white-space:nowrap;">
                    <asp:Label ID="Label1" runat="server" Text="申請年度"
                        meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <asp:Label ID="lblApplyYear" runat="server"
                        meta:resourcekey="lblApplyYearResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style=" white-space:nowrap;">
                    <asp:Label ID="Label2" runat="server" Text="參加人員"
                        meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <table width="100%">
                        <tr>
                            <td>
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
                                <asp:CustomValidator ID="cvMustHaveDetail" runat="server"
                                    ErrorMessage="至少須新增一筆以上的明細!"
                                    ClientValidationFunction="CheckMustHaveDetail" Display="Dynamic"
                                    meta:resourcekey="cvMustHaveDetailResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                                    AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"
                                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                    EnhancePager="True" KeepSelectedRows="False" PageSize="15" 
                                     Width="100%" OnRowCommand="Grid1_RowCommand"
                                    OnRowDataBound="Grid1_RowDataBound" OnRowDeleting="Grid1_RowDeleting"
                                    meta:resourcekey="Grid1Resource1">
                                    <EnhancePagerSettings
                                        ShowHeaderPager="True"></EnhancePagerSettings>
                                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                    <Columns>
                                        <asp:BoundField meta:resourcekey="BoundFieldResource1"></asp:BoundField>
                                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Bind("USER_GUID") %>' runat="server" Text="刪除" CausesValidation="False"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="員工" DataField="NAME"
                                            meta:resourcekey="BoundFieldResource2">
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="職級" DataField="JOB_TITLE"
                                            meta:resourcekey="BoundFieldResource3">
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="可補助金額" DataField="TOTAL_AMOUNT"
                                            DataFormatString="{0:#,0}" meta:resourcekey="BoundFieldResource4">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="實際使用金額"
                                            meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <telerik:RadNumericTextBox ID="rdNumUsedAmount" runat="server" Value="0" MinValue="0" Width="80px" CssClass="RightAligned" DataType="System.Int64">
                                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                                    <DisabledStyle CssClass="RightAligned" />
                                                    <EnabledStyle CssClass="RightAligned" />
                                                    <FocusedStyle CssClass="RightAligned" />
                                                    <ReadOnlyStyle CssClass="RightAligned" />
                                                    <ClientEvents OnValueChanged="wneUsedAmount_ValueChange" OnValueChanging="OnValueChanging" />
                                                </telerik:RadNumericTextBox>
                                                <asp:Label ID="lblUsedAmount" runat="server"
                                                    meta:resourcekey="lblUsedAmountResource1"></asp:Label>


                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="公司補助金額" Visible="False"
                                            meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblConpanyAmount" runat="server"
                                                    Text='<%# Bind("COMPANY_AMOUNT") %>'
                                                    meta:resourcekey="lblConpanyAmountResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="福委補助金額" Visible="False"
                                            meta:resourcekey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCommitteeAmount" runat="server"
                                                    Text='<%# Bind("COMMITTEE_AMOUNT") %>'
                                                    meta:resourcekey="lblCommitteeAmountResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvNoArrive" runat="server"
                                        ErrorMessage="明細項目{0}的人員無到職日，請修改到職日並重新產生旅遊補助資訊!" Display="Dynamic"
                                        ClientValidationFunction="CheckArrive" meta:resourcekey="cvNoArriveResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvNoCreate" runat="server"
                                        ErrorMessage="明細項目{0}的人員未產生旅遊補助資訊，請重新產生旅遊補助資訊!" Display="Dynamic"
                                        ClientValidationFunction="CheckCreate" meta:resourcekey="cvNoCreateResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvFormRepet" runat="server"
                                        ErrorMessage="明細項目{0}人員的旅遊補助已申請過!" Display="Dynamic"
                                        ClientValidationFunction="CheckRepet" meta:resourcekey="cvFormRepetResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvPrice" runat="server"
                                        ErrorMessage="明細項目{0}的人員申請金額需大於零!" Display="Dynamic"
                                        ClientValidationFunction="CheckPrice" meta:resourcekey="cvPriceResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style=" white-space:nowrap;">
                    <asp:Label ID="Label3" runat="server" Text="申請補助總計"
                        meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <asp:Label ID="lblTourTotalAmount" runat="server" Text="0"
                        meta:resourcekey="lblTourTotalAmountResource1"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="公式：Sum(參加人員：實際使用金額)"
                        ForeColor="Gray" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:TextBox ID="txtFieldValue" runat="server" Style="display: none" meta:resourcekey="txtFieldValueResource1"></asp:TextBox>
        <asp:HiddenField ID="hfCount" runat="server" />
        <asp:HiddenField ID="hfFiledSeq" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
<asp:Label ID="lblNoArrive" runat="server" Text="無到職日" Visible="False" meta:resourcekey="lblNoArriveResource1"></asp:Label>
<asp:Label ID="lblNoCreate" runat="server" Text="未產生旅遊補助" Visible="False" meta:resourcekey="lblNoCreateResource1"></asp:Label>
<asp:Label ID="lblErrorPrice" runat="server" Text="明細項目{0}的人員申請金額需大於零!" Style="display: none" meta:resourcekey="lblErrorPriceResource1"></asp:Label>
<asp:Label ID="lblDisplayTitle" runat="server" Text="申請補助總金額" Visible="false"></asp:Label>
<asp:Label ID="lblUserTitle" runat="server" Text="員工" Visible="false"></asp:Label>
<asp:Label ID="lblJobTitle" runat="server" Text="職級" Visible="false"></asp:Label>
<asp:Label ID="lblAmountTitle" runat="server" Text="可補助金額" Visible="false"></asp:Label>
<asp:Label ID="lblRealAmountTitle" runat="server" Text="實際使用金額" Visible="false"></asp:Label>


<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>