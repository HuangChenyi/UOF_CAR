<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="RevisedDocSearch.aspx.cs" Inherits="Ede.Uof.Web.DMS.Query.RevisedDocSearch" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="../DocStore/UC_ChooseDMSAuthorityFolder.ascx" TagName="UC_ChooseDMSAuthorityFolder" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function radRevisedDocToolBar_Click(sender, args) {
            var toolBar = sender;
            var button = args.get_item();
                     
            if (button.get_value() == "Send") {

                //發送通知依勾選文件類型(SELECT|ALL)
                var radRevisedDocToolBar = $find("<%= radRevisedDocToolBar.ClientID %>");
                var toolbarbutton = radRevisedDocToolBar.findItemByValue("SelectDoc")
                var rbtnSelectDocList = $telerik.findElement(toolbarbutton.get_element(), ("rbtnSelectDocList"));
                var hfSelectType = $(rbtnSelectDocList).find("input:checked").val();

                if (hfSelectType == "SELECT") {
                    var checkedData = $uof.fastGrid.getChecked('<%=revisedGrid.ClientID%>');
                    $("#<%=hfSelectDocList.ClientID%>").val(checkedData);

                    //選取的文件
                    var hfSelectDocClientId = '<%= hfSelectDocList.ClientID %>';

                    if ($("#<%=hfSelectDocList.ClientID%>").val() == "") {
                        alert('<%=lblNoCheckDoc.Text%>');
                    }
                    else {
                        args.set_cancel(true);
                        $uof.dialog.open2("~/DMS/Query/SendRevisedDocMessage.aspx", args.get_item(), '<%=lblSendMessage.Text%>', 600, 400,
                            OpenDialogResult, { "hfSelectDoc": hfSelectDocClientId, "hfSelectType": hfSelectType });
                    }
                }
                else if (hfSelectType == "ALL") {
                    //時間起迄
                    var startDate = $("#<%=hfStartDate.ClientID%>").val();
                    var finishDate = $("#<%=hfEndDate.ClientID%>").val();
                    //選取目錄
                    var allFolderList = $("#<%=hfAllFolderList.ClientID%>").val();
                    //選取作者
                    var hfAllAuthorListClientId = '<%= hfAuthorList.ClientID %>';
                    //文件狀態
                    var docStatus = $("#<%=hfStatus.ClientID%>").val();

                    args.set_cancel(true);
                    $uof.dialog.open2("~/DMS/Query/SendRevisedDocMessage.aspx", args.get_item(), '<%=lblSendMessage.Text%>', 600, 400, OpenDialogResult,
                            { "hfSelectType": hfSelectType, "startDate": startDate, "finishDate": finishDate, "docStatus": docStatus, "hfAllAuthorListClientId": hfAllAuthorListClientId, "docList": allFolderList });

                }
            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined")
                return false;
            else
                return true;
        }
    </script>
    <style type="text/css">
        .btnAlign {
            margin-top: 5px;
        }
    </style>
    <asp:UpdatePanel ID="upRevisedDoc" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="radRevisedDocToolBar" runat="server" Width="100%" OnClientButtonClicking="radRevisedDocToolBar_Click" OnButtonClick="radRevisedDocToolBar_ButtonClick" SingleClick="None" meta:resourcekey="radRevisedDocToolBarResource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.png" DisabledImageUrl="~/Common/Images/icon_m39.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.png" ImageUrl="~/Common/Images/Icon/icon_m39.png" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2" />
                    <telerik:RadToolBarButton runat="server" Value="SelectDoc" meta:resourcekey="RadToolBarButtonResource3">
                        <ItemTemplate>
                            <div class="btnAlign">
                                <asp:RadioButtonList ID="rbtnSelectDocList" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rbtnSelectDocListResource1">
                                    <asp:ListItem Text="所有文件" Value="ALL" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                    <asp:ListItem Text="勾選文件" Value="SELECT" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="發送通知" Value="Send" 
                        CheckedImageUrl="~/Common/Images/Icon/icon_m216.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m216.gif" ImageUrl="~/Common/Images/Icon/icon_m216.gif" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource5" />
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblStar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lblTime" runat="server" Text="時間" meta:resourcekey="lblTimeResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 100%">
                                    <table border="0" style="width: 100%">
                                        <tr>
                                            <td style="width: 150px; text-align: left; white-space: nowrap">
                                                <telerik:RadDatePicker ID="rdBeginDate" runat="server" meta:resourcekey="PublishStartDateResource1">
                                                    <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                    </Calendar>
                                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
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
                                                <asp:CustomValidator ID="cvStartTime" runat="server" Display="Dynamic" ErrorMessage="請填入開始時間" meta:resourcekey="cvStartTimeResource1"></asp:CustomValidator>
                                            </td>
                                            <td style="width: 20px; text-align: center">
                                                <asp:Label ID="lblWave" runat="server" Text="～" meta:resourcekey="lblWaveResource1"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="PublishEndDateResource1">
                                                    <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                    </Calendar>
                                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
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
                                                <asp:CustomValidator ID="cvEndTime" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" meta:resourcekey="cvEndTimeResource1"></asp:CustomValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td runat="server" id="folderTitleTD" rowspan="3" class="PopTableLeftTD" style="width: 150px; white-space: nowrap;">
                        <asp:Label ID="Label3" runat="server" Text="目錄" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td runat="server" id="folderTD" rowspan="3" class="PopTableRightTD" style="width: 350px; height: 200px; max-width: 350px; overflow: auto;">
                        <div style="overflow: auto; height: inherit">
                            <uc2:UC_ChooseDMSAuthorityFolder ID="UC_ChooseDMSAuthorityFolder" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblStatus" runat="server" Text="狀態" meta:resourcekey="lblStatusResource1"></asp:Label></td>
                    <td colspan="3">
                        <asp:DropDownList ID="dllStatus" runat="server" meta:resourcekey="dllStatusResource1">
                            <asp:ListItem Value="All" Text="全部" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Value="CheckOut" Text="已取出" meta:resourcekey="ListItemResource4"></asp:ListItem>
                            <asp:ListItem Value="CheckIn" Text="已存回" meta:resourcekey="ListItemResource5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr runat="server" id="authorTR">
                    <td style="white-space: nowrap;" runat="server">
                        <asp:Label ID="Label4" runat="server" Text="作者" meta:resourcekey="Label4Resource1"></asp:Label></td>
                    <td colspan="3" style="height: 150px; vertical-align: top" runat="server">
                        <div style="overflow: auto; width: 100%; height: 170px">
                            <uc1:UC_ChoiceList ID="UC_AuthorChoiceList" runat="server" ChioceType="User" />
                        </div>
                    </td>
                </tr>
            </table>
            <Ede:Grid ID="revisedGrid" runat="server" AllowPaging="True" AllowSorting="True" DefaultSortDirection="Descending" DefaultSortColumnName="MODIFY_DATE"
                AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="True" DataKeyNames="DOC_ID,DOC_AUTHOR" EmptyDataText="沒有資料"
                KeepSelectedRows="False" PageSize="15" Width="100%" CustomDropDownListPage="False" OnBeforeExport="revisedGrid_BeforeExport" EnhancePager="True"
                OnPageIndexChanging="revisedGrid_PageIndexChanging" OnRowDataBound="revisedGrid_RowDataBound" OnSorting="revisedGrid_Sorting" OnAfterExport="revisedGrid_AfterExport" meta:resourcekey="revisedGridResource1" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <span style="width: 30px;">
                                <asp:Label ID="lblDocSerial" runat="server" Text='<%#: Bind("DOC_SERIAL") %>' meta:resourcekey="lblDocSerialResource1"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Width="15%" Wrap="False" />
                        <ItemStyle Width="15%" Wrap="true" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <span style="word-break: break-all; width: 100%;">
                                <table>
                                    <tr>
                                        <td style="min-width: 16px;">
                                            <asp:Image runat="server" ID="docIcon1" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIcon1Resource1"></asp:Image>&nbsp; 
                                        </td>
                                        <td>
                                            <asp:Label ID="lbtnDocName" runat="server" Text='<%#: Bind("DOC_NAME") %>' meta:resourcekey="lbtnDocNameResource1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="25%" />
                        <ItemStyle Wrap="True" Width="25%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="DOC_NAME" HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" Width="25%" />
                        <ItemStyle Wrap="False" Width="25%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="作者" SortExpression="DISPLAYNAME" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnAuthor" meta:resourcekey="lbtnAuthorResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="15%" Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" Wrap="True" Width="15%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" SortExpression="MANUAL_VERSION" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Width="5%" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="目錄" SortExpression="FOLDER_SITEMAP" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <span style="word-break: break-all;">
                                <asp:Label runat="server" ID="lblFolder" Text='<%# Bind("FOLDER_SITEMAP") %>' meta:resourcekey="lblFolderResource1"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Width="25%" Wrap="False" />
                        <ItemStyle Width="25%" HorizontalAlign="Left" Wrap="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStatus" meta:resourcekey="lblStatusResource2"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="3%" Wrap="False" />
                        <ItemStyle Width="3%" HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="動作時間" SortExpression="MODIFY_DATE" meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblAddDate" meta:resourcekey="lblAddDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="False" />
                        <ItemStyle Width="10%" HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource7">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnInfo" Text="資訊" OnClick="lbtnInfo_Click" meta:resourcekey="lbtnInfoResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="3%" Wrap="False" />
                        <ItemStyle Width="3%" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle Wrap="False" />
            </Ede:Grid>
            <asp:HiddenField runat="server" ID="hfCurrentGuid"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfCurrentCultrue"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfAuthorList"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfAllFolderList"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfStartDate"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfEndDate"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfStatus"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfSelectDocList"></asp:HiddenField>
            <asp:HiddenField runat="server" ID="hfExport"></asp:HiddenField>
            <asp:Label runat="server" ID="lblCheckOut" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
            <asp:Label runat="server" ID="lblCheckIn" Text="已存回" Visible="False" meta:resourcekey="lblCheckInResource1"></asp:Label>
            <asp:Label runat="server" ID="lblSendMessage" Text="發送通知" Visible="False" meta:resourcekey="lblSendMessageResource1"></asp:Label>
            <asp:Label runat="server" ID="lblNoCheckDoc" Text="尚未勾選要發送通知的項目，請確認" Visible="False" meta:resourcekey="lblNoCheckDocResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
