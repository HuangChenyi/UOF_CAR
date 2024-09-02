<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Task_Default" CodeBehind="Default.aspx.cs" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .action:link {
            color: #003A8E !important;
            text-decoration: none;
        }

        .action:visited {
            color: #003A8E !important;
            text-decoration: none;
        }

        .action:hover {
            color: #252323 !important;
            text-decoration: underline;
        }

        div.RadGrid .rgPager .rgAdvPart {
            display: none;
        }
    </style>

    <div style="width: 100%; background-color: #ffffff">
        <telerik:RadButton ID="RadButton2" runat="server" Text="重新整理" OnClientClicked="function(){bindGrid();}" AutoPostBack="False" ButtonType="LinkButton" meta:resourcekey="RadButton2Resource1">
        </telerik:RadButton>
        <asp:Label ID="lblMemoryUsageWord" runat="server" Text="使用記憶體:MB" EnableViewState="False" meta:resourcekey="lblMemoryUsageWordResource1"></asp:Label>
        &nbsp;&nbsp;
            <asp:Label ID="lblErrorInfo" runat="server" Text="排程異常無法顯示內容，請至「系統管理→檢視事件」查看錯誤原因。" meta:resourcekey="lblErrorInfoResource1" ForeColor="Red"></asp:Label>
    </div>

    <div style="height: 1500px; display: block">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" EnableViewState="False" MultiPageID="RadMultiPage1" SelectedIndex="0">
            <Tabs>
                <telerik:RadTab Text="固定排程" meta:resourcekey="RadTabResource1"></telerik:RadTab>
                <telerik:RadTab Text="動態排程" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                <telerik:RadTab Text="文件轉檔排程" meta:resourcekey="RadTabResource3"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" EnableViewState="False">
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1" BackColor="#ffffff">
                <telerik:RadGrid ID="fixedGrid" EnableViewState="false" runat="server" GridLines="Both" AllowPaging="true" PageSize="25">
                    <ItemStyle Wrap="false"></ItemStyle>
                    <MasterTableView>
                        <Columns>
                            <telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" HeaderText="工作" meta:resourcekey="GridBoundColumnResource1">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MisfiredCount" HeaderText="忙碌次數" meta:resourcekey="GridBoundColumnResource2">
                            </telerik:GridBoundColumn>
                            <telerik:GridDateTimeColumn UniqueName="PreviousFireTime" DataField="PreviousFireTime" DataFormatString="{0:yyyy/MM/dd HH:mm}"
                                HeaderText="上次執行時間" meta:resourcekey="GridDateTimeColumnResource1">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridDateTimeColumn UniqueName="NextFireTime" DataField="NextFireTime" DataFormatString="{0:yyyy/MM/dd HH:mm}"
                                HeaderText="下次執行時間" meta:resourcekey="GridDateTimeColumnResource2">
                            </telerik:GridDateTimeColumn>
                            <telerik:GridTemplateColumn UniqueName="Action" HeaderText="操作" meta:resourcekey="GridTemplateColumnResource1">
                                <ClientItemTemplate>
                          <a class="action" href="javascript:OpenWindow('#=TypeName#')" meta:resourcekey="">執行記錄</a>
                                </ClientItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>

                    <ClientSettings>
                        <ClientEvents OnCommand="FixedGrid_Command" OnRowDataBound="grid_RowDataBound"></ClientEvents>
                    </ClientSettings>
                </telerik:RadGrid>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView2" BackColor="#ffffff">

                <div style="margin: 2px">
                    <div class="SizeL">
                        <asp:Label ID="Label2" runat="server" Text="等候中" meta:resourcekey="Label2Resource1"></asp:Label>
                    </div>
                    <telerik:RadGrid ID="dynamicQueueGrid" EnableViewState="false" runat="server" GridLines="Both" Width="100%" AllowPaging="true" PageSize="15">
                        <ItemStyle Wrap="false"></ItemStyle>
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" HeaderText="工作" meta:resourcekey="GridBoundColumnResource3">
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn UniqueName="Time" DataField="Time" DataFormatString="{0:yyyy/MM/dd HH:mm}"
                                    HeaderText="預計時間" meta:resourcekey="GridDateTimeColumnResource3">
                                </telerik:GridDateTimeColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <ClientEvents OnCommand="QueueGrid_Command" OnRowDataBound="grid_RowDataBound"></ClientEvents>
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
                <div style="margin: 2px">
                    <div class="SizeL">
                        <asp:Label ID="Label3" runat="server" Text="執行中" meta:resourcekey="Label3Resource1"></asp:Label>
                    </div>
                    <telerik:RadGrid ID="dynamicExecutingGrid" EnableViewState="false" runat="server" GridLines="Both" Width="100%">
                        <ItemStyle Wrap="false"></ItemStyle>
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" HeaderText="工作" meta:resourcekey="GridBoundColumnResource4">
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn UniqueName="Time" DataField="Time" DataFormatString="{0:yyyy/MM/dd HH:mm}"
                                    HeaderText="預計時間" meta:resourcekey="GridDateTimeColumnResource4">
                                </telerik:GridDateTimeColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <ClientEvents OnCommand="function(){}" OnRowDataBound="grid_RowDataBound"></ClientEvents>
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
                <div style="margin: 2px; clear: both">
                    <span class="SizeL">
                        <asp:Label ID="Label1" runat="server" Text="執行記錄" meta:resourcekey="Label1Resource1"></asp:Label></span>
                    <telerik:RadGrid ID="dynamicHistoryGrid" EnableViewState="false" runat="server" GridLines="Both" AllowPaging="true" PageSize="15">
                        <ItemStyle Wrap="false"></ItemStyle>
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" HeaderText="工作" meta:resourcekey="GridBoundColumnResource5">
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn UniqueName="StartTime" DataField="StartTime" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}"
                                    HeaderText="開始時間" meta:resourcekey="GridDateTimeColumnResource5">
                                </telerik:GridDateTimeColumn>
                                <telerik:GridDateTimeColumn UniqueName="EndTime" DataField="EndTime" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}"
                                    HeaderText="完成時間" meta:resourcekey="GridDateTimeColumnResource10">
                                </telerik:GridDateTimeColumn>
                                <telerik:GridBoundColumn UniqueName="State" DataField="State" HeaderText="狀態" meta:resourcekey="GridBoundColumnResource6">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <ClientEvents OnCommand="HistoryGrid_Command" OnRowDataBound="grid_RowDataBound"></ClientEvents>
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="RadPageView3" BackColor="#ffffff">
                <div style="margin: 2px; overflow: ">
                    <div class="SizeL">
                        <asp:Label ID="Label4" runat="server" Text="等候中" meta:resourcekey="Label2Resource1"></asp:Label>
                    </div>
                    <telerik:RadGrid ID="docQueueGrid" EnableViewState="false" runat="server" GridLines="Both" Width="100%">
                        <ItemStyle Wrap="false"></ItemStyle>
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" HeaderText="工作" meta:resourcekey="GridBoundColumnResource3">
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn UniqueName="Time" DataField="Time" DataFormatString="{0:yyyy/MM/dd HH:mm}"
                                    HeaderText="預計時間" meta:resourcekey="GridDateTimeColumnResource3">
                                </telerik:GridDateTimeColumn>
                                <telerik:GridBoundColumn UniqueName="ServiceUrl" DataField="ServiceUrl" HeaderText="ServiceUrl">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <ClientEvents OnCommand="function(){}" OnRowDataBound="grid_RowDataBound"></ClientEvents>
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
                <div style="margin: 2px">
                    <div class="SizeL">
                        <asp:Label ID="Label5" runat="server" Text="執行中" meta:resourcekey="Label3Resource1"></asp:Label>
                    </div>
                    <telerik:RadGrid ID="docExecutingGrid" EnableViewState="false" runat="server" GridLines="Both" Width="100%">
                        <ItemStyle Wrap="false"></ItemStyle>
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" HeaderText="工作" meta:resourcekey="GridBoundColumnResource4">
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn UniqueName="Time" DataField="Time" DataFormatString="{0:yyyy/MM/dd HH:mm}"
                                    HeaderText="預計時間" meta:resourcekey="GridDateTimeColumnResource4">
                                </telerik:GridDateTimeColumn>
                                <telerik:GridBoundColumn UniqueName="ServiceUrl" DataField="ServiceUrl" HeaderText="ServiceUrl">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <ClientEvents OnCommand="function(){}" OnRowDataBound="grid_RowDataBound"></ClientEvents>
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
                <div style="margin: 2px; clear: both">
                    <span class="SizeL">
                        <asp:Label ID="Label6" runat="server" Text="執行記錄" meta:resourcekey="Label1Resource1"></asp:Label></span>
                    <telerik:RadGrid ID="docHistoryGrid" EnableViewState="false" runat="server" GridLines="Both">
                        <ItemStyle Wrap="false"></ItemStyle>
                        <%--    <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ></Scrolling>
            </ClientSettings>--%>
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn UniqueName="TypeName" DataField="TypeName" HeaderText="工作" meta:resourcekey="GridBoundColumnResource5">
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn UniqueName="StartTime" DataField="StartTime" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}"
                                    HeaderText="開始時間" meta:resourcekey="GridDateTimeColumnResource5">
                                </telerik:GridDateTimeColumn>
                                <telerik:GridDateTimeColumn UniqueName="EndTime" DataField="EndTime" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}"
                                    HeaderText="完成時間" meta:resourcekey="GridDateTimeColumnResource10">
                                </telerik:GridDateTimeColumn>
                                <telerik:GridBoundColumn UniqueName="State" DataField="State" HeaderText="狀態" meta:resourcekey="GridBoundColumnResource6">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn UniqueName="ServiceUrl" DataField="ServiceUrl" HeaderText="ServiceUrl">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <ClientEvents OnCommand="function(){}" OnRowDataBound="grid_RowDataBound"></ClientEvents>
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </div>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadWindow ID="RadWindow1" runat="server" EnableViewState="False" Modal="True" Width="500" Height="500" Behaviors="Close, Resize,Maximize">
        <ContentTemplate>
            <telerik:RadGrid ID="historyGrid" EnableViewState="false" runat="server" GridLines="Both" Height="100%">
                <ItemStyle Wrap="false"></ItemStyle>
                <MasterTableView>
                    <Columns>
                        <telerik:GridDateTimeColumn UniqueName="StartTime" DataField="StartTime" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}"
                            HeaderText="開始時間" meta:resourcekey="GridDateTimeColumnResource7">
                        </telerik:GridDateTimeColumn>
                        <telerik:GridDateTimeColumn UniqueName="EndTime" DataField="EndTime" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}"
                            HeaderText="完成時間" meta:resourcekey="GridDateTimeColumnResource6">
                        </telerik:GridDateTimeColumn>
                        <telerik:GridBoundColumn UniqueName="State" DataField="State" HeaderText="狀態" meta:resourcekey="GridBoundColumnResource7">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                <ClientSettings>
                    <ClientEvents OnCommand="function(){}" OnRowDataBound="historyGrid_RowDataBound"></ClientEvents>
                </ClientSettings>
            </telerik:RadGrid>
        </ContentTemplate>
    </telerik:RadWindow>



    <script type="text/javascript">
        var jobcount;
        var queuecount;
        var logcount;
        function pageLoad(sender, eventArgs) {


            //   $find("<%= RadAjaxLoadingPanel1.ClientID %>").show("<%= fixedGrid.ClientID %>");


            bindGrid();

        }


        function bindGrid() {
            //先關掉錯誤提示
            var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
            lblErrorInfo.hide();
            var lblMemoryUsageWord = $("#<%=lblMemoryUsageWord.ClientID %>");
            $uof.pageMethod.async("GetJobByPage", [0, 25], updateFixedGrid);
            $uof.pageMethod.async("GetJobDynamic", ["executing"], updateDynamicExecutingGrid);
            $uof.pageMethod.async("GetJobDynamicByPage", ["queue", 0, 15], updateDynamicQueueGrid);
            $uof.pageMethod.async("GetJobDynamicByPage", ["history", 0, 15], updateDynamicHistoryGrid);
            setTimeout(function () {

                // $uof.pageMethod.async("GetJobDynamic", ["queue"], updateDynamicQueueGrid2);

                $uof.pageMethod.async("GetMemoryUsage", [], function (result) {
                    lblMemoryUsageWord.text(String.format('<%=lbMemoryUsage.Text%>', result));
                });
            }, 1500);

            setTimeout(function () {
                // doc engine
                $uof.pageMethod.async("GetDocJob", ["queue"], updateDocQueueGrid);
                $uof.pageMethod.async("GetDocJob", ["executing"], updateDocExecutingGrid);
                $uof.pageMethod.async("GetDocJob", ["history"], updateDocHistoryGrid);
            }, 2000);
        }


        function updateGrid(result) {

            //紀錄拋出的錯誤訊息
            if (result == "error") {
                var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
                lblErrorInfo.show();
            }

            var data = $uof.json.toObject(result);

            tableView.set_dataSource(data);
            tableView.dataBind();
        }




        function updateHistoryGrid(result) {

            //紀錄拋出的錯誤訊息
            if (result == "error") {
                var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
                lblErrorInfo.show();
            }
            var data = $uof.json.toObject(result);

            var tableView = $find("<%= historyGrid.ClientID %>").get_masterTableView();
            tableView.set_dataSource(data);
            tableView.dataBind();

            //  $find("<%= RadAjaxLoadingPanel1.ClientID %>").hide("<%= historyGrid.ClientID %>");
        }

        function FixedGrid_Command(sender, args) {
            args.set_cancel(true);

            var currentPageIndex = sender.get_masterTableView().get_currentPageIndex();
            var pageSize = sender.get_masterTableView().get_pageSize();

            if (currentPageIndex > 0) {
                sender.get_masterTableView().set_currentPageIndex(currentPageIndex);
            }
            $uof.pageMethod.async("GetJobByPage", [currentPageIndex, pageSize], updateFixedGrid);
        }

        function QueueGrid_Command(sender, args) {
            args.set_cancel(true);

            var currentPageIndex = sender.get_masterTableView().get_currentPageIndex();
            var pageSize = sender.get_masterTableView().get_pageSize();

            if (currentPageIndex > 0) {
                sender.get_masterTableView().set_currentPageIndex(currentPageIndex);
            }
            $uof.pageMethod.async("GetJobDynamicByPage", ["queue", currentPageIndex, pageSize], updateDynamicQueueGrid);
        }

        function HistoryGrid_Command(sender, args) {
            args.set_cancel(true);

            var currentPageIndex = sender.get_masterTableView().get_currentPageIndex();
            var pageSize = sender.get_masterTableView().get_pageSize();

            if (currentPageIndex > 0) {
                sender.get_masterTableView().set_currentPageIndex(currentPageIndex);
            }
            $uof.pageMethod.async("GetJobDynamicByPage", ["history", currentPageIndex, pageSize], updateDynamicHistoryGrid);
        }

        function grid_RowDataBound(sender, args) {
            var typeName = args.get_dataItem()["TypeName"];

            $(args.get_item().get_cell("TypeName")).text(_typeDescripts[typeName]);
            $(args.get_item().get_cell("Action")).find("a").text("<%=lbHistory.Text%>");

            var state = args.get_dataItem()["State"];
            if (state == "") {
                $(args.get_item().get_cell("State")).text("<%=lbNormal.Text%>");
            }
        }

        function historyGrid_RowDataBound(sender, args) {
            var state = args.get_dataItem()["State"];
            if (state == "") {
                $(args.get_item().get_cell("State")).text("<%=lbNormal.Text%>");
            }
        }

        function OpenWindow(typeName) {

            var RadWindow = $find("<%=RadWindow1.ClientID%>");

            // $find("<%= RadAjaxLoadingPanel1.ClientID %>").show("<%= historyGrid.ClientID %>");


            $uof.pageMethod.async("GetJobHistory", [typeName], updateHistoryGrid);

            RadWindow.show();

        }

        function updateFixedGrid(result) {
            //紀錄拋出的錯誤訊息
            if (result == "error") {
                var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
                lblErrorInfo.show();
            }

            var data = $uof.json.toObject(result);

            var tableView = $find("<%= fixedGrid.ClientID %>").get_masterTableView();
            tableView.set_dataSource(data);
            if (data.length > 0) {
                jobcount = data[0]['ItemCount'];
            }
            tableView.dataBind();
            tableView.set_virtualItemCount(jobcount);

        }

        function updateDynamicQueueGrid(result) {

            //紀錄拋出的錯誤訊息
            if (result == "error") {
                var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
                lblErrorInfo.show();
            }

            var data = $uof.json.toObject(result);

            var tableView = $find("<%= dynamicQueueGrid.ClientID %>").get_masterTableView();
            tableView.set_dataSource(data);
            if (data.length > 0) {
                queuecount = data[0]['ItemCount'];
            }
            tableView.dataBind();
            tableView.set_virtualItemCount(queuecount);

        }

        function updateDynamicExecutingGrid(result) {

            //紀錄拋出的錯誤訊息
            if (result == "error") {
                var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
                lblErrorInfo.show();
            }

            var data = $uof.json.toObject(result);

            var tableView = $find("<%= dynamicExecutingGrid.ClientID %>").get_masterTableView();
            tableView.set_dataSource(data);
            tableView.dataBind();
        }

        function updateDynamicHistoryGrid(result) {

            //紀錄拋出的錯誤訊息
            if (result == "error") {
                var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
                lblErrorInfo.show();
            }

            var data = $uof.json.toObject(result);
            if (data.length > 0) {
                logcount = data[0]['ItemCount'];
            }
            var tableView = $find("<%= dynamicHistoryGrid.ClientID %>").get_masterTableView();
            tableView.set_dataSource(data);
            tableView.dataBind();
            tableView.set_virtualItemCount(logcount);
        }

        function updateDocQueueGrid(result) {

            //紀錄拋出的錯誤訊息
            if (result == "error") {
                var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
                lblErrorInfo.show();
            }

            var data = $uof.json.toObject(result);

            var tableView = $find("<%= docQueueGrid.ClientID %>").get_masterTableView();
            tableView.set_dataSource(data);
            tableView.dataBind();
        }

        function updateDocExecutingGrid(result) {

            //紀錄拋出的錯誤訊息
            if (result == "error") {
                var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
                lblErrorInfo.show();
            }

            var data = $uof.json.toObject(result);

            var tableView = $find("<%= docExecutingGrid.ClientID %>").get_masterTableView();
            tableView.set_dataSource(data);
            tableView.dataBind();
        }

        function updateDocHistoryGrid(result) {

            //紀錄拋出的錯誤訊息
            if (result == "error") {
                var lblErrorInfo = $("#<%=lblErrorInfo.ClientID %>");
                lblErrorInfo.show();
            }

            var data = $uof.json.toObject(result);

            var tableView = $find("<%= docHistoryGrid.ClientID %>").get_masterTableView();
            tableView.set_dataSource(data);
            tableView.dataBind();
        }

    </script>
    <asp:Label ID="lbHistory" runat="server" Text="執行記錄" EnableViewState="False" Visible="False" meta:resourcekey="lbHistoryResource1"></asp:Label>
    <asp:Label ID="lbNormal" runat="server" Text="正常" EnableViewState="False" Visible="False" meta:resourcekey="lbNormalResource1"></asp:Label>
    <asp:Label ID="lbMemoryUsage" runat="server" Text="使用記憶體: {0} MB" EnableViewState="False" Visible="False" meta:resourcekey="lbMemoryUsageResource1"></asp:Label>
</asp:Content>
