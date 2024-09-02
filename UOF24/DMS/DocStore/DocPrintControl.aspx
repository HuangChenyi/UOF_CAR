<%@ Page Title="新增分發紀錄" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocPrintControl" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocPrintControl.aspx.cs" %>


<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        //function CheckNumberText() {
        //    //48 ~ 57 -----> 0~9  
        //    //8 -----------> Backpace  
        //    //13-----------> Enter  
        //    alert(window.event.keyCode);
        //    if (window.event.keyCode == 45 || window.event.keyCode == 46) {     //0-->空字元
        //        window.event.keyCode = 0;
        //    }
        //}

        function RadToolBar1_ButtonClicking(sender, args) {
            var keyValue = args.get_item().get_value();
            if (keyValue == "New") {
                args.set_cancel(true);
               
                var printObj = "<%=wneQuantity.ClientID %>";
               
                $uof.dialog.open2("~/DMS/DocStore/DocPrintRetrieve.aspx", args.get_item(), "", 500, 400, function (returnValue) {
                    if (returnValue === null || typeof (returnValue) === 'undefined') {
                        return false;
                    }
                    return true;  
                }, { "detailGuid": '<%=Request.QueryString["detailId"]%>', "printObj": printObj });
            }
            else if (keyValue == "Delete") {
                if (!window.confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                    args.set_cancel(true);
                }
            }
    }
   
    function PrintFile() {

        var userSet = $('#<%=hidUserSet.ClientID %>').val();
            var reason = $('#<%=txtPrintReason.ClientID %>').val();
            var quantity = $('#<%=wneQuantity.ClientID %>').val();
            var wdcPrintDate = $find('<%=wdcPrintDate.ClientID %>');
            var status = $('#<%=hidStatus.ClientID %>').val();
            var data = [userSet, '<%= Request.QueryString["docid"]%>', '<%= Request.QueryString["manualversion"]%>', reason, quantity, wdcPrintDate.get_selectedDate()];

            if ($uof.pageMethod.sync("InsertPrintControl", data) == "true") {
                var docMode = $('#<%=hidDocMode.ClientID %>').val();
                    if (docMode == "CONT") {
                        $uof.dialog.open2("~/DMS/DocStore/DocPrintContentByDownLoad.aspx", this, "", 1024, 768, OpenDownloadResult, { "docid": '<%= Request.QueryString["docid"]%>', "docversion": '<%= Request.QueryString["manualversion"]%>' });
                        return false;
                        //top.close();
                    }
                    else {
                        var AppPath = $('#<%=hidAppPath.ClientID %>').val();
                        $uof.dialog.open2("~/DMS/DocStore/DocDownLoad.aspx", this, "", 700, 550, function (returnValue) {
                            $uof.dialog.close();
                            return true;
                        }, { "docid": '<%= Request.QueryString["docid"]%>', "status": status, "folderid": '<%= Request.QueryString["folderid"]%>', "ver": '<%= Request.QueryString["manualversion"]%>' });
                        return false;
                        //top.close();
                    }
                }

                return false;
    }
            function OpenDownloadResult(returnValue) {
                $uof.dialog.close();
                return true;
            }
            function CustodiansColumnError(source, args) {
                var userSet = $('#<%=hidUserSet.ClientID %>').val();
                if (userSet == "[]") {
                    args.IsValid = false;
                }
                else {
                    args.IsValid = true;
                }
            }

            function QuantityColumnError(source, args) {
                var Quantity = $('#<%=wneQuantity.ClientID %>').val();
                if (Quantity == "0" || Quantity == "") {
                    args.IsValid = false;
                }
                else {
                    args.IsValid = true;
                }
            }
    </script>
    <table class="PopTable" style="width: 100%; border: 1px;">
        <colgroup class="PopTableLeftTD" style="border: 0px;"></colgroup>
        <colgroup class="PopTableRightTD" style="border: 0px;"></colgroup>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="lblDate" runat="server" Text="分發時間"
                    meta:resourcekey="lblDateResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDateTimePicker ID="wdcPrintDate" runat="server" meta:resourcekey="wdcPrintDateResource1">
                </telerik:RadDateTimePicker>
                <asp:Label ID="lblPrintDate" runat="server" meta:resourcekey="lblPrintDateResource2"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvNeedDate" runat="server"
                    ErrorMessage="請輸入分發時間" ControlToValidate="wdcPrintDate"
                    meta:resourcekey="rfvNeedDateResource1" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="lblPrintReason" runat="server" Text="理由"
                    meta:resourcekey="lblPrintReasonResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPrintReason" runat="server" MaxLength="50" Width="100%"
                    meta:resourcekey="txtPrintReasonResource1"></asp:TextBox>
                <asp:Label ID="lblReason" runat="server" Visible="False" meta:resourcekey="lblReasonResource1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="請輸入理由" ControlToValidate="txtPrintReason"
                    meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label5" runat="server" Text="分發版本"
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblPrintVersion" runat="server"
                    meta:resourcekey="lblPrintVersionResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"
                    meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="lblCustodians" runat="server" Text="分發對象"
                    meta:resourcekey="lblCustodiansResource1"></asp:Label>
            </td>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td>
                            <div style="overflow: auto; width: 100%;">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="true" />
                                        <asp:HiddenField ID="hidUserSet" runat="server" />
                                        <asp:Label ID="lblPrintUser" runat="server" meta:resourcekey="lblPrintUserResource1"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>
                        </td>
                        <td style="padding: 0px; margin: 0px;">
                            <asp:CustomValidator ID="cvCustodians" Display="Dynamic" runat="server"
                                ClientValidationFunction="CustodiansColumnError" ErrorMessage="請選擇分發對象"
                                meta:resourcekey="cvCustodiansResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label7" runat="server" CssClass="SizeMemo" Text="*預設為文件保管者" meta:resourcekey="Label7Resource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"
                    meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="lblQuantity" runat="server" Text="份數"
                    meta:resourcekey="lblQuantityResource1"></asp:Label>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <telerik:RadNumericTextBox ID="wneQuantity" Width="50px" runat="server" MaxLength="2" MinValue="1" MaxValue="99" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="wneQuantityResource2">
                            <NegativeStyle Resize="None" />
                            <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </telerik:RadNumericTextBox>
                        <asp:CustomValidator ID="cvQuantity" runat="server"
                            ClientValidationFunction="QuantityColumnError" ErrorMessage="不可為0或空值"
                            Display="Dynamic" meta:resourcekey="cvQuantityResource1"></asp:CustomValidator>
                        <asp:Label ID="lblCount" runat="server" Visible="False" meta:resourcekey="lblCountResource1"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr id="stateTr" runat="server">
            <td style="white-space: nowrap">
                <asp:Label ID="Label6" runat="server" Text="狀態" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlState" runat="server" meta:resourcekey="ddlStateResource1">
                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">已分發</asp:ListItem>
                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource3">已回收</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="lblStatus" runat="server" Visible="False" meta:resourcekey="lblStatusResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" SingleClick="None" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="新增回收紀錄" Value="New"
                ClickedImageUrl="~/Common/Images/Icon/icon_m188.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m188.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m188.gif" ImageUrl="~/Common/Images/Icon/icon_m188.gif" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatPanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="detailGrid" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" AllowSorting="True" 
                DefaultSortDirection="Descending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15"   Width="100%" DataKeyNames="RECALL_GUID" AllowPaging="True" DefaultSortColumnName="RECALL_TIME" OnPageIndexChanging="detailGrid_PageIndexChanging" OnRowDataBound="detailGrid_RowDataBound" OnSorting="detailGrid_Sorting" meta:resourcekey="detailGridResource1" OnBeforeExport="detailGrid_BeforeExport">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="False" DataSourceType="ObjectDataSource"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="回收時間" SortExpression="RECALL_TIME" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnRecallTime" runat="server" Text="" OnClick="lbtnRecallTime_Click" meta:resourcekey="lbtnRecallTimeResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="20%" Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="回收者" SortExpression="CREATOR" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblRecallPerson" runat="server" Text=""></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="NUMBER_OF_RECALL" HeaderText="回收份數" SortExpression="NUMBER_OF_RECALL" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" Width="10%" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NUMBER_OF_VOID" HeaderText="遺失份數" SortExpression="NUMBER_OF_VOID" meta:resourcekey="BoundFieldResource4">
                    <HeaderStyle Width="10%" Wrap="False" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="REMARK" HeaderText="備註" meta:resourcekey="BoundFieldResource2" >
                        <HeaderStyle Width="30%"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="RECALL_GUID" Visible="False" meta:resourcekey="BoundFieldResource3" />
                </Columns>
            </Fast:Grid>
            <asp:HiddenField ID="hidPrintCount" runat="server" />
            <asp:HiddenField ID="hidRecallCount" runat="server" />
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <iframe id="dlFrame" style="width: 0; height: 0"></iframe>
    <asp:HiddenField ID="hidDocID" runat="server" />
    <asp:HiddenField ID="hidDocVersion" runat="server" />
    <asp:HiddenField ID="hidFileID" runat="server" />
    <asp:HiddenField ID="hidAppPath" runat="server" />
    <asp:HiddenField ID="hidStatus" runat="server" />
    <asp:HiddenField ID="hidDocMode" runat="server" />

    <asp:Label ID="lblTitle" runat="server" Text="新增回收紀錄" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblCountErr" runat="server" Text="總回收份數(含遺失份數)大於分發份數" Visible="False" meta:resourcekey="lblCountErrResource1"></asp:Label>
    <asp:Label ID="lblExport" runat="server" Text="匯出Excel" Visible="False" meta:resourcekey="lblExportResource1"></asp:Label>
</asp:Content>

