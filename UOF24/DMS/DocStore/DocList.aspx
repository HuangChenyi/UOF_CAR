<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocList" Title="文件清冊" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="DocList.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="UC_ChooseFolder.ascx" TagName="UC_ChooseFolder" TagPrefix="uc2" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .wrap {
            float: left;
            margin-bottom: 2em;
            position: relative;
            left: 45%;
        }
    </style>
    <script type="text/javascript">

        Sys.Application.add_load(rbChecked);

        function IsSend(sender, args) {
            if (!confirm("<%=lblConfirmSend.Text%>")) {
                args.set_cancel(true);
            }
        }

        function OpenMsgDialog(sender) {                        
            var Author = "<%=hfAuthor.ClientID%>"; 
            var StartDate = $("#<%=ExpiryStartDate.ClientID%>").val();
            var EndDate = $("#<%=ExpiryEndDate.ClientID%>").val();
            var LendUser = "<%=User.Identity.Name%>";
            var Status = $("#<%=dllStatus.ClientID%>").val();
            var ChooseFolder = $("#<%=hfFolder.ClientID%>").val();            
            $uof.dialog.open2("~/DMS/DocStore/DocListSendMessage.aspx", "", "", 600, 400, function () { return true; },
                { "Author": Author, "StartDate": StartDate, "EndDate": EndDate, "LendUser": LendUser, "Status": Status, "ChooseFolder": ChooseFolder });
        }

        function rbChecked() {            
            if ($("#<%=rbPublishDate.ClientID %>").is(":checked") == true) {
                $find("<%=PublishStartDate.ClientID%>").set_enabled(true);
                $find("<%=PublishEndDate.ClientID%>").set_enabled(true);
                $find("<%=ExpiryStartDate.ClientID%>").set_enabled(false);
                $find("<%=ExpiryEndDate.ClientID%>").set_enabled(false);                
            }
            else if ($("#<%=rbExpiryDate.ClientID %>").is(":checked") == true) {
                $find("<%=PublishStartDate.ClientID%>").set_enabled(false);
                $find("<%=PublishEndDate.ClientID%>").set_enabled(false);
                $find("<%=ExpiryStartDate.ClientID%>").set_enabled(true);
                $find("<%=ExpiryEndDate.ClientID%>").set_enabled(true);                
            }
        }

        function Date_SelectedDateChanged(sender, args) {
            $find("<%=btnSendMsg.ClientID%>").set_enabled(false);          
            $("#<%=btnPostBack.ClientID%>").click();
        }

        function ddlChanged() {
            $find("<%=btnSendMsg.ClientID%>").set_enabled(false);            
            $("#<%=btnPostBack.ClientID%>").click();
        }

        function ClickbtnPrint(sender, args) {     
            alert('<%=lblPrompt.Text%>');                        
        }

        function RadTBQuery_ButtonClick(sender, args) {
            var key = args.get_item().get_value();
            if (key == "Delete") {
                if (confirm('<%=lblDelconfirm.Text%>') == false)
                    args.set_cancel(true);
            }
        }
    </script> 
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage" meta:resourcekey="RadTabStrip1Resource1">
            <Tabs>
                <telerik:RadTab runat="server" PageViewID="RadPageView1" Text="查詢" Selected="True" meta:resourcekey="RadTabResource1"></telerik:RadTab>
                <telerik:RadTab runat="server" PageViewID="RadPageView2" Text="下載匯出報表" meta:resourcekey="RadTabResource2"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage" Runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPageResource1">
            <telerik:RadPageView id="RadPageViewOne" runat="server" meta:resourcekey="RadPageViewOneResource1" Selected="True">

                        <table class="PopTable" style="width: 100%">
                           <tr>
                                <td style="white-space: nowrap;">
                                    <asp:Label ID="Label1" runat="server" Text="時間" meta:resourcekey="Label1Resource1"></asp:Label>
                                </td>
                                <td colspan="3">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 100%">
                                                <table border="0" style="width: 100%">
                                                    <tr>
                                                        <td style="width: 240px; text-align: left; white-space: nowrap">
                                                            <asp:RadioButton ID="rbPublishDate" runat="server" Text="公佈日" Checked="True" GroupName="QueryType" onclick="rbChecked()" meta:resourcekey="rbPublishDateResource1" />
                                                            <telerik:RadDatePicker ID="PublishStartDate" runat="server" meta:resourcekey="PublishStartDateResource1">
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
                                                                <ClientEvents OnDateSelected="Date_SelectedDateChanged" />
                                                            </telerik:RadDatePicker>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PublishStartDate"
                                                                Display="Dynamic" ErrorMessage="請輸入起日" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td style="width: 20px; text-align: center">
                                                            <asp:Label ID="Label2" runat="server" Text="～" meta:resourcekey="Label2Resource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <telerik:RadDatePicker ID="PublishEndDate" runat="server" meta:resourcekey="PublishEndDateResource1">
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
                                                                <ClientEvents OnDateSelected="Date_SelectedDateChanged" />
                                                            </telerik:RadDatePicker>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PublishEndDate"
                                                                Display="Dynamic" ErrorMessage="請輸入訖日" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table border="0" style="width: 100%">
                                                    <tr>
                                                        <td style="width: 240px; text-align: left; white-space: nowrap">
                                                            <asp:RadioButton ID="rbExpiryDate" runat="server" Text="到期時間" GroupName="QueryType" onclick="rbChecked()" meta:resourcekey="rbExpiryDateResource1" />
                                                            <telerik:RadDatePicker ID="ExpiryStartDate" runat="server" meta:resourcekey="ExpiryStartDateResource1">
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
                                                                <ClientEvents OnDateSelected="Date_SelectedDateChanged" />
                                                            </telerik:RadDatePicker>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ExpiryStartDate"
                                                                Display="Dynamic" ErrorMessage="請輸入起日" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td style="width: 20px; text-align: center">
                                                            <asp:Label ID="Label5" runat="server" Text="～" meta:resourcekey="Label5Resource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <telerik:RadDatePicker ID="ExpiryEndDate" runat="server" meta:resourcekey="ExpiryEndDateResource1">
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
                                                                <ClientEvents OnDateSelected="Date_SelectedDateChanged" />
                                                            </telerik:RadDatePicker>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ExpiryEndDate"
                                                                Display="Dynamic" ErrorMessage="請輸入訖日" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            <td runat="server" id="folderTitleTD" rowspan="3" class="PopTableLeftTD" style="width: 150px; white-space: nowrap;">
                                <asp:Label ID="Label3" runat="server" Text="目錄" meta:resourcekey="LabelFolderResource"></asp:Label>
                            </td>
                            <td runat="server" id="folderTD" rowspan="3" class="PopTableRightTD" style="width: 350px; height: 200px; max-width:350px; overflow:auto;">
                                <div style="overflow: auto; height: inherit">
                                    <uc2:UC_ChooseFolder ID="UC_ChooseFolder1" runat="server" />
                                </div>
                            </td>
                        </tr>
                            <tr>
                                <td style="white-space: nowrap;">
                                    <asp:Label ID="lblStatus" runat="server" Text="狀態" meta:resourcekey="LabelStatusResource"></asp:Label></td>
                                <td colspan="3">
                                    <asp:DropDownList ID="dllStatus" runat="server" meta:resourcekey="dllStatusResource1" >
                                        <asp:ListItem Value="All" Text="全部" meta:resourcekey="ItemAllResource"></asp:ListItem>
                                        <asp:ListItem Value="Publish" Text="已公佈" meta:resourcekey="ItemPublishedResource"></asp:ListItem>
                                        <asp:ListItem Value="Void" Text="已作廢" meta:resourcekey="ItemCancelledResource"></asp:ListItem>
                                        <asp:ListItem Value="TempInact" Text="已下架" meta:resourcekey="ItemDeadResource"></asp:ListItem>
                                        <asp:ListItem Value="Inactive" Text="已失效" meta:resourcekey="ItemInactiveResource"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr runat="server" id="authorTR">
                        <td style="white-space: nowrap;" runat="server">
                            <asp:Label ID="Label4" runat="server" Text="作者" meta:resourcekey="Label4Resource1"></asp:Label></td>
                        <td colspan="3" style="height: 150px; vertical-align: top" runat="server">

                            <div style="overflow: auto; width: 100%; height: 170px">                    
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ChioceType="User" />                        
                            </div>
                        </td>
                    </tr>
                        </table>
                        <div class="wrap">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <telerik:RadButton ID="okBtn" Text="查詢" runat="server" OnClick="okBtn_Click"
                                            meta:resourcekey="okBtnResource1">
                                        </telerik:RadButton>
                                    </td>
                                    <td>
                                        <telerik:RadButton ID="btnPrint" Text="匯出EXCEL" runat="server" OnClick="btnPrint_Click" OnClientClicking="ClickbtnPrint" 
                                            meta:resourcekey="btnPrintResource1">
                                        </telerik:RadButton>
                                    </td>
                                    <td>        
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>            
                                                <telerik:RadButton ID="btnSendMsg" runat="server" Text="發送到期通知" OnClick="btnSendMsg_Click" meta:resourcekey="btnSendMsgResource1" Enabled="False" ></telerik:RadButton>                    
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <table style="height: 100%; width: 100%;">
                            <tr style="vertical-align: top;">
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <Fast:Grid ID="Grid2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                                AutoGenerateColumns="False" OnPageIndexChanging="Grid2_PageIndexChanging"
                                                OnRowDataBound="Grid2_RowDataBound"
                                                Width="100%" DataKeyOnClientWithCheckBox="False"
                                                DataKeyNames="DOC_ID,MANUAL_VERSION" EnhancePager="True" PageSize="15"
                                                OnSorting="Grid2_Sorting" CustomDropDownListPage="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="Grid2Resource1" SelectedRowColor="" UnSelectedRowColor="">
                                                <EnhancePagerSettings ShowHeaderPager="True" />
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:TemplateField meta:resourcekey="TemplateFieldResource7">
                                                        <ItemTemplate>
                                                            <center>
                                                                <table border="0" style=" width:100%">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td colspan="3" style=" text-align:left;">
                                                                                <table border="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="text-align:right; height:30px">&nbsp;&nbsp;
                                                                                                <asp:Label ID="lblFile" runat="server" ForeColor="Gray" meta:resourceKey="TemplateFieldResource2" Text="文件名稱："></asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Image ID="imgStar1" runat="server" ImageUrl="~/DMS/images/ratnull.gif" meta:resourcekey="imgStar1Resource1" />
                                                                                                <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourceKey="docIconResource1" />
                                                                                                <asp:Label ID="lblDocName" runat="server" meta:resourcekey="lblDocNameResource1" Text='<%#: Eval("DOC_NAME") %>'></asp:Label>
                                                                                                <asp:HiddenField ID="hfDocID" runat="server" Value='<%# Bind("DOC_ID") %>' />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style=" text-align:left; height:30px; width:300px; max-width: 300px; ">&nbsp;&nbsp;
                                                                                <asp:Label ID="Label12" runat="server" ForeColor="Gray" meta:resourceKey="lblPathResource2" Text="路徑："></asp:Label>
                                                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/DMS/images/closed.gif" meta:resourcekey="Image1Resource1" />
                                                                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource2" Text='<%# Bind("PATH") %>'></asp:Label>
                                                                            </td>
                                                                            <td style=" text-align:left;">
                                                                                <table>
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label ID="Label8" runat="server" ForeColor="Gray" meta:resourceKey="BoundFieldResource1" Text="文件編號："></asp:Label>
                                                                                            </td>
                                                                                            <td><span style="word-break:break-all; width:110px;">
                                                                                                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource2" Text='<%#: Bind("DOC_SERIAL") %>'></asp:Label>
                                                                                                </span></td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style=" text-align:left;height:30px">&nbsp;&nbsp;
                                                                                <asp:Label ID="Label21x" runat="server" ForeColor="Gray" meta:resourceKey="TemplateFieldResource4" Text="作者："></asp:Label>
                                                                                <asp:Label ID="lblAuthor" runat="server" meta:resourcekey="lblAuthorResource1"></asp:Label>
                                                                            </td>
                                                                            <td style=" text-align:left; height:30px ">
                                                                                <asp:Label ID="Label4" runat="server" ForeColor="Gray" meta:resourceKey="BoundFieldResource10" Text="版本："></asp:Label>
                                                                                <asp:Label ID="Label10" runat="server" meta:resourcekey="Label10Resource1" Text='<%#: Bind("MANUAL_VERSION") %>'></asp:Label>
                                                                            </td>
                                                                            <td style=" text-align:left;">
                                                                                <asp:Label ID="Label6" runat="server" ForeColor="Gray" meta:resourceKey="LabelStatusResource" Text="狀態："></asp:Label>
                                                                                <asp:Label ID="labDocStatus" runat="server" meta:resourcekey="labDocStatusResource1" Text='<%#: Bind("DOC_STATUS") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align:left; height:30px">&nbsp;&nbsp;
                                                                                <asp:Label ID="Label3" runat="server" ForeColor="Gray" meta:resourceKey="Label3Resource1" Text="公佈日："></asp:Label>
                                                                                <asp:Label ID="lblPublishDate" runat="server" meta:resourcekey="lblPublishDateResource1" Text='<%#: Bind("PUBLISH_DATE") %>'></asp:Label>
                                                                            </td>
                                                                            <td style=" text-align:left;">
                                                                                <asp:Label ID="Labela4" runat="server" ForeColor="Gray" meta:resourceKey="rdoActive2Resource1" Text="生效日："></asp:Label>
                                                                                <asp:Label ID="labActiveDay" runat="server" meta:resourcekey="labActiveDayResource1" Text='<%#: Bind("ACTIVE_DAY") %>'></asp:Label>
                                                                            </td>
                                                                            <td style=" text-align:left;">
                                                                                <asp:Label ID="Labela6" runat="server" ForeColor="Gray" meta:resourceKey="BoundFieldResource15" Text="過期日："></asp:Label>
                                                                                <asp:Label ID="labVoidDate" runat="server" meta:resourcekey="labVoidDateResource1" Text='<%#: Bind("INVALID_DAY") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="3" style=" text-align:left;">
                                                                                <table border="0">
                                                                                    <tr>
                                                                                        <td style="WIDTH: 75px; vertical-align:top">&nbsp;&nbsp;
                                                                                            <asp:Label ID="Label7" runat="server" ForeColor="Gray" meta:resourceKey="lblSummaryResource" Text="摘要："></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="labSummary" runat="server" meta:resourcekey="labSummaryResource1" Text='<%#: Bind("DOC_COMMENT") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" style="HEIGHT: 21px; text-align:right"></td>
                                                                            <td style="text-align:center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                <asp:Image ID="Image2" runat="server" EnableViewState="False" ImageUrl="~/DMS/images/inform.gif" meta:resourcekey="Image2Resource1" />
                                                                                <asp:LinkButton ID="lbtnInfo" runat="server" meta:resourceKey="lbtnInfoResource1" Text="資訊"></asp:LinkButton>
                                                                                &nbsp;&nbsp;
                                                                                <asp:Image ID="Image3" runat="server" EnableViewState="False" ImageUrl="~/DMS/images/LendProcess.gif" meta:resourcekey="Image3Resource1" />
                                                                                <asp:LinkButton ID="LinkButton2" runat="server" meta:resourceKey="LinkButton2Resource1" OnClick="LinkButton2_Click" Text="調閱"></asp:LinkButton>
                                                                                 <asp:Label ID="lblLendDoc" runat="server" meta:resourceKey="LinkButton2Resource1" Visible="false" Text="調閱"></asp:Label>
                                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </center>
                                                            <hr />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </Fast:Grid>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
            </telerik:RadPageView>
                  <telerik:RadPageView id="RadPageViewTwo" runat="server" meta:resourcekey="RadPageViewTwoResource1">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                            <telerik:RadToolBar ID="RadTBQuery" runat="server" Width="100%" OnButtonClick="RadTBQuery_ButtonClick" OnClientButtonClicking="RadTBQuery_ButtonClick" meta:resourcekey="RadTBQueryResource1" SingleClick="None">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource1">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text="匯出時間：" meta:resourcekey="LabelResource1"></asp:Label>
                                        </ItemTemplate>                                                     
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton  Value="radTBDateStart" runat="server" meta:resourcekey="RadToolBarButtonResource2" >
                                        <ItemTemplate>
                                            <telerik:RadDatePicker ID="rdDateStart" runat="server" meta:resourcekey="rdDateStartResource1"  >
                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" />
                                                    <DateInput LabelWidth="40%"  DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                                    <ClientEvents OnValueChanging="OnValueChanging" />
                                                    <EmptyMessageStyle Resize="None" />
                                                    <ReadOnlyStyle Resize="None" />
                                                    <FocusedStyle Resize="None" />
                                                    <DisabledStyle Resize="None" />
                                                    <InvalidStyle Resize="None" />
                                                    <HoveredStyle Resize="None" />
                                                    <EnabledStyle Resize="None" />
                                                </DateInput>
                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl=""/>
                                            </telerik:RadDatePicker>
                                                <asp:Label runat="server" Text="~" meta:resourcekey="LabelResource2"></asp:Label>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>    
                                    <telerik:RadToolBarButton Value="radTBDateEnd" runat="server" meta:resourcekey="RadToolBarButtonResource3">
                                        <ItemTemplate>
                                            <telerik:RadDatePicker ID="rdDateEnd" runat="server" meta:resourcekey="rdDateEndResource1"  >
                                                <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" />
                                                    <DateInput LabelWidth="40%"  DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                                    <ClientEvents OnValueChanging="OnValueChanging" />
                                                    <EmptyMessageStyle Resize="None" />
                                                    <ReadOnlyStyle Resize="None" />
                                                    <FocusedStyle Resize="None" />
                                                    <DisabledStyle Resize="None" />
                                                    <InvalidStyle Resize="None" />
                                                    <HoveredStyle Resize="None" />
                                                    <EnabledStyle Resize="None" />
                                                </DateInput>
                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl=""/>
                                            </telerik:RadDatePicker>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>    
                                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                                        Value="Search" Text="查詢" ToolTip="查詢" meta:resourcekey="RadToolBarButtonResource4" >
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource5" />
                                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                        Value="Delete" Text="刪除" ToolTip="刪除" meta:resourcekey="RadToolBarButtonResource6"  >
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource7"/>         
                                </Items>
                            </telerik:RadToolBar>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                              <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <Fast:Grid ID="gridExportExcelList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" OnPageIndexChanging="gridExportExcelList_PageIndexChanging"
                                            AutoGenerateColumns="False" OnRowDataBound="gridExportExcelList_RowDataBound" DefaultSortColumnName="CREATOR_DATE" Width="100%" Height="100%"
                                            EnhancePager="True" DataKeyNames="TASK_GUID" PageSize="15" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" 
                                            DefaultSortDirection="Descending" EmptyDataText="沒有資料" KeepSelectedRows="False" OnSorting="gridExportExcelList_Sorting" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="gridExportExcelListResource1" >
                                            <EnhancePagerSettings  ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                            <ExportExcelSettings AllowExportToExcel="False" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="匯出時間" SortExpression="CREATOR_DATE" meta:resourcekey="TemplateFieldResource8">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("CREATOR_DATE") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCreatorDate" runat="server" meta:resourcekey="lblCreatorDateResource1" ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="檔名" meta:resourcekey="TemplateFieldResource9">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("FILE_NAME") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:Image ID="imgIcon" ImageUrl="~/Common/Images/Icon/icon_m177.gif" runat="server" meta:resourcekey="imgIconResource1"/>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="hlFile" runat="server" meta:resourcekey="hlFileResource1"></asp:HyperLink>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="匯出者" SortExpression="CREATOR" meta:resourcekey="TemplateFieldResource10">                                                       
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCreator" runat="server" Text='<%#: Bind("CREATOR") %>' meta:resourcekey="lblCreatorResource1"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="狀態" SortExpression="EXPORT_STATUS" meta:resourcekey="TemplateFieldResource11">                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%#: Bind("EXPORT_STATUS") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource12">                                                      
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtnErrorMsg" runat="server" Text="訊息" Visible ="False" meta:resourcekey="lbtnErrorMsgResource1"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>  

    <asp:Label ID="labStatus" runat="server" Text="狀態" Visible="False" meta:resourcekey="lblDocStatus"></asp:Label>
    <asp:Label ID="lblDocNum" runat="server" meta:resourcekey="lblDocNumResource1" Text="文件編號" Visible="False"></asp:Label>
    <asp:Label ID="lblFormat" runat="server" meta:resourcekey="lblFormatResource1" Text="格式" Visible="False"></asp:Label>
    <asp:Label ID="lblDocName" runat="server" meta:resourcekey="lblDocNameResource2" Text="文件名稱" Visible="False"></asp:Label>
    <asp:Label ID="lblVersion" runat="server" meta:resourcekey="lblVersionResource1" Text="版本" Visible="False"></asp:Label>
    <asp:Label ID="lblUnit" runat="server" meta:resourcekey="lblUnitResource1" Text="發行單位" Visible="False"></asp:Label>
    <asp:Label ID="lblAuthor" runat="server" meta:resourcekey="lblAuthorResource2" Text="作者" Visible="False"></asp:Label>
    <asp:Label ID="lblPath" runat="server" Text="路徑" Visible="False" meta:resourcekey="lblPathResource"></asp:Label>
    <asp:Label ID="lblComment" runat="server" Text="摘要" Visible="False" meta:resourcekey="labSummaryResource"></asp:Label>
    <asp:Label ID="lblCreatetime" runat="server" Text="建立日"  meta:resourcekey="lblCreatetimeResource1" Visible ="False"></asp:Label>
    <asp:Label ID="lblPublishTime" runat="server" meta:resourcekey="lblPublishTimeResource1" Text="發佈時間" Visible="False"></asp:Label>
    <asp:Label ID="lblActiveDay" runat="server" meta:resourcekey="lblActiveDayResource1" Text="生效日" Visible="False"></asp:Label>
    <asp:Label ID="lblInvalidday" runat="server" meta:resourcekey="lblInvaliddayResource1" Text="過期日" Visible="False"></asp:Label>
    <asp:Label ID="lblActive" runat="server" meta:resourcekey="lblActiveResource1" Text="立即生效" Visible="False"></asp:Label>
    <asp:Label ID="lblNeverOverdue" runat="server" meta:resourcekey="lblNeverOverdueResource1" Text="永不過期" Visible="False"></asp:Label>
    <asp:Label ID="lblCheckin" runat="server" meta:resourcekey="lblCheckinResource1" Text="已存回" Visible="False"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" meta:resourcekey="lblCheckOutResource1" Text="已取出" Visible="False"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" meta:resourcekey="lblApprovalResource1" Text="審核中" Visible="False"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" meta:resourcekey="lblPublishResource1" Text="已公佈" Visible="False"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" meta:resourcekey="lblVoidResource1" Text="已作廢" Visible="False"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" meta:resourcekey="lblTempInactResource1" Text="已下架" Visible="False"></asp:Label>
    <asp:Label  ID="lblOldVer" runat="server" meta:resourcekey="lblOldVerResource1" Text="舊版本" Visible="False"></asp:Label>
    <asp:Label ID="lblReAct" runat="server" meta:resourcekey="lblReActResource1" Text="已上架" Visible="False"></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" meta:resourcekey="labDocDenyResource1" Text="發佈拒絕" Visible="False"></asp:Label>
    <asp:Label ID="labNoActive" runat="server" meta:resourcekey="labNoActiveResource1" Text="未生效" Visible="False"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" meta:resourcekey="lblInactiveResource1" Text="已失效" Visible="False"></asp:Label>
    <asp:Label ID="lblDocLink" runat="server" meta:resourcekey="lblDocLinkResource1" Text="文件連結" Visible="False"></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
    <asp:Label ID="lblDeleting" runat="server" Text="(銷毀審核中)" Visible="False" meta:resourcekey="lblDeletingResource1" ></asp:Label>
    <asp:Label ID="lblReader" runat="server" Text="讀者" Visible="False" meta:resourcekey="lblReaderResource1"></asp:Label>
    <asp:Label ID="lblUser" runat="server" Text="人員" Visible="False" meta:resourcekey="lblUserResource1"></asp:Label>
    <asp:Label ID="lblDep" runat="server" Text="部門" Visible="False" meta:resourcekey="lblDepResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="職級" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblFunction" runat="server" Text="職務" Visible="False" meta:resourcekey="lblFunctionResource1"></asp:Label>
    <asp:Label ID="lblGroup" runat="server" Text="外部群組" Visible="False" meta:resourcekey="lblGroupResource1"></asp:Label>
    <asp:Label ID="lblMember" runat="server" Text="外部人員" Visible="False" meta:resourcekey="lblMemberResource1"></asp:Label>
    <asp:Label ID="lblMemberClass" runat="server" Text="會員類別" Visible="False" meta:resourcekey="lblMemberClassResource1"></asp:Label>
    <asp:Label ID="lblConfirmSend" runat="server" Text="確定要發送訊息嗎?" Visible="False" meta:resourcekey="lblConfirmSendResource1"></asp:Label>
    <asp:Label ID="lblDocLend" runat="server" Text="文件調閱" Visible="False" meta:resourcekey="lblDocLendResource1" ></asp:Label>
    <asp:HiddenField ID="hfAuthor" runat="server" />
    <asp:HiddenField ID="hfFolder" runat="server" />    
    <asp:Button ID="btnPostBack" runat="server" Text="Button" OnClick="btnPostBack_Click" Style="display:none" meta:resourcekey="btnPostBackResource1" />
    <asp:Label ID="lblPrompt" runat="server" Text="報表匯出將進入系統排程，請於5分鐘後至[下載匯出報表]中下載" Visible="False" meta:resourcekey="lblPromptResource1"></asp:Label>
    <asp:Label ID="lblExportExcel" runat="server" Visible="False" Text="確定產生報表EXCEL檔案?" meta:resourcekey="lblExportExcelResource1"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Visible="False" Text="錯誤訊息" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" Visible="False" Text="成功" meta:resourcekey="lblSuccessResource1"></asp:Label>
    <asp:Label ID="lblFail" runat="server" Visible="False" Text="失敗" meta:resourcekey="lblFailResource1"></asp:Label>
    <asp:Label ID="lblProcess" runat="server" Visible="False" Text="處理中" meta:resourcekey="lblProcessResource1"></asp:Label>
    <asp:Label ID="lblStandBy" runat="server" Visible="False" Text="等待中" meta:resourcekey="lblStandByResource1"></asp:Label>
    <asp:Label ID="lblDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblDelconfirmResource1" ></asp:Label>
</asp:Content>
