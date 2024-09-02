<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_OptionalFields_AllowanceUC" CodeBehind="AllowanceUC.ascx.cs" EnableTheming="true" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript">
    function CheckMustHaveDetail(e, args) {

        var data = [$('#<%=txtFieldValue.ClientID %>').val()];
        var isPass = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/AllowanceUC.ascx", "CheckMustHaveDetail", data);
        if (isPass == "false")
            args.IsValid = false;
    }

    function CheckDetailActualDate(e, args) {
        var applyDateTimeOffset = $("#<%=hfApplyDateTimeOffset.ClientID %>").val(); //表單代碼
        var applicantGuid = $("#<%=hfApplicantGuid.ClientID %>").val();
        var data = [$('#<%=txtFieldValue.ClientID %>').val(), applyDateTimeOffset, applicantGuid];

        var sValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/AllowanceUC.ascx", "CheckActualDate", data);

        if (sValue != "" && sValue != "NotDisplay" && sValue != null) {
            var lblErrorMessageObj = $("#<%=cvActualDate.ClientID%>");
            lblErrorMessageObj.text(String.format(lblErrorMessageObj.text(), sValue));
            args.IsValid = false;
            return;
        }
    }

    function DDlChanged(sender, eventArgs) {
        var data = [$('#<%=txtFieldValue.ClientID %>').val()];
        var boolValue = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/AllowanceUC.ascx", "CheckMustHaveDetail", data);
        var strDefault = $('#<%= hfDDlDefault.ClientID %>').val();
        var rddlAllowanceClass = $find("<%= rddlAllowanceClass.ClientID %>");

        if (boolValue == "true") {
            if (strDefault === rddlAllowanceClass.get_selectedItem().get_value())  //如果再跑回來一次，就檢查前後參數是否一樣，一樣就return
                return;
            if (confirm('<%= lblClassType.Text %>') == false) {
                rddlAllowanceClass.findItemByValue(strDefault).select();  //按取消就把原本的值設定會去ddl上
                return false;
            }
            else {
                $("#<%=button1.ClientID%>").click();
            }
        }
        else {
            $("#<%=button1.ClientID%>").click();
        }
    }

    function CheckSupportMobile(e, args) {
        var mobileUi = "<%=_MobileUI%>";
        if (mobileUi == "true") {
            args.IsValid = false;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div>
            <asp:Label ID="lblNotSupport" runat="server" Text="此欄位不允許在App編輯" Visible="False" ForeColor="Red" meta:resourcekey="lblNotSupportResource1"></asp:Label>
            <asp:CustomValidator ID="cvCheckSupportMobile" runat="server" ForeColor="Red" ErrorMessage="此欄位不允許在App編輯" Display="Dynamic"
                                    ClientValidationFunction="CheckSupportMobile" meta:resourcekey="cvCheckSupportMobileResource1"></asp:CustomValidator>
        </div>
        <table class="PopTable" style="width: 500px">
            <tr id="officeTr" runat="server" style="white-space: nowrap;">
                <td class="PopTableLeftTD" style=" white-space:nowrap;" runat="server">
                    <asp:Label ID="Label3" runat="server" Text="歸屬地點時區" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD" runat="server">
                    <asp:Label ID="lblOffice" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="white-space: nowrap;">
                    <asp:Label ID="Label1" runat="server" Text="津貼種類" meta:resourcekey="Label1Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <telerik:RadDropDownList ID="rddlAllowanceClass" runat="server" CausesValidation="false" OnSelectedIndexChanged="rddlAllowanceClass_SelectedIndexChanged" meta:resourcekey="rddlAllowanceClassResource1"></telerik:RadDropDownList>
                    <asp:Label ID="lblAllowanceClass" runat="server" meta:resourcekey="lblAllowanceClassResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="white-space: nowrap;">
                    <asp:Label ID="Label12" runat="server" Text="明細資料" meta:resourcekey="Label12Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <table width="100%">
                        <tr>
                            <td>
                                <telerik:RadButton ID="rdbtnAddDetail" runat="server" Text="新增明細" CausesValidation="False" OnClick="rdbtnAddDetail_Click" meta:resourcekey="rdbtnAddDetailResource1"></telerik:RadButton>
                                <asp:CustomValidator ID="cvMustHaveDetail" runat="server" ErrorMessage="至少須新增一筆以上的津貼明細!" ClientValidationFunction="CheckMustHaveDetail" meta:resourcekey="cvMustHaveDetailResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False"
                                    AllowSorting="True" AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EmptyDataText="沒有資料" EnhancePager="True"
                                    KeepSelectedRows="False" OnRowCommand="Grid1_RowCommand"
                                    OnRowDataBound="Grid1_RowDataBound" PageSize="15"
                                    OnRowDeleting="Grid1_RowDeleting"
                                    meta:resourcekey="Grid1Resource1">

                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings
                                        AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:BoundField meta:resourcekey="BoundFieldResource1"></asp:BoundField>
                                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnModify" CommandName="Modify"
                                                    CommandArgument='<%#: Bind("ALLOWANCE_GUID") %>' runat="server" Text="修改"
                                                    CausesValidation="False" meta:resourcekey="lbtnModifyResource1"></asp:LinkButton><asp:LinkButton
                                                        ID="lbtnDelete" CommandName="Delete"
                                                        CommandArgument='<%#: Bind("ALLOWANCE_GUID") %>' runat="server" Text="刪除"
                                                        CausesValidation="False" meta:resourcekey="lbtnDeleteResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:BoundField
                                            DataField="NAME" HeaderText="津貼名稱" meta:resourcekey="BoundFieldResource2">
                                            <HeaderStyle
                                                Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="公司津貼金額"
                                            DataField="COMPANY_AMOUNT" DataFormatString="{0:#,0}"
                                            meta:resourcekey="BoundFieldResource3">


                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField
                                            HeaderText="福委津貼金額" DataField="COMMITTEE_AMOUNT" DataFormatString="{0:#,0}"
                                            meta:resourcekey="BoundFieldResource4">


                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField
                                            HeaderText="小計" DataField="SUB_TOTAL_AMOUNT" DataFormatString="{0:#,0}"
                                            meta:resourcekey="BoundFieldResource5">




                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField
                                            HeaderText="申請數量" DataField="APPLY_COUNT"
                                            meta:resourcekey="BoundFieldResource6">


                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField
                                            HeaderText="額外補助金額" DataField="ADDITIONAL_AMOUNT" DataFormatString="{0:#,0}"
                                            meta:resourcekey="BoundFieldResource7">


                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField
                                            HeaderText="總計" DataField="TOTAL_AMOUNT" DataFormatString="{0:#,0}"
                                            meta:resourcekey="BoundFieldResource8">


                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField
                                            HeaderText="發生日" DataField="ACTUAL_DATE" meta:resourcekey="BoundFieldResource9">

                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField
                                            HeaderText="注意事項" DataField="ALLOEANCE_REMARK"
                                            meta:resourcekey="BoundFieldResource10">

                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                                <asp:CustomValidator ID="cvActualDate" runat="server"
                                    ErrorMessage="明細項目{0}的發生日已超過可申請範圍" Display="Dynamic"
                                    ClientValidationFunction="CheckDetailActualDate"
                                    meta:resourcekey="cvActualDateResource1"></asp:CustomValidator>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="white-space: nowrap;">
                    <asp:Label ID="Label2" runat="server" Text="申請津貼總金額" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <asp:Label ID="lblGridTotalAmount" runat="server" Text="0" meta:resourcekey="lblGridTotalAmountResource1"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="公式：Sum(明細資料：總計)" ForeColor="Gray" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:TextBox ID="txtFieldValue" runat="server" Style="display: none" meta:resourcekey="txtFieldValueResource1"></asp:TextBox>
        <asp:Label ID="lblTotalCompanyAmount" runat="server" Text="0" Style="display: none" meta:resourcekey="lblTotalCompanyAmountResource1"></asp:Label>
        <asp:Label ID="lblTotalCommitteeAmount" runat="server" Text="0" Style="display: none" meta:resourcekey="lblTotalCommitteeAmountResource1"></asp:Label>
        <asp:HiddenField ID="hfDDlDefault" runat="server" />

    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblNameTitle" runat="server" Text="津貼名稱" Visible="false"></asp:Label>
<asp:Label ID="lblConyAmountTitle" runat="server" Text="公司津貼金額" Visible="false"></asp:Label>
<asp:Label ID="lblCommitteeAmountTitle" runat="server" Text="福委津貼金額" Visible="false"></asp:Label>
<asp:Label ID="lblSubTotalTitle" runat="server" Text="小計" Visible="false"></asp:Label>
<asp:Label ID="lblApplyCountTitle" runat="server" Text="申請數量" Visible="false"></asp:Label>
<asp:Label ID="lblAddAmouontTitle" runat="server" Text="額外補助金額" Visible="false"></asp:Label>
<asp:Label ID="lblTotalTitle" runat="server" Text="總計" Visible="false"></asp:Label>
<asp:Label ID="lblActualDateTitle" runat="server" Text="發生日" Visible="false"></asp:Label>
<asp:Label ID="lblRemarkTitle" runat="server" Text="注意事項" Visible="false"></asp:Label>
<asp:Label ID="lblTotalAmountTitle" runat="server" Text="申請津貼總金額" Visible="false"></asp:Label>
<asp:Label ID="lblClassType" runat="server" Text="修改津貼種類後，所有明細內容皆會清空，是否確定修改?" Visible="False" meta:resourcekey="lblClassTypeResource1"></asp:Label>
<asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:HiddenField ID="hfApplicantGuid" runat="server" />
<asp:HiddenField ID="hfApplyDateTimeOffset" runat="server" />
<div style="display: none">
    <asp:Button ID="button1" runat="server" OnClick="button1_Click" CausesValidation="false" />
</div>
