<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Customer_BaseDataMaintain" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="BaseDataMaintain.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function radToolBarClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "btnAddClass":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/ClassEdit.aspx", args.get_item(), "<%= lblClassAdd.Text %>", 350, 150, OpenDialogResult, { "Mode": "Insert" });
                    break;
                case "btnDeleteClass":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grdClass.ClientID %>');
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
                case "btnAddGrade":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/GradeEdit.aspx", args.get_item(), "<%= lblGradeAdd.Text %>", 350, 220, OpenDialogResult, { "Mode": "Insert" });
                    break;
                case "btnDeleteGrade":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grdGrade.ClientID %>');
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
            case "btnAddIndustry":
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Customer/IndustryEdit.aspx", args.get_item(), "<%=lblIndustryAdd.Text%>", 350, 150, OpenDialogResult, { "Mode": "Insert" });
                    break;
                case "btnDeleteIndustry":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grdIndustry.ClientID %>');
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
            case "btnEditArea":
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Customer/AreaEdit.aspx", args.get_item(), "<%=lblAreaEdit.Text%>", 500, 500, OpenDialogResult, { "Mode": "Insert" });
                    break;
            }
        }
        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) === "undefined" || returnValue === null) {
                return false;
            }
            else
                return true;
        }
    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelToolbar" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <asp:Panel ID="PanelToolbar1" runat="server">
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="radToolBarClicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="新增類別" Value="btnAddClass"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            meta:resourcekey="RadToolBarAddResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="刪除類別" Value="btnDeleteClass"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            meta:resourcekey="RadToolBarDeleteResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </asp:Panel>

            <asp:Panel ID="PanelToolbar2" runat="server">
                <telerik:RadToolBar ID="RadToolBar2" runat="server" Width="100%" OnButtonClick="RadToolBar2_OnButtonClick" OnClientButtonClicking="radToolBarClicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="新增等級" Value="btnAddGrade"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            meta:resourcekey="RadToolBar2AddGradeResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="刪除等級" Value="btnDeleteGrade"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            meta:resourcekey="RadToolBar2DeleteGradeResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </asp:Panel>

            <asp:Panel ID="PanelToolbar3" runat="server">
                <telerik:RadToolBar ID="RadToolBar3" runat="server" Width="100%" OnButtonClick="RadToolBar3_OnButtonClick" OnClientButtonClicking="radToolBarClicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="新增行業別" Value="btnAddIndustry"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                            meta:resourcekey="RadToolBar3AddIndustryResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="刪除行業別" Value="btnDeleteIndustry"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            meta:resourcekey="RadToolBar3DeleteIndustryResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </asp:Panel>

            <asp:Panel ID="PanelToolbar4" runat="server">
                <telerik:RadToolBar ID="RadToolBar4" runat="server" Width="100%" OnButtonClick="RadToolBar4_OnButtonClick" OnClientButtonClicking="radToolBarClicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="地區別維護" Value="btnEditArea"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m124.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m124.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m124.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m124.gif"
                            meta:resourcekey="RadToolBar4EditAreaResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:Label ID="lblLeftTitle" Text="主檔維護列表" Visible="false" runat="server" meta:resourcekey="Label1Resource1" ></asp:Label>
    <asp:UpdatePanel ID="UpdatePanelTree" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTreeView ID="RadTreeView1" runat="server" OnNodeClick="rdTree_NodeClick"></telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="PanelGrid1" runat="server">
                <Fast:Grid ID="grdClass" runat="server" AllowPaging="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="True"
                    DataKeyNames="CLASS_ID" Width="100%" AllowSorting="True" EnhancePager="True" PageSize="15" OnRowDataBound="grdClass_RowDataBound">
                    <EnhancePagerSettings
                        ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <Columns>
                        <asp:TemplateField HeaderText="類別名稱" SortExpression="CLASS_NAME" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%#: Eval("CLASS_NAME") %>' ID="lbtnClassName" OnClick="lbtnClassName_Click"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="100%" />
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows" OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetClassDataSet_Count"
                    SelectMethod="GetClassDataSet" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
                    TypeName="Ede.Uof.EIP.Customer.UCO.CUSClassUCO">
                    <SelectParameters>
                        <asp:Parameter Name="intStartIndex" Type="Int32" />
                        <asp:Parameter Name="intMaxRows" Type="Int32" />
                        <asp:Parameter Name="strSortExpression" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
            <asp:Panel ID="PanelGrid2" runat="server">

                <Fast:Grid ID="grdGrade" runat="server" AllowPaging="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="True" DataKeyNames="GRADE_ID"
                    Width="100%" AllowSorting="True" EnhancePager="True" PageSize="15" OnRowDataBound="grdGrade_RowDataBound">
                    <EnhancePagerSettings ShowHeaderPager="True" />
                    <Columns>
                        <asp:TemplateField HeaderText="等級名稱" SortExpression="GRADE_NAME" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%#: Eval("GRADE_NAME") %>' ID="lbtnGradeName" __designer:wfdid="w11" OnClick="lbtnGradeName_Click"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="33%" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="等級" DataField="GRADE" SortExpression="GRADE" meta:resourcekey="BoundFieldResource1">
                            <FooterStyle Width="10%" />
                            <HeaderStyle Width="10%" />
                            <ItemStyle Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="備註" DataField="REMARK" meta:resourcekey="BoundFieldResource2">
                            <FooterStyle Width="56%" />
                            <HeaderStyle Width="56%" />
                            <ItemStyle Width="56%" />
                        </asp:BoundField>
                    </Columns>
                </Fast:Grid>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" TypeName="Ede.Uof.EIP.Customer.UCO.CUSGradeUCO" StartRowIndexParameterName="intStartIndex" SortParameterName="strSortExpression" SelectMethod="GetGradeDataSet" SelectCountMethod="GetGradeDataSet_Count" OldValuesParameterFormatString="original_{0}" MaximumRowsParameterName="intMaxRows" EnablePaging="True">
                    <SelectParameters>
                        <asp:Parameter Name="intStartIndex" Type="Int32" />
                        <asp:Parameter Name="intMaxRows" Type="Int32" />
                        <asp:Parameter Name="strSortExpression" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
            <asp:Panel ID="PanelGrid3" runat="server">
                <Fast:Grid ID="grdIndustry" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                    DataKeyNames="INDUSTRY_ID" DataKeyOnClientWithCheckBox="False"
                    EnhancePager="True" OnRowDataBound="grdIndustry_RowDataBound" PageSize="15"
                    Width="100%">
                    <EnhancePagerSettings
                        ShowHeaderPager="True" />
                    <Columns>
                        <asp:TemplateField HeaderText="行業別名稱" SortExpression="INDUSTRY_NAME" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text='<%#: Eval("INDUSTRY_NAME") %>' ID="lbtnIndustryName" __designer:wfdid="w12" OnClick="lbtnIndustryName_Click"></asp:LinkButton>

                            </ItemTemplate>
                            <ItemStyle Width="99%" />
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                    OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetIndustryDataSet_Count"
                    SelectMethod="GetIndustryDataSet" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
                    TypeName="Ede.Uof.EIP.Customer.UCO.CUSIndustryUCO">
                    <SelectParameters>
                        <asp:Parameter Name="intStartIndex" Type="Int32" />
                        <asp:Parameter Name="intMaxRows" Type="Int32" />
                        <asp:Parameter Name="strSortExpression" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
            <asp:Panel ID="PanelGrid4" runat="server" Width="100%" Height="100%">
                <br />
                <telerik:RadTreeView ID="rdtreeArea" EnableNodeTextHtmlEncoding="true" runat="server" Height="700px" Width="100%"></telerik:RadTreeView>
            </asp:Panel>
        </ContentTemplate>
        <%--                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="rdTree" EventName="NodeClick" />
                    </Triggers>--%>
    </asp:UpdatePanel>

    <asp:Label ID="lblhiddenDelete" runat="server" Text="沒有挑選要刪除的項目" Visible="False" meta:resourcekey="lblhiddenDeleteResource1"></asp:Label>
    <asp:Label ID="lblCustClass" runat="server" Text="客戶類別" Visible="False" meta:resourcekey="lblCustClassResource1"></asp:Label>
    <asp:Label ID="lblGrade" runat="server" Text="客戶等級" Visible="False" meta:resourcekey="lblGradeResource1"></asp:Label>
    <asp:Label ID="lblIndustry" runat="server" Text="行業別" Visible="False" meta:resourcekey="lblIndustryResource1"></asp:Label>
    <asp:Label ID="lblClassEdit" runat="server" Text="修改類別" Visible="False" meta:resourcekey="lblClassEditResource1"></asp:Label>
    <asp:Label ID="lblEdit" runat="server" Text="主檔維護" Visible="False" meta:resourcekey="lblEditResource1"></asp:Label>
    <asp:Label ID="lblArea" runat="server" Text="地區別" Visible="False" meta:resourcekey="lblAreaResource1"></asp:Label>
    <asp:Label ID="lblAreaEdit" runat="server" Text="地區別維護" Visible="False" meta:resourcekey="lblAreaEditResource1"></asp:Label>
    <asp:Label ID="lblClassAdd" runat="server" Text="新增類別" Visible="False" meta:resourcekey="lblClassAddResource1"></asp:Label>
    <asp:Label ID="lblIndustryAdd" runat="server" Text="新增行業別" Visible="False" meta:resourcekey="lblIndustryAddResource1"></asp:Label>
    <asp:Label ID="lblIndustryEdit" runat="server" Text="修改行業別" Visible="False" meta:resourcekey="lblIndustryEditResource1"></asp:Label>
    <asp:Label ID="lblGradeAdd" runat="server" Text="新增等級" Visible="False" meta:resourcekey="lblGradeAddResource1"></asp:Label>
    <asp:Label ID="lblGradeEdit" runat="server" Text="修改等級" Visible="False" meta:resourcekey="lblGradeEditResource1"></asp:Label>
    <asp:HiddenField ID="hiddenDelete" runat="server" Value="沒有挑選要刪除的項目" />
</asp:Content>

