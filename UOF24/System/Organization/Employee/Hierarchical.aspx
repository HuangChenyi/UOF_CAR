<%@ Page Title="部門人員管理" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="System_Organization_Employee_Hierarchical" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Hierarchical.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../../Common/Organization/Hierarchical_Department.ascx" TagName="Hierarchical_Department" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">

        $(function () {

            var conDiv = $("#ContentDIV");
            if (conDiv) {
                conDiv.css("overflow", "auto");
                conDiv.height($("body").height() - 180);
            }
        }
        )

        function RadToolBar1_HR_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            //var tree = igtree_getTreeById('<%=HRDepartmentTree.TreeClientId%>');
            var keywordCid = '#<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hftxtClientID.Value,true)%>';
            var groupCid = '#<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hfddlClientID.Value,true)%>';
            var tree = $find('<%=HRDepartmentTree.TreeClientId%>');
            $("#<%=doEndRequestHandler.ClientID%>").val("do");
            if (Key === "AddEmployee") {
                var groupObj = $(groupCid);
                var m_groupId = groupObj.val();
                var node = tree.get_selectedNode();

                if (node !== null) {
                    var groupId = node.get_value();
                    var groupName = node.get_text();
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/Organization/Employee/Add.aspx", args.get_item(), "", 720, 768, OpenDialogResult, { "Groupid": groupId, "Groupname": groupName, "m_groupId": m_groupId });
                }
            }
            else if (Key === "DelEmployee") {
                if (confirm('<%=lbConfirmDelete.Text %>') === false) {
                args.set_cancel(true);
            }
        }
        else if (Key === "DepManage") {
                var groupObj = $(groupCid);
            var m_groupId = groupObj.val();
            var node = tree.get_selectedNode();
            var groupId = null;
            if (node !== null) {
                groupId = node.get_value();
            }

            args.set_cancel(true);
            $uof.dialog.open2("~/System/Organization/Department/HierarchicalDepartment.aspx", args.get_item(), "", 600, 600, OpenDeptDialogResult, { "groupId": m_groupId, "focusNode": groupId });
        }
        else if (Key === "EmpMove") {
                var groupObj = $(groupCid);
            var m_groupId = groupObj.val();
            var node = tree.get_selectedNode();
            if (node !== null) {
                var groupId = node.get_value();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Department/HierarchicalEmployee.aspx", args.get_item(), "", 600, 600, OpenDialogResult, { "Groupid": groupId, "m_groupId": m_groupId });
                }
            }
            else if (Key === "Search") {                
                var keyword = $(keywordCid).val();
                if (keyword === "") {
                    alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                    args.set_cancel(true);
                }
            }
            else if (Key === "ExportEmployeeExcel") {                
                var groupObj = $(groupCid);
                var groupId = groupObj.val();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/ExportEmployeeExcelHierarchical.aspx", args.get_item(), "", 600, 500, OpenDialogResult, { "groupId": groupId });
            }
            else if (Key === "Search_dep") {
                var groupObj = $(groupCid);
                var groupId = groupObj.val();                
                var keyword = $(keywordCid).val();
                if (keyword === "") {
                    if (confirm("<% =lblKeyWordNeeded.Text %>")) {
                        args.set_cancel(true);
                        $uof.dialog.open2("~/System/Organization/Employee/SearchDepartmentHierarchical.aspx", args.get_item(), "", 900, 550, OpenSearchDepResult, { "keyword": keyword, "groupId": groupId });
                    }
                    else {
                        args.set_cancel(true);
                    }
                }
                else {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/Organization/Employee/SearchDepartmentHierarchical.aspx", args.get_item(), "", 900, 550, OpenSearchDepResult, { "keyword": keyword, "groupId": groupId });
                }
            }
            else if (Key === "ImportDutySettType") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/ImportDutySettTypeData.aspx", args.get_item(), '<%=lblUpdateDutySettTypeDataTitle.Text%>', 600, 500, OpenDialogResult, { "groupId": groupId });

            }
            else if (Key === "ImportTimeZone") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/ImportTimeZoneData.aspx", args.get_item(), '<%=lblUpdateTimeZoneDialogTitle.Text%>', 600, 500, OpenDialogResult, { "isGroupMgt": false });
            }
            else if (Key == "ImportCardNbr") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/ImportCardNbrData.aspx", args.get_item(), '<%=lblUpdateCardNBRDialogTitle.Text%>', 600, 500, OpenDialogResult, OpenDialogResult);
            }
        }
        function resizeHRTree(X, Y) {

            var tree = $find("<%=HRDepartmentTree.TreeClientId %>");
            var control = $("#<%=HRDepartmentTree.DisplayActiveControlClientId %>").is(':visible');

            tree.get_element().style.overflow = "auto";
            if (control) {
                tree.get_element().style.height = (Y - 45) + "px";
            }
            else {
                tree.get_element().style.height = (Y - 25) + "px";
            }
            tree.get_element().style.width = (X) + "px";

            $("#<%=leftX.ClientID%>").val(X);
            $("#<%=leftY.ClientID%>").val(Y);
        }
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function EndRequestHandler(sender, args) {
            if ($("#<%=doEndRequestHandler.ClientID%>").val() === "") {
                return;
            }

            //display scroll bar
            window.setTimeout(function () { resizeHRTree($("#<%=leftX.ClientID%>").val(), $("#<%=leftY.ClientID%>").val()); }, 500);

            //call tree node.scrollIntoView()
            window.setTimeout(function () {
                var tree = $find("<%= this.HRDepartmentTree.TreeClientId %>");
                var selectedNode = tree.get_selectedNode();

                if (selectedNode !== null) {
                    selectedNode.scrollIntoView();
                }
            }, 500);

            $("#<%=doEndRequestHandler.ClientID%>").val("");
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) === '' || returnValue === null) {
                return false;
            }
            else {
                return true;
            }
        }

        function OpenDeptDialogResult(returnValue)
        {
            if (typeof (returnValue) !== 'undefined' && returnValue !== null) {
                __doPostBack('ctl00$ctl00$ContentPlaceHolder1$LeftContentPlaceHolder$LinkButton2', '');
            }
            else {
                return false;
            }
        }
        function OpenSearchDepResult(returnValue)
        {
            if (typeof (returnValue) === '' || returnValue === null) {
                return false;
            }
            else {

                var deptId = returnValue;
                var tree = $find('<%=this.HRDepartmentTree.TreeClientId %>');
                var node = tree.findNodeByValue(deptId);
                if (node) {
                    node.select();
                    $("#<%=doEndRequestHandler.ClientID%>").val("do");
                }
                return true;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick"
        OnClientButtonClicking="RadToolBar1_HR_ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="Dept" meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="可管理部門：" meta:resourcekey="TBLabelResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"
                                    meta:resourcekey="ddlDepartmentResource1">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s1" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m01.png"
                ImageUrl="~/Common/Images/Icon/icon_m01.png" Value="DepManage" CheckedImageUrl="~/Common/Images/Icon/icon_m01.png"
                Text="部門管理" ToolTip="部門管理" meta:resourcekey="TBarButtonResource14">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s2" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m17.png"
                ImageUrl="~/Common/Images/Icon/icon_m17.png" Value="AddEmployee" CheckedImageUrl="~/Common/Images/Icon/icon_m17.png"
                Text="新增人員" ToolTip="新增人員" meta:resourcekey="TBarButtonResource15">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s3" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m26.gif"
                ImageUrl="~/Common/Images/Icon/icon_m26.gif" Value="EmpMove" CheckedImageUrl="~/Common/Images/Icon/icon_m26.gif"
                Text="人員搬移" ToolTip="人員搬移" meta:resourcekey="TBarButtonResource16">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s4" meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif" Value="DelEmployee" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                Text="刪除人員" ToolTip="刪除選取人員" meta:resourcekey="TBarButtonResource17">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s5" meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Keyword" meta:resourcekey="RadToolBarButtonResource7">
                <ItemTemplate>
                    <asp:TextBox ID="tbxKeyword" runat="server" meta:resourcekey="tbxKeywordResource1"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Value="Search" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="搜尋人員" ToolTip="搜尋人員"
                meta:resourcekey="TBarButtonResource20">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m64.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m64.gif" ImageUrl="~/Common/Images/Icon/icon_m64.gif"
                Value="Search_dep" CheckedImageUrl="~/Common/Images/Icon/icon_m64.gif" Text="搜尋部門" ToolTip="搜尋部門"
                meta:resourcekey="TBarButtonResource21">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s6" meta:resourcekey="RadToolBarButtonResource8">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarDropDown runat="server" Text="進階" ToolTip="進階" meta:resourcekey="RadToolBarDropDownResource1" DropDownWidth="200px">
                <Buttons>
                    <telerik:RadToolBarButton Text="匯出人員" runat="server" ImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        Value="ExportEmployeeExcel" ToolTip="匯出人員" meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Text="批次更新期別" runat="server" ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        Value="ImportDutySettType" ToolTip="批次更新期別" meta:resourcekey="RadToolBarImportDutySettTypeResource12">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Text="批次更新時區" runat="server" ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        Value="ImportTimeZone" ToolTip="批次更新時區" meta:resourcekey="RadToolBarImportTimeZoneButtonResource11">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Text="批次匯入卡號工號" runat="server" ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        Value="ImportCardNbr" ToolTip="批次匯入卡號工號" meta:resourcekey="RadToolBarButtonResource11" >
                    </telerik:RadToolBarButton>
                </Buttons>
            </telerik:RadToolBarDropDown>
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:Hierarchical_Department ID="HRDepartmentTree" runat="server" Width="300px" Height="600px" DisplayActiveControl="true"/>

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" meta:resourcekey="LinkButton2Resource1"></asp:LinkButton>
    <asp:HiddenField ID="leftX" runat="server" />
    <asp:HiddenField ID="leftY" runat="server" />

    <asp:HiddenField ID="doEndRequestHandler" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="padding-bottom: 5px; padding-top: 5px; padding-left: 5px;">
                <asp:CheckBox ID="cbOnlyAvailable" runat="server" Text="顯示停用及帳號到期人員" AutoPostBack="True" meta:resourcekey="cbOnlyAvailableResource1" />
            </div>
            
            <asp:HiddenField ID="hideSource" runat="server" />
            <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False" DataKeyNames="USER_GUID" DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EnhancePager="True" OnPageIndexChanging="Grid1_PageIndexChanging"
                OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" PageSize="15" Width="100%"
                EmptyDataText="沒有資料" KeepSelectedRows="False"
                meta:resourcekey="Grid1Resource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""   >
                <EnhancePagerSettings
                    ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="帳號" meta:resourceKey="TemplateFieldResource1" ShowHeader="False"
                        SortExpression="ACCOUNT">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" meta:resourceKey="LinkButton1Resource1"
                                OnClick="LinkButton1_Click" Text='<%# Eval("ACCOUNT") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="網域" SortExpression="DOMAIN_NICKNAME" meta:resourceKey="DomainTemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayDomainName" runat="server" Text='<%# Bind("DOMAIN_NICKNAME") %>' meta:resourcekey="lblDisplayDomainNameResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="名稱" meta:resourceKey="BoundFieldResource1"
                        SortExpression="NAME">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="帳號鎖定" meta:resourceKey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblLock" runat="server" meta:resourceKey="lblLockResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="EXPIRE_DATE" DataFormatString="{0:d}" HeaderText="到期日"
                        HtmlEncode="False" meta:resourceKey="BoundFieldResource4" SortExpression="EXPIRE_DATE">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" meta:resourceKey="BoundFieldResource3"
                        SortExpression="EMAIL">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="部門主管" meta:resourceKey="TemplateFieldResource3" SortExpression="SUPERIOR">
                        <ItemTemplate>
                            <asp:Label ID="lblSuperior" runat="server" meta:resourceKey="lblSuperiorResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="簽核人員" meta:resourceKey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblSigner" runat="server" meta:resourceKey="lblSignerResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="OPTION1" HeaderText="OPTION1" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OPTION2" HeaderText="OPTION2" meta:resourcekey="BoundFieldResource5">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OPTION3" HeaderText="OPTION3" meta:resourcekey="BoundFieldResource6">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OPTION4" HeaderText="OPTION4" meta:resourcekey="BoundFieldResource7">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OPTION5" HeaderText="OPTION5" meta:resourcekey="BoundFieldResource8">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OPTION6" HeaderText="OPTION6" meta:resourcekey="BoundFieldResource9">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnHR" runat="server" CausesValidation="False" CommandName="lbtnHR"
                                meta:resourcekey="lbtnHRResource1" OnClick="lbtnHR_Click" Text="人事資料"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbtnChange" runat="server" CausesValidation="False" CommandName="lbtnChange"
                                meta:resourcekey="lbtnChangeResource1" Text="異動記錄"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label runat="server" ID="lbYes" Text="是" Visible="False" meta:resourcekey="lbYesResource1"></asp:Label>
    <asp:Label runat="server" ID="lbNo" Text="否" Visible="False" meta:resourcekey="lbNoResource1"></asp:Label>
    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblKeyWordNeeded" runat="server" Text="請輸入關鍵字，確定要繼續搜尋？" Visible="False" meta:resourcekey="lblKeyWordNeededResource1"></asp:Label>
    <asp:Label ID="LabelScrollable" runat="server" Text="1" Visible="False" meta:resourcekey="LabelScrollableResource1"></asp:Label>
    <asp:HiddenField runat="server" ID="hfddlClientID"></asp:HiddenField>
    <asp:HiddenField runat="server" ID="hftxtClientID"></asp:HiddenField>
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="內部組織結構列表" Visible="False"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblUpdateTimeZoneDialogTitle" runat="server" Text="批次更新時區資料" Visible="False" meta:resourcekey="lblUpdateTimeZoneDialogTitleResource1"></asp:Label>
    <asp:Label ID="lblUpdateDutySettTypeDataTitle" runat="server" Text="批次更新期別資料" Visible="False" meta:resourcekey="lblUpdateDutySettTypeDataTitleResource1"></asp:Label>
    <asp:Label ID="lblUpdateCardNBRDialogTitle" runat="server" Text="批次更新卡號工號資料" Visible="False" meta:resourcekey="lblUpdateCardNBRDialogTitleResource1" ></asp:Label>

</asp:Content>

