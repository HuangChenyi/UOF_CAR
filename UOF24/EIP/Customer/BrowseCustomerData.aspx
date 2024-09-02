<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_BrowseCustomerData" Title="瀏覽客戶資料" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="BrowseCustomerData.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="customerJS" type="text/javascript">
        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "btnAdd":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/ContactEdit.aspx", args.get_item(), "<%= lblAddContact.Text %>", 725, 650, OpenDialogResult, { "Mode": "Insert", "CustID": $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["CUSTOMER_ID"].ToString(),true)%>')});
                break;
                case "btnCreate":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                    var CustID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["CUSTOMER_ID"].ToString(),true)%>');
                    if (CheckedData == "") {
                        alert("<%= lblhiddenCreate.Text %>");
                    args.set_cancel(true);
                    return;
                }
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Customer/CreateExternalAccountByBat.aspx", args.get_item(), "", 700, 520, OpenCreateResult, { "CONTACT_ID": CheckedData, "CustID": CustID });
                break;
        }
    }
    function OpenDialogResult(returnValue) {
        if (typeof (returnValue) === "undefined" || returnValue === null) {
            return false;
        }
        else {
            return true;
        }
    }

    function OpenCreateResult(returnValue) {
        if (typeof (returnValue) === "undefined" || returnValue === "AlreadyCreate" || returnValue === null) {
            if (returnValue == "AlreadyCreate") {
                alert("<%= lblAlreadyCreate.Text %>");
            }
            return false;
        }
        else {
            return true;
        }
    }

    function memoToolBarButtonClicking(sender, args) {

        var key = args.get_item().get_value();
        switch (key) {
            case "btnEdit":
                args.set_cancel(true);              
                var CustID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["CUSTOMER_ID"].ToString(),true)%>');  
                $uof.dialog.open2("~/EIP/Customer/CustomerMemoEditor.aspx", args.get_item(), "<%=lblOpenEdit.Text %>", 0, 0, EditDialogResult, { "Mode": "Edit", "CustID": CustID });
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
    </script>
    <script type="text/jscript">
        function CopyToClipBoard() {
            clipboardData.setData("Text", event.srcElement.innerText);
        }
    </script>
    <telerik:RadTabStrip ID="radTab" runat="server" MultiPageID="rdMultiPage" OnTabClick="RadTabStrip1_TabClick" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="客戶資料" PageViewID="rdpageView1" Selected="true">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="聯絡人資料" PageViewID="rdpageView2">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="客戶備忘錄" PageViewID="rdPageView3">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="rdMultiPage" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="rdpageView1" runat="server" Selected="true">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table class="PopTable" cellspacing="1" style="width: 100%">
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label19" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label19Resource1"></asp:Label><asp:Label ID="Label1" runat="server" Text="客戶代號:" meta:resourcekey="Label1Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblCusID" runat="server" meta:resourcekey="lblCusIDResource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label20" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label20Resource1"></asp:Label><asp:Label ID="Label3" runat="server" Text="客戶簡稱:" meta:resourcekey="Label3Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblAbbreviation" runat="server"
                                    meta:resourcekey="lblAbbreviationResource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label4" runat="server" Text="統一編號:" meta:resourcekey="Label4Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblUnifiedID" runat="server"
                                    meta:resourcekey="lblUnifiedIDResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label22" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label22Resource1"></asp:Label><asp:Label ID="Label2" runat="server" Text="客戶名稱:" meta:resourcekey="Label2Resource1"></asp:Label></td>
                            <td colspan="3" class="PopTableRightTD">
                                <asp:Label ID="lblCusName" runat="server"
                                    meta:resourcekey="lblCusNameResource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label21" runat="server" Text="資料狀態:" meta:resourcekey="Label21Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblPublic" runat="server" meta:resourcekey="lblPublicResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label5" runat="server" Text="客戶英文名稱:" meta:resourcekey="Label5Resource1" Width="110px"></asp:Label></td>
                            <td colspan="3" class="PopTableRightTD">
                                <asp:Label ID="lblEngName" runat="server"
                                    meta:resourcekey="lblEngNameResource1"></asp:Label></td>
                            <td>
                                <asp:Label ID="Label27" runat="server" Text="保固日期" meta:resourceKey="Label27Resource1"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblWarrantyDate" runat="server"></asp:Label></td>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="PopTableLeftTD">
                                <asp:Label ID="Label23" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label23Resource1"></asp:Label><asp:Label ID="Label6" runat="server" Text="客戶類別:" meta:resourcekey="Label6Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <telerik:RadTreeView runat="server" ID="rdtreeClass"  EnableNodeTextHtmlEncoding="true" Height="150px" Width="150px"></telerik:RadTreeView>
                                </asp:Panel>

                            </td>
                            <td valign="top" class="PopTableLeftTD">
                                <asp:Label ID="Label26" runat="server" Text="地區別:" meta:resourcekey="Label26Resource1"></asp:Label></td>
                            <td valign="top" class="PopTableRightTD">
                                <asp:Panel ID="Panel2" runat="server" meta:resourcekey="Panel2Resource1">
                                    <telerik:RadTreeView runat="server"  ID="rdtreeArea" EnableNodeTextHtmlEncoding="true" Height="150px" Width="150px"></telerik:RadTreeView>
                                </asp:Panel>
                            </td>
                            <td valign="top" class="PopTableLeftTD">
                                <asp:Label ID="Label7" runat="server" Text="行業別:" meta:resourcekey="Label7Resource1"></asp:Label>
                            </td>
                            <td valign="top" class="PopTableRightTD">
                                <asp:DropDownList ID="ddlIndustry" runat="server" Enabled="False" meta:resourcekey="ddlIndustryResource1">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label8" runat="server" Text="負責人:" meta:resourcekey="Label8Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblOwner" runat="server" meta:resourcekey="lblOwnerResource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label13" runat="server" Text="資本額:" meta:resourcekey="Label13Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblCapitalization" runat="server"
                                    meta:resourcekey="lblCapitalizationResource1"></asp:Label>
                                <asp:Label ID="Label25" runat="server" Text="千" meta:resourcekey="Label25Resource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label17" runat="server" Text="客戶等級:" meta:resourcekey="Label17Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:DropDownList ID="ddlGrade" runat="server" Enabled="False"
                                    meta:resourcekey="ddlGradeResource1">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label9" runat="server" Text="公司電話1:" meta:resourcekey="Label9Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblTel1" runat="server" meta:resourcekey="lblTel1Resource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label14" runat="server" Text="公司電話2:" meta:resourcekey="Label14Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblTel2" runat="server" meta:resourcekey="lblTel2Resource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label18" runat="server" Text="公司傳真:" meta:resourcekey="Label18Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblFax" runat="server" meta:resourcekey="lblFaxResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label10" runat="server" Text="郵遞區號:" meta:resourcekey="Label10Resource1"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblCompanyCode" runat="server"
                                    meta:resourcekey="lblCompanyCodeResource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label15" runat="server" Text="公司地址:" meta:resourcekey="Label15Resource1"></asp:Label></td>
                            <td colspan="3" style="width: 100%" class="PopTableRightTD">
                                <asp:Label ID="lblCompanyAddress" runat="server"
                                    meta:resourcekey="lblCompanyAddressResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label11" runat="server" Text="發票郵遞區號:" meta:resourcekey="Label11Resource1" Width="110px"></asp:Label></td>
                            <td class="PopTableRightTD">
                                <asp:Label ID="lblInvoiceCode" runat="server"
                                    meta:resourcekey="lblInvoiceCodeResource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label16" runat="server" Text="發票地址:" meta:resourcekey="Label16Resource1" Width="100px"></asp:Label></td>
                            <td colspan="3" class="PopTableRightTD">
                                <asp:Label ID="lblInvoiceAddress" runat="server"
                                    meta:resourcekey="lblInvoiceAddressResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label12" runat="server" Text="公司網址:" meta:resourcekey="Label12Resource1"></asp:Label></td>
                            <td colspan="5" class="PopTableRightTD">
                                <asp:Label ID="lblWebURL" runat="server" meta:resourcekey="lblWebURLResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label32" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label32Resource1"></asp:Label>
                                <asp:Label ID="Label24" runat="server" Text="資料歸屬:" meta:resourcekey="Label24Resource1"></asp:Label></td>
                            <td colspan="2" valign="top" class="PopTableRightTD">
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" TreeHeight="100px" />
                            </td>

                            <td class="PopTableLeftTD">
                                <asp:Label ID="Label28" runat="server" Text="備註:" meta:resourcekey="Label28Resource1"></asp:Label></td>
                            <td colspan="2" class="PopTableRightTD">
                                <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Height="120px"
                                    ReadOnly="True" Width="273px" meta:resourcekey="txtRemarkResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="lblOption1" runat="server" Text="其他1" meta:resourcekey="lblOption1Resource1"></asp:Label>:</td>
                            <td colspan="2" class="PopTableRightTD">
                                <asp:Label ID="lblOption1Value" runat="server"
                                    meta:resourcekey="lblOption1ValueResource1"></asp:Label>
                            </td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="lblOption2" runat="server" Text="其他2" meta:resourcekey="lblOption2Resource1"></asp:Label>:</td>
                            <td colspan="2" class="PopTableRightTD">
                                <asp:Label ID="lblOption2Value" runat="server"
                                    meta:resourcekey="lblOption2ValueResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="lblOption3" runat="server" Text="其他3" meta:resourcekey="lblOption3Resource1"></asp:Label>:</td>
                            <td colspan="2" class="PopTableRightTD">
                                <asp:Label ID="lblOption3Value" runat="server"
                                    meta:resourcekey="lblOption3ValueResource1"></asp:Label>
                            </td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="lblOption4" runat="server" Text="其他4" meta:resourcekey="lblOption4Resource1"></asp:Label>:</td>
                            <td colspan="2" class="PopTableRightTD">
                                <asp:Label ID="lblOption4Value" runat="server"
                                    meta:resourcekey="lblOption4ValueResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="lblOption5" runat="server" Text="其他5" meta:resourcekey="lblOption5Resource1"></asp:Label>:</td>
                            <td colspan="2" class="PopTableRightTD">
                                <asp:Label ID="lblOption5Value" runat="server"
                                    meta:resourcekey="lblOption5ValueResource1"></asp:Label></td>
                            <td class="PopTableLeftTD">
                                <asp:Label ID="lblOption6" runat="server" Text="其他6" meta:resourcekey="lblOption6Resource1"></asp:Label>:</td>
                            <td colspan="2" class="PopTableRightTD">
                                <asp:Label ID="lblOption6Value" runat="server"
                                    meta:resourcekey="lblOption6ValueResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lblShowMessage" runat="server" meta:resourcekey="lblShowMessageResource1"></asp:Label>
                    <asp:Label ID="lblCreateTime" runat="server" Text="建立日期:" Visible="False" meta:resourcekey="lblCreateTimeResource1"></asp:Label>
                    <asp:Label ID="lblCreater" runat="server" Text="建立人:" Visible="False" meta:resourcekey="lblCreaterResource1"></asp:Label>
                    <asp:Label ID="lblModifyTime" runat="server" Text="修改日期:" Visible="False" meta:resourcekey="lblModifyTimeResource1"></asp:Label>
                    <asp:Label ID="lblModifier" runat="server" Text="修改人:" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
                    <br />
                    <asp:Label ID="lblNote" runat="server" ForeColor="Red" Text="PS.點擊兩下,即可複製文字" meta:resourcekey="lblNoteResource1" Visible="false"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rdpageView2" runat="server">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBar1ButtonClicking" >
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Text="新增聯絡人" Value="btnAdd"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                            meta:resourcekey="RadToolBarAddResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="true" Value="sp"></telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" Text="建立外部會員帳號" Value="btnCreate"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                            meta:resourcekey="RadToolBarCreateResource1">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                                <Fast:Grid ID="grd" runat="server" DataKeyNames="CONTACT_ID" AllowSorting="True"
                                    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="True"
                                    EnhancePager="True" PageSize="15"
                                    AllowPaging="True" Width="100%"
                                    OnRowDataBound="grd_RowDataBound"
                                    DefaultSortDirection="Ascending">
                                    <EnhancePagerSettings
                                        ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="姓名" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text='<%#: Eval("CONTACT_NAME") %>' ID="lbtn" OnClick="lbtn_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="主要聯絡人" meta:resourceKey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIsMainContact" runat="server" Text='<%#: Eval("IS_MAIN_CONTACT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sex" HeaderText="性別" meta:resourcekey="BoundFieldResource1">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DEPARTMENT" HeaderText="單位" meta:resourcekey="BoundFieldResource2">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TITLE" HeaderText="職級" meta:resourcekey="BoundFieldResource3">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="電話" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlTEL" runat="server" Text='<%#: Eval("TEL") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="EXT_NUM" HeaderText="分機" meta:resourcekey="BoundFieldResource5">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="手機" meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlMobile" runat="server" Text='<%#: Eval("MOBILE_PHONE") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" meta:resourcekey="BoundFieldResource7">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EBACCOUNT" HeaderText="外部會員帳號" meta:resourcekey="BoundFieldResource8">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" MaximumRowsParameterName="intMaxRows"
                                    OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetContactDataSetByCustID_Count"
                                    SelectMethod="GetContactDataSetByCustID" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
                                    TypeName="Ede.Uof.EIP.Customer.UCO.CUSContactUCO" EnablePaging="True">
                                    <SelectParameters>
                                        <asp:Parameter Name="CustID" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="intStartIndex" Type="Int32" />
                                        <asp:Parameter Name="intMaxRows" Type="Int32" />
                                        <asp:Parameter Name="strSortExpression" Type="String" />
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
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <telerik:RadToolBar ID="memoToolBar" Width="100%" OnClientButtonClicking="memoToolBarButtonClicking" OnButtonClick="memoToolBar_ButtonClick" runat="server" meta:resourcekey="memoToolBarResource1">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" Text="編輯" Value="btnEdit"
                                            meta:resourceKey="memoToolBarEditResource1"
                                            CheckedImageUrl="~/Common/Images/Icon/icon_m57.gif"
                                            DisabledImageUrl="~/Common/Images/Icon/icon_m57.gif"
                                            HoveredImageUrl="~/Common/Images/Icon/icon_m57.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m57.gif">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True"></telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMemoContent" runat="server" Text="" meta:resourcekey="lblMemoContentResource1"></asp:Label>
                                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:Label ID="lblHasPublish" runat="server" Text="已發佈" Visible="False" meta:resourcekey="lblHasPublishResource1"></asp:Label>
    <asp:Label ID="lblUnPublish" runat="server" Text="未發佈" Visible="False" meta:resourcekey="lblUnPublishResource1"></asp:Label>
    <asp:Label ID="lblMale" runat="server" Text="男" Visible="False" meta:resourcekey="lblMaleResource1"></asp:Label>
    <asp:Label ID="lblFemale" runat="server" Text="女" Visible="False" meta:resourcekey="lblFemaleResource1"></asp:Label>
    <asp:Label ID="lblDDLItem" runat="server" Text="暫不分類" Visible="False" meta:resourcekey="lblDDLItemResource1"></asp:Label>
    <asp:Label ID="lblTab0" runat="server" Text="客戶資料" Visible="False" meta:resourcekey="lblTab0Resource1"></asp:Label>
    <asp:Label ID="lblTab1" runat="server" Text="聯絡人資料" Visible="False" meta:resourcekey="lblTab1Resource1"></asp:Label>
    <asp:Label ID="lblTab2" runat="server" Text="客戶備忘錄" Visible="False" meta:resourcekey="lblTab2Resource1"></asp:Label>
    <asp:Label ID="lblhiddenCreate" runat="server" Text="沒有挑選要建立的項目" Visible="False" meta:resourcekey="lblhiddenCreateResource1"></asp:Label>
    <asp:Label ID="lblAlreadyCreate" runat="server" Text="挑選的項目裡已有建立外部會員帳號,請選擇尚未建立帳號的項目" Visible="False" meta:resourcekey="lblAlreadyCreateResource1"></asp:Label>
    <asp:Label ID="lblAddContact" runat="server" Text="新增聯絡人" Visible="False" meta:resourcekey="lblAddContactResource1"></asp:Label>
    <asp:Label ID="lblContact" runat="server" Text="瀏覽聯絡人資料" Visible="False" meta:resourcekey="lblContactResource1"></asp:Label>
    <asp:Label ID="lblOpenEdit" runat="server" Text="編輯" Visible="False" meta:resourcekey="lblOpenEditResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="false" meta:resourcekey="lblYesResource1"></asp:Label>
</asp:Content>
