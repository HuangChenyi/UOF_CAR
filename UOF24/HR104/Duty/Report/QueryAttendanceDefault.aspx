<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryAttendanceDefault.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.QueryAttendanceDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree runat="server" ID="UC_DeptManagerTree" OnNodeOnClick="UC_DeptManagerTree_NodeOnClick" ShowDeptManagerTree="true" ShowDeptPersonalTree="true" ShowSuperiorTree="true" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
      <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" SingleClick="None" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="suDept" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSubDet" runat="server" Text="包含子部門" meta:resourcekey="cbSubDetResource1"/>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td style="width:20%">
                        <asp:Label ID="lblemployee" runat="server" Text="人員" meta:resourcekey="lblemployeeResource1" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtKeyword" runat="server" meta:resourcekey="txtKeywordResource1"/>
                    </td>
                </tr>
            </table>
            <Ede:Grid ID="gridAtt" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" OnBeforeExport="gridAtt_BeforeExport"
                OnPageIndexChanging="gridAtt_PageIndexChanging" OnSorting="gridAtt_Sorting" runat="server" DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" AllowPaging="True" AllowSorting="True" PageSize="15" 
                CustomDropDownListPage="False" EnhancePager="True" meta:resourcekey="gridAttResource1" SelectedRowColor="" UnSelectedRowColor="" >
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""/>
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="EmployeeName" SortExpression="EmployeeName" meta:resourcekey="BoundFieldResource1"/>
                    <asp:BoundField HeaderText="員工編號" DataField="EmployeeNo" SortExpression="EmployeeNo" meta:resourcekey="BoundFieldResource2">
                     <HeaderStyle Wrap="False" />
                     <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>  
                    <asp:BoundField HeaderText="申請部門" DataField="DeptName" SortExpression="DeptName" meta:resourcekey="BoundFieldResource3"/>
                    <asp:BoundField HeaderText="假別" DataField="LEAVE_REFERENCE_CLASS" SortExpression="LEAVE_REFERENCE_CLASS ASC" meta:resourcekey="BoundFieldResource4">
                     <HeaderStyle Wrap="False" />
                     <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>  
                    <asp:BoundField HeaderText="可用" DataField="ANNUAL_MEMO" SortExpression="ANNUAL_LEAVE ASC,LEAVE_UNIT ASC" meta:resourcekey="BoundFieldResource5"/>
                    <asp:BoundField HeaderText="已用" DataField="USED_MEMO" SortExpression="USED_LEAVE ASC,LEAVE_UNIT ASC" meta:resourcekey="BoundFieldResource6"/>
                    <asp:BoundField HeaderText="剩餘" DataField="SURPLUS_MEMO" SortExpression="SURPLUS_LEAVE ASC,LEAVE_UNIT ASC" meta:resourcekey="BoundFieldResource7"/>                
                </Columns>
            </Ede:Grid>

             <Ede:Grid ID="gridDept" Width="100%" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" OnBeforeExport="gridDept_BeforeExport"
                OnPageIndexChanging="gridDept_PageIndexChanging" OnRowDataBound="gridDept_RowDataBound" OnSorting="gridDept_Sorting" runat="server" DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" AllowPaging="True" AllowSorting="True" PageSize="15" DefaultSortColumnName="EMPLOYEE_NO"
                CustomDropDownListPage="False" EnhancePager="True" meta:resourcekey="gridDeptResource1" SelectedRowColor="" UnSelectedRowColor="" >
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""/>
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="EMPLOYEE_CNAME" SortExpression="EMPLOYEE_CNAME" meta:resourcekey="BoundFieldResource8"></asp:BoundField>
                    <asp:TemplateField HeaderText="員工編號" SortExpression="EMPLOYEE_NO" meta:resourcekey="TemplateFieldResource1">
                     <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbtnEmployeeNo" meta:resourcekey="lbtnEmployeeNoResource1"/>
                     </ItemTemplate>
                     <HeaderStyle Wrap="False" />
                     <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="申請部門" DataField="DEPARTMENT_CNAME" SortExpression="DEPARTMENT_CNAME" meta:resourcekey="BoundFieldResource9"></asp:BoundField>                   
                   <asp:TemplateField HeaderText="帳號停用" SortExpression="IS_SUSPENDED" meta:resourcekey="TemplateFieldResource2">
                     <ItemTemplate>
                        <asp:Label runat="server" ID="lblIsSuspended" meta:resourcekey="lblIsSuspendedResource1"/>
                     </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="帳號到期日" DataField="EXPIRE_DATE" SortExpression="EXPIRE_DATE" DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource10">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>                                     
                </Columns>
            </Ede:Grid>     
            
             <Ede:Grid ID="gridNoData" Width="100%" runat="server" EmptyDataText="沒有資料" AutoGenerateCheckBoxColumn="False" DataKeyOnClientWithCheckBox="False" CustomDropDownListPage="False">             
                <Columns></Columns>
            </Ede:Grid>    

    <asp:label ID="lblyes" runat="server" Text="是" Visible="False" meta:resourcekey="lblyesResource1"/>
    <asp:label ID="lblno" runat="server" Text="否" Visible="False" meta:resourcekey="lblnoResource1"/>
    <asp:label ID="lbltitle" runat="server" Text="可休假查詢" Visible="False" meta:resourcekey="lbltitleResource1"/>
    <asp:HiddenField ID="hidIsExporting" runat="server" /> 
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
