<%@ Page Language="C#" Title="新增/維護題目" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_QusItemMA" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" Codebehind="QusItemMA.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" id="igClientScript">
        function itemMaToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/QUE/Design/QusItemAnsOptMA.aspx", args.get_item(), "<%=lblType.Text%>", 400, 350, openDialogResult,
                        { "Type": "Add", "ItemGuid": "<%=lblItemGuid.Text%>" });
                    break;
                case "Delete":
                    if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                        var CheckedData = $uof.fastGrid.getChecked('<%= gridAnspot.ClientID %>');
                        var choose = $('#<%= hiddenDelete.ClientID %>').val();//信息
                        if (CheckedData == "") {
                            alert(choose);
                            args.set_cancel(true);
                            return;
                        }
                        else {
                            args.set_cancel(false);
                        }
                    }
                    else {
                        args.set_cancel(true);
                    }
                    break;
            }
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
            return true;
        }

        function txtRepeartCol_OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(1);
            }
        }
        function ntbMaxAnsCount_OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(0);
            }
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:CustomValidator ID="cvMessage" runat="server" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
            <table style="width: 100%" cellspacing="0" class="PopTable">
                <tr>
                    <td>
                        <font color="red">*</font>
                        <asp:Label ID="lblItemLeft" runat="server" Text="題目" 
                            meta:resourcekey="lblItemLeftResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtItemName" runat="server" Width="100%" TextMode="MultiLine" 
                            Height="80px" meta:resourcekey="txtItemNameResource1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTypeLeft" runat="server" Text="選項類型" 
                            meta:resourcekey="lblTypeLeftResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged"
                            AutoPostBack="True" Width="150px" meta:resourcekey="ddlTypeResource1">
                            <asp:ListItem Value="SC" meta:resourcekey="ListItemResource1" Text="單選"></asp:ListItem>
                            <asp:ListItem Value="MS" meta:resourcekey="ListItemResource2" Text="複選"></asp:ListItem>
                            <asp:ListItem Value="ST" meta:resourcekey="ListItemResource3" Text="單行文字"></asp:ListItem>
                            <asp:ListItem Value="MT" meta:resourcekey="ListItemResource4" Text="多行文字"></asp:ListItem>
                            <asp:ListItem Value="SM" meta:resourcekey="ListItemResource5" Text="摘要說明"></asp:ListItem>
                            <asp:ListItem Value="DT" Text="日期欄位" meta:resourcekey="ListItemResource20"></asp:ListItem>  
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr runat="server" id="trIsRequired">
                    <td runat="server">
                        <asp:Label ID="lblRequired" runat="server" Text="是否必填"
                        meta:resourcekey="lblRequiredResource1"></asp:Label>
                    </td>
                    <td runat="server">
                        <asp:RadioButtonList ID="rbtnRequired" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="Y" Selected="True" meta:resourcekey="ListItemResource6" 
                                Text="是"></asp:ListItem>
                            <asp:ListItem Value="N" meta:resourcekey="ListItemResource7" Text="否"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr runat="server" id="trRepeatDirection">
                    <td runat="server" style=" white-space:nowrap;">
                        <asp:Label ID="lblRD" runat="server" Text="選項排列方式"
                        meta:resourcekey="lblRDResource1"></asp:Label>
                    </td>
                    <td runat="server">
                        <asp:DropDownList ID="ddlRepeatDir" runat="server" Width="85px" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlRepeatDir_SelectedIndexChanged">
                            <asp:ListItem Value="H" meta:resourcekey="ListItemResource8" Text="水平"></asp:ListItem>
                            <asp:ListItem Value="V" meta:resourcekey="ListItemResource9" Text="垂直"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr runat="server" id="trRepeatColumns">
                    <td runat="server">
                        <asp:Label ID="lblRepeartColoumns" runat="server" Text="選項每列顯示"
                        meta:resourcekey="lblRepeartColoumnsResource1"></asp:Label>
                    </td>
                    <td runat="server">
                        <telerik:RadNumericTextBox ID="txtRepeartCol" Runat="server" DataType="System.Int" Width="85px" MinValue="1" Value="1">
                            <numberformat decimaldigits="0" zeropattern="n" />
                            <ClientEvents OnValueChanging="txtRepeartCol_OnValueChanging" />
                        </telerik:RadNumericTextBox>
                       
                        <asp:Label ID="lblDW" runat="server" Text="個"
                        meta:resourcekey="lblDWResource1"></asp:Label>
                    </td>
                </tr>
                <tr runat="server" id="trHeight">
                    <td runat="server">
                        <asp:Label ID="lblHeight" runat="server" Text="行數"
                        meta:resourcekey="lblHeightResource1"></asp:Label>
                    </td>
                    <td runat="server">
                        <asp:DropDownList ID="ddlHeight" runat="server" Width="85px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblHDW" runat="server" Text="行"
                        meta:resourcekey="lblHDWResource1"></asp:Label>
                    </td>
                </tr>
                <tr runat="server" id="trMaxAnsCount">
                <td runat="server" style=" white-space:nowrap;">
                    <asp:Label ID="Label1" runat="server" Text="最多可勾選的數量"
                    meta:resourcekey="Label1Resource1"></asp:Label></td>
                <td runat="server">
                    <telerik:RadNumericTextBox ID="ntbMaxAnsCount" Runat="server" Width="85px" DataType="System.Int32" MaxLength="3" MinValue="0" Value="0">
                        <numberformat decimaldigits="0" zeropattern="n" />
                        <ClientEvents OnValueChanging="ntbMaxAnsCount_OnValueChanging" />
                    </telerik:RadNumericTextBox>
                    
                    <asp:Label ID="lblMaxAnsCountDesc" runat="server" Text="(0 表示不限制勾選數量)"
                    meta:resourcekey="lblMaxAnsCountDescResource1"></asp:Label>
                </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMemo" runat="server" Text="題目備註" 
                            meta:resourcekey="lblMemoResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMemo" runat="server" Width="100%" Height="109px" 
                            TextMode="MultiLine" meta:resourcekey="txtMemoResource1"></asp:TextBox>
                    </td>
                </tr>
                <tr runat="server" id="trCreateOther">
                    <td colspan="2" align="left" runat="server">
                    </td>
                </tr>
            </table>
            <asp:Panel ID="panelAnsopt" runat="server" 
                meta:resourcekey="panelAnsoptResource1">
                <table style="width: 100%">
                    <tr>
                        <td>
                            <asp:CheckBox ID="cbCreateOhter" runat="server" Text="增加[其他]選項，供使用者輸入意見" 
                                meta:resourcekey="cbCreateOhterResource1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadToolBar ID="itemMaToolBar" runat="server" Width="100%" OnButtonClick="itemMaToolBar_OnButtonClick" OnClientButtonClicking="itemMaToolBarButtonClicking">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" Text="新增選項" Value="Add"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                        ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                        meta:resourcekey="itemMaToolBarAddResource1" >
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Text="刪除選項" Value="Delete"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        meta:resourcekey="itemMaToolBarDeleteResource1" >
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="divItem" style="float:left;overflow:visible; width: 790px; height: 370px;" runat="server">
                                <Fast:Grid ID="gridAnspot" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                                     DataKeyNames="ANSOPT_GUID" DataKeyOnClientWithCheckBox="False"
                                     EnhancePager="True" OnRowDataBound="gridAnspot_RowDataBound"
                                    PageSize="15"   
                                    AllowSorting="True"  
                                    onsorting="gridAnspot_Sorting" DefaultSortDirection="Ascending" 
                                    EmptyDataText="沒有資料" EnableModelValidation="True" 
                                    KeepSelectedRows="False" meta:resourcekey="gridAnspotResource2" >
                                    <EnhancePagerSettings
                                        ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" 
                                        LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" 
                                        PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" 
                                        PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="選項" SortExpression="ANSOPT_DESCRIPTION" 
                                            meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnAnsoptDesc" runat="server" OnClick="lbtnAnsoptDesc_Click"
                                                    Text='<%#: Eval("ANSOPT_DESCRIPTION") %>' 
                                                    meta:resourcekey="lbtnAnsoptDescResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="50%" Wrap="True" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SCORE" HeaderText="分數" SortExpression="SCORE" 
                                            DataFormatString="{0:0}" meta:resourcekey="BoundFieldResource1">
                                            <ItemStyle Width="20%" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="圖片" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>                                                
                                                <uc1:UC_FileCenter runat="server" id="UC_FileCenter" Editable="false" />
                                            </ItemTemplate>
                                            <ItemStyle Width="30%" />
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </div>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Label ID="lblType" runat="server" Text="新增/修改選項" Visible="False" 
                meta:resourcekey="lblTypeResource1"></asp:Label>
            <asp:Label ID="lblItemGuid" runat="server" Visible="False" 
                meta:resourcekey="lblItemGuidResource1"></asp:Label>
            <asp:HiddenField ID="hiddenDelete" runat="server" Value="請選擇要刪除的資料行" meta:resourcekey="hiddenDeleteResource1" />
            <asp:Label ID="lblOther" runat="server" Text="其他" Visible="False" 
                meta:resourcekey="lblOtherResource1"></asp:Label>
            <asp:Label ID="lblNameIsNull" runat="server" Text="題目不能為空" Visible="False" 
                meta:resourcekey="lblNameIsNullResource1"></asp:Label>
            <asp:Label ID="lblRep" runat="server" Text="選項每列顯示必須大於0" Visible="False" 
                meta:resourcekey="lblRepResource1"></asp:Label>
            <asp:Label ID="lblAnspot" runat="server" Text="題目是必填,請編輯題目選項" Visible ="False" 
                meta:resourcekey="lblAnspotResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
