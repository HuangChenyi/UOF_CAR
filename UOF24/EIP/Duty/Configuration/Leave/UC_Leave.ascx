<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Duty_Configuration_Leave_UC_Leave" CodeBehind="UC_Leave.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<script type="text/javascript">


    function leaRadToolBarButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        switch (key) {
            case "Select":
                args.set_cancel(true);
                var groupid = $("#<%=hfGroupID.ClientID%>").val();
                $uof.dialog.open2("~/EIP/Duty/Configuration/Leave/Add.aspx", args.get_item(), "", 700, 900, openDialogResult, { "LeaCode": "", "GroupGuid": groupid });
                break;
            case "Remove":
                if (!$uof.fastGrid.hasChecked('<%=Grid1.ClientID %>')) {
                    alert(('<%=lblRemoveMustCheck.Text%>'))
                    args.set_cancel(true);
                }
                else {
                    if (!confirm(('<%=lblConfirmRemove.Text%>'))) {
                        args.set_cancel(true);
                    }
                }
                break;
            case "Enable":
                if (!$uof.fastGrid.hasChecked('<%=Grid1.ClientID %>')) {
                    alert(('<%=lblEnableMustCheck.Text%>'))
                    args.set_cancel(true);
                }
                else {
                    if (!confirm(('<%=lblConfirmEnable.Text%>'))) {
                        args.set_cancel(true);
                    }
                }
                break;

            case "Delete":
                if (!$uof.fastGrid.hasChecked('<%=Grid1.ClientID %>')) {
                    alert(('<%=lblDeleteMustCheck.Text%>'))
                    args.set_cancel(true);
                }
                else {
                    if (!confirm(('<%=lblConfirmDEL.Text%>'))) {
                        args.set_cancel(true);
                    }
                }
                break;
                break;
        }
    }
    function Leave_chbParentSetting_Click() {
        var toolbarbutton = $find("<%=leaRadToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentSetting"));
        if (settingCheckBox.checked) {
            if (!confirm('<%=lbConfirmCheckBox.Text%>'))
                settingCheckBox.checked = false;
            return false;
        }
    }
    function openDialogResult(returnValue) {

        if (returnValue === '' || returnValue === null)
            return false;
        else
            return true;
    }

</script>
<telerik:RadToolBar ID="leaRadToolBar" runat="server" Width="100%"
    OnButtonClick="leaRadToolBar_OnButtonClick"
    OnClientButtonClicking="leaRadToolBarButtonClicking"
    meta:resourcekey="leaRadToolBarResource1" SingleClick="None">
    <Items>
        <telerik:RadToolBarButton runat="server" Value="useParent"
            meta:resourcekey="RadToolBarButtonResource1">
            <ItemTemplate>
                <asp:CheckBox ID="chbParentSetting" runat="server" Text="使用上一部門設定" onClick="Leave_chbParentSetting_Click()"
                    AutoPostBack="True" OnCheckedChanged="chbParentSetting_CheckedChanged"
                    meta:resourcekey="chbParentSettingResource1" />
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"
            meta:resourcekey="RadToolBarButtonResource2">
        </telerik:RadToolBarButton>

        <telerik:RadToolBarButton runat="server" Text="啟用" Value="Enable"
            CheckedImageUrl="~/Common/Images/Icon/icon_m132.gif"
            DisabledImageUrl="~/Common/Images/Icon/icon_m132.gif"
            HoveredImageUrl="~/Common/Images/Icon/icon_m132.gif"
            ImageUrl="~/Common/Images/Icon/icon_m132.gif" meta:resourcekey="RadToolBarButtonResource7">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"
            meta:resourcekey="RadToolBarButtonResource4">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="停用" Value="Remove"
            CheckedImageUrl="~/Common/Images/Icon/icon_m141.gif"
            DisabledImageUrl="~/Common/Images/Icon/icon_m141.gif"
            HoveredImageUrl="~/Common/Images/Icon/icon_m141.gif"
            ImageUrl="~/Common/Images/Icon/icon_m141.gif" meta:resourcekey="RadToolBarButtonResource5">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"
            meta:resourcekey="RadToolBarButtonResource6">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="新增" Value="Select"
            CheckedImageUrl="~/Common/Images/Icon/icon_m134.gif"
            DisabledImageUrl="~/Common/Images/Icon/icon_m134.gif"
            HoveredImageUrl="~/Common/Images/Icon/icon_m134.gif"
            ImageUrl="~/Common/Images/Icon/icon_m134.gif" meta:resourcekey="RadToolBarButtonResource3">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource8">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
            CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
            DisabledImageUrl="~/Common/Images/Icon/icon_m03.png"
            HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
            ImageUrl="~/Common/Images/Icon/icon_m03.png" meta:resourcekey="RadToolBarButtonResource9">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource10">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource11">
            <ItemTemplate>
                <asp:Label runat="server" Text="假別代碼粗體字為系統假別" ID="lblMemo" CssClass="SizeMemo" meta:resourcekey="lblMemoResource1"></asp:Label>
            </ItemTemplate>
        </telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>
<Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
    DataKeyNames="LEA_CODE" DataKeyOnClientWithCheckBox="False"
    DefaultSortDirection="Ascending" EnhancePager="True"
    OnRowDataBound="Grid1_RowDataBound" PageSize="15"
    Width="100%" AllowSorting="True" EmptyDataText="沒有資料"
    KeepSelectedRows="False" meta:resourcekey="Grid1Resource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
    <ExportExcelSettings AllowExportToExcel="False" />
    <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
    <Columns>
        <asp:TemplateField HeaderStyle-Width="10px" meta:resourcekey="TemplateFieldResource5">
            <ItemTemplate>
                <asp:Image runat="server" ID="imgEnable" ImageUrl="~/Common/Images/Icon/icon_m141.gif" meta:resourcekey="imgEnableResource1" />
            </ItemTemplate>
            <HeaderStyle Width="10px"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="假別代碼" HeaderStyle-Wrap="false" HeaderStyle-Width="300px" ItemStyle-Wrap="false"
            meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"
                    Text='<%#: Eval("LEA_CODE") %>' meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
            </ItemTemplate>
            <HeaderStyle Wrap="False" Width="300px"></HeaderStyle>
            <ItemStyle Wrap="False"></ItemStyle>
        </asp:TemplateField>
        <asp:BoundField DataField="NAME" HeaderText="名稱" HeaderStyle-Wrap="false" HeaderStyle-Width="500px"
            meta:resourcekey="BoundFieldResource1">
            <HeaderStyle Wrap="False" Width="500px"></HeaderStyle>
        </asp:BoundField>
        <asp:BoundField DataField="DAYS" HeaderText="可請天(時)數" HeaderStyle-Wrap="false" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Right"
            meta:resourcekey="BoundFieldResource2">
            <HeaderStyle Wrap="False" Width="100px"></HeaderStyle>

            <ItemStyle HorizontalAlign="Right"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="最小單位" meta:resourcekey="TemplateFieldResource6">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MIN_UNIT") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblMinUnit" runat="server" Text='<%# Bind("MIN_UNIT") %>' meta:resourcekey="lblMinUnitResource1"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Width="80px" Wrap="False" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="計算方式" meta:resourcekey="TemplateFieldResource7">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CALCULATED") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblCalculated" runat="server" Text='<%# Bind("CALCULATED") %>' meta:resourcekey="lblCalculatedResource1"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Width="95px" Wrap="False" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="扣薪與否" HeaderStyle-Wrap="false" HeaderStyle-Width="80px"
            meta:resourcekey="TemplateFieldResource2">
            <ItemTemplate>
                <asp:Label ID="lblSalary" runat="server" Text='<%# Eval("DEDUCT_SALARY") %>'
                    meta:resourcekey="lblSalaryResource1"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Wrap="False" Width="80px"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="連休" HeaderStyle-Wrap="false" HeaderStyle-Width="50px"
            meta:resourcekey="TemplateFieldResource3">
            <ItemTemplate>
                <asp:Label ID="lblCONSECUTIVE" runat="server" Text='<%# Eval("CONSECUTIVE") %>'
                    meta:resourcekey="lblCONSECUTIVEResource1"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Wrap="False" Width="50px"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="多次申請" meta:resourcekey="TemplateFieldResource8">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("REPEAT") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblManyTime" runat="server" Text='<%# Bind("REPEAT") %>' meta:resourcekey="lblManyTimeResource1"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Wrap="False" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="性別" meta:resourcekey="TemplateFieldResource9">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("GENDER") %>' meta:resourcekey="TextBox4Resource1"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblGender" runat="server" Text='<%# Bind("GENDER") %>' meta:resourcekey="lblGenderResource1"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Width="50px" Wrap="False" />
        </asp:TemplateField>


        <asp:TemplateField HeaderText="排序" meta:resourcekey="TemplateFieldResource4">
            <ItemTemplate>
                <table>
                    <tr style="text-align: left">
                        <td>&nbsp;
                        </td>
                        <td nowrap="nowrap" style="width: 60px">
                            <asp:Panel ID="palUp" runat="server" meta:resourcekey="palUpResource2">
                                <img id="Img1" src="~/Common/Images/Icon/icon_m113.png" runat="server"
                                    border="0" />
                                &nbsp;&nbsp;<asp:LinkButton ID="lbtnUp" runat="server" CommandName="Up" CommandArgument='<%# Eval("LEA_CODE") %>'
                                    OnCommand="CommandBtn_Click" Text="上移" meta:resourcekey="lbtnUpResource1"></asp:LinkButton>
                            </asp:Panel>
                        </td>
                        <td>&nbsp;
                        </td>
                        <td nowrap="nowrap" style="width: 60px">
                            <asp:Panel ID="palDown" runat="server" meta:resourcekey="palDownResource2">
                                <img id="Img2" src="~/Common/Images/Icon/icon_m114.png" runat="server"
                                    border="0" />
                                &nbsp;&nbsp;<asp:LinkButton ID="lbtnDown" runat="server" CommandName="Down" CommandArgument='<%# Eval("LEA_CODE") %>'
                                    OnCommand="CommandBtn_Click" Text="下移" meta:resourcekey="lbtnDownResource1"></asp:LinkButton>
                            </asp:Panel>
                        </td>
                        <td>&nbsp;
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <HeaderStyle Wrap="False" Width="200px" />
        </asp:TemplateField>

    </Columns>
    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
        ShowHeaderPager="True" />
</Fast:Grid>
<asp:HiddenField ID="hfGroupID" runat="server" />
<asp:Label ID="lbYes" runat="server" Text="是" Visible="False" meta:resourcekey="lbYesResource1"></asp:Label>
<asp:Label ID="lbConfirmCheckBox" runat="server" Text="確定要使用上一部門設定?     \r\n注意:確定後會移除此部門所有的自訂資料!!" Visible="False" meta:resourcekey="lbConfirmCheckBoxResource1"></asp:Label>
<asp:Label ID="lbNo" runat="server" Text="否" Visible="False" meta:resourcekey="lbNoResource1"></asp:Label>
<asp:Label ID="lbWorkDay" runat="server" Text="工作天" Visible="False" meta:resourcekey="lbWorkDayResource1"></asp:Label>
<asp:Label ID="lbCalendarDay" runat="server" Text="日曆天" Visible="False" meta:resourcekey="lbCalendarDayResource1"></asp:Label>
<asp:Label ID="lblMinUnitHour" runat="server" Text="半小時" Visible="False" meta:resourcekey="lblMinUnitHourResource1"></asp:Label>
<asp:Label ID="lblMinUnitAnHour" runat="server" Text="一小時" Visible="False" meta:resourcekey="lblMinUnitAnHourResource1"></asp:Label>
<asp:Label ID="lblMinUnitHelf" runat="server" Text="半天" Visible="False" meta:resourcekey="lblMinUnitHelfResource1"></asp:Label>
<asp:Label ID="lblMinUnitAll" runat="server" Text="全天" Visible="False" meta:resourcekey="lblMinUnitAllResource1"></asp:Label>
<asp:Label ID="lblMinUnitError" runat="server" Text="資料錯誤" Visible="False" meta:resourcekey="lblMinUnitErrorResource1"></asp:Label>
<asp:Label ID="lbGender1" runat="server" Text="男" Visible="False" meta:resourcekey="lbGender1Resource1"></asp:Label>
<asp:Label ID="lbGender2" runat="server" Text="女" Visible="False" meta:resourcekey="lbGender2Resource1"></asp:Label>
<asp:Label ID="lbGender3" runat="server" Text="皆可" Visible="False" meta:resourcekey="lbGender3Resource1"></asp:Label>
<asp:Label ID="lblRemoveMessage" runat="server" Text="該假別有簽核中或銷假中的表單，不可停用。" Visible="False" meta:resourcekey="lblRemoveMessageResource1"></asp:Label>
<asp:Label ID="lblConfirmRemove" runat="server" Visible="False" Text="確定要停用嗎?     \r\n注意:確定後會移除此假別的自訂資料!!" meta:resourcekey="lblConfirmRemoveResource1" />

<asp:Label ID="lblConfirmEnable" runat="server" Text="確定要啟用嗎?" Visible="False" meta:resourcekey="lblConfirmEnableResource1"></asp:Label>
<asp:Label ID="lblRemoveMustCheck" runat="server" Text="請先勾選要停用的假別!" Visible="False" meta:resourcekey="lblRemoveMustCheckResource1"></asp:Label>
<asp:Label ID="lblEnableMustCheck" runat="server" Text="請先勾選要啟用的假別!" Visible="False" meta:resourcekey="lblEnableMustCheckResource1"></asp:Label>
<asp:Label ID="lblDeleteMustCheck" runat="server" Text="請先勾選要刪除的假別!" Visible="False" meta:resourcekey="lblDeleteMustCheckResource1"></asp:Label>

<asp:Label ID="lblAllSalary" runat="server" Text="全薪" Visible="False" meta:resourcekey="lblAllSalaryResource1"></asp:Label>
<asp:Label ID="lblHalfSalary" runat="server" Text="半薪" Visible="False" meta:resourcekey="lblHalfSalaryResource1"></asp:Label>
<asp:Label ID="lblDelMessage" runat="server" Text="以上假別代碼為非本部門新增的假別、已被其他部門自訂選用的假別、使用者已申請過的假別或系統假別，不可刪除。" Visible="False" meta:resourcekey="lblDelMessageResource1"></asp:Label>
<asp:Label ID="lblConfirmDEL" runat="server" Text="確定要刪除嗎?     \r\n注意!!刪除後該假別即不存在系統中，可能會產生資料遺失的問題!!" Visible="False" meta:resourcekey="lblConfirmDELResource1"></asp:Label>

<asp:Label ID="lblEnable" runat="server" Text="啟用" Visible="False" meta:resourcekey="lblEnableResource1"></asp:Label>
<asp:Label ID="lblRemove" runat="server" Text="停用" Visible="False" meta:resourcekey="lblRemoveResource1"></asp:Label>
<asp:HiddenField ID="hfMaxLeave" runat="server" />
