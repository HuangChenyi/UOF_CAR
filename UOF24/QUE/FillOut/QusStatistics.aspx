<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="QUE_FillOut_QusStatistics" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QusStatistics.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <style>
    .SearchBoxMargin {
        margin-top: 2px;
        margin-left: 1px;
    }
    .rbPrimary{
        padding-left:0px !important;
    }
    </style>
    <script type="text/javascript" id="igClientScript">
<!--
    function Export() {
        if (!confirm('<%=lblExportExcel.Text %>')) {
        $('#<%= hiddenFlag.ClientID %>').val("No");
            return false;
    }
    else {
            $('#<%= hiddenFlag.ClientID %>').val("Yes");
            
    }

        alert('<%= lblhidAtt.Text %>');
        return true;
    }

    function DirectExport() {
        return confirm('<%=lblExportExcel.Text %>');
    }



    function checkSelected(Button, oEvent) {
        var CheckedData = $uof.fastGrid.getChecked('<%= gridExcel.ClientID %>');
        var choose = '<%= lblSelectDelete.Text %>'; //信息
        if (CheckedData == "") {
            alert(choose);
            oEvent.cancel = true;

        }
        else {
            if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
	            oEvent.cancel = false;
	        }
	        else {
	            oEvent.cancel = true;
            }
	    }
    }

    Sys.Application.add_load(function () {
        var lblSearch = $("#<%=lblSearch.ClientID%>");
        var txtSearch = $("#<%=txtSearch.ClientID%>");

        txtSearch.attr("placeholder", lblSearch.text());
        txtSearch.keyup(function (e) {
        if ((e.which == 8 && txtSearch.val() == "") ||
            (e.which == 13 && txtSearch.val() != "") ||
            (e.which == 46 && txtSearch.val() == "")) {
                $('#<%= btnSearh.ClientID%>').click();
            }
        });
    });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Inline">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width:100%">
                        <asp:Label ID="lblSearch" runat="server" Style="display: none;" Text="問卷類別" meta:resourcekey="lblSearchResource1"></asp:Label>
                        <asp:TextBox ID="txtSearch" runat="server" Width="100%" CssClass="SearchBoxMargin"></asp:TextBox>
                    </td>
                    <td>
                        <telerik:RadButton ID="btnSearh" runat="server" OnClick="btnSearh_Click">
                            <Icon PrimaryIconUrl="~/Common/Images/Icon/icon_m39.png" PrimaryIconLeft="2px" />
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>
            <telerik:RadTreeView ID="RadTreeView1" runat="server"
                OnNodeClick="RadTreeView1_NodeClick" EnableNodeTextHtmlEncoding="True"
                meta:resourcekey="RadTreeView1Resource1">
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblNoAuth" runat="server" Text="沒有權限觀看" ForeColor="Red" Visible ="False" meta:resourcekey="lblNoAuthResource1"></asp:Label>
            <telerik:RadTabStrip ID="rtsQue" MultiPageID="rmpQue" runat="server"
                SelectedIndex="0" OnTabClick="rtsQue_TabClick"
                meta:resourcekey="rtsQueResource1">
                <Tabs>
                    <telerik:RadTab Value="statQue" Selected="True" runat="server"
                        meta:resourcekey="RadTabResource1" Owner="">
                    </telerik:RadTab>
                    <telerik:RadTab Value="downExcel" runat="server"
                        meta:resourcekey="RadTabResource2" Owner="">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="rmpQue" runat="server" SelectedIndex="0"
                meta:resourcekey="rmpQueResource1">
                <telerik:RadPageView ID="statQue" runat="server" BackColor="White"
                    meta:resourcekey="statQueResource1" Selected="True">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <table cellspacing="1" class="PopTable" >


                                                        <tr>
                                                            <td style="width: 100px; white-space: nowrap;">
                                                                <asp:Label ID="lblNameLeft" runat="server" Text="問卷名稱"
                                                                    meta:resourcekey="lblNameLeftResource1"></asp:Label>
                                                            </td>
                                                            <td style="width: 180px;">
                                                                <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                                                            </td>
                                                            <td style="width: 80px; white-space: nowrap;">
                                                                <asp:Label ID="lblStateLeft" runat="server" Text="狀態"
                                                                    meta:resourcekey="lblStateLeftResource1"></asp:Label>
                                                            </td>
                                                            <td style="width: 100px;">
                                                                <asp:DropDownList ID="ddlState" runat="server"
                                                                    meta:resourcekey="ddlStateResource1">
                                                                    <asp:ListItem Text="全部" Value="ALL" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                                    <asp:ListItem Text="製作中" Value="DS" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                                                    <asp:ListItem Text="調查中" Value="EM" Selected="True"
                                                                        meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                                    <asp:ListItem Text="結束" Value="CL" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                                                    <asp:ListItem Text="中止" Value="SP" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: left; padding: 0 0 0 0; width:80px" class="PopTableRightTD">

                                                                <div style="padding-left: 5px; padding-right: 5px">
                                                                    <telerik:RadButton ID="rbtnQuery" runat="server" Text="查詢"
                                                                        OnClick="rbtnQuery_Click" meta:resourcekey="rbtnQueryResource1">
                                                                    </telerik:RadButton>
                                                                </div>
                                                            </td>
                                                            <td style="width: 450px">
                                                                <asp:Label ID="lblExportMsg" ForeColor="Blue" runat="server"
                                                                    Text="如果(問卷題目*回收數)>10000，建議使用排程匯出EXCEL，以免於同畫面中久候。" meta:resourcekey="lblExportMsgResource1"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CustomValidator ID="cvMessage" runat="server"
                                                        meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
                                                    <Fast:Grid ID="gridQue" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                                        AutoGenerateColumns="False" DataKeyNames="DESIGN_MASTER_GUID"
                                                        DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                                                        PageSize="15" Width="100%" OnRowDataBound="gridQue_RowDataBound"
                                                        OnRowCommand="gridQue_RowCommand" DefaultSortDirection="Ascending"
                                                        EmptyDataText="沒有資料"
                                                        KeepSelectedRows="False" meta:resourcekey="gridQueResource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""
                                                          >
                                                        <HeaderStyle Font-Bold="False" Font-Italic="False" />
                                                        <EnhancePagerSettings
                                                            ShowHeaderPager="True" />
                                                        <ExportExcelSettings AllowExportToExcel="False" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="問卷名稱" SortExpression="DESIGN_NAME"
                                                                meta:resourcekey="TemplateFieldResource1">
                                                                <ItemTemplate >
                                                                    <asp:LinkButton ID="lbtnName" Style="word-wrap: break-word; width: 300px; overflow-x: hidden;"
                                                                        runat="server" Text='<%#: Eval("DESIGN_NAME") %>'
                                                                        meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="False" />
                                                                <ItemStyle Wrap="False" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="狀態" DataField="QUS_MASTER_STATUS"
                                                                SortExpression="QUS_MASTER_STATUS" meta:resourcekey="BoundFieldResource1">
                                                                <HeaderStyle Wrap="False" />
                                                                <ItemStyle Wrap="False" />
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="發送數" DataField="SEND_COUNT"
                                                                SortExpression="SEND_COUNT" meta:resourcekey="BoundFieldResource2">
                                                                <HeaderStyle Wrap="False" />
                                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="回收數" SortExpression="SUBMIT_COUNT"
                                                                meta:resourcekey="TemplateFieldResource2">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSubmitCount" runat="server"
                                                                        Text='<%#: Bind("SUBMIT_COUNT") %>' meta:resourcekey="lblSubmitCountResource1"></asp:Label>
                                                                    <asp:LinkButton ID="lbtnSubmitCount" runat="server"
                                                                        meta:resourcekey="lbtnSubmitCountResource1"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Wrap="False" />
                                                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="統計" meta:resourcekey="TemplateFieldResource3">
                                                                <ItemTemplate>
                                                                    <table style="width:400px">
                                                                        <tr>
                                                                            <td style="text-align:left">
                                                                                <asp:LinkButton ID="lbtnViewAns" runat="server" CommandName="ViewAns"
                                                                                    Text="回收結果" meta:resourcekey="lbtnViewAnsResource1"></asp:LinkButton>
                                                                            </td>
                                                                            <td style="width: 10px"></td>
                                                                            <td style="text-align:left">
                                                                                <asp:LinkButton ID="lbtnReport" runat="server" Text="統計圖表"
                                                                                    meta:resourcekey="lbtnReportResource1"></asp:LinkButton>
                                                                            </td>
                                                                            <td style="width: 10px"></td>
                                                                            <td style="text-align:left">
                                                                                <asp:LinkButton ID="lbtnSetUserset" runat="server" Text="設定觀看權限"
                                                                                    meta:resourcekey="lbtnSetUsersetResource1"></asp:LinkButton>
                                                                            </td>
                                                                            <td style="width: 10px"></td>


                                                                        </tr>
                                                                        <tr>


                                                                            <td style="text-align:left;">
                                                                                <asp:HyperLink ID="hlDirectExportExcel" runat="server" Target="ExportExcel"
                                                                                    Text="直接匯出" meta:resourcekey="hlDirectExportExcelResource1"></asp:HyperLink>&nbsp;&nbsp;
                                                                            </td>
                                                                            <td style="width: 10px"></td>
                                                                            <td style="text-align:left">
                                                                                <asp:LinkButton ID="lbtnExportExcel" runat="server" CommandName="ExportExcel" Text="排程匯出"
                                                                                     meta:resourcekey="lbtnExportExcelResource1"></asp:LinkButton>&nbsp;&nbsp;
                                                                            </td>
                                                                            <td style="width: 10px"></td>
                                                                            <td style="text-align:left">
                                                                                <asp:HyperLink ID="hlDirectExportExcelTime" runat="server" Target="ExportExcel"
                                                                                    Text="直接匯出(依時間)" meta:resourcekey="hlDirectExportExcelTimeResource1"></asp:HyperLink>&nbsp;&nbsp;
                                                                            </td>
                                                                            <td style="width: 10px"></td>
                                                                            <td style="text-align:left">
                                                                                <asp:LinkButton ID="lbtnExportExcelTime" runat="server" CommandName="ExportExcelTime" Text="排程匯出(依時間)"
                                                                                     meta:resourcekey="lbtnExportExcelTimeResource1"></asp:LinkButton>&nbsp;&nbsp;
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <ItemStyle Wrap="False" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </Fast:Grid>
                                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                                                        SelectCountMethod="QueryQusByStat_Count" SelectMethod="QueryQusByStat" SortParameterName="strSortExpression"
                                                        StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusUCO">
                                                        <SelectParameters>
                                                            <asp:Parameter Name="condition" />
                                                            <asp:Parameter Name="intStartIndex" />
                                                            <asp:Parameter Name="intMaxRows" />
                                                            <asp:Parameter Name="strSortExpression" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                            </tr>
                                        </table>
                            </td>
                        </tr>
                    </table>

                </telerik:RadPageView>
                <telerik:RadPageView ID="downExcel" runat="server"
                    meta:resourcekey="downExcelResource1">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <table cellspacing="1" class="PopTable" style="width: 100%">

                                    <tr>
                                        <td style="width: 10%; white-space: nowrap;">
                                            <asp:Label ID="lblDateBegin" runat="server" Text="匯出時間(起)"
                                                meta:resourcekey="lblDateBeginResource1"></asp:Label>
                                        </td>
                                        <td style="width: 12%">
                                            <telerik:RadDatePicker ID="rdpBeginDate" runat="server" meta:resourcekey="rdpBeginDateResource1" >
                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                </Calendar>
                                                <DateInput LabelWidth="64px"
                                                    Width="" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d">
                                                    <EmptyMessageStyle Resize="None" />
                                                    <ReadOnlyStyle Resize="None" />
                                                    <FocusedStyle Resize="None" />
                                                    <DisabledStyle Resize="None" />
                                                    <InvalidStyle Resize="None" />
                                                    <HoveredStyle Resize="None" />
                                                    <EnabledStyle Resize="None" />
                                                </DateInput>
                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td style="width: 10%; white-space: nowrap;">
                                            <asp:Label ID="lblDateEnd" runat="server" Text="匯出時間(迄)"
                                                meta:resourcekey="lblDateEndResource1"></asp:Label>
                                        </td>
                                        <td style="width: 12%">
                                            <telerik:RadDatePicker ID="rdpEndDate" runat="server" meta:resourcekey="rdpEndDateResource1" >
                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                                                </Calendar>
                                                <DateInput LabelWidth="64px" Width="" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d">
                                                    <EmptyMessageStyle Resize="None" />
                                                    <ReadOnlyStyle Resize="None" />
                                                    <FocusedStyle Resize="None" />
                                                    <DisabledStyle Resize="None" />
                                                    <InvalidStyle Resize="None" />
                                                    <HoveredStyle Resize="None" />
                                                    <EnabledStyle Resize="None" />
                                                </DateInput>
                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td class="PopTableRightTD" style="padding: 0 0 0 0">

                                            <table   style="text-align: left; vertical-align:middle;">
                                                <tr>
                                                    <td style="text-align: left;">
                                                            <telerik:RadButton ID="rbtnExcelQuery" runat="server" Text="查詢"
                                                                meta:resourcekey="ibtnExcelQueryResource1" OnClick="rbtnExcelQuery_Click">
                                                            </telerik:RadButton>
                                                    </td>
                                                    <td style="text-align: left">
                                                            <telerik:RadButton ID="rbtnDelete" runat="server" Text="刪除" meta:resourcekey="ibntDeleteResource1"
                                                                OnClick="rbtnDelete_Click">
                                                            </telerik:RadButton>
                                                    </td>
                                                </tr>
                                            </table>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="CustomValidator1" runat="server"
                                    meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                <Fast:Grid ID="gridExcel" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False" DataKeyNames="TASK_GUID"
                                    DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                                    PageSize="15" Width="100%"
                                    OnRowDataBound="gridExcel_RowDataBound" DefaultSortDirection="Ascending"
                                    EmptyDataText="沒有資料"
                                    KeepSelectedRows="False" meta:resourcekey="gridExcelResource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""
                                      >
                                    <EnhancePagerSettings
                                        ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="匯出時間" SortExpression="TASK.MODIFY_DATE" meta:resourcekey="BoundFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExportDate" runat="server" Text='<%# Bind("EXPORT_DATE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="20%" />
                                        </asp:TemplateField>

                                        <asp:BoundField HeaderText="問卷名稱" DataField="DESIGN_NAME" SortExpression="DM.DESIGN_NAME" meta:resourcekey="BoundFieldResourc10">
                                            <ItemStyle Width="30%" />
                                        </asp:BoundField>

                                        <asp:BoundField HeaderText="匯出者" DataField="NAME"
                                            SortExpression="TASK.CREATE_USER" meta:resourcekey="BoundFieldResource4">
                                            <ItemStyle Width="10%" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="狀態" DataField="STATUS" SortExpression="STATUS"
                                            meta:resourcekey="BoundFieldResource5">
                                            <ItemStyle Width="10%" />
                                        </asp:BoundField>

                                        <asp:TemplateField HeaderText="下載" SortExpression="TASK.FILE_GROUP_ID" meta:resourcekey="BoundFieldResourc11">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="imgIcon" ImageUrl="~/Common/Images/Icon/icon_m177.gif" runat="server"
                                                                meta:resourcekey="imgIconResource1" />
                                                        </td>
                                                        <td>
                                                            <asp:HyperLink ID="hlFile" runat="server" meta:resourcekey="hlFileResource1"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ItemStyle Width="30%" />
                                        </asp:TemplateField>

                                    </Columns>
                                </Fast:Grid>
                                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                                    SelectCountMethod="QueryExportTask_Count" SelectMethod="QueryExportTask" SortParameterName="strSortExpression"
                                    StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusUCO">
                                    <SelectParameters>
                                        <asp:Parameter Name="condition" />
                                        <asp:Parameter Name="intStartIndex" />
                                        <asp:Parameter Name="intMaxRows" />
                                        <asp:Parameter Name="strSortExpression" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
            <asp:Label ID="lblTab1" runat="server" Text="問卷統計" Visible="False"
                meta:resourcekey="lblTab1Resource1"></asp:Label>
            <asp:Label ID="lblTab2" runat="server" Text="下載匯出資料" Visible="False"
                meta:resourcekey="lblTab2Resource1"></asp:Label>
            <asp:HiddenField ID="hiddenCategoryId" runat="server" />
            <asp:Label ID="lblDS" runat="server" Text="製作中" Visible="False"
                meta:resourcekey="lblDSResource1"></asp:Label>
            <asp:Label ID="lblEM" runat="server" Text="調查中" Visible="False"
                meta:resourcekey="lblEMResource1"></asp:Label>
            <asp:Label ID="lblCL" runat="server" Text="結束" Visible="False"
                meta:resourcekey="lblCLResource1"></asp:Label>
            <asp:Label ID="lblSP" runat="server" Text="中止" Visible="False"
                meta:resourcekey="lblSPResource1"></asp:Label>
            <asp:Label ID="lblSetUserset" runat="server" Text="設定觀看權限" Visible="False"
                meta:resourcekey="lblSetUsersetResource1"></asp:Label>
            <asp:Label ID="lblCell0" runat="server" Text="作答問卷 \ 題目" Visible="False"
                meta:resourcekey="lblCell0Resource1"></asp:Label>
            <asp:Label ID="lblStat" runat="server" Text="統計 - " Visible="False"
                meta:resourcekey="lblStatResource1"></asp:Label>
            <asp:Label ID="lblWT" runat="server" Text="處理中" Visible="False"
                meta:resourcekey="lblWTResource1"></asp:Label>
            <asp:Label ID="lblSC" runat="server" Text="成功" Visible="False"
                meta:resourcekey="lblSCResource1"></asp:Label>
            <asp:Label ID="lblFL" runat="server" Text="失敗" Visible="False"
                meta:resourcekey="lblFLResource1"></asp:Label>
            <asp:HiddenField ID="hiddenDelete" runat="server" Value="請選擇要刪除的資料行" />
            <asp:Label ID="lblSelectDelete" runat="server" Text="請選擇要刪除的資料行" Visible="False"
                meta:resourcekey="lblSelectDeleteResource1"></asp:Label>
            <asp:Label ID="lblReport" runat="server" Text="統計圖表" Visible="False"
                meta:resourcekey="lblReportResource1"></asp:Label>
            <asp:Label ID="lblQueryQus" runat="server" Text="查看問卷" Visible="False"
                meta:resourcekey="lblQueryQusResource1"></asp:Label>
            <asp:HiddenField ID="hiddenAtt" runat="server" Value="統計匯出將進入系統排程，請於5分鐘後至[下載匯出資料]中下載" />
            <asp:Label ID="lblhidAtt" runat="server" Text="統計匯出將進入系統排程，請於5分鐘後至[下載匯出資料]中下載" Visible="False"
                meta:resourcekey="lblhidAttResource1"></asp:Label>
            <asp:Label ID="lblViewSubmitCout" runat="server" Text="瀏覽問卷回收數" Visible="False"
                meta:resourcekey="lblViewSubmitCoutResource1"></asp:Label>
            <asp:HiddenField ID="hiddenExcel" runat="server" Value="是否確定產生問卷EXCEL檔案" />
            <asp:Label ID="lblExportExcel" runat="server" Visible="False" Text="是否確定產生問卷EXCEL檔案"
                meta:resourcekey="lblExportExcelResource1"></asp:Label>
            <asp:HiddenField ID="hiddenFlag" runat="server" />
            <asp:Label ID="lblViewResult" runat="server" Text="回收結果" Visible="False"
                meta:resourcekey="lblViewResultResource1"></asp:Label>
            <asp:Label ID="lblAll" runat="server" Visible="False" Text="全部類別"
                meta:resourcekey="lblAllResource1"></asp:Label>
            <asp:Label ID="lblDownLoadTitle" runat="server" Text="下載" Visible="False" meta:resourcekey="lblDownLoadTitleResource1"></asp:Label>
            <asp:Label ID="lblTitle" runat="server" Text="問卷名稱"   meta:resourcekey="lblNameLeftResource1" Visible="False"></asp:Label>
            <asp:HiddenField ID="hidIsAdmin" runat="server" />
            <asp:HiddenField ID="hidTreeNodetoXml" runat="server" />
            <asp:HiddenField ID="hidOldValue" runat="server" />
            <asp:HiddenField ID="hidNodeIndex" runat="server"/>
        </ContentTemplate>
    </asp:UpdatePanel>
    <iframe id="ExportExcel" name="ExportExcel" height="0" width="0"></iframe>


</asp:Content>

