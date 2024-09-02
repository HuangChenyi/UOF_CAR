<%@ Page Title="假別新增與選取" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Configuration_Leave_Manage" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Manage.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"  Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script id="manageJS" type="text/javascript">        
function ConfirmDelete(){
    var result = confirm('<%=Resources.Common.ConfirmDelete %>\r\n<asp:Literal runat="server" Text="注意!!刪除之後可能會產生資料遺失的問題" />');
    var returnValue = $("#<%= hfReturnValue.ClientID %>");
    returnValue.val(result);
    //return confirm('<%=Resources.Common.ConfirmDelete %>\r\n<asp:Literal runat="server" Text="注意!!刪除之後可能會產生資料遺失的問題" />');
}

    function rdBar_OnClientButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        switch (key) {
            case "Add":
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Duty/Configuration/Leave/Add.aspx", args.get_item(), "", 550, 700, openDialogResult);

                break;
        }
    }
    function openDialogResult(returnValue) {
        if (returnValue === '' || returnValue === null)
            return false;
        else
            return true;
    }
</script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="rdBar_OnClientButtonClicking" Width="99%" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                ImageUrl="~/Common/Images/Icon/icon_m71.png"
                meta:resourcekey="RadToolBarAddResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton Text="請勾選您要套用的假別" Enabled="false" CssClass="SizeMemo" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                 DataKeyNames="LEA_CODE" DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EnhancePager="True"
                OnRowDataBound="Grid1_RowDataBound" PageSize="15"  
                Width="99%" KeepSelectedRows="True" AllowSorting="True" meta:resourcekey="Grid1Resource1"
                EmptyDataText="沒有資料" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  
                 >
                <ExportExcelSettings AllowExportToExcel="False" />
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                <Columns>
                    <asp:TemplateField HeaderText="假別代碼" ShowHeader="False" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%#: Eval("LEA_CODE") %>'
                                meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="名稱" 
                        meta:resourcekey="BoundFieldResource1" >
                    <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DAYS" HeaderText="可請天(時)數" 
                        meta:resourcekey="BoundFieldResource2" >
                    <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MIN_UNIT" HeaderText="最小單位" 
                        meta:resourcekey="BoundFieldResource3" >
                    <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CALCULATED" HeaderText="計算方式" 
                        meta:resourcekey="BoundFieldResource4" >
                    <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SEPARATE" HeaderText="分次請休" Visible="False" 
                        meta:resourcekey="BoundFieldResource5" >
                    <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="GENDER" HeaderText="性別" 
                        meta:resourcekey="BoundFieldResource6" >
                    <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <table>
                                <tr align="left">
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td nowrap="nowrap" width="30%" >
                                        <asp:Panel ID="palUp" runat="server" meta:resourcekey="palUpResource2">
                                            <img id="Img1" src="~/Common/Images/Icon/icon_m113.png" runat="server"
                                                border="0" />
                                            &nbsp;<asp:LinkButton ID="lbtnUp" runat="server" CommandName="Up" CommandArgument='<%#: Eval("LEA_CODE") %>'
                                                OnCommand="CommandBtn_Click" Text="往上移" meta:resourcekey="lbtnUpResource1"></asp:LinkButton>
                                        </asp:Panel>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td nowrap="nowrap" width="30%" >
                                        <asp:Panel ID="palDown" runat="server" meta:resourcekey="palDownResource2">
                                            <img id="Img2" src="~/Common/Images/Icon/icon_m114.png" runat="server"
                                                border="0" />
                                            &nbsp;<asp:LinkButton ID="lbtnDown" runat="server" CommandName="Down" CommandArgument='<%#: Eval("LEA_CODE") %>'
                                                OnCommand="CommandBtn_Click" Text="往下移" meta:resourcekey="lbtnDownResource1"></asp:LinkButton>
                                        </asp:Panel>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td nowrap="nowrap" width="30%" >
                                        <asp:Panel ID="palDel" runat="server" meta:resourcekey="palDelResource2">
                                            <img id="Img3" src="~/Common/Images/Icon/icon_m03.png" runat="server"
                                                border="0" />
                                            &nbsp;<asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" CommandArgument='<%#: Eval("LEA_CODE") %>'
                                                OnCommand="CommandBtn_Click" Text="刪除" meta:resourcekey="lbtnDeleteResource1"></asp:LinkButton>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lbYes" runat="server" Text="是" Visible="False" meta:resourcekey="lbYesResource1"></asp:Label>
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
    <asp:Label ID="lblRemoveMessage" runat="server" Text="該假別有簽核中或銷假中的表單，不可刪除。" Visible="False" meta:resourcekey="lblRemoveMessageResource1"></asp:Label>
    <asp:HiddenField ID="hfReturnValue" runat="server" />
    <asp:HiddenField ID="hfGroupId" runat="server" />
</asp:Content>
