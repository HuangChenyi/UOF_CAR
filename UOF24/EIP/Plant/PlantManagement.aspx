<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Plant_PlantManagement" Title="設備管理" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="PlantManagement.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">

    <script type="text/javascript">

        function OpenDialogResult (returnValue) {
            if( typeof(returnValue)=="undefined")
                return false;
            else
                return true;
        }


        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            switch (value) {
                case "ClassManagement":

                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Plant/ClassManagement.aspx", args.get_item(), 
                   "",800, 700, OpenDialogResult);


                    break;

                case "CreatePlant":
                    var tree = $find('<%=treeClass.ClientID %>');
                    var node = tree.get_selectedNode();
                    if (node == null) {
                        alert('<%=lblSelectNodeMsg.Text %>');
                        args.set_cancel(true);
                    }
                    else {
                        var classID = node.get_value();
                        var className = node.get_text();
                        args.set_cancel(true);
                        $uof.dialog.open2("~/EIP/Plant/CreatePlant.aspx", args.get_item(),
                       "", 700, 700, OpenDialogResult, { ClassGuid: classID });
                    }
                    break;

                case "DeletePlant":
                    args.set_cancel(!confirm('<%=msgDelconfirm.Text %>'));
                    break;
            }
        }
    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdateToolBar" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" OnClientButtonClicking="RadToolBar1_ButtonClicking">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="類別管理" Value="ClassManagement"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m77.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m77.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m77.gif" ImageUrl="~/Common/Images/Icon/icon_m77.gif" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增場地設備" Value="CreatePlant"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m78.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m78.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m78.gif" ImageUrl="~/Common/Images/Icon/icon_m78.gif" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除場地設備" Value="DeletePlant"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">


    <asp:UpdatePanel ID="UpdatePanelTreeview" runat="server" UpdateMode="Conditional"
        RenderMode="Inline">
        <ContentTemplate>
            <telerik:RadTreeView ID="treeClass" EnableNodeTextHtmlEncoding="true" runat="server" OnNodeClick="treeClass_NodeClick"></telerik:RadTreeView>
            <br />
            <asp:Label ID="lblLeftTitle" runat="server" Visible="False"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>   
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="lblSelectNodeMsg" runat="server" Text="請選擇節點" Visible="False" meta:resourcekey="lblSelectNodeMsgResource1"></asp:Label>
    <asp:Label ID="lblOpen" runat="server" Text="開放" Visible="False"  meta:resourcekey="lblOpenResource1"></asp:Label>
    <asp:Label ID="lblStop" runat="server" Text="暫停" Visible="False" meta:resourcekey="lblStopResource1"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" BackColor="Red" ForeColor="White" />
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ErrorMessage="設備已被借出無法刪除" ForeColor="Red"
                meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="None" ErrorMessage="刪除失敗" ForeColor="Red"
                meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" Display="None" ErrorMessage="權限不足無法刪除" ForeColor="Red"
                meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
            <Fast:Grid ID="Grid3" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True" DataKeyNames="PLANT_GUID"
                Width="100%" OnRowDataBound="Grid3_RowDataBound"
                OnRowCommand="Grid3_RowCommand"
                DataKeyOnClientWithCheckBox="False"
                EnhancePager="True" PageSize="15" AllowPaging="True"
                DefaultSortDirection="Ascending"  EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="Grid3Resource3"   AutoGenerateColumns="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:BoundField DataField="CLASS_NAME" HeaderText="類別" SortExpression="CLASS_NAME" meta:resourcekey="BoundFieldResource1" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Width="100px" Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="編號" SortExpression="SERIAL_NO" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="btnSerialNo" Text='<%#: Eval("SERIAL_NO") %>' CommandName="EditPlant" meta:resourceKey="btnSerialNoResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px"/>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PLANT_NAME" HeaderText="名稱" SortExpression="PLANT_NAME" meta:resourcekey="BoundFieldResource2" >
                        <HeaderStyle Wrap="False" Width="500px"/>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="保管人" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList1" IsAllowEdit="false" TreeHeight="50px"></uc1:UC_ChoiceList>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="300px"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="可借用人員" meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <uc1:UC_ChoiceList ID="UC_ChoiceListPlantMember" runat="server" IsAllowEdit="false" TreeHeight="50px"/>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Width="300px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="借用狀態" SortExpression="PLANT_STATE" meta:resourcekey="BoundFieldResource5">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("PLANT_STATE") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBorrowStatus" runat="server" Text='<%#: Bind("PLANT_STATE") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="設備狀態" SortExpression="PLANT_OPEN" meta:resourcekey="BoundFieldResource6">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("PLANT_OPEN") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPlantStatus" runat="server" Text='<%#: Bind("PLANT_OPEN") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="借用限制" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPlantLimit" runat="server" meta:resourcekey="lblPlantLimitResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="借用申請方式" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblPlantApplyWay" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="100px" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="PLANT_GUID" HeaderText="PLANT_GUID" ReadOnly="True" SortExpression="PLANT_GUID"
                        Visible="False" meta:resourcekey="BoundFieldResource4" />
                </Columns>
            </Fast:Grid>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAuthorityAllPlantOrderBySerialNo" TypeName="Ede.Uof.EIP.Plant.ReadBorrowRecordUCO">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lbClassGuid" Name="classGUID" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="lbUserGuid" runat="server" meta:resourcekey="lbUserGuidResource1" Visible="False"></asp:Label>
            <asp:Label ID="lbClassGuid" runat="server" meta:resourcekey="lbClassGuidResource1" Visible="False"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblNotLimit" runat="server" Text="不限定" Visible="False" meta:resourcekey="lblNotLimitResource1"></asp:Label>
    <asp:Label ID="lblByClass" runat="server" Text="依類別設定" Visible="False" meta:resourcekey="lblByClassResource1"></asp:Label>
    <asp:Label ID="lblByExamine" runat="server" Text="由設備借用單借用" Visible="False" meta:resourcekey="lblByExamineResource1"></asp:Label>
    <asp:Label ID="lblByCalendar" runat="server" Text="由行事曆借用" Visible="False" meta:resourcekey="lblByCalendarResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>

    <asp:Label ID="lblIsUseDay" runat="server" Text="可借用到系統日之後" Visible="False" meta:resourcekey="lblIsUseDayResource1"></asp:Label>

    <asp:Label ID="lblMonths" runat="server" Text="每月" Visible="False" meta:resourcekey="lblMonthsResource1"></asp:Label>
    <asp:Label ID="lblDayOfMonth" runat="server" Text="日" Visible="False" meta:resourcekey="lblDayOfMonthResource1"></asp:Label>
    <asp:Label ID="lblCanAdd" runat="server" Text="可新增" Visible="False" meta:resourcekey="lblCanAddResource1"></asp:Label>
    <asp:Label ID="lblThisMonth" runat="server" Text="當月" Visible="False" meta:resourcekey="lblThisMonthResource1"></asp:Label>
    <asp:Label ID="lblNextMonth" runat="server" Text="次月" Visible="False" meta:resourcekey="lblNextMonthResource1"></asp:Label>
    <asp:Label ID="lblMonthsLater" runat="server" Text="個月後" Visible="False" meta:resourcekey="lblMonthsLaterResource1"></asp:Label>
    <asp:Label ID="lblBorrow" runat="server" Text="的借用" Visible="False" meta:resourcekey="lblBorrowResource1"></asp:Label>

     <asp:Label ID="lblBorrowRange" runat="server" Text="每月{0}日 {1}可新增{1}的借用" Visible="False" meta:resourcekey="lblBorrowRangeResource1"></asp:Label>


</asp:Content>
