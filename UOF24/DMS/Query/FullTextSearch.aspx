<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Query_FullTextSearch" Title="全文檢索" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" CodeBehind="FullTextSearch.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../DocStore/UC_ChooseFolder.ascx" TagName="UC_ChooseFolder" TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/ecmascript">

        var treeClassCurrent;

        function classSearchTree_InitializeTree(sender, eventArgs) {
            var chkStatus;
            chkStatus = $('#<%=chkSearchAllClass.ClientID%>').prop('checked');
            treeClassCurrent = sender;
            treeClassCurrent.set_enabled(!chkStatus);
        }



        function classSearchTree_NodeChecked(sender, e) {
            var node = e.get_node();

            recSubChilds(node, node.get_checked());

        }



        // 全選 Child Node
        function recSubChilds(nodeClassChild, checkStatus) {
            var childChilds = nodeClassChild.get_allNodes();
            for (var i = 0; i < childChilds.length; i++) {

                childChilds[i].set_checked(!checkStatus);

                if (childChilds[i].get_allNodes().length > 0)
                    recSubChilds(childChilds[i], checkStatus);
            }
        }



        $(function () {

            // ChangeClassTree();
            // ChangeDateStatus();
            ChangeSubFilename();
        });


        function ChangeSubFilename() {
            var txtSubFileName;
            txtSubFileName = $('#<%=txtSubFileName.ClientID%>');

            var chkSubname;
            chkSubname = $('#<%=chkSubname.ClientID%>');

            if (chkSubname.prop("checked")) {
                txtSubFileName.prop("disabled", false);
                txtSubFileName.css("backgroundColor", "#FFFFFF");
            }
            else {
                txtSubFileName.prop("disabled", true)
                txtSubFileName.css("backgroundColor", "#F0F0F0");
            }
        }


        function ChangeClassTree() {
            var chkStatus;
            chkStatus = $('#<%=chkSearchAllClass.ClientID%>').prop('checked');
            divSearchClass = $('#divSearchClass');

            divSearchClass.attr('disabled', chkStatus);
            var tree = $find('<%=classSearchTree.ClientID%>');

            if (tree)
                $find('<%=classSearchTree.ClientID%>').set_enabled(!chkStatus);
}






function btnSearch_Click(sender, e) {
    var txtKeyWord = $('#<%=txtKeyWord.ClientID%>');
    var lblSearchTime = $('#<%=lblSearchTime.ClientID%>');

    lblSearchTime.val('');

    if (txtKeyWord.val().trim() == "") {
        alert('<%=lblPleaseInputKeyword.Text %>');
        txtKeyWord.focus();
        e.set_cancel(true);
    }
}



function ChangeDateStatus() {
    var chkStatus;
    chkStatus = $('#<%=chkAssDate.ClientID%>').prop('checked');
    if ($find('<%=dateStart.ClientID%>')) {
        $find('<%=dateStart.ClientID%>').set_enabled(chkStatus);
        $find('<%=dateEnd.ClientID%>').set_enabled(chkStatus);
    }
}

function OpenPDFViewerWithFileCenterV2(sJson) {
    var h = $uof.tool.printScreenSize('h', screen.availHeight);
    var w = $uof.tool.printScreenSize('w', screen.availWidth);
    $uof.window.open("../DocStore/PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);
}

        //15.0 UDocViewer
        function OpenUDocViewer(sJson, docid, docversion, status) {
            var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(status)];
            $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsViewCount", data);
            $uof.uDocViewer.open(sJson);
        }
    </script>
    <style>
        .ResultTable {
            border: solid 1px #999999;
            table-layout: fixed;
            width: 100%;
        }

            .ResultTable td {
                border: solid 1px #999999;
            }
    </style>
    <table width="100%">
        <tr>
            <td valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table border="1" cellpadding="0" cellspacing="0" class="PopTable" style="table-layout: fixed; height: 100px; width: 100%;">
                            <tr>
                                <td style="text-align:right;width:12%;" class="PopTableLeftTD">
                                    <asp:Label ID="Label12" runat="server" Text="一般條件" meta:resourcekey="Label12Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD" >
                                    <asp:Label ID="Label13" runat="server" Text="檢索範圍:" meta:resourcekey="Label13Resource1" ></asp:Label>
                                    &nbsp;
                                    <asp:CheckBox ID="chkSearchFile" runat="server" Text="文件內容" Checked="True" meta:resourcekey="chkSearchFileResource1" />
                                    &nbsp;
                                    <asp:CheckBox ID="chkSearchAuthor" runat="server" Text="作者" meta:resourcekey="chkSearchAuthorResource1" />
                                    &nbsp;
                                    <asp:CheckBox ID="chkSearchFilename" runat="server" Text="檔名" meta:resourcekey="chkSearchFilenameResource1" />
                                    &nbsp;
                                    <asp:CheckBox ID="chkSearchMem" runat="server" Text="摘要" meta:resourcekey="chkSearchMemResource1" />
                                    &nbsp;
                                    <asp:CheckBox ID="chkKeyWord" runat="server" Text="關鍵字" meta:resourcekey="chkKeyWordResource1" />
                                    &nbsp;
                                    <asp:CheckBox ID="chkDocNum" runat="server" Text="文件編號" meta:resourcekey="chkDocNumResource1" />
                                    &nbsp;
                                    <asp:CheckBox ID="chkCustodyUser" runat="server" Text="保管者" meta:resourcekey="chkCustodyUserResource1"/>
                                    &nbsp;
                                    <asp:CheckBox ID="chkCustomProperty" runat="server" Text="其他自訂屬性" meta:resourcekey="chkCustomPropertyResource1" />
                                    <br />
                                    <asp:Label ID="Label10" runat="server" Text="檢索字串:" meta:resourcekey="Label10Resource1"></asp:Label>
                                    &nbsp;
                                    <asp:TextBox ID="txtKeyWord" runat="server" meta:resourcekey="txtKeyWordResource1"></asp:TextBox>
                                </td>
                                <td runat="server" id="tdClassFolder" rowspan="5" colspan="3" class="PopTableLeftTD" style="text-align: left; width:30%;">
                                    <telerik:RadTabStrip ID="rtsSearch" MultiPageID="rmpSearch" SelectedIndex="0" runat="server" meta:resourcekey="rtsSearchResource1">
                                        <Tabs>
                                            <telerik:RadTab Selected="True" Text="類別" runat="server" meta:resourcekey="RadTabResource1"></telerik:RadTab>
                                            <telerik:RadTab Text="目錄" runat="server" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                                        </Tabs>
                                    </telerik:RadTabStrip>
                                    <telerik:RadMultiPage ID="rmpSearch" runat="server" SelectedIndex="0" meta:resourcekey="rmpSearchResource1">
                                        <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1" Selected="True">
                                            <asp:CheckBox ID="chkSearchAllClass" runat="server" Checked="True" Font-Bold="True"
                                                meta:resourcekey="chkSearchAllClassResource1" Text="所有的類別" />
                                            <div id="divSearchClass" style="overflow: auto; width: 100%; height: 155px">
                                                <telerik:RadTreeView ID="classSearchTree" runat="server" Height="150px" EnableNodeTextHtmlEncoding="true"
                                                    OnClientNodeChecking="classSearchTree_NodeChecked"
                                                    OnClientLoad="classSearchTree_InitializeTree" CheckBoxes="True" meta:resourcekey="classSearchTreeResource2" TriStateCheckBoxes="False">
                                                </telerik:RadTreeView>
                                            </div>
                                        </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource1">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <uc1:UC_ChooseFolder ID="UC_ChooseFolder1" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </telerik:RadPageView>
                                    </telerik:RadMultiPage>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="PopTableLeftTD">
                                    <asp:Label ID="Label11" runat="server" Text="版本" meta:resourcekey="Label11Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD" >
                                    <asp:RadioButtonList ID="rdoSearchVerType" runat="server" RepeatDirection="Horizontal"
                                        meta:resourcekey="rdoSearchVerTypeResource1">
                                        <asp:ListItem Selected="True" Value="newVersion" meta:resourcekey="ListItemResource1" Text="公佈的最新版本"></asp:ListItem>
                                        <asp:ListItem Value="allVersion" meta:resourcekey="ListItemResource2" Text="所有公佈的版本"></asp:ListItem>
                                        <asp:ListItem Value="FinalVersion" meta:resourcekey="ListItemResource23" Text="文件最後版本"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr runat="server" id="trPublishUnit">
                                <td align="right" class="PopTableLeftTD" >
                                    <asp:Label ID="Label4" runat="server" Text="發行單位" meta:resourcekey="Label4Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD">
                                    <uc2:UC_ChoiceList ID="choicePublishUnit" runat="server" ChioceType="Group" ShowMember="false" ExpandToUser="false" />
                                    <asp:CustomValidator ID="validPublishUnit" runat="server" Display="Dynamic" ErrorMessage="只能選擇一個部門" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="PopTableLeftTD" >
                                    <asp:Label ID="Label14" runat="server" Text="時間範圍" meta:resourcekey="Label14Resource1"></asp:Label>
                                </td>
                                <td valign="top" class="PopTableRightTD" >
                                    <table border="0">
                                        <tr>
                                            <td colspan="4">
                                                <asp:CheckBox ID="chkAssDate" runat="server" Text="只搜尋時間內的文件" meta:resourcekey="chkAssDateResource1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="Label15" runat="server" Text="從" meta:resourcekey="Label15Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="dateStart" runat="server" meta:resourcekey="dateStartResource2" >
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label16" runat="server" Text="到" meta:resourcekey="Label16Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="dateEnd" runat="server" meta:resourcekey="dateEndResource2" >
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="結束時間需晚於開始時間" Display="Dynamic" meta:resourcekey="CompareValidator1Resource1"></asp:CustomValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="PopTableLeftTD" >
                                    <asp:Label ID="Label2" runat="server" Text="副檔名" meta:resourcekey="Label2Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD" >
                                    <asp:CheckBox ID="chkSubname" runat="server" meta:resourcekey="chkSubnameResource1"
                                        Text="只搜尋下列副檔名" />
                                    <asp:TextBox ID="txtSubFileName" runat="server" MaxLength="8" Width="110px" meta:resourcekey="txtSubFileNameResource1"></asp:TextBox>
                                    <asp:Label ID="Label7" runat="server" ForeColor="Red" meta:resourcekey="labPdfExample"
                                        Text="例：( pdf )"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="PopTableRightTD" colspan="5" style="padding-left: 0px; padding-right: 0px;">
                                    <table width="100%">
                                        <tr>
                                            <td style="width: 46%">&nbsp;
                                            </td>
                                            <td style="width: 5%; text-align: center;  white-space:nowrap" >
                                                <telerik:RadButton ID="btnSearch" runat="server" Text="搜尋" meta:resourcekey="btnSearchResource1"
                                                    OnClientClicking="btnSearch_Click" OnClick="btnSearch_Click1">
                                                </telerik:RadButton>
                                            </td>
                                            <td style="width: 46%; text-align: left;">
                                                <asp:Label ID="lblSearchTime" runat="server" meta:resourcekey="lblSearchTimeResource1"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <strong>


                            <table style="width: 100%; margin: 0 auto">
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td style="text-align: left">
                                                    <asp:Label ID="labOrderType" runat="server" Text="排序" meta:resourcekey="labOrderTypeResource"></asp:Label>
                                                    <asp:DropDownList ID="ddlSearchOrder" runat="server" Width="136px" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlSearchOrder_SelectedIndexChanged"
                                                        meta:resourcekey="ddlSearchOrderResource1">
                                                        <asp:ListItem Value="filename" meta:resourcekey="ListItemResourceOrder" Text="文件檔名"></asp:ListItem>
                                                        <asp:ListItem Value="docSerial" meta:resourcekey="ListItemResourcedocSerial" Text="文件編號"></asp:ListItem>
                                                        <asp:ListItem Value="docsize" meta:resourcekey="ListItemResource2Order" Text="文件大小"></asp:ListItem>
                                                        <asp:ListItem Value="FolderPath" meta:resourcekey="ListItemResource3" Text="文件路徑"></asp:ListItem>
                                                        <asp:ListItem Value="ModifyDate" meta:resourcekey="ListItemResource4" Text="公佈日"></asp:ListItem>
                                                        <asp:ListItem Value="docAuthor" meta:resourcekey="ListItemResource5" Text="作者"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDisplay" runat="server" Text="顯示方式：" meta:resourcekey="lblDisplayResource2"></asp:Label>
                                                    <asp:DropDownList ID="ddlDisplay" runat="server"
                                                        OnSelectedIndexChanged="ddlDisplay_SelectedIndexChanged"
                                                        AutoPostBack="True" meta:resourcekey="ddlDisplayResource2">
                                                        <asp:ListItem Selected="True" Value="fileList" Text="文件列表" meta:resourcekey="ListItemResource15"></asp:ListItem>
                                                        <asp:ListItem Value="fileDetails" Text="詳細資料" meta:resourcekey="ListItemResource16"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="lblItems" runat="server" Text="顯示筆數：" meta:resourcekey="lblItemsResource2"></asp:Label>
                                                    <asp:DropDownList ID="ddlItems" runat="server" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlItems_SelectedIndexChanged"
                                                        meta:resourcekey="ddlItemsResource1">
                                                        <asp:ListItem Selected="True" Value="10" Text="10"
                                                            meta:resourcekey="ListItemResource8"></asp:ListItem>
                                                        <asp:ListItem Value="20" Text="20" meta:resourcekey="ListItemResource17"></asp:ListItem>
                                                        <asp:ListItem Value="30" Text="30" meta:resourcekey="ListItemResource18"></asp:ListItem>
                                                        <asp:ListItem Value="40" Text="40" meta:resourcekey="ListItemResource19"></asp:ListItem>
                                                        <asp:ListItem Value="50" Text="50" meta:resourcekey="ListItemResource20"></asp:ListItem>
                                                        <asp:ListItem Value="100" Text="100" meta:resourcekey="ListItemResource21"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <Fast:Grid ID="docListGrid" runat="server" AutoGenerateCheckBoxColumn="False"
                                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                            DataKeyOnClientWithCheckBox="False"
                                            DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False"
                                            OnRowDataBound="docListGrid_RowDataBound" Width="100%" PageSize="15"
                                            OnPageIndexChanging="docListGrid_PageIndexChanging"
                                            OnSorting="docListGrid_Sorting" meta:resourcekey="docListGridResource2" OnRowCommand="docListGrid_RowCommand">
                                            <EnhancePagerSettings ShowHeaderPager="True" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" />
                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="文件路徑" SortExpression="FOLDER_NAME" meta:resourcekey="TemplateFieldResource6">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ID="HyFolderPath" runat="server" meta:resourcekey="HyFolderPathResource2"></asp:HyperLink>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FOLDER_ID") %>' meta:resourcekey="TextBox3Resource2"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="文件編號" DataField="DOC_SERIAL" SortExpression="DOC_SERIAL" meta:resourcekey="BoundFieldResource5">
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="文件類別" DataField="CLASS_NAME" SortExpression="CLASS_NAME" meta:resourcekey="BoundFieldResource6">
                                                    <HeaderStyle Wrap="False" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="文件標題" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource7">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DOC_NAME") %>' meta:resourcekey="TextBox4Resource2"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:LinkButton ID="lbtnDocName" runat="server" Text='<%#: Bind("DOC_NAME") %>' meta:resourcekey="lbtnDocNameResource2"></asp:LinkButton>
                                                                </td>
                                                                <td style="text-align: right;">
                                                                    <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" Visible="false" runat="server" AlternateText="觀看文件" />
                                                                    <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Wrap="False" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="作者" SortExpression="DOC_AUTHOR" meta:resourcekey="TemplateFieldResource8">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAuthor" runat="server" meta:resourcekey="lblAuthorResource2"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource2"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Wrap="False" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="公佈日"  SortExpression="PUBLISH_DATE" meta:resourcekey="BoundFieldResource7">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPublishDate" runat="server" ></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="版本" SortExpression="MANUAL_VERSION" meta:resourcekey="BoundFieldResource8">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labVersion" runat="server" meta:resourcekey="labVersionResource2"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS_DISPLAY" meta:resourcekey="TemplateFieldResource9">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("DOC_STATUS") %>' meta:resourcekey="lblStatusResource2"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DOC_STATUS") %>' meta:resourcekey="TextBox1Resource2"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource10">
                                                    <ItemTemplate>
                                                        <div style="width: 100%; text-align: center;">
                                                            <asp:LinkButton ID="lbtnInfo" runat="server"
                                                                Text="資訊" meta:resourcekey="lbtnInfoResource1"></asp:LinkButton>
                                                        </div>
                                                    </ItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="3">

                                        <Fast:Grid ID="dgSearchList" runat="server" AllowPaging="True" AllowSorting="True"
                                            AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                                            DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                                            meta:resourcekey="gridChartResource1" OnRowDataBound="dgSearchList_RowDataBound"
                                            PageSize="15" Width="100%"
                                            ShowHeader="False" OnPageIndexChanging="dgSearchList_PageIndexChanging"
                                            DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False" OnRowCommand="dgSearchList_RowCommand">
                                            <EnhancePagerSettings ShowHeaderPager="True" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" />
                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource1">
                                                    <ItemTemplate>
                                                        <table class="ResultTable">
                                                            <tbody>
                                                                <tr align="left">
                                                                    <td rowspan="6">
                                                                        <br />
                                                                        <asp:Label ID="lanNum" runat="server" meta:resourcekey="lanNumResource1" Text="1"
                                                                            Font-Bold="True" ForeColor="Red"></asp:Label>
                                                                        <asp:Image ID="imgVer" runat="server" meta:resourcekey="imgVerResource1"></asp:Image>
                                                                        <asp:Image ID="docIcon" runat="server" meta:resourcekey="docIconResource1"></asp:Image>&nbsp;
                                                                        <asp:LinkButton ID="LinkBtTitle" runat="server" Text='<%#: Bind("DOC_NAME") %>' meta:resourcekey="LinkBtTitleResource1"></asp:LinkButton>
                                                                        <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" Visible="false" runat="server" AlternateText="觀看文件" />
                                                                        <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image><br />
                                                                    </td>
                                                                    <td class="PopTableLeftTD" valign="middle" align="right">
                                                                        <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="文件版本"
                                                                            class="SizeSB" ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td class="PopTableRightTD" align="left">
                                                                        <asp:Label ID="labVersion" runat="server" Text='<%#: Bind("MANUAL_VERSION") %>' meta:resourcekey="labVersionResource1"></asp:Label>
                                                                    </td>
                                                                    <td class="PopTableLeftTD" valign="middle" align="right">
                                                                        <asp:Label ID="Label9" runat="server" meta:resourcekey="Label9Resource1" Text="文件作者"
                                                                            class="SizeSB" ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td class="PopTableRightTD" align="left">&nbsp;
                                                                        <asp:Label ID="labDocAuthor" runat="server" meta:resourcekey="labDocAuthorResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="PopTableLeftTD" valign="middle" align="right">
                                                                        <asp:Label ID="Label99" runat="server" meta:resourcekey="Label7Resource1" Text="文件大小"
                                                                            class="SizeSB" ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td class="PopTableRightTD" align="left">
                                                                        <asp:Label ID="labDocSize" runat="server" Text='<%# Bind("DOC_SIZE") %>'
                                                                            meta:resourcekey="labDocSizeResource1"></asp:Label>
                                                                    </td>
                                                                    <td class="PopTableLeftTD" valign="middle" align="right">
                                                                        <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" Text="公佈日"
                                                                            class="SizeSB" ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td class="PopTableRightTD" align="left">&nbsp;<asp:Label ID="labModifyTime" runat="server" meta:resourcekey="labModifyTimeResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="PopTableLeftTD" valign="middle" align="right">
                                                                        <asp:Label ID="lblGridDocSerial" runat="server" Text="文件編號" class="SizeSB" ForeColor="Black" meta:resourcekey="lblGridDocSerialResource1"></asp:Label>
                                                                    </td>
                                                                    <td class="PopTableRightTD" align="left">
                                                                        <asp:Label ID="labDocSerial" runat="server" Text='<%#: Bind("DOC_SERIAL") %>' meta:resourcekey="labDocSerialResource1"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 120px; height: 20px" class="PopTableLeftTD" valign="middle" align="right">
                                                                        <asp:Label ID="Label3" runat="server" Text="狀態" Font-Bold="True" ForeColor="Black" meta:resourcekey="Label3Resource1"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 220px; height: 20px" class="PopTableRightTD">&nbsp;<asp:Label ID="lblStatus2" runat="server" Text='<%# Bind("DOC_STATUS") %>' meta:resourcekey="lblStatus2Resource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="PopTableLeftTD" valign="middle" align="right">
                                                                        <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="文件路徑"
                                                                            class="SizeSB" ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td class="PopTableRightTD" colspan="3" align="left">
                                                                        <img src="../images/closed.gif" />
                                                                        <asp:HyperLink ID="hyLinkFolderPath" runat="server" meta:resourcekey="hyLinkFolderPathResource2"></asp:HyperLink>
                                                                        <asp:Label ID="labFolderPath" runat="server" Visible="False"
                                                                            meta:resourcekey="labFolderPathResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="PopTableLeftTD" valign="middle" align="right">
                                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" class="SizeSB"
                                                                            Text="文件類別" meta:resourcekey="Label1Resource2"></asp:Label>
                                                                    </td>
                                                                    <td class="PopTableRightTD" colspan="3" align="left">
                                                                        <asp:Label ID="lblDocClass" runat="server" meta:resourcekey="lblDocClassResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="PopTableRightTD" colspan="4" align="left">
                                                                        <asp:Label ID="labSample" runat="server" meta:resourcekey="labSampleResource1" Text='<%#: Bind("SAMPLE_TEXT") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="PopTableRightTD" colspan="5" style="text-align: right;">
                                                                        <asp:Image ID="Image2" runat="server" EnableViewState="False" ImageUrl="~/DMS/images/inform.gif" meta:resourcekey="Image2Resource1" />
                                                                        <asp:LinkButton ID="lbtnInfo" runat="server" meta:resourcekey="lbtnInfoResource1"
                                                                            Text="資訊"></asp:LinkButton>
                                                                    </td>
                                                                </tr>

                                                            </tbody>
                                                        </table>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>
                                    </td>
                                </tr>
                            </table>
                            <asp:HiddenField ID="hidSelectNode" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:Label ID="lblPleaseInputKeyword" runat="server" meta:resourcekey="lblPleaseInputKeywordResource1" Text="請輸入搜尋關鍵字" Visible="False"></asp:Label>
                <asp:Label ID="lblDMSClass" runat="server" meta:resourcekey="lblDMSClassResource1" Text="文件類別" Visible="False"></asp:Label>
                <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource2"></asp:Label>
                <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource2"></asp:Label>
                <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
                <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
                <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
                <asp:Label ID="lblDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="lblDocDenyResource1"></asp:Label>
                <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
                <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
                <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Label runat="server" ID="lblSearchDurtionTime" Text="共有{0}項結果 共耗時 {1:#,0.00;(#,0.00)}秒" Visible="False" meta:resourcekey="lblSearchDurtionTimResource1"></asp:Label>
    <asp:Label ID="lblSorted" runat="server" Visible="False" meta:resourcekey="lblSortedResource1"></asp:Label>
    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
    <asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1"></asp:Label>
    <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
    <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblChoiceBtntxt" runat="server" Text="選取部門" Visible="False" meta:resourcekey="lblChoiceBtntxtResource1"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" Text="未生效" Visible="False" meta:resourcekey="labNoActiveResource1"></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
    <asp:Label ID="lblDeleting" runat="server" Text="(銷毀審核中)" Visible="False" meta:resourcekey="lblDeletingResource1" ></asp:Label>
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:HiddenField ID="hfTmpFolderId" runat="server" />
    <asp:HiddenField ID="hfTmpIsEnablePDFViewer" runat="server" />
    <a id="atag" style="display:none;">Run UDoc Viewer</a>
</asp:Content>

