<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="Basic_Personal_AddressBook_Default" Title="通訊錄"
    meta:resourcekey="PageResource1" Culture="auto" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/Organization/DepartmentTree.ascx" TagName="DepartmentTree"
    TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args) {

            args.set_cancel(true);
            $uof.dialog.open2("~/Basic/Personal/AddressBook/DepartmentSearch.aspx", args.get_item(), 
           "", 300, 160, OpenDialogResult);

        }
        function RadToolBar2_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "SkillSearch") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Basic/Personal/AddressBook/DepartmentSearch.aspx", args.get_item(),
               "", 300, 160, OpenDialogResult);
            }
        }
        function RadToolBar3_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            switch (value) {
                case "Search":

                    var toolbarbutton = sender.findItemByValue("keyword");
                    var keyword = $telerik.findElement(toolbarbutton.get_element(), ("txbKeyword")).value;
                    if (keyword == "") {
                        alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common", "ErrorNotAllowEmpty")%>');
                        args.set_cancel(true);
                    }
                    break;
                case "EditClass":
    
                    args.set_cancel(true);
                    $uof.dialog.open2("~/Basic/Personal/AddressBook/ManageMyAddrClass.aspx", args.get_item(), 
                   "", 400, 400, OpenDialogResult);
                    
                    break;
                case "CreatePerson":
                    var tree = $find('<%=rtvTreeMyAddr.ClientID %>');
                    var node = tree.get_selectedNode();
                    var classGuid = node.get_value();
                    if (classGuid.length != 0) {

                        args.set_cancel(true);
                        $uof.dialog.open2("~/Basic/Personal/AddressBook/MyFriendInformation.aspx", args.get_item(),
                       "", 600, 300, OpenDialogResult, { ClassGuid: classGuid });
                    }
                    break;
                case "DeletePerson":
                    args.set_cancel(!confirm('<%=msgDelconfirm.Text %>'));
                    break;
                case "ImportPerson":

                    args.set_cancel(true);
                    $uof.dialog.open2("~/Basic/Personal/AddressBook/ImportAddressBook.aspx", args.get_item(),
                   "", 450, 300, OpenDialogResult);
                    break;
                case "OutputPerson":
   
                    args.set_cancel(true);
                    $uof.dialog.open2("~/Basic/Personal/AddressBook/ExportOutlook.aspx", args.get_item(),
                   "", 350, 350, OpenDialogResult, {"Mode":"Export"});
                    break;
                case "EmpMove":
                    var tree = $find('<%=rtvTreeMyAddr.ClientID %>');
                    var node = tree.get_selectedNode();
                    var classGuid = node.get_value();
                    if (classGuid.length != 0) {
                        
                        args.set_cancel(true);
                        $uof.dialog.open2("~/Basic/Personal/AddressBook/ManageEmployee.aspx", args.get_item(),
                       "", 450, 500, OpenDialogResult, { "ClassGuid": classGuid });
                    }
                    break;
            }
        }
        function onClientNodeClicked(sender, args) {
            var node = args.get_node();
            $('#<%=hiddenNodeTag.ClientID %>').val(node.get_value());
        }

        function rts1_TabSelecting(sender, args) {
            var tabIndex = args.get_tab().get_index();
            var view2 = $find("<%=RadMultiPage2.ClientID%>");
            var view3 = $find("<%=RadMultiPage3.ClientID%>");

            view2.set_selectedIndex(tabIndex);
            view3.set_selectedIndex(tabIndex);
        }

        function OpenDialogResult (returnValue) {
            if( typeof(returnValue)=="undefined")
                return false;
            else
                return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadTabStrip ID="rts1" MultiPageID="RadMultiPage1" runat="server" SelectedIndex="0"
        meta:resourcekey="rts1Resource1" OnClientTabSelecting="rts1_TabSelecting">
        <Tabs>
            <telerik:RadTab runat="server" Text="依部門" Value="Department" PageViewID="rpvDepartment"
                Selected="True" meta:resourcekey="RadTabResource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="依專長" Value="Skill" PageViewID="rpvSkill" meta:resourcekey="RadTabResource2">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="我的通訊錄" Value="Expert" PageViewID="rpvExpert"
                meta:resourcekey="RadTabResource3">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="RadPageView1" runat="server">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick"
                Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="搜尋人員" Value="Search" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server">
            <telerik:RadToolBar ID="RadToolBar2" runat="server" OnClientButtonClicking="RadToolBar2_ButtonClicking"
                Width="100%" OnButtonClick="RadToolBar2_ButtonClick" meta:resourcekey="RadToolBar2Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="搜尋人員" Value="SkillSearch" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server">
            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="White" BackColor="Red"
                        runat="server" meta:resourcekey="ValidationSummary1Resource1" />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ForeColor="Red"
                        meta:resourcekey="CustomValidator1Resource1">
                    </asp:CustomValidator>
                    <telerik:RadToolBar ID="RadToolBar3" Width="100%" runat="server" OnClientButtonClicking="RadToolBar3_ButtonClicking"
                        OnButtonClick="RadToolBar3_ButtonClick" meta:resourcekey="RadToolBar3Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m40.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m40.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m40.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m40.gif" meta:resourceKey="RadToolBarButtonResource5"
                                Text="編輯類別" Value="EditClass">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource6">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m41.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m41.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m41.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m41.gif" meta:resourceKey="RadToolBarButtonResource7"
                                Text="新增聯絡人" Value="CreatePerson">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource8">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourceKey="RadToolBarButtonResource9"
                                Text="刪除聯絡人" Value="DeletePerson">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource10">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m26.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m26.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m26.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m26.gif" meta:resourceKey="RadToolBarButtonResource11"
                                Text="搬移聯絡人" Value="EmpMove">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource12">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m110.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m110.gif" meta:resourceKey="RadToolBarButtonResource13"
                                Text="匯入聯絡人" Value="ImportPerson">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource14">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m144.gif" meta:resourceKey="RadToolBarButtonResource15"
                                Text="匯出聯絡人" Value="OutputPerson">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource16">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" meta:resourceKey="RadToolBarButtonResource17"
                                Value="keyword">
                                <ItemTemplate>
                                    <asp:TextBox ID="txbKeyword" runat="server" meta:resourceKey="txbKeywordResource1"
                                        TextAlign="Left" Width="100px">
                                    </asp:TextBox>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourceKey="RadToolBarButtonResource18"
                                Text="搜尋聯絡人" Value="Search">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourceKey="RadToolBarButtonResource19">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <telerik:RadMultiPage ID="RadMultiPage2" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="RadPageView4" runat="server">
            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                <ContentTemplate>
                    <uc1:DepartmentTree ID="DepartmentTree1" runat="server" DisplayActiveControl="true" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server">
            <telerik:RadTreeView ID="rtvTreeSkill" runat="server" OnNodeClick="rtvTreeSkill_NodeClick" EnableNodeTextHtmlEncoding="true">
            </telerik:RadTreeView>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView6" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <telerik:RadTreeView ID="rtvTreeMyAddr" runat="server" OnNodeClick="rtvTreeMyAddr_NodeClick" OnClientNodeClicked="onClientNodeClicked" EnableNodeTextHtmlEncoding="true">
                    </telerik:RadTreeView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <telerik:RadMultiPage ID="RadMultiPage3" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="RadPageView7" runat="server">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <Fast:Grid ID="gridByDept" runat="server" AllowSorting="True" Width="100%" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="USER_GUID" OnRowDataBound="gridByDept_RowDataBound"
                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnhancePager="True"
                        PageSize="15"  EmptyDataText="沒有資料" KeepSelectedRows="False"
                          meta:resourcekey="gridByDeptResource3">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                            PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="姓名" SortExpression="NAME" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnNameByDept" runat="server" CommandName="edit" meta:resourceKey="btnNameByDeptResource1"
                                        Text='<%#:Eval("NAME") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" SortExpression="EMAIL" meta:resourcekey="BoundFieldResource1">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOBILE" HeaderText="手機號碼" SortExpression="MOBILE" meta:resourcekey="BoundFieldResource2">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EMERGENCY" HeaderText="緊急電話" SortExpression="EMERGENCY"
                                meta:resourcekey="BoundFieldResource3">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EXT_NUM" HeaderText="分機" SortExpression="EXT_NUM" meta:resourcekey="BoundFieldResource4">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="USER_GUID" HeaderText="USER_GUID" Visible="False" meta:resourcekey="BoundFieldResource5" />
                        </Columns>
                    </Fast:Grid>
                    <asp:Label ID="lbDeptId" runat="server" Visible="False" meta:resourcekey="lbDeptIdResource1"></asp:Label>
                    &nbsp;
                  <asp:Label ID="lbName" runat="server" meta:resourcekey="lbNameResource1" Visible="False"></asp:Label>
                    <asp:Label ID="lbEmail" runat="server" meta:resourcekey="lbEmailResource1" Visible="False"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="dSByDept" runat="server" SelectMethod="GetPerson" TypeName="Ede.Uof.EIP.AddressBook.ByDepartmentUCO"
                OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbDeptId" Name="departmentID" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="lblUserGuid" Name="userGuid" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dSByNameEmail" runat="server" SelectMethod="SearchPerson"
                TypeName="Ede.Uof.EIP.AddressBook.ByDepartmentUCO">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbName" Name="likeName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lbEmail" Name="likeEmail" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lblUserGuid" Name="userGuid" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="lblNoDisplayMsg" runat="server" meta:resourcekey="lblNoDisplayMsgResource1"
                Text="不顯示" Visible="False"></asp:Label>
            <asp:Label ID="msgDelconfirm" runat="server" meta:resourcekey="msgDelconfirmResource1"
                Text="確定要刪除?" Visible="False"></asp:Label>
            <asp:Label ID="msgSelectskill" runat="server" meta:resourcekey="msgSelectskillResource1"
                Text="此為專長分類,欲查詢請點選專長項目" Visible="False"></asp:Label>
            <asp:Label ID="msgNodata" runat="server" meta:resourcekey="msgNodataResource1" Text="沒有資料"
                Visible="False"></asp:Label>
            <asp:Label ID="msgMustselectnode" runat="server" meta:resourcekey="msgMustselectnodeResource1"
                Text="請先編輯設定類別" Visible="False"></asp:Label>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView8" runat="server">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <Fast:Grid ID="gridBySkill" runat="server" Width="100%" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="USER_GUID" OnRowDataBound="gridBySkill_RowDataBound"
                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnhancePager="True"
                        PageSize="15"  EmptyDataText="沒有資料" KeepSelectedRows="False"
                          meta:resourcekey="gridBySkillResource3">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                            PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="姓名" SortExpression="NAME" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnNameBySkill" runat="server" meta:resourceKey="btnNameBySkillResource1"
                                        Text='<%#:Eval("NAME") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" SortExpression="EMAIL" meta:resourcekey="BoundFieldResource6">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOBILE" HeaderText="手機號碼" SortExpression="MOBILE" meta:resourcekey="BoundFieldResource7">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EMERGENCY" HeaderText="緊急電話" SortExpression="EMERGENCY"
                                meta:resourcekey="BoundFieldResource8">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EXT_NUM" HeaderText="分機" SortExpression="EXT_NUM" meta:resourcekey="BoundFieldResource9">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="USER_GUID" HeaderText="USER_GUID" Visible="False" meta:resourcekey="BoundFieldResource10" />
                        </Columns>
                    </Fast:Grid>
                    <asp:Label ID="lbSkillId" runat="server" Visible="False" meta:resourcekey="lbSkillIdResource1"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="dSBySkill" runat="server" SelectMethod="GetPerson" TypeName="Ede.Uof.EIP.AddressBook.BySkillUCO">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbSkillId" Name="skillID" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lblUserGuid" Name="userGuid" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dSByNameEmailOfSkill" runat="server" SelectMethod="SearchPerson"
                TypeName="Ede.Uof.EIP.AddressBook.BySkillUCO">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbName" Name="likeName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lbEmail" Name="likeEmail" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lblUserGuid" Name="userGuid" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView9" runat="server">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <Fast:Grid ID="expertGrid" runat="server" AutoGenerateCheckBoxColumn="True" AllowSorting="True"
                        OnRowDataBound="expertGrid_RowDataBound" AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="PERS_GUID" OnRowCommand="expertGrid_RowCommand" Width="100%" DataKeyOnClientWithCheckBox="False"
                        DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15" 
                        EmptyDataText="沒有資料" KeepSelectedRows="False"  
                        meta:resourcekey="expertGridResource3">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                            PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                            PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:BoundField DataField="PERS_GUID" Visible="False" meta:resourcekey="BoundFieldResource11" />
                            <asp:TemplateField HeaderText="姓名" SortExpression="NAME" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnNameByMyAddr" runat="server" meta:resourceKey="btnNameByMyAddrResource1"
                                        Text='<%#:Eval("NAME") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TELEPHONE" HeaderText="電話" SortExpression="TELEPHONE"
                                meta:resourcekey="BoundFieldResource12">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MOBILE" HeaderText="手機號碼" SortExpression="MOBILE" meta:resourcekey="BoundFieldResource13">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" SortExpression="EMAIL" meta:resourcekey="BoundFieldResource14">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                    </Fast:Grid>
                    <asp:Label ID="lbNodeTag" runat="server" Visible="False" meta:resourcekey="lbNodeTagResource1"></asp:Label>
                    <asp:HiddenField ID="hiddenNodeTag" runat="server" />
                    <asp:Label ID="lblUserGuid" runat="server" meta:resourceKey="lblUserGuidResource1"
                        Visible="False"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPerson"
                TypeName="Ede.Uof.EIP.AddressBook.ManageMyAddressBookUCO">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbNodeTag" Name="classID" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SearchPerson"
                TypeName="Ede.Uof.EIP.AddressBook.ManageMyAddressBookUCO">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserGuid" DefaultValue="" Name="userGUID" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="lbName" Name="likeName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lbEmail" Name="likeEmail" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
