<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="System_Organization_Employee_Default" Title="內部員工維護"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="../../../Common/Organization/DepartmentTree.ascx" TagName="DepartmentTree" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">

        function RadToolBar1_Employee_ButtonClicking(sender, args) {
            //Add code to handle your event here.
            var tree = $find('<%=DepartmentTree1.TreeClientId%>');
            var Key = args.get_item().get_value();
            var button = args.get_item();
            $("#<%=doEndRequestHandler.ClientID%>").val("do");

            if (Key === "AddEmployee") {
                var node = tree.get_selectedNode();
                if (node !== null) {
                    var groupId = node.get_value();
                    var groupName = node.get_text();

                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/Organization/Employee/Add.aspx", args.get_item(), "", 750, 768, OpenDialogResult, { "Groupid": groupId, "Groupname": groupName });
                }
            } else if (Key === "DelEmployee") {
                if (confirm('<%=lbConfirmDelete.Text %>') === false) {
                    args.set_cancel(true);
                }
            } else if (Key === "DepManage") {

                var node = tree.get_selectedNode();
                if (node !== null)
                    var groupId = node.get_value();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Department/ManageDepartment.aspx", args.get_item(), "", 600, 600, OpenDeptDialogResult, { "focusNode": groupId });

            } else if (Key === "EmpMove") {
                var node = tree.get_selectedNode();
                if (node !== null) {
                    var groupId = node.get_value();
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/Organization/Department/ManageEmployee.aspx", args.get_item(), "", 600, 600, OpenDialogResult, { "Groupid": groupId });

                }

            } else if (Key === "ImportEmployee") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/ImportEmployee.aspx", args.get_item(), "", 700, 350, OpenDialogResult);

            } else if (Key === "ImportADEmployee") {
                var node = tree.get_selectedNode();
                if (node !== null) {
                    var groupId = node.get_value();
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/AD/ImportUser.aspx", args.get_item(), "", 1024, 600, OpenDialogResult, { "UserType": "Employee", "Groupid": groupId });

                }
            } else if (Key === "Search") {
                var cid = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hdnKeywordId.Value,true)%>');
                var keyword = $("#" + cid).val();

                if (keyword === "") {
                    alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                    args.set_cancel(true);
                }

            } else if (Key === "Search_dep") {
                var cid = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hdnKeywordId.Value,true)%>');
                var keyword = $("#" + cid).val();

                if (keyword === "") {
                    if (confirm("<% =lblKeyWordNeeded.Text %>")) {
                        args.set_cancel(true);
                        $uof.dialog.open2("~/System/Organization/Employee/SearchDepartment.aspx", args.get_item(), "", 900, 550, OpenSearchDeptResult, { "keyword": keyword });

                    } else {
                        args.set_cancel(true);
                    }
                } else {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/Organization/Employee/SearchDepartment.aspx", args.get_item(), "", 900, 550, OpenSearchDeptResult, { "keyword": keyword });
                }
            } else if (Key === "ExportEmployeeExcel") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/ExportEmployeeExcel.aspx", args.get_item(), "", 600, 500, OpenDialogResult);

            } else if (Key === "SendPw") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/NeverLoginUser.aspx", args.get_item(), "", 1024, 550, OpenDialogResult, { "UserType": "Employee" });

            } else if (Key === "SetProxy") {
                var node = tree.get_selectedNode();
                var groupId = node.get_value();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/SetProxy.aspx", args.get_item(), "", 400, 200, OpenDialogResult, { "Groupid": groupId });
            }
            else if (Key === "ImportTimeZone") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/ImportTimeZoneData.aspx", args.get_item(), '<%=lblUpdateTimeZoneDialogTitle.Text%>', 600, 500, OpenDialogResult);
            }
        }

        function resizeTree(X, Y) {
            var tree = $find("<%=DepartmentTree1.TreeClientId %>");
            var control = $("#<%=DepartmentTree1.DisplayActiveControlClientId %>").is(':visible');
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
            window.setTimeout(function () { resizeTree($("#<%=leftX.ClientID%>").val(), $("#<%=leftY.ClientID%>").val()); }, 500);

            //call tree node.scrollIntoView()
            window.setTimeout(function () {
                var tree = $find("<%= this.DepartmentTree1.TreeClientId %>");
                var selectedNode = tree.get_selectedNode();

                if (selectedNode !== null) {
                    selectedNode.scrollIntoView();
                }
            }, 500);

            $("#<%=doEndRequestHandler.ClientID%>").val("");
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) === '' || returnValue === null)
                return false;
            else
                return true;
        }

        function OpenDeptDialogResult(returnValue) {
            if (typeof (returnValue) !== 'undefined' && returnValue !== null) {
                __doPostBack("ctl00$ctl00$ContentPlaceHolder1$LeftContentPlaceHolder$LinkButton2", "");
              
            }
            else {
                return false;
            }
        }
        function OpenSearchDeptResult(returnValue) {
            if (typeof (returnValue) === '' || returnValue === null) {
                return false;
            }
            else {

                var deptId = returnValue;
                var tree = $find('<%=this.DepartmentTree1.TreeClientId %>');
                var node = tree.findNodeByValue(deptId);
                if (node) {
                    node.select();
                    $("#<%=doEndRequestHandler.ClientID%>").val("do");
                }
                return true;
            }
        }

    </script>
     <style type="text/css">
    .LeftPaneTitle
    {
       white-space:nowrap !important;
       text-transform:capitalize;
    }

    .cbOnlyAvailableClass{
        padding-top:2px;
        padding-bottom:2px;
    }


     </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick"
        OnClientButtonClicking="RadToolBar1_Employee_ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m01.png"
                ImageUrl="~/Common/Images/Icon/icon_m01.png" Value="DepManage" meta:resourcekey="TBarButtonResource14"
                CheckedImageUrl="~/Common/Images/Icon/icon_m01.png" Text="部門管理" ToolTip="部門管理">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s1" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m17.png"
                ImageUrl="~/Common/Images/Icon/icon_m17.png" Value="AddEmployee" meta:resourcekey="TBarButtonResource15"
                CheckedImageUrl="~/Common/Images/Icon/icon_m17.png" Text="新增人員" ToolTip="新增人員">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s2" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m26.gif"
                ImageUrl="~/Common/Images/Icon/icon_m26.gif" Value="EmpMove" meta:resourcekey="TBarButtonResource16"
                CheckedImageUrl="~/Common/Images/Icon/icon_m26.gif" Text="人員搬移" ToolTip="人員搬移">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s3" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif" Value="DelEmployee" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                meta:resourcekey="TBarButtonResource17" Text="刪除人員" ToolTip="刪除人員">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s4" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Keyword" meta:resourcekey="RadToolBarButtonResource5">
                <ItemTemplate>
                    <asp:TextBox ID="txtKeyword" runat="server" Width="120px" meta:resourcekey="txtKeywordResource1"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Value="Search" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="TBarButtonResource20"
                Text="搜尋人員" ToolTip="搜尋人員">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m64.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m64.gif" ImageUrl="~/Common/Images/Icon/icon_m64.gif"
                Value="Search_dep" CheckedImageUrl="~/Common/Images/Icon/icon_m64.gif" meta:resourcekey="TBarButtonResource21"
                Text="搜尋部門" ToolTip="搜尋部門">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="s8" meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarDropDown runat="server" Text="進階" ToolTip="進階" meta:resourcekey="RadToolBarDropDownResource1" DropDownWidth="200px">
                <Buttons>
                    <telerik:RadToolBarButton Text="匯入人員" runat="server" ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        Value="ImportEmployee" ToolTip="匯入人員" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Text="匯入AD人員" runat="server" ImageUrl="~/Common/Images/Icon/icon_m34.gif"
                        Value="ImportADEmployee" ToolTip="匯入AD人員" meta:resourcekey="RadToolBarButtonResource8">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Text="匯出人員" runat="server" ImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        Value="ExportEmployeeExcel" ToolTip="匯出人員" meta:resourcekey="RadToolBarButtonResource9">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Text="設定Proxy" runat="server" ImageUrl="~/Common/Images/Icon/icon_m69.gif"
                        Value="SetProxy" ToolTip="設定Proxy" meta:resourcekey="RadToolBarButtonResource11">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Text="發送密碼" runat="server" ImageUrl="~/Common/Images/Icon/icon_m33.gif"
                        Value="SendPw" ToolTip="發送密碼" meta:resourcekey="RadToolBarButtonResource10">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton Text="批次更新時區資料" runat="server" ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        Value="ImportTimeZone" ToolTip="批次更新時區資料" meta:resourcekey="RadToolBarImportTimeZoneButtonResource11">
                    </telerik:RadToolBarButton>
                </Buttons>
            </telerik:RadToolBarDropDown>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="seqProxy" meta:resourcekey="RadToolBarButtonResource12">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional" >
        <ContentTemplate>
            <uc1:DepartmentTree ID="DepartmentTree1" runat="server" Height="500px" Width="300px" DisplayActiveControl="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" meta:resourcekey="LinkButton2Resource1"></asp:LinkButton>

    <asp:HiddenField ID="leftX" runat="server" />
    <asp:HiddenField ID="leftY" runat="server" />

    <asp:HiddenField ID="doEndRequestHandler" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <div style="padding-bottom: 5px; padding-top: 5px; padding-left: 5px;">
                <asp:CheckBox ID="cbOnlyAvailable" runat="server" Text="顯示停用及帳號到期人員" AutoPostBack="True" meta:resourcekey="cbOnlyAvailableResource1" />
            </div>
            
            <asp:HiddenField ID="hideSource" runat="server" />
            <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" CustomDropDownListPage="False" DataKeyNames="USER_GUID" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource3" OnPageIndexChanging="Grid1_PageIndexChanging" OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%">
                <enhancepagersettings firstaltimageurl="" firstimageurl="" lastaltimage="" lastimageurl="" nextialtimageurl="" nextimageurl="" pageinfocssclass="" pagenumbercssclass="" pagenumbercurrentcssclass="" pageredirectcssclass="" previousaltimageurl="" previousimageurl="" showheaderpager="True" />
                <exportexcelsettings allowexporttoexcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="帳號" meta:resourceKey="TemplateFieldResource1" ShowHeader="False" SortExpression="ACCOUNT">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" meta:resourceKey="LinkButton1Resource1" OnClick="LinkButton1_Click" Text='<%# Eval("ACCOUNT") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="網域" meta:resourceKey="DomainTemplateFieldResource2" SortExpression="DOMAIN_NICKNAME">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayDomainName" runat="server" meta:resourceKey="lblDisplayDomainNameResource1" Text='<%# Bind("DOMAIN_NICKNAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="名稱" meta:resourceKey="BoundFieldResource1" SortExpression="NAME"></asp:BoundField>
                    <asp:TemplateField HeaderText="帳號鎖定" meta:resourceKey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblLock" runat="server" __designer:wfdid="w15" meta:resourceKey="lblLockResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EXPIRE_DATE" DataFormatString="{0:d}" HeaderText="到期日" HtmlEncode="False" meta:resourceKey="BoundFieldResource4" SortExpression="EXPIRE_DATE"></asp:BoundField>
                    <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" meta:resourceKey="BoundFieldResource3" SortExpression="EMAIL"></asp:BoundField>
                    <asp:TemplateField HeaderText="部門主管" meta:resourceKey="TemplateFieldResource3" SortExpression="SUPERIOR">
                        <ItemTemplate>
                            <asp:Label ID="lblSuperior" runat="server" meta:resourceKey="lblSuperiorResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="簽核人員" meta:resourceKey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblSigner" runat="server" meta:resourceKey="lblSignerResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourceKey="TemplateFieldResource5" Visible="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnHR" runat="server" CausesValidation="False" CommandName="lbtnHR" meta:resourceKey="lbtnHRResource1" Text="人事資料"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbtnChange" runat="server" CausesValidation="False" CommandName="lbtnChange" meta:resourceKey="lbtnChangeResource1" Text="異動記錄"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle Wrap="False" />
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label runat="server" ID="lbYes" Text="是" Visible="False" meta:resourcekey="lbYesResource1"></asp:Label>
    <asp:Label runat="server" ID="lbNo" Text="否" Visible="False" meta:resourcekey="lbNoResource1"></asp:Label>
    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblKeyWordNeeded" runat="server" Text="請輸入關鍵字，確定要繼續搜尋？" Visible="False" meta:resourcekey="lblKeyWordNeededResource1"></asp:Label>
    <asp:HiddenField runat="server" ID="hdnKeywordId" />
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="內部組織結構列表" Visible="False"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblUpdateTimeZoneDialogTitle" runat="server" Text="批次更新時區資料" Visible="False" meta:resourcekey="lblUpdateTimeZoneDialogTitleResource1"></asp:Label>
</asp:Content>
