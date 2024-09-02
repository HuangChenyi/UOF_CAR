<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_QusMA" Culture="auto" UICulture="auto" Title="問卷內容" meta:resourcekey="PageResource1" CodeBehind="QusMA.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../Common/UC_Qus.ascx" TagName="UC_Qus" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc3" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc4" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc5" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" id="igClientScript">
        function maItemToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "AddItem":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/QUE/Design/QusItemMA.aspx", args.get_item(), "<%=lblTypeAddItems.Text%>", 810, 750, openDialogResult,
                        { "Type": "Add", "QusDesignGuid": "<%=lblDesignGuid.Text%>" });
                    break;
                case "ImportItem":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/QUE/Design/ImportItem.aspx", args.get_item(), "<%=lblCopyItems.Text%>", 840, 600, openDialogResult,
                        { "Type": "Add", "QusDesignGuid": "<%=lblDesignGuid.Text%>" });
                    break;
                case "ImportQusItem":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/QUE/Design/ImportQusItem.aspx", args.get_item(), "<%=lblImportItems.Text%>", 500, 400, openDialogResult,
                        { "Type": "Add", "QusDesignGuid": "<%=lblDesignGuid.Text%>" });
                    break;
                case "ChangeOrder":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/QUE/Design/ModifyItemOrder.aspx", args.get_item(), "<%=lblItemsOrder.Text%>", 950, 700, openDialogResult,
                        { "QusDesignGuid": "<%=lblDesignGuid.Text%>" });
                    break;
                case "SetProperty":

                    args.set_cancel(true);
                    $uof.dialog.open2("~/QUE/Design/ImportProperty.aspx", args.get_item(), "<%=lblImportProperty.Text%>", 700, 550, openDialogResult,
                        { "QusDesignGuid": "<%=lblDesignGuid.Text%>" });
                    break;
                case "DeleteItem":
                    // 取得題目的信息
                    var gridObj = $('#ctl00_ContentPlaceHolder1_UC_Qus1_gridItem INPUT');
                    var checkboxs = gridObj;
                    var checkedString = "";
                    for (var i = 0; i < checkboxs.length; i++) {
                        if (checkboxs[i].checked)
                            checkedString += checkboxs[i].DataKey + ",";
                    }
                    var CheckedData = checkedString;
                    var choose = '<%= lblDelete.Text %>';//信息

                    if (CheckedData == "") {
                        alert(choose);
                        args.set_cancel(true);
                        return;
                    }
                    else {
                        if (!confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                            args.set_cancel(true);
                        }
                    }
                    break;
                case "ExportItem":
                    args.set_cancel(true);
                    $uof.download('DownloadQusExcel.aspx?QusDesignGuid=' +  "<%=lblDesignGuid.Text%>" + "'");
                    break;
            }
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
            return true;
        }

        function NeedExamine() {

            if ($("#<%=ExaminerTR.ClientID%>").length > 0) {
                if (confirm('<%=lblNeedExamine.Text %>')) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else
                return true;
        }
        
        function CheckRadioButtonStatus(noticeType) {
            if (noticeType != '') {
                if (noticeType === 'E') {
                    noticeType = $("#<%= ddlNoticeTime.ClientID %>").val();
                }

            }
            if ($("#<%=rbNoNotice.ClientID %>").is(":checked") == true || $("#<%=rbNoticeAtOnce.ClientID %>").is(":checked") == true || $("#<%=rbNoticeSurveyStart.ClientID %>").is(":checked") == true) {
                $("#noticeDiv").css("display", "none");
            }
            if ($("#<%=rbElse.ClientID %>").is(":checked") == true) {
                $("#noticeDiv").css("display", "");
            }

            if (noticeType != '') {
                if ($("#<%= hidType.ClientID %>").val() === noticeType) {
                    $("#<%= btnChangeNotice.ClientID %>").click();
                }
            }
        }
        Sys.Application.add_load(
            function () {
                CheckRadioButtonStatus('');
            });
    </script>

    <asp:CustomValidator ID="cvMessage" runat="server" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>

    <telerik:RadTabStrip ID="tabQue" MultiPageID="rmp1" Width="100%" runat="server" SelectedIndex="1" meta:resourcekey="tabQueResource2">
        <Tabs>
            <telerik:RadTab runat="server" Value="Design" PageViewID="rpvDesign" Text="基本設定" meta:resourcekey="RadTabResource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="Items" PageViewID="rpvItems" Selected="True" Text="題目設定" meta:resourcekey="RadTabResource2">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="Users" PageViewID="rpvUsers" Text="調查時間/對象" meta:resourcekey="RadTabResource3">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="ExamineLog" PageViewID="rpvExamineLog" Text="審核意見" meta:resourcekey="RadTabResource4">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="rmp1" runat="server" SelectedIndex="1" meta:resourcekey="rmp1Resource1">
        <telerik:RadPageView ID="rpvDesign" runat="server" meta:resourcekey="rpvDesignResource1">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <table cellspacing="1" class="PopTable" style="width: 100%">
                        <tr>
                            <td><font color="red">*</font>
                                <asp:Label ID="lblNameLeft" runat="server" meta:resourcekey="lblNameLeftResource1" Text="問卷名稱"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" MaxLength="255" meta:resourcekey="txtNameResource1"></asp:TextBox>
                                <telerik:RadButton ID="ibtnAddQue" runat="server" meta:resourcekey="ibtnAddQueResource1" OnClick="ibtnAddQue_Click" Text="從其他問卷複製"></telerik:RadButton>
                            </td>
                        </tr>
                        <tr>
                            <td><font color="red">*</font>
                                <asp:Label ID="lblCatLeft" runat="server" meta:resourcekey="lblCatLeftResource1" Text="問卷類別"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCatRight" runat="server" meta:resourcekey="lblCatRightResource1"></asp:Label></td>
                                                <td>
                                                    <telerik:RadButton ID="ibtnCat" runat="server" meta:resourcekey="ibtnCatResource1" OnClick="ibtnCat_Click" Text="選取類別"></telerik:RadButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSateLeft" runat="server" meta:resourcekey="lblSateLeftResource1" Text="問卷狀態"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblStateRight" runat="server" meta:resourcekey="lblStateRightResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr id="ExaminerTR" runat="server">
                            <td runat="server">
                                <asp:Label ID="lblExaminer" runat="server" Text="審核者"></asp:Label>
                            </td>
                            <td runat="server">
                                <uc5:UC_ChoiceList ID="UC_ChoiceListExaminer" runat="server" IsAllowEdit="false" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPublishLeft" runat="server" meta:resourcekey="lblPublishLeftResource1" Text="統計結果"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtnPublish" runat="server" meta:resourcekey="rbtnPublishResource1" RepeatDirection="Horizontal">
                                    <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True" Text="公開" Value="Y"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource2" Text="不公開" Value="N"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblRegisteredLeft" runat="server" meta:resourcekey="lblRegisteredLeftResource1" Text="問卷記名"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtnRegistered" runat="server" meta:resourcekey="rbtnRegisteredResource1" RepeatDirection="Horizontal">
                                    <asp:ListItem meta:resourcekey="ListItemResource3" Selected="True" Text="記名" Value="Y"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource4" Text="不記名" Value="N"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblAllowCopyLeft" runat="server" meta:resourcekey="lblAllowCopyLeftResource1" Text="是否允許他人複製此問卷"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtnCopy" runat="server" meta:resourcekey="rbtnCopyResource1" RepeatDirection="Horizontal">
                                    <asp:ListItem meta:resourcekey="ListItemResource5" Selected="True" Text="是" Value="Y"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource6" Text="否" Value="N"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="lblAllowSaceLeft" runat="server" meta:resourcekey="lblAllowSaceLeftResource1" Text="填寫問卷時是否提供儲存"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtnSave" runat="server" meta:resourcekey="rbtnSaveResource1" RepeatDirection="Horizontal">
                                    <asp:ListItem meta:resourcekey="ListItemResource7" Selected="True" Text="是" Value="Y"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource8" Text="否" Value="N"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblRepeatSubmit" runat="server" meta:resourcekey="lblRepeatSubmitResource1" Text="是否允許重複填寫"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtnRepeat" runat="server" meta:resourcekey="rbtnSaveResource1" RepeatDirection="Horizontal">
                                    <asp:ListItem meta:resourcekey="ListItemResource7" Text="是" Value="Y"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource8" Selected="True" Text="否" Value="N"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="white-space: nowrap;">
                                <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" Text="是否允許填寫者修改或取消"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rblIsModify" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblIsModifyResource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource93" Text="是" Value="Y"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource94" Selected="True" Text="否" Value="N"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Label ID="Label10" runat="server" CssClass="SizeMemo" ForeColor="Blue" meta:resourcekey="Label10Resource1" Text="說明：可設定填寫者是否能修改或取消個人填寫過的問卷"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFile" runat="server" meta:resourcekey="lblFileResource1" Text="附件"></asp:Label>
                            </td>
                            <td>
                                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMemo" runat="server" meta:resourcekey="lblMemoResource1" Text="備註"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMemo" runat="server" Height="102px" meta:resourcekey="txtMemoResource1" TextMode="MultiLine" Width="448px"></asp:TextBox>
                                <asp:Label ID="lblMemoText" runat="server" meta:resourcekey="lblMemoTextResource1" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="問卷設計人"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDesigner" runat="server" meta:resourcekey="lblDesignerResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="建立時間"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblCreateDate" runat="server" meta:resourcekey="lblCreateDateResource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="最後一次修改時間"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLastModifyDate" runat="server" meta:resourcekey="lblLastModifyDateResource1"></asp:Label>
                            </td>
                        </tr>
                        </colgroup>
                    </table>
                    <asp:HiddenField ID="hidType" runat="server" />
                    <asp:HiddenField ID="hidisFirst" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:Label ID="lblDS" runat="server" Text="製作中" Visible="False" meta:resourcekey="lblDSResource1"></asp:Label>
            <asp:Label ID="lblPL" runat="server" Text="發佈" Visible="False" meta:resourcekey="lblPLResource1"></asp:Label>
            <asp:Label ID="lblCatGuid" runat="server" Visible="False" meta:resourcekey="lblCatGuidResource1"></asp:Label>
            <asp:Label ID="lblNameIsNull" runat="server" Text="問卷名稱不能為空" Visible="False" meta:resourcekey="lblNameIsNullResource1"></asp:Label>
            <asp:Label ID="lblCatIsNull" runat="server" Text="問卷類別不能為空" Visible="False" meta:resourcekey="lblCatIsNullResource1"></asp:Label>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvItems" runat="server" meta:resourcekey="rpvItemsResource1" Selected="True">
            <table style="width: 800px">
                <tr >
                    <td>
                        <asp:Label ID="lblWriterTime" Text="" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <telerik:RadToolBar ID="maItemToolBar" runat="server" OnButtonClick="maItemToolBar_OnButtonClick" OnClientButtonClicking="maItemToolBarButtonClicking" Width="100%" meta:resourcekey="maItemToolBarResource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m12.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif" ImageUrl="~/Common/Images/Icon/icon_m12.gif" meta:resourcekey="maItemToolBarAddItemResource1" Text="新增題目" Value="AddItem"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m179.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m179.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m179.gif" ImageUrl="~/Common/Images/Icon/icon_m179.gif" meta:resourcekey="maItemToolBarImportItemResource1" Text="複製題目" Value="ImportItem"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif" ImageUrl="~/Common/Images/Icon/icon_m110.gif" meta:resourcekey="maItemToolBarImportExcelItemResource1" Text="匯入題目" Value="ImportQusItem"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m38.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m38.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m38.gif" ImageUrl="~/Common/Images/Icon/icon_m38.gif" meta:resourcekey="maItemToolBarChangeOrderResource1" Text="修改題目順序" Value="ChangeOrder"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m19.png" DisabledImageUrl="~/Common/Images/Icon/icon_m19.png" HoveredImageUrl="~/Common/Images/Icon/icon_m19.png" ImageUrl="~/Common/Images/Icon/icon_m19.png" meta:resourcekey="maItemToolBarSetPropertyResource1" Text="設定填寫人屬性" Value="SetProperty"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="maItemToolBarDeleteItemResource1" Text="刪除選擇題目" Value="DeleteItem"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource5"></telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m144.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif" ImageUrl="~/Common/Images/Icon/icon_m144.gif" meta:resourcekey="maItemToolBarExportItemResource1" Text="匯出問卷" Value="ExportItem"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource6" Value="ExportItemSeparator"></telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td style="width: 800px">
                        <uc2:UC_Qus ID="UC_Qus1" runat="server" />
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvUsers" runat="server" meta:resourcekey="rpvUsersResource1">
            <table cellspacing="1" class="PopTable" style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="lblTime" runat="server" meta:resourcekey="lblTimeResource1" Text="調查時間"></asp:Label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td style="width: 50px">
                                    <telerik:RadDatePicker ID="rdpStartDate" runat="server" meta:resourcekey="rdpStartDateResource1" AutoPostBack="True" OnSelectedDateChanged="rdpStartDate_SelectedDateChanged">
                                        <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                        </Calendar>
                                        <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="" AutoPostBack="True">
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </DateInput>
                                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                    </telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlStartHour" runat="server" meta:resourcekey="ddlStartHourResource1" AutoPostBack="True" OnSelectedIndexChanged="ddlStartHour_SelectedIndexChanged">
                                        <asp:ListItem meta:resourcekey="ListItemResource9" Text="00"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource10" Text="01"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource11" Text="02"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource12" Text="03"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource13" Text="04"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource14" Text="05"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource15" Text="06"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource16" Text="07"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource17" Text="08"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource18" Text="09"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource19" Text="10"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource20" Text="11"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource21" Text="12"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource22" Text="13"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource23" Text="14"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource24" Text="15"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource25" Text="16"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource26" Text="17"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource27" Text="18"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource28" Text="19"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource29" Text="20"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource30" Text="21"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource31" Text="22"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource32" Text="23"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;:&nbsp; </td>
                                <td>
                                    <asp:DropDownList ID="ddlStartMinute" runat="server" meta:resourcekey="ddlStartMinuteResource1" AutoPostBack="True" OnSelectedIndexChanged="ddlStartMinute_SelectedIndexChanged">
                                        <asp:ListItem meta:resourcekey="ListItemResource33" Text="00"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource34" Text="15"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource35" Text="30"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource36" Text="45"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 10px">
                                    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="~"></asp:Label>
                                </td>
                                <td style="width: 50px">
                                    <telerik:RadDatePicker ID="rdpEndDate" runat="server" meta:resourcekey="rdpEndDateResource1">
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
                                    </telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlEndHour" runat="server" meta:resourcekey="ddlEndHourResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource37" Text="00"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource38" Text="01"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource39" Text="02"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource40" Text="03"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource41" Text="04"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource42" Text="05"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource43" Text="06"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource44" Text="07"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource45" Text="08"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource46" Text="09"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource47" Text="10"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource48" Text="11"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource49" Text="12"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource50" Text="13"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource51" Text="14"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource52" Text="15"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource53" Text="16"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource54" Text="17"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource55" Text="18"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource56" Text="19"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource57" Text="20"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource58" Text="21"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource59" Text="22"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource60" Text="23"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;:&nbsp; </td>
                                <td>
                                    <asp:DropDownList ID="ddlEndMinute" runat="server" meta:resourcekey="ddlEndMinuteResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource61" Text="00"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource62" Text="15"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource63" Text="30"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource64" Text="45"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblShowReportTime" runat="server" meta:resourcekey="lblShowReportTimeResource1" Text="統計結果公布時間"></asp:Label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadDatePicker ID="rdpShowReportTime" runat="server" meta:resourcekey="rdpShowReportTimeResource1">
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
                                    </telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlShowHour" runat="server" meta:resourcekey="ddlShowHourResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource65" Text="00"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource66" Text="01"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource67" Text="02"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource68" Text="03"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource69" Text="04"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource70" Text="05"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource71" Text="06"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource72" Text="07"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource73" Text="08"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource74" Text="09"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource75" Text="10"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource76" Text="11"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource77" Text="12"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource78" Text="13"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource79" Text="14"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource80" Text="15"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource81" Text="16"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource82" Text="17"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource83" Text="18"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource84" Text="19"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource85" Text="20"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource86" Text="21"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource87" Text="22"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource88" Text="23"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;:&nbsp; </td>
                                <td>
                                    <asp:DropDownList ID="ddlShowMinute" runat="server" meta:resourcekey="ddlShowMinuteResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource89" Text="00"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource90" Text="15"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource91" Text="30"></asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource92" Text="45"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblExpiredDate" runat="server" meta:resourcekey="lblExpiredDateResource1" Text="統計結果下架日期"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="rdpExpired" runat="server" meta:resourcekey="rdpExpiredResource1">
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
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1" Text="問卷調查對象"></asp:Label>
                    </td>
                    <td>
                        <uc5:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="False" ShowEmployee="True" ShowMember="True" ShowSubDept="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="發送時間"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSendDate" runat="server" meta:resourcekey="lblSendDateResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="關閉時間"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCloseDate" runat="server" meta:resourcekey="lblCloseDateResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" meta:resourcekey="Label9Resource1" Text="中止時間"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSPDate" runat="server" meta:resourcekey="lblSPDateResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label11" runat="server" Text="問卷調查通知" meta:resourcekey="Label11Resource1"></asp:Label>
                    </td>
                    <td style="white-space:nowrap;">
                        <table style="padding: 0; width: 25%">
                            <tr>
                                <td colspan="2">
                                    <asp:RadioButton ID="rbNoNotice" runat="server" Text="不通知" GroupName="NoticeGroup" onclick="CheckRadioButtonStatus('N')" meta:resourcekey="rbNoNoticeResource1" AutoPostBack="True" OnCheckedChanged="rbNoNotice_CheckedChanged" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:RadioButton ID="rbNoticeAtOnce" runat="server" Text="立即通知(啟用後約5分鐘可收到通知)" GroupName="NoticeGroup" onclick="CheckRadioButtonStatus('Y')" meta:resourcekey="rbNoticeAtOnceResource1" AutoPostBack="True" OnCheckedChanged="rbNoticeAtOnce_CheckedChanged" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:RadioButton ID="rbNoticeSurveyStart" runat="server" Text="調查開始時通知" GroupName="NoticeGroup" onclick="CheckRadioButtonStatus('0')" AutoPostBack="True" OnCheckedChanged="rbNoticeSurveyStart_CheckedChanged" meta:resourcekey="rbNoticeSurveyStartResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width:70px">
                                    <asp:RadioButton ID="rbElse" runat="server" Text="開始前" GroupName="NoticeGroup" onclick="CheckRadioButtonStatus('E')" meta:resourcekey="rbElseResource1" AutoPostBack="True" OnCheckedChanged="rbElse_CheckedChanged" />
                                </td>
                                <td>
                                    <div style="display: none" id="noticeDiv">
                                        <asp:DropDownList ID="ddlNoticeTime" runat="server" meta:resourcekey="ddlNoticeTimeResource1" AutoPostBack="True" OnSelectedIndexChanged="ddlNoticeTime_SelectedIndexChanged">
                                            <asp:ListItem Value="15" meta:resourcekey="ListItemResource95" Text="15分"></asp:ListItem>
                                            <asp:ListItem Value="30" meta:resourcekey="ListItemResource96" Text="30分"></asp:ListItem>
                                            <asp:ListItem Value="60" meta:resourcekey="ListItemResource97" Text="1小時"></asp:ListItem>
                                            <asp:ListItem Value="120" meta:resourcekey="ListItemResource98" Text="2小時"></asp:ListItem>
                                            <asp:ListItem Value="1440" meta:resourcekey="ListItemResource99" Text="1天"></asp:ListItem>
                                            <asp:ListItem Value="4320" meta:resourcekey="ListItemResource100" Text="3天"></asp:ListItem>
                                            <asp:ListItem Value="10080" meta:resourcekey="ListItemResource101" Text="1週"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                    <div style="display:none">
                                        <asp:Button ID="btnChangeNotice" runat="server" OnClick="btnChangeNotice_Click" CausesValidation="False" meta:resourcekey="btnChangeNoticeResource1" />
                                    </div>
                                <asp:Label ID="lblSendTime" runat="server" ForeColor="Blue" meta:resourcekey="lblSendTimeResource1"></asp:Label>
                                <asp:Label ID="lblHasSendTitle" runat="server" Text="已有發送通知。當異動通知選項或調查時間時，如果符合通知條件時，仍會再次發送通知" ForeColor="Blue" Visible="False" meta:resourcekey="lblHasSendTitleResource1"></asp:Label>
                                <asp:Label ID="lblNoticeAtOnceUpdate" runat="server" Text="當問卷儲存後，立刻發送通知" ForeColor="Blue" Visible="False" meta:resourcekey="lblNoticeAtOnceUpdateResource1"></asp:Label>
                                <asp:Label ID="lblNoticeAtOnceInsert" runat="server" Text="當問卷啟用後，立刻發送通知" ForeColor="Blue" Visible="False" meta:resourcekey="lblNoticeAtOnceInsertResource1"></asp:Label>
                                <asp:Label ID="lblExpiredUpdate" runat="server" Text="調查時間已過，當問卷儲存後，立刻發送通知" ForeColor="Blue" Visible="False" meta:resourcekey="lblExpiredUpdateResource1"></asp:Label>
                                <asp:Label ID="lblExpiredInsert" runat="server" Text="調查時間已過，當問卷啟用後，立刻發送通知" ForeColor="Blue" Visible="False" meta:resourcekey="lblExpiredInsertResource1"></asp:Label>
                                <asp:Label ID="lblSendTimeTitle" runat="server" Text="預計發送時間:" ForeColor="Blue" Visible="False" meta:resourcekey="lblSendTimeTitleResource1"></asp:Label>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="rdpStartDate" EventName="SelectedDateChanged" />
                                <asp:AsyncPostBackTrigger ControlID="ddlStartHour" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="ddlStartMinute" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="rbNoNotice" EventName="CheckedChanged" />
                                <asp:AsyncPostBackTrigger ControlID="rbNoticeAtOnce" EventName="CheckedChanged" />
                                <asp:AsyncPostBackTrigger ControlID="rbNoticeSurveyStart" EventName="CheckedChanged" />
                                <asp:AsyncPostBackTrigger ControlID="rbElse" EventName="CheckedChanged" />
                                <asp:AsyncPostBackTrigger ControlID="ddlNoticeTime" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="btnChangeNotice" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: left;">
                        <asp:Label ID="lblNotice" runat="server" CssClass="SizeMemo" meta:resourcekey="lblNoticeResource1" Text="1. 必須啟用問卷，才會發送問卷調查通知。"></asp:Label>
                        <br />
                        <asp:Label ID="lblChangeTimeNotice" runat="server" CssClass="SizeMemo" meta:resourcekey="lblChangeTimeNoticeResource1" Text="2. 當調查對象還未收到問卷調查通知前，若有修改調查時間，則不會發送問卷修改通知。"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" CssClass="SizeMemo" meta:resourcekey="Label2Resource1" Text="3. 問卷啟用後，如修改問卷調查對象，將會修改問卷的發送數及回收數。"></asp:Label>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rpvExamineLog" runat="server" meta:resourcekey="rpvExamineLogResource1">
            <Ede:Grid ID="logGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="True"
                DefaultSortDirection="Descending" DefaultSortColumnName="CREATE_DATE" EmptyDataText="沒有資料"
                EnhancePager="True" KeepSelectedRows="False" OnRowDataBound="logGrid_RowDataBound"
                PageSize="15" Width="100%" OnPageIndexChanging="logGrid_PageIndexChanging"
                OnSorting="logGrid_Sorting" CustomDropDownListPage="False" meta:resourcekey="logGridResource1" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="審核者" meta:resourceKey="TemplateFieldResource1" SortExpression="EXAMINER">
                        <ItemTemplate>
                            <asp:Label ID="lblExaminer" runat="server" meta:resourceKey="lblExaminerResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Width="20%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="COMMENT" HeaderText="意見" meta:resourceKey="BoundFieldResource1"></asp:BoundField>
                    <asp:TemplateField HeaderText="審核時間" meta:resourceKey="BoundFieldResource2" SortExpression="CREATE_DATE">
                        <ItemTemplate>
                            <asp:Label ID="lblCreateDate" runat="server" Text=""></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="25%"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="審核狀態" meta:resourceKey="TemplateFieldResource2" SortExpression="STATUS">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" meta:resourceKey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Width="5%"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hidisExamine" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblFillQue" runat="server" Text="填寫問卷" Visible="False" meta:resourcekey="lblFillQueResource1"></asp:Label>
    <asp:Label ID="lblViewQue" runat="server" Text="查看問卷" Visible="False" meta:resourcekey="lblViewQueResource1"></asp:Label>
    <asp:Label ID="lblTypeAddItems" runat="server" Text="新增/修改題目" Visible="False" meta:resourcekey="lblTypeAddItemsResource1"></asp:Label>
    <asp:Label ID="lblItemsOrder" runat="server" Text="修改題目順序" Visible="False" meta:resourcekey="lblItemsOrderResource1"></asp:Label>
    <asp:Label ID="lblCopyItems" runat="server" Text="複製題目" Visible="False" meta:resourcekey="lblCopyItemsResource1"></asp:Label>
    <asp:Label ID="lblImportItems" runat="server" Text="匯入題目" Visible="False" meta:resourcekey="lblImportItemsResource1"></asp:Label>
    <asp:Label ID="lblImportProperty" runat="server" Text="設定填寫人屬性" Visible="False" meta:resourcekey="lblImportPropertyResource1"></asp:Label>
    <asp:Label ID="lblDesignGuid" runat="server" Visible="False" meta:resourcekey="lblDesignGuidResource1"></asp:Label>
    <asp:Label ID="lblEditCat" runat="server" Text="選取類別" Visible="False" meta:resourcekey="lblEditCatResource1"></asp:Label>
    <asp:Label ID="lblDesignGuidForSend" runat="server" Visible="False" meta:resourcekey="lblDesignGuidForSendResource1"></asp:Label>
    <asp:Label ID="lblMasterGuidForSend" runat="server" Visible="False" meta:resourcekey="lblMasterGuidForSendResource1"></asp:Label>
    <asp:HiddenField ID="hiddenDelete" runat="server" Value="請選擇要刪除的資料行" />
    <asp:Label ID="lblDelete" runat="server" Text="請選擇要刪除的資料行" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblDesignName" runat="server" Text="問卷名稱不允許重覆" Visible="False" meta:resourcekey="lblDesignNameResource1"></asp:Label>
    <asp:Label ID="lblQusTimeError" runat="server" Text="調查終止時間不能早於調查起始時間" Visible="False"
        meta:resourcekey="lblQusTimeErrorResource1"></asp:Label>
    <asp:Label ID="lblQusTimeEqualError" runat="server" Text="調查終止時間需晚於調查起始時間" Visible="False" meta:resourcekey="lblQusTimeEqualErrorResource1"></asp:Label>
    <asp:Label ID="lblQusEndTimeError" runat="server" Text="調查終止時間不能早於當前時間" Visible="False"
        meta:resourcekey="lblQusEndTimeErrorResource1"></asp:Label>
    <asp:Label ID="lblQusStartTimeError" runat="server" Text="調查起始時間不能早於當前時間" Visible="False"
        meta:resourcekey="lblQusStartTimeErrorResource1"></asp:Label>
    <asp:Label ID="lblExpiredTimeError" runat="server" Text="統計結果下架日期必須晚於調查結束時間" Visible="False"
        meta:resourcekey="lblExpiredTimeErrorResource1"></asp:Label>
    <asp:Label ID="lblShowReportDateError" runat="server" Text="統計結果公布時間不能早於問卷調查開始時間或晚於統計結果下架日期"
        Visible="False" meta:resourcekey="lblShowReportDateErrorResource1"></asp:Label>
    <asp:Label ID="lblSend" runat="server" Text="啟用" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>
    <asp:Label ID="lblItem" runat="server" Text="題目是必填,請編輯題目選項" Visible="False" meta:resourcekey="lblItemResource1"></asp:Label>
    <asp:Label ID="lblSave" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="維護問卷" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblItemError" runat="server" Text="題目是必填,請編輯題目選項" Visible="False"
        meta:resourcekey="lblItemErrorResource1"></asp:Label>
    <asp:Label ID="lblItemEmpty" runat="server" Text="該問卷沒有題目,不可以發送問卷" Visible="False"
        meta:resourcekey="lblItemEmptyResource1"></asp:Label>
    <asp:Label ID="lblLinkName" runat="server" Text="請點選此處,填寫問卷。" Visible="False" meta:resourcekey="lblLinkNameResource1"></asp:Label>
    <asp:Label ID="lblSetSendUsers" runat="server" Text="未設定問卷調查對象" Visible="False" meta:resourcekey="lblSetSendUsersResource1"></asp:Label>
    <asp:Label ID="lblSaveSuccess" runat="server" Visible="False" meta:resourcekey="lblSaveSuccessResource1"></asp:Label>
    <asp:Label ID="lblSendM" runat="server" Text="發送數更改為:" Visible="False" meta:resourcekey="lblSendMResource1"></asp:Label>
    <asp:Label ID="lblSubmit" runat="server" Text="回收數更改為:" Visible="False" meta:resourcekey="lblSubmitResource1"></asp:Label>
    <asp:Label ID="lblModMsgTitle" runat="server" Visible="False" Text="問卷調查修改通知" meta:resourcekey="lblModMsgTitleResource1"></asp:Label>
    <asp:Label ID="lblCancelMsgTitle" runat="server" Visible="False" Text="問卷調查取消通知"
        meta:resourcekey="lblCancelMsgTitleResource1"></asp:Label>
    <asp:Label ID="lblQueName" runat="server" Visible="False" Text="問卷名稱" meta:resourcekey="lblQueNameResource1"></asp:Label>
    <asp:Label ID="lblQueTime" runat="server" Visible="False" Text="原始調查時間" meta:resourcekey="lblQueTimeResource1"></asp:Label>
    <asp:Label ID="lblQueNowTime" runat="server" Visible="False" Text="目前調查時間" meta:resourcekey="lblQueNowTimeResource1"></asp:Label>
    <asp:Label ID="lblQueRemark" runat="server" Visible="False" Text="問卷說明" meta:resourcekey="lblQueRemarkResource1"></asp:Label>
    <asp:Label ID="lblQueDesigner" runat="server" Visible="False" Text="發起人" meta:resourcekey="lblQueDesignerResource1"></asp:Label>
    <asp:Label ID="lblQueNote" runat="server" Visible="False" Text="請在調查時間內填寫問卷，謝謝" meta:resourcekey="lblQueNoteResource1"></asp:Label>
    <asp:Label ID="lblCancelQue" runat="server" Visible="False" Text="問卷" meta:resourcekey="lblCancelQueResource1"></asp:Label>
    <asp:Label ID="QueTime" Visible="False" runat="server" Text="(發起人:{0}  起始時間:{1} 結束時間:{2})" meta:resourcekey="QueTimeQueResource1"></asp:Label>
    <asp:Label ID="lblNoData" Visible="False" runat="server" Text="請先新增題目再進行排序。" meta:resourcekey="lblNoDataResource1"></asp:Label>
    <asp:Label ID="lblSendTimeErr" Visible="False" runat="server" Text="啟用時間不能晚於調查結束時間" meta:resourcekey="lblSendTimeErrResource1"></asp:Label>
    <asp:Label ID="lblDN" Visible="False" runat="server" Text="發佈拒絕" meta:resourcekey="lblDNResource1"></asp:Label>
    <asp:Label ID="lblAP" Visible="False" runat="server" Text="審核中" meta:resourcekey="lblAPResource1"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" Text="拒絕" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>
    <asp:Label ID="lblApprove" runat="server" Text="同意" Visible="False" meta:resourcekey="lblApproveResource1"></asp:Label>
    <asp:Label ID="lblNeedExamine" runat="server" Text="問卷需經過審核後才會發佈" Visible="False" meta:resourcekey="lblNeedExamineResource1"></asp:Label>
    <asp:Label ID="lblRootName" runat="server" Text="全部類別" meta:resourcekey="lblRootNameResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblTaskExecuting" runat="server" Text="問卷尚未發送完成，請稍候。" meta:resourcekey="lblTaskExecutingResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblInsertTargetUserMsg" runat="server" Text="已啟用問卷，問卷發送將進入系統排程。" meta:resourcekey="lblInsertTargetUserMsgResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblWriter" runat="server" Visible="false" Text="填寫人" meta:resourcekey="lblWriterResource1"></asp:Label>
    <asp:Label ID="lblWriteTime" runat="server" Visible="false" Text="填寫時間" meta:resourcekey="lblWriteTimeResource1"></asp:Label>
    <asp:Label ID="lblHiddenName" runat="server" Visible="false" Text="不記名" meta:resourcekey="lblHiddenNameResource1"></asp:Label>
    <asp:Label ID="lblClose" runat="server" Text="問卷已關閉" Visible="False" Font-Size="Large" meta:resourcekey="lblCloseResource1"></asp:Label>

</asp:Content>
