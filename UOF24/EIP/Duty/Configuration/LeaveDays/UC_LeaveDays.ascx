<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Duty_Configuration_LeaveDays_UC_LeaveDays" Codebehind="UC_LeaveDays.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<script type="text/javascript">
    function OnClientButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        switch (key) {
            case "Add":
                args.set_cancel(true);
                var groupname = $("#<%=hfGroupName.ClientID%>").val();
                var groupid = $("#<%=hfGroupID.ClientID%>").val();
                $uof.dialog.open2("~/EIP/Duty/Configuration/LeaveDays/Add.aspx", args.get_item(), "", 400, 280, openDialogResult, { "Year": "", "GroupName": groupname, "GroupGuid": groupid, "EditAble": true });
                break;
            case "Delete":
                if (!$uof.fastGrid.hasChecked('<%=Grid1.ClientID %>')) {
                    args.set_cancel(true);
                }
                else {
                    if (!confirm('<%=Resources.Common.ConfirmDelete %>')) {
                        args.set_cancel(true);
                    }
                }
                break;
        }
    }
    function LeaveDays_chbParentSetting_Click() {
        var toolbarbutton = $find("<%=RadToolBar1.ClientID%>").findItemByValue("useParent");
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
<telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="OnClientButtonClicking">
    <Items>
        <telerik:RadToolBarButton runat="server" Value="useParent" >
            <ItemTemplate>
                 <asp:CheckBox ID="chbParentSetting" runat="server" Text="使用上一部門設定" AutoPostBack="true" OnCheckedChanged="chbParentSetting_CheckedChanged"
                     onClick="LeaveDays_chbParentSetting_Click()" meta:resourcekey="chbParentSettingResource1"/>
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
            CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
            DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
            HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
            ImageUrl="~/Common/Images/Icon/icon_m71.png"
            meta:resourcekey="RadToolBarAddResource1">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
            CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
            DisabledImageUrl="~/Common/Images/Icon/icon_m03.png"
            HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
            ImageUrl="~/Common/Images/Icon/icon_m03.png"
            meta:resourcekey="RadToolBarDeleteResource1">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>
<Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
     DataKeyNames="YEAR" DataKeyOnClientWithCheckBox="False"
    DefaultSortDirection="Ascending" EnableModelValidation="True" EnhancePager="True"
    OnRowDataBound="Grid1_RowDataBound" PageSize="15"  
    Width="100%" KeepSelectedRows="False" 
    meta:resourcekey="Grid1Resource1">
    <ExportExcelSettings AllowExportToExcel="False" />
    <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
    <Columns>
        <asp:TemplateField HeaderText="年資" ShowHeader="False" 
            meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" 
                    Text='<%# Eval("YEAR") %>' meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        
        <asp:BoundField DataField="DAYS" HeaderText="年休天(時)數" 
            meta:resourcekey="BoundFieldResource1" />
    </Columns>
    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
        ShowHeaderPager="True" />
</Fast:Grid>

<asp:Label ID="lbConfirmCheckBox" runat="server" 
    Text="確定要使用上一部門設定?     \r\n注意:確認後會刪除此部門所有的自訂資料!!" Visible="False" 
    meta:resourcekey="lbConfirmCheckBoxResource1"></asp:Label>
<asp:Label ID="lblAddDaysTitle" runat="server" Text="新增年休天(時)數" Visible="False" 
    meta:resourcekey="lblAddDaysTitleResource1"></asp:Label>
<asp:HiddenField ID="hfGroupName" runat="server" />
<asp:HiddenField ID="hfGroupID" runat="server" />
