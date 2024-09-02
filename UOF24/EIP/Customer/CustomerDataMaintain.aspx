<%@ Page Title="客戶資料維護" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Customer_CustomerDataMaintain" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CustomerDataMaintain.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">

        function EnterEvent(e) {
            if (e.keyCode == 13) {
                var toolbar = $find("<%=RadToolBar1.ClientID %>");
                var btnQuery = toolbar.findItemByValue("Query");
                btnQuery.click();
            }
        }

        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();

            switch (key) {
                case "btnAdd":                       
                    var oTabType =  $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hiddenTabType.Value,true)%>');                       
                    var oInsert = "Insert";
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/CustomerEdit.aspx", args.get_item(), "<%=lblCustomerAdd.Text%>", 1024, 768, OpenDialogResult, { "Mode": oInsert, "tabType": oTabType });

                    break;

                case "btnDelete":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                    if (CheckedData == "") {
                        alert("<%= lblhiddenDelete.Text %>");
                        args.set_cancel(true);
                        return;
                    }
                    else {
                        if (!window.confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                            args.set_cancel(true);
                        }
                    }
                    break;

                case "btnSetting":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                    var choose = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenField1.Value,true)%>'); 
                    if (CheckedData == "") {
                        alert(choose);
                        args.set_cancel(true);
                        return;
                    }
                    else {
                        var getXML = $('#<%= HiddenXML.ClientID %>');
                        getXML.val("");
                        args.set_cancel(true);
                        $uof.dialog.open2("~/Common/ChoiceCenter/ChoiceCenter.aspx", args.get_item(), "", 935, 750, OpenDialogResult,
                            { "NeedPostBack": 1, "ShowMember": 0, "ShowSubDept": 1, "ShowEmployee": 1, "ExpandToUser": 0, "ChioceType": "All", "hf": "<%=HiddenXML.ClientID%>" });
                    }
                    break;

                case "btnImport":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/ImportCustomerData.aspx", args.get_item(), "", 500, 300, OpenDialogResult, { "Mode": "Import" });
                    break;

                case "btnExport":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/ExportCustomerData.aspx", args.get_item(), "", 500, 500, { "Mode": "Export" });
                    break;

                case "btnPublish":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                    var choose = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(HiddenPublish.Value,true)%>'); //信息
                    if (CheckedData == "") {
                        alert(choose);
                        args.set_cancel(true);
                        return;
                    }
                    else {
                        
                        if (!window.confirm($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hiddenConfirmPublish.Value,true)%>'))) {
                            args.set_cancel(true);
                        }
                    }
                    break;

                case "btnAddUse":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                    var choose = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hiddenUse.Value,true)%>'); 
                    if (CheckedData == "") {
                        alert(choose);
                        args.set_cancel(true);
                        return;
                    }
                    break;

                case "btnCancelUse":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                    var choose = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hiddenCancelUse.Value,true)%>');  //信息
                    if (CheckedData == "") {
                        alert(choose);
                        args.set_cancel(true);
                        return;
                    }
                    break;
            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined" || returnValue == null) {
                return false;
            }
            else {
                return true;
            }
                
        }

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelTB" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBar1ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="新增客戶" ToolTip="新增客戶" Value="btnAdd"
                CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                meta:resourcekey="RadToolBarAddResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="刪除客戶" ToolTip="刪除客戶" Value="btnDelete"
                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                meta:resourcekey="RadToolBarDeleteResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="匯入客戶" ToolTip="匯入客戶" Value="btnImport"
                CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                meta:resourcekey="RadToolBarImportResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="匯出客戶" ToolTip="匯出客戶" Value="btnExport"
                CheckedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                ImageUrl="~/Common/Images/Icon/icon_m144.gif"
                meta:resourcekey="RadToolBarExportResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="資料歸屬" ToolTip="資料歸屬" Value="btnSetting"
                CheckedImageUrl="~/Common/Images/Icon/icon_m29.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m29.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m29.gif"
                ImageUrl="~/Common/Images/Icon/icon_m29.gif"
                meta:resourcekey="RadToolBarSettingResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource5"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="發佈客戶" ToolTip="發佈客戶" Value="btnPublish"
                CheckedImageUrl="~/Common/Images/Icon/icon_m122.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m122.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m122.gif"
                ImageUrl="~/Common/Images/Icon/icon_m122.gif"
                meta:resourcekey="RadToolBarPublishResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="加入常用客戶" ToolTip="加入常用客戶" Value="btnAddUse"
                CheckedImageUrl="~/Common/Images/Icon/icon_m24.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m24.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m24.png"
                ImageUrl="~/Common/Images/Icon/icon_m24.png"
                meta:resourcekey="RadToolBarAddUseResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource7"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="取消常用客戶" ToolTip="取消常用客戶" Value="btnCancelUse"
                CheckedImageUrl="~/Common/Images/Icon/icon_m107.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m107.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m107.gif"
                ImageUrl="~/Common/Images/Icon/icon_m107.gif"
                meta:resourcekey="RadToolBarCancelUseResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" Value="spCancelUse" runat="server"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
               CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
               DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" 
               HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
               ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                meta:resourcekey="QueryRadToolBarButtonResources">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource09"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelTree" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTabStrip ID="rts1" MultiPageID="rmp1" runat="server" OnTabClick="rts1_TabClick" Width="100%"  SelectedIndex="1" meta:resourcekey="rts1Resource1">
                <Tabs>
                    <telerik:RadTab runat="server" Text="個人常用客戶" Value="tabUse" PageViewID="rpvTabUse" meta:resourcekey="RadTabResource1">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="類別" Value="tabClass" PageViewID="rpvTabClass" meta:resourcekey="RadTabResource2" Selected="True">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="行業別" Value="tabIndustry" PageViewID="rpvTabIndustry" meta:resourcekey="RadTabResource3">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="地區別" Value="tabArea" PageViewID="rpvTabArea" meta:resourcekey="RadTabResource4">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="rmp1" runat="server" SelectedIndex="1"  meta:resourcekey="rmp1Resource1" Style="text-align: left;">
                <telerik:RadPageView runat="server" ID="rpvTabUse" meta:resourcekey="rpvTabUseResource1">
                    <telerik:RadTreeView ID="rdCommonUsetree" EnableNodeTextHtmlEncoding="true" runat="server" OnNodeClick="rdCommonUsetree_NodeClick" meta:resourcekey="rdCommonUsetreeResource1"></telerik:RadTreeView>

                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="rpvTabClass" meta:resourcekey="rpvTabClassResource1" Style="text-align: left;" Selected="True">
                    <asp:Label ID="Label12" runat="server" Text="資料狀態:" meta:resourcekey="Label12Resource1"></asp:Label>


                    <asp:DropDownList ID="ddlDataType" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlDataType_SelectedIndexChanged" Width="100px" meta:resourcekey="ddlDataTypeResource1">
                        <asp:ListItem meta:resourcekey="ListItemResource1" Value="ALL" Text="全部"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource2" Value="Y" Text="已發佈"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource3" Value="N" Text="未發佈"></asp:ListItem>
                    </asp:DropDownList>

                    <telerik:RadTreeView runat="server" ID="rdClasstree"  EnableNodeTextHtmlEncoding="true" OnNodeClick="rdClasstree_NodeClick" meta:resourcekey="rdClasstreeResource1"></telerik:RadTreeView>

                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="rpvTabIndustry" meta:resourcekey="rpvTabIndustryResource1" Style="text-align: left;">
                    <asp:Label ID="Label13" runat="server" Text="資料狀態:" meta:resourcekey="Label13Resource1"></asp:Label>


                    <asp:DropDownList ID="ddlTypeIndustry" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlTypeIndustry_SelectedIndexChanged" Width="100px" meta:resourcekey="ddlTypeIndustryResource1">
                        <asp:ListItem meta:resourcekey="ListItemResource4" Value="ALL" Text="全部"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource5" Value="Y" Text="已發佈"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource6" Value="N" Text="未發佈"></asp:ListItem>
                    </asp:DropDownList>

                    <telerik:RadTreeView runat="server" ID="industrytree" EnableNodeTextHtmlEncoding="true" OnNodeClick="industrytree_NodeClick" meta:resourcekey="industrytreeResource1"></telerik:RadTreeView>

                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="rpvTabArea" meta:resourcekey="rpvTabAreaResource1">

                    <asp:Label ID="Label14" runat="server" Text="資料狀態:" meta:resourcekey="Label14Resource1"></asp:Label>


                    <asp:DropDownList ID="ddlTypeArea" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlTypeArea_SelectedIndexChanged" Width="100px" meta:resourcekey="ddlTypeAreaResource1">
                        <asp:ListItem meta:resourcekey="ListItemResource7" Value="ALL" Text="全部"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource8" Value="Y" Text="已發佈"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource9" Value="N" Text="未發佈"></asp:ListItem>
                    </asp:DropDownList>

                    <telerik:RadTreeView runat="server" ID="areatree" OnNodeClick="areatree_NodeClick" EnableNodeTextHtmlEncoding="true" meta:resourcekey="areatreeResource1"></telerik:RadTreeView>

                </telerik:RadPageView>
            </telerik:RadMultiPage>
            <asp:HiddenField ID="hiddenTabType" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
        <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table class="PopTable" cellspacing="0" style="width: 100%">
                    <tr>
                        <td  align="left" class="PopTableLeftTD" style="white-space: nowrap;width:10%;">
                            <asp:Label ID="Label2" runat="server" Text="特殊查詢:" meta:resourcekey="Label2Resource1"></asp:Label></td>
                        <td align="left" class="PopTableRightTD">
                            <asp:DropDownList ID="ddlQuery" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlQuery_SelectedIndexChanged" Width="180px" meta:resourcekey="ddlQueryResource1">
                                <asp:ListItem Value="WeekCusID" meta:resourcekey="ListItemResource10" Text="一週內發佈的客戶"></asp:ListItem>
                                <asp:ListItem Value="UnSetting" meta:resourcekey="ListItemResource11" Text="未設定資料歸屬的客戶"></asp:ListItem>
                                <asp:ListItem Value="UnContact" meta:resourcekey="ListItemResource12" Text="未設定聯絡人的客戶"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="word-wrap: break-word; width:10%">
                            <asp:Label ID="Label15" runat="server" Text="關鍵字" meta:resourcekey="lbl5Resource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtQuery" runat="server" Width="150px" onkeypress="return EnterEvent(event)" meta:resourcekey="txtQueryResource1"/>
                            <asp:label ID="lblQuerymsg" runat="server" Text="*可依客戶代號、名稱、簡稱、統一編號、聯絡人姓名及備註欄內容查詢" ForeColor="Blue" meta:resourcekey="lblQuerymsgResource1" />
                        </td>
                    </tr>
                </table>
                <Fast:Grid ID="grd" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyNames="CUSTOMER_ID,CREATE_USER" DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="30" Width="100%" AllowPaging="True" OnRowDataBound="grd_RowDataBound"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="grdResource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                    <EnhancePagerSettings
                        ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:TemplateField HeaderText="客戶代號" SortExpression="CU.CUSTOMER_ID" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%#: Eval("CUSTOMER_ID") %>' ID="lbtnCustomerID"
                                    OnClick="lbtnCustomerID_Click" meta:resourcekey="lbtnCustomerIDResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="CUSTOMER_ABBREVIATION" HeaderText="客戶簡稱" SortExpression="CU.CUSTOMER_ABBREVIATION"
                            meta:resourcekey="BoundFieldResource1">
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="公司電話" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlTEL1" runat="server" Text='<%#: Eval("TEL1") %>' Target="CalltoFrame" meta:resourcekey="hlTEL1Resource1"></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="WARRANTY_DATE" HeaderText="保固日期" DataFormatString="{0:yyyy/MM/dd}"
                             meta:resourcekey="BoundFieldResource6">
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MODIFY_TIME" HeaderText="維護日期" DataFormatString="{0:d}"
                            meta:resourcekey="BoundFieldResource3">
                            <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="資料歸屬" meta:resourcekey="BoundFieldResource4">
                            <ItemTemplate>
                                <asp:Label ID="lblRmID" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="狀態" SortExpression="CONFIRM_PUBLISH" meta:resourcekey="BoundFieldResource5">
                            <ItemTemplate>
                                <asp:Label ID="lblConfirmPublish" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="聯絡人" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text="清單" ID="lbtnContactID" __designer:wfdid="w69"
                                    meta:resourcekey="lbtnContactIDResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
            </ContentTemplate>
        </asp:UpdatePanel>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCustDataSet_Count"
        SelectMethod="GetCustDataSet" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
        TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="StructClassID" Type="Object" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
            <asp:Parameter Name="DataType" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCustDataSet_Count"
        SelectMethod="GetCustDataSet" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
        TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="dateStart" Type="DateTime" />
            <asp:Parameter Name="dateEnd" Type="DateTime" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGuid" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCustDataSetByRMID_Count"
        SelectMethod="GetCustDataSetByRMID" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
        TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCustDataSet_Count"
        SelectMethod="GetCustDataSet" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
        TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCustDataSetByIndustryID_Count"
        SelectMethod="GetCustDataSetByIndustryID" SortParameterName="strSortExpression"
        StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="StructIndustryID" Type="Object" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
            <asp:Parameter Name="DataType" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="hiddenDelete" runat="server" Value="沒有挑選要刪除的項目" meta:resourcekey="hiddenDeleteResource1" />
    <asp:HiddenField ID="HiddenField1" runat="server" Value="沒有選擇需要進行批量設定資料歸屬的客戶" meta:resourcekey="HiddenField1Resource1" />
    <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCustDataSetByContactID_Count"
        SelectMethod="GetCustDataSetByContactID" SortParameterName="strSortExpression"
        StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
            <asp:Parameter Name="DataType" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCustDataSetByListAreaID_Count"
        SelectMethod="GetCustDataSetByListAreaID" SortParameterName="strSortExpression"
        StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="StructAreaID" Type="Object" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
            <asp:Parameter Name="DataType" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCustDataSetByStrQuery_Count"
        SelectMethod="GetCustDataSetByStrQuery" SortParameterName="strSortExpression"
        StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="strQuery" Type="String" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="hiddenUse" runat="server" Value="沒有選擇要加入常用客戶的資料" meta:resourcekey="hiddenUseResource1" />
    <asp:HiddenField ID="HiddenPublish" runat="server" Value="沒有挑選要發佈的項目" meta:resourcekey="HiddenPublishResource1" />
    <asp:HiddenField ID="hiddenCancelUse" runat="server" Value="沒有選擇要取消常用客戶的資料" meta:resourcekey="hiddenCancelUseResource1" />

    <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCommonUseData_Count"
        SelectMethod="GetCommonUseData" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
        TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="ClassID" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="hiddenConfirmPublish" runat="server" Value="是否確定批次發佈客戶？" meta:resourcekey="hiddenConfirmPublishResource1" />
    <asp:Label ID="lblContactEdit" runat="server" Text="聯絡人資料維護" Visible="False" meta:resourcekey="lblContactEditResource1"></asp:Label>
    <asp:Label ID="Label8" runat="server" Text="已發佈" Visible="False" meta:resourcekey="Label8Resource1"></asp:Label>
    <asp:Label ID="Label7" runat="server" Text="未發佈" Visible="False" meta:resourcekey="Label7Resource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="客戶資料維護" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblEdit" runat="server" Text="修改客戶資料" Visible="False" meta:resourcekey="lblEditResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="一周內發佈的客戶" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:Label ID="Label5" runat="server" Text="類別" Visible="False" meta:resourcekey="Label5Resource1"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="未設定資料歸屬客戶" Visible="False" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:Label ID="lblAdd" runat="server" Text="新增客戶資料" Visible="False" meta:resourcekey="lblAddResource1"></asp:Label>
    <asp:Label ID="Label6" runat="server" Text="未發佈的客戶" Visible="False" meta:resourcekey="Label6Resource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="發佈客戶資料" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblBrowseCust" runat="server" Text="瀏覽客戶資料" Visible="False" meta:resourcekey="lblBrowseCustResource1"></asp:Label>
    <asp:Label ID="lblBrowseContact" runat="server" Text="聯絡人清單" Visible="False" meta:resourcekey="lblBrowseContactResource1"></asp:Label>
    <asp:Label ID="Label11" runat="server" Text="未設定聯絡人的客戶" Visible="False" meta:resourcekey="Label11Resource1"></asp:Label>
    <input id="HiddenXML" type="hidden" runat="Server" />
    <asp:Label ID="Label9" runat="server" Text="行業別" Visible="False" meta:resourcekey="Label9Resource1"></asp:Label>
    <asp:Label ID="Label10" runat="server" Text="無設定行業別客戶" Visible="False" meta:resourcekey="Label10Resource1"></asp:Label>
    <asp:Label ID="lblArea" runat="server" Text="地區別" Visible="False" meta:resourcekey="lblAreaResource1"></asp:Label>
    <asp:Label ID="lblUnArea" runat="server" Text="無設定地區別客戶" Visible="False" meta:resourcekey="lblUnAreaResource1"></asp:Label>
    <asp:Label ID="lblCustomerAdd" runat="server" Text="新增客戶資料" Visible="False" meta:resourcekey="lblCustomerAddResource1"></asp:Label>
    <asp:Label ID="lblBatchPublish" runat="server" Text="批量發佈客戶資料失败" Visible="False" meta:resourcekey="lblBatchPublishResource1"></asp:Label>
    <asp:Label ID="lblDeleteFailure" runat="server" Text="删除资料失败" Visible="False" meta:resourcekey="lblDeleteFailureResource1"></asp:Label>
    <asp:Label ID="lblBatchSetting" runat="server" Text="批量設置资料歸屬失败" Visible="False" meta:resourcekey="lblBatchSettingResource1"></asp:Label>
    <asp:Label ID="lblCommmonUseFailure" runat="server" Text="加入常用客戶資料失败" Visible="False" meta:resourcekey="lblCommmonUseFailureResource1"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="未設定" Visible="False" meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:Label ID="Label16" runat="server" Text="已設定" Visible="False" meta:resourcekey="Label16Resource1"></asp:Label>
    <asp:Label ID="lblPublishDisabled" runat="server" Text="資料歸屬未設定的客戶資料, 不能發佈" Visible="False" meta:resourcekey="lblPublishDisabledResource1"></asp:Label>
    <asp:Label ID="lblDeleteAuthority" runat="server" Text="您沒有刪除客戶資料的權限" Visible="False" meta:resourcekey="lblDeleteAuthorityResource1"></asp:Label>
    <asp:Label ID="lblModifyAuthority" runat="server" Text="您沒有修改客戶資料的權限" Visible="False" meta:resourcekey="lblModifyAuthorityResource1"></asp:Label>
    <asp:Label ID="lblHasPublishDisabled" runat="server" Text="已發佈的客戶資料將不會被發佈" Visible="False" meta:resourcekey="lblHasPublishDisabledResource1"></asp:Label>
    <asp:Label ID="lblCommonUseDisabled" runat="server" Text="未發佈的客戶資料不能被加入常用客戶" Visible="False" meta:resourcekey="lblCommonUseDisabledResource1"></asp:Label>
    <asp:Label ID="lblCancelFailure" runat="server" Text="取消常用客戶資料失败" Visible="False" meta:resourcekey="lblCancelFailureResource1"></asp:Label>
    <asp:Label ID="lblDDLItem" runat="server" Text="請選擇查詢條件" Visible="False" meta:resourcekey="lblDDLItemResource1"></asp:Label>
    <asp:Label ID="lblhiddenDelete" runat="server" Text="沒有挑選要刪除的項目" Visible="False" meta:resourcekey="lblhiddenDeleteResource1"></asp:Label>
    <iframe id="CalltoFrame" name="CalltoFrame" height="0" width="0"></iframe>
</asp:Content>
