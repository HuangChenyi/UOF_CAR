<%@ Page Title="可補休時數查詢" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryTimeOffData" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryTimeOffData.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }

        function ConfirmDelete() {
            if (!confirm('<%=lblConfirmDelete.Text%>')) {
                return false;
            }            
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree ID="UC_DeptManagerTree1" runat="server" ShowSuperiorTree="true" ShowDeptPersonalTree="true" ShowDeptManagerTree="true" DisplayActiveControl="true"/>               
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Value="subDept">
                            <ItemTemplate>
                                <asp:CheckBox ID="chbChild" runat="server" Text="包含子部門" meta:resourcekey="chbChildResource1" />
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarQueryResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <table class="PopTable" style="width:100%">
                    <tr>
                        <td style="width:20%">
                            <asp:Label ID="Label3" runat="server" Text="到期日" meta:resourcekey="Label3Resource1"></asp:Label>
                        </td>
                        <td style="width:30%">
                            <telerik:RadDatePicker ID="rdStartDate" runat="server">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" runat="server"></Calendar>
                                <DateInput ClientEvents-OnValueChanging="OnValueChanging" runat="server"></DateInput>
                            </telerik:RadDatePicker>
                            <asp:Label ID="Label6" runat="server" Text="~"  meta:resourcekey="Label6Resource1"></asp:Label>
                            <telerik:RadDatePicker ID="rdEndDate" runat="server">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" runat="server"></Calendar>
                                <DateInput ClientEvents-OnValueChanging="OnValueChanging" runat="server"></DateInput>
                            </telerik:RadDatePicker>
                        </td>
                        <td style="width:20%">
                            <asp:Label ID="Label2" runat="server" Text="人員" meta:resourcekey="Label2Resource1"></asp:Label>
                        </td>
                        <td style="width:30%">
                            <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:20%">
                            <asp:Label ID="Label4" runat="server" Text="來源" meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="ddlSource" runat="server">
                                <asp:ListItem Text="全部" Value="" Selected="True" meta:resourcekey="ListItem1Resource1"></asp:ListItem>
                                <asp:ListItem Text="加班" Value="OT" meta:resourcekey="ListItem2Resource1"></asp:ListItem>
                                <asp:ListItem Text="匯入" Value="IM" meta:resourcekey="ListItem3Resource1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                    <ContentTemplate>
                        <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                            AutoGenerateColumns="False" Width="100%" DataKeyOnClientWithCheckBox="False"
                            PageSize="15" DefaultSortDirection="Ascending"  EnhancePager="True"
                            EmptyDataText="沒有資料" KeepSelectedRows="False" OnPageIndexChanging="Grid1_PageIndexChanging"
                            OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" OnBeforeExport="Grid1_BeforeExport" OnAfterExport="Grid1_AfterExport"
                            meta:resourcekey="Grid1Resource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" >
                            <ExportExcelSettings AllowExportToExcel="True" />
                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                                LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                PreviousImageUrl="" />
                            <Columns>
                                <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle Width="100px" Wrap="false" />
                                    <ItemStyle Width="100px"  Wrap="false"/>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="姓名" SortExpression="GROUP_NAME" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Width="200px"  Wrap="false"/>
                                    <ItemStyle Width="200px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="來源" SortExpression="SOURCE" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSources" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="50px" Wrap="false" />
                                    <ItemStyle Width="50px"  Wrap="false"/>
                                </asp:TemplateField>
                                <asp:BoundField DataField="DOC_NBR" HeaderText="加班單號" SortExpression="DOC_NBR" meta:resourcekey="BoundFieldResource7">
                                    <HeaderStyle Width="120px" Wrap="false" />
                                    <ItemStyle Width="120px" Wrap="false"/>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="加班類型" meta:resourcekey="TemplateFieldResource5">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOverTimeType" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="70px" Wrap="false" />
                                    <ItemStyle Width="70px"  Wrap="false"/>
                                </asp:TemplateField>
                                <asp:BoundField DataField="START_DATE" HeaderText="開始日" SortExpression="START_DATE"
                                    DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Width="140px"  Wrap="false"/>
                                    <ItemStyle Width="140px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="到期日" DataField="END_DATE" SortExpression="END_DATE"
                                    DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource5">
                                    <HeaderStyle Width="140px"  Wrap="false"/>
                                    <ItemStyle Width="140px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="可用時數" DataField="HOURS" SortExpression="HOURS" meta:resourcekey="BoundFieldResource3">
                                    <HeaderStyle Width="80px"  Wrap="false"/>
                                    <ItemStyle Width="80px" HorizontalAlign="Right"/>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="已用時數" DataField="USED_HOURS" SortExpression="USED_HOURS"
                                    meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle Width="80px"  Wrap="false"/>
                                    <ItemStyle Width="80px" HorizontalAlign="Right"/>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="剩餘時數" DataField="REMINDER_HOURS" SortExpression="REMINDER_HOURS"
                                    meta:resourcekey="BoundFieldResource6">
                                    <HeaderStyle Width="80px"  Wrap="false"/>
                                    <ItemStyle Width="80px" HorizontalAlign="Right"/>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="備註" SortExpression="REMAEK" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemark" runat="server" meta:resourcekey="lblRemarkResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="150px"  Wrap="false"/>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDetail" runat="server" Text="使用記錄" CausesValidation="false" Visible="false" OnClick="lbtnDetail_Click" meta:resourcekey="lbtnDetailResource1"></asp:LinkButton>
                                        <asp:LinkButton ID="lbtnEdit" runat="server" Text="修改" CausesValidation="false" OnClick="lbtnEdit_Click" meta:resourcekey="lbtnEditResource1"></asp:LinkButton>
                                        <asp:LinkButton ID="lbtnModify" runat="server" Text="異動記錄" CausesValidation="false" meta:resourcekey="lbtnModifyResource1"></asp:LinkButton>
                                        <asp:LinkButton ID="lbtnDelete" runat="server" Text="刪除" CausesValidation="false" OnClientClick="return ConfirmDelete();" OnClick="lbtnDelete_Click" meta:resourcekey="lbtnDeleteResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="false" />
                                    <ItemStyle Wrap="false" Width="100px" HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>    
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" meta:resourcekey="Label1Resource1" Visible="false"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="是否確定刪除？" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblAccount" runat="server" Text="帳號" meta:resourcekey="lblAccountResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblDisplayName" runat="server" Text="姓名" meta:resourcekey="lblDisplayNameResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblStartDate" runat="server" Text="開始日" meta:resourcekey="lblStartDateResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblEndDate" runat="server" Text="到期日" meta:resourcekey="lblEndDateResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblHours" runat="server" Text="可用時數" meta:resourcekey="lblHoursResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblUsedHours" runat="server" Text="已用時數" meta:resourcekey="lblUsedHoursResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblModifier" runat="server" Text="修改者" Visible="false" meta:resourcekey="lblModifierResource1"></asp:Label>
    <asp:Label ID="lblEmotion" runat="server" Text="動作" Visible="false" meta:resourcekey="lblEmotionResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="刪除" Visible="false" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblEditTimeOffData" runat="server" Text="補休時數維護" Visible="false" meta:resourcekey="lblEditTimeOffDataResource1"></asp:Label>
    <asp:Label ID="lblTimeOffDetail" runat="server" Text="使用記錄" Visible="false"  meta:resourcekey="lblTimeOffDetailResource1"></asp:Label>
    <asp:Label ID="lblOverTime" runat="server" Text="加班" Visible="false"  meta:resourcekey="lblOverTimeResource1"></asp:Label>
    <asp:Label ID="lblImport" runat="server" Text="匯入" Visible="false"  meta:resourcekey="lblImportResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeWorkDay" runat="server" Text="工作日" Visible="False" meta:resourcekey="lblWorkTypeWorkDayResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeDayoff" runat="server" Text="休息日" Visible="False" meta:resourcekey="lblWorkTypeDayoffResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeRoutine" runat="server" Text="例假日" Visible="False" meta:resourcekey="lblWorkTypeRoutineResource1"></asp:Label>
    <asp:Label ID="lblWorkTypeOrgHoliday" runat="server" Text="國定假日" Visible="False" meta:resourcekey="lblWorkTypeOrgHolidayResource1"></asp:Label>
    <asp:Label ID="lblModifyTitle" runat="server" Text="異動記錄" Visible="false" meta:resourcekey="lblModifyTitleResource1"></asp:Label>

    
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hidIsExporting" runat="server" Value="N" />
</asp:Content>
