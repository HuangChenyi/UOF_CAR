<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="System_Organization_Member_Default" Title="外部會員維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../../Common/Organization/GroupTree.ascx" TagName="GroupTree" TagPrefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function RadToolBar1_Member_ButtonClicking(sender, args) {
            //Add code to handle your event here.
            //var tree = igtree_getTreeById('<%=GroupTree1.TreeClientId%>');
            var tree = $find('<%=GroupTree1.TreeClientId%>');
            var node = tree.get_selectedNode();
            var groupID = node.get_value();
            var groupName = node.get_text();
            var Key = args.get_item().get_value();
            $("#doEndRequestHandler").val("do");
            if (Key == "AddMember") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Member/Add.aspx", args.get_item(), "", 700, 768, OpenDialogResult, { "Groupid": groupID, "Groupname": groupName });
                
            }
            if (Key == "DelMemeber") {
                if (confirm('<%=lbConfirmDelete.Text %>') == false)
                    args.set_cancel(true);
            }
            if (Key == "GroupManage") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Group/ManageGroup.aspx", args.get_item(), "", 500, 550, ManageGroupResult, { "focusNode": groupID });
                
            }
            if (Key == "ClassManage") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Member/ClassManage.aspx", args.get_item(), "", 500, 500, OpenDialogResult);
            }
            if (Key == "MemMove") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Group/ManageMember.aspx", args.get_item(), "", 600, 600, OpenDialogResult, { "Groupid": groupID });
            }
            if (Key == "ImportExcel") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Member/ImportMember.aspx", args.get_item(), "", 500, 400, OpenDialogResult);
                
            }
            if (Key == "ImportADMember") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/AD/ImportUser.aspx", args.get_item(), "", 1024, 600, OpenDialogResult, { "UserType": "Member", "Groupid": groupID, "Groupname": groupName });
                
            }
            if (Key == "Search") {
                var keyword = $("#<%=this.hdnKeywordId.Value%>").val();
                if (keyword == "") {
                    alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common", "ErrorNotAllowEmpty")%>');
                    args.set_cancel(true);
                }
            }
            if (Key == "Search_group") {

                var keyword = $("#<%=this.hdnKeywordId.Value%>").val();
                if (keyword == "") {
                    if (confirm("<% =lblKeyWordNeeded.Text %>")) {
                        args.set_cancel(true);
                        $uof.dialog.open2("~/System/Organization/Member/SearchGroup.aspx", args.get_item(), "", 900, 550, SearchGroupResult, { "keyword": keyword });

                        
                    }
                    else {
                        args.set_cancel(true);
                    }
                }
                else {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/Organization/Member/SearchGroup.aspx", args.get_item(), "", 900, 550, SearchGroupResult, { "keyword": keyword });
                }



            }
            if (Key == "ExportMemberExcel") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Member/ExportMemberExcel.aspx", args.get_item(), "", 600, 500, OpenDialogResult);
            }
            else if (Key == "SendPw") {
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/NeverLoginUser.aspx", args.get_item(), "", 830, 550, OpenDialogResult, { "UserType": "Member" });
               
            }
        }

            function resizeGroupTree(X, Y) {
            var tree = $find("<%=this.GroupTree1.TreeClientId %>");
                tree.get_element().style.overflow = "auto";
                tree.get_element().style.height = (Y - 30) + "px";
                tree.get_element().style.width = (X) + "px";

               $("#<%=leftX.ClientID%>").val(X);
               $("#<%=leftY.ClientID%>").val(Y);
        }



        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function EndRequestHandler(sender, args) {
            //alert($("#doEndRequestHandler").val());
            if ($("#doEndRequestHandler").val() === "") {
                return;
            }

            //display scroll bar
            window.setTimeout(function () { resizeGroupTree($("#<%=leftX.ClientID%>").val(), $("#<%=leftY.ClientID%>").val()); }, 500);

            //call tree node.scrollIntoView()
            window.setTimeout(function () {
                var tree = $find("<%= this.GroupTree1.TreeClientId %>");
                var selectedNode = tree.get_selectedNode();

                if (selectedNode != null) {
                    selectedNode.scrollIntoView();
                }
            }, 500);

            $("#doEndRequestHandler").val("");
        }

        function OpenDialogResult(returnValue) {

            if (typeof (returnValue) === '' || returnValue === null) {
                return false;
            }
            else
                return true;
        }
        function ManageGroupResult(returnValue) {
            if (typeof (returnValue) != 'undefined' && returnValue != null) {
                __doPostBack('ctl00$ctl00$ContentPlaceHolder1$LeftContentPlaceHolder$LinkButton2', '')
            }
            else
                return false;

        }

        function SearchGroupResult(returnValue){
            if (typeof (returnValue) === '' || returnValue === null) {
                return false;
            }
            else {
                var groupId = returnValue;
                var tree = $find('<%=GroupTree1.TreeClientId %>');
                var node = tree.findNodeByValue(groupId);
                if (node) {
                    node.select();
                    $("#doEndRequestHandler").val("do");
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
     </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">

    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick"
        OnClientButtonClicking="RadToolBar1_Member_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m05.png"
                ImageUrl="~/Common/Images/Icon/icon_m05.png" Value="GroupManage" CheckedImageUrl="~/Common/Images/Icon/icon_m05.png"
                Text="群組" ToolTip="群組" meta:resourcekey="TBarButtonResource10">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="ClassManage" Text="類別" ToolTip="類別" HoveredImageUrl="~/Common/Images/Icon/icon_m138.png"
                ImageUrl="~/Common/Images/Icon/icon_m138.png" CheckedImageUrl="~/Common/Images/Icon/icon_m138.png"
                meta:resourcekey="TBarButtonResource18">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m30.png"
                ImageUrl="~/Common/Images/Icon/icon_m30.png" Value="AddMember" CheckedImageUrl="~/Common/Images/Icon/icon_m30.png"
                Text="新增會員" ToolTip="新增會員" meta:resourcekey="TBarButtonResource13">
            </telerik:RadToolBarButton>

            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m26.gif"
                ImageUrl="~/Common/Images/Icon/icon_m26.gif" Value="MemMove" CheckedImageUrl="~/Common/Images/Icon/icon_m26.gif"
                Text="會員搬移" ToolTip="會員搬移" meta:resourcekey="TBarButtonResource11">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif" Value="DelMemeber" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                Text="刪除會員" ToolTip="刪除會員" meta:resourcekey="TBarButtonResource12">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Keyword" meta:resourcekey="RadToolBarButtonResource6">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="txtKeyword" Width="120px" meta:resourcekey="txtKeywordResource1"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Value="Search" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="搜尋人員" ToolTip="搜尋人員"
                meta:resourcekey="TBarButtonResource16">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m64.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m64.gif" ImageUrl="~/Common/Images/Icon/icon_m64.gif"
                Value="Search_group" CheckedImageUrl="~/Common/Images/Icon/icon_m64.gif" Text="搜尋群組" ToolTip="搜尋群組"
                meta:resourcekey="TBarButtonResource17">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarDropDown runat="server" Text="進階" ToolTip="進階" meta:resourcekey="RadToolBarDropDownResource1" DropDownWidth="200px">
                <Buttons>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m110.gif" Value="ImportExcel" CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        Text="匯入會員" ToolTip="匯入會員" meta:resourcekey="TBarButtonResource14">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m34.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m34.gif" Value="ImportADMember" CheckedImageUrl="~/Common/Images/Icon/icon_m34.gif"
                        Text="匯入AD會員" ToolTip="匯入AD會員" meta:resourcekey="TBarButtonResource15">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m144.gif" Value="ExportMemberExcel" CheckedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        Text="匯出會員" ToolTip="匯出會員" meta:resourcekey="TBarButtonExportResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m33.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m33.gif" ImageUrl="~/Common/Images/Icon/icon_m33.gif"
                        Value="SendPw" CheckedImageUrl="~/Common/Images/Icon/icon_m33.gif" Text="發送密碼" ToolTip="發送密碼"
                        meta:resourcekey="TBarSendPwResource15">
                    </telerik:RadToolBarButton>
                </Buttons>
            </telerik:RadToolBarDropDown>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource8"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline" ChildrenAsTriggers="False">
        <ContentTemplate>
            <uc1:GroupTree ID="GroupTree1" runat="server" Width="300px" Height="600px"></uc1:GroupTree>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" meta:resourcekey="LinkButton2Resource1"></asp:LinkButton>
    <asp:HiddenField ID="leftX" runat="server" />
    <asp:HiddenField ID="leftY" runat="server" />
    <asp:HiddenField ID="doEndRequestHandler" runat="server" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server" RenderMode="Inline">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="padding-bottom: 5px; padding-top: 5px; padding-left: 5px;">
                <asp:CheckBox ID="cbOnlyAvailable" runat="server" Text="顯示停用及帳號到期人員" AutoPostBack="True" meta:resourcekey="cbOnlyAvailableResource1" />
            </div>
            <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False" DataKeyNames="USER_GUID" Width="100%" OnRowDataBound="Grid1_RowDataBound"
                OnPageIndexChanging="Grid1_PageIndexChanging" OnSorting="Grid1_Sorting" DataKeyOnClientWithCheckBox="False"
                PageSize="15">
                <Columns>
                    <asp:TemplateField HeaderText="帳號" ShowHeader="False" SortExpression="ACCOUNT" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("ACCOUNT") %>' __designer:wfdid="w12"
                                meta:resourceKey="LinkButton1Resource1" OnClick="LinkButton1_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="名稱" SortExpression="NAME" meta:resourcekey="BoundFieldResource1" />
                    <asp:TemplateField HeaderText="帳號鎖定" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblLock" meta:resourceKey="lblLockResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EXPIRE_DATE" DataFormatString="{0:d}" HtmlEncode="False"
                        HeaderText="到期日" SortExpression="EXPIRE_DATE" meta:resourcekey="BoundFieldResource4" />
                    <asp:BoundField DataField="COMPANY_NAME" HeaderText="公司名稱" SortExpression="COMPANY_NAME"
                        meta:resourcekey="BoundFieldResource3" />
                </Columns>
                <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                    NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                    PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                    ShowHeaderPager="True" />
            </Fast:Grid>
            <asp:HiddenField ID="hideSource" runat="server" />&nbsp;
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label runat="server" ID="lbYes" Text="是" Visible="False" meta:resourcekey="lbYesResource1"></asp:Label>
    <asp:Label runat="server" ID="lbNo" Text="否" Visible="False" meta:resourcekey="lbNoResource1"></asp:Label>
    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblKeyWordNeeded" runat="server" Text="請輸入關鍵字，確定要繼續搜尋？" Visible="False" meta:resourcekey="lblKeyWordNeededResource1"></asp:Label>
    <asp:HiddenField runat="server" ID="hdnKeywordId" />
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="外部組織結構列表" Visible="False"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>



