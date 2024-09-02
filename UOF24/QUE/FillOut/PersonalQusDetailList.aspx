<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_FillOut_PersonalQusDetailList" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="PersonalQusDetailList.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBar1ButtonClicking(sender, args) {
            var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
            var key = args.get_item().get_value();
            var oDesignMasterGuid = '<%=hidDesignGuidEncode.Value %>';
            var oHid = $('#<%=hid.ClientID %>');
            oHid.val("");
            switch (key) {
                case "btnQuery":
                    var dteFrom = $find('<%=rdpFrom.ClientID %>');
                    var dteFromDate = dteFrom.get_dateInput().get_textBoxValue();
                    var dteTo = $find('<%=rdpTo.ClientID %>');
                    var dteToDate = dteTo.get_dateInput().get_textBoxValue();

                    if (dteFromDate > dteToDate) {
                        alert('<%= lblDateMsg.Text %>');
                        args.set_cancel(true);
                        return;
                    }
                    break;
                case "btnAdd":
                    var oDetailGuid = $('#<%=hidDesignGuidEncode.ClientID%>').val();
                    $uof.dialog.open2("~/QUE/FillOut/FillOut.aspx", args.get_item(), "", 900, 750, openDialogResult, { "DesignMasterGuid": oDetailGuid });
                    args.set_cancel(true);
                    break;
                case "btnDelete":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                    var choose = '<%= lblSelectDelete.Text %>';//信息
                    if (CheckedData == "") {
                        alert(choose);
                        args.set_cancel(true);
                        return;
                    }
                    else {
                        var countdata = [oDesignMasterGuid, userGuid];
                        var ointCount = $uof.pageMethod.sync("CheckDeleteCount", countdata);
                        if (!confirm('<%= lblCancelMsg.Text%>')) {
                            args.set_cancel(true);
                        }
                    }
                    break;
            }
        }
    function OnValueChanging(sender, args) {
        if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined') {
            return false;
        }
        $('#<%=hid.ClientID %>').val("hasReturn");
        return true;
    }
    </script>

    <table width="100%">
        <tr>
            <td colspan="4">
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%"
                    OnButtonClick="RadToolBar1_OnButtonClick"
                    OnClientButtonClicking="RadToolBar1ButtonClicking"
                    meta:resourcekey="RadToolBar1Resource1">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="查詢" Value="btnQuery"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"
                            meta:resourcekey="RadToolBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="填寫新問卷" Value="btnAdd"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m02.gif" meta:resourcekey="RadToolBarButtonResource3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton Value="S1" IsSeparator="true"
                            meta:resourcekey="RadToolBarButtonResource4">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="取消" Value="btnDelete"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource5">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton Value="S2" IsSeparator="true"
                            meta:resourcekey="RadToolBarButtonResource6">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <table style="width: 100%" cellspacing="1" class="PopTable">
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="問卷名稱"
                                meta:resourcekey="Label1Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDesignName" runat="server"
                                meta:resourcekey="lblDesignNameResource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="狀態"
                                meta:resourcekey="Label2Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDesignStatus" runat="server"
                                meta:resourcekey="lblDesignStatusResource1"></asp:Label>
                        </td>

                    </tr>
                    <tr>

                        <td style=" white-space:nowrap;">
                            <asp:Label ID="Label5" runat="server" Text="問卷填寫日期(起)"
                                meta:resourcekey="Label5Resource1"></asp:Label></td>
                        <td>
                            <telerik:RadDatePicker ID="rdpFrom" runat="server"
                                meta:resourcekey="rdpFromResource1">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                                <DateInput LabelWidth="64px" ClientEvents-OnValueChanging="OnValueChanging"
                                    Width="">
                                </DateInput>

                                <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                        <td style=" white-space:nowrap;">
                            <asp:Label ID="Label6" runat="server" Text="問卷填寫日期(迄)"
                                meta:resourcekey="Label6Resource1"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="rdpTo" runat="server" meta:resourcekey="rdpToResource1">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

                                <DateInput LabelWidth="64px" ClientEvents-OnValueChanging="OnValueChanging"
                                    Width="">
                                </DateInput>

                                <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="填寫者備註"
                                meta:resourcekey="Label3Resource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtQusDetailRemark" runat="server"
                                meta:resourcekey="txtQusDetailRemarkResource1"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="狀態"
                                meta:resourcekey="Label4Resource1"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlDetailStatus" runat="server" Width="120px"
                                meta:resourcekey="ddlDetailStatusResource1">
                                <asp:ListItem Text="全部" Value="ALL" Selected="True"
                                    meta:resourcekey="ListItemResource1"></asp:ListItem>
                                <asp:ListItem Text="已送出" Value="SM" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                <asp:ListItem Text="已儲存" Value="SA" meta:resourcekey="ListItemResource3"></asp:ListItem>

                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <Fast:Grid ID="grd" AutoGenerateCheckBoxColumn="True" runat="server"
                    AllowSorting="True"
                    DataKeyOnClientWithCheckBox="False"
                    EnhancePager="True" OnRowDataBound="grd_RowDataBound" PageSize="15"
                    AutoGenerateColumns="False"
                    Width="100%" DataKeyNames="QUS_DETAIL_GUID" AllowPaging="True"
                    DefaultSortDirection="Ascending" 
                    EmptyDataText="沒有資料" KeepSelectedRows="False"
                    meta:resourcekey="grdResource2"  >
                    <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>


                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>


                    <Columns>
                        <asp:BoundField HeaderText="填寫者備註" meta:resourcekey="BoundFieldResource1" />
                        <asp:BoundField HeaderText="狀態" meta:resourcekey="BoundFieldResource2" />
                        <asp:TemplateField HeaderText="儲存/送出時間"
                            meta:resourcekey="BoundFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblSubmitDate" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtn" runat="server" OnClick="lbtn_Click"
                                    meta:resourcekey="lbtnResource1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </Fast:Grid>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                    SelectCountMethod="GetRepeatQusDetail_Count" SelectMethod="GetRepeatQusDetail" SortParameterName="strSortExpression"
                    StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusUCO">
                    <SelectParameters>
                        <asp:Parameter Name="condition" />
                        <asp:Parameter Name="intStartIndex" />
                        <asp:Parameter Name="intMaxRows" />
                        <asp:Parameter Name="strSortExpression" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblEM" runat="server" Text="調查中" Visible="False"
        meta:resourcekey="lblEMResource1"></asp:Label>
    <asp:Label ID="lblSP" runat="server" Text="中止" Visible="False"
        meta:resourcekey="lblSPResource1"></asp:Label>
    <asp:Label ID="lblCL" runat="server" Text="結束" Visible="False"
        meta:resourcekey="lblCLResource1"></asp:Label>
    <asp:Label ID="lblSA" runat="server" Text="儲存" Visible="False"
        meta:resourcekey="lblSAResource1"></asp:Label>
    <asp:Label ID="lblSM" runat="server" Text="送出" Visible="False"
        meta:resourcekey="lblSMResource1"></asp:Label>
    <asp:Label ID="lblEdit" runat="server" Text="修改" Visible="False"
        meta:resourcekey="lblEditResource1"></asp:Label>
    <asp:Label ID="lblLook" runat="server" Text="查看內容" Visible="False"
        meta:resourcekey="lblLookResource1"></asp:Label>
    <asp:Label ID="lblSelectDelete" runat="server" Text="請選擇要取消的資料行"
        Visible="False" meta:resourcekey="lblSelectDeleteResource1"></asp:Label>
    <asp:Label ID="lblFillOutTitle" runat="server" Text="填寫問卷" Visible="False"
        meta:resourcekey="lblFillOutTitleResource1"></asp:Label>
    <asp:Label ID="lblDetailListTitle" runat="server" Text="個人問卷填寫情況"
        Visible="False" meta:resourcekey="lblDetailListTitleResource1"></asp:Label>
    <asp:Label ID="lblDeleteAllItemMsg" runat="server" Text="不能取消全部問卷資料."
        Visible="False" meta:resourcekey="lblDeleteAllItemMsgResource1"></asp:Label>
    <asp:HiddenField ID="hidDesignGuidEncode" runat="server" />
    <asp:HiddenField ID="hid" runat="server" />
    <asp:HiddenField ID="hfIsModify" runat="server" />
    <asp:Label ID="lblDateMsg" runat="server" Text="查詢的起始時間必須早於等於結束時間"
        meta:resourcekey="lblDateMsgResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblCancelMsg" runat="server" Text="確定要取消嗎?" meta:resourcekey="lblCancelMsgResource1" Visible="False"></asp:Label>
    <asp:HiddenField ID="hdUserGuid" runat="server" />
</asp:Content>

