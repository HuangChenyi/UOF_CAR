<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="QueryAttendanceDetail.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.QueryAttendanceDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td style="white-space:nowrap">
                        <asp:label ID="lblDeptView" runat="server" Text="申請部門" meta:resourcekey="lblDeptViewResource1"/>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:label ID="lblDeptName" runat="server" meta:resourcekey="lblDeptNameResource1"/>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:label ID="lblEmployeeView" runat="server" Text="姓名" meta:resourcekey="lblEmployeeViewResource1"/>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:label ID="lblEmployeeName" runat="server" meta:resourcekey="lblEmployeeNameResource1"/>
                    </td>
                </tr>
            </table>
            <Ede:Grid ID="gridAttDetail" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" OnBeforeExport="gridAttDetail_BeforeExport" OnPageIndexChanging="gridAttDetail_PageIndexChanging"
                        Width="100%" EmptyDataText="沒有資料" EnhancePager="True" OnSorting="gridAtt_Sorting" CustomDropDownListPage="False" OnAfterExport="gridAttDetail_AfterExport" 
                        DataKeyOnClientWithCheckBox="False"  KeepSelectedRows="False"  DefaultSortDirection="Ascending" AllowPaging="True"  PageSize="15" meta:resourcekey="gridAttDetailResource1">
             <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
             <ExportExcelSettings AllowExportToExcel="True"></ExportExcelSettings>
                <Columns>
                     <asp:BoundField HeaderText="姓名"  DataField="EmployeeName" SortExpression ="EmployeeName" meta:resourcekey="BoundFieldResource1" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                     <asp:BoundField HeaderText="員編"  DataField="EmployeeNo" SortExpression ="EmployeeNo" meta:resourcekey="BoundFieldResource2" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>
                     <asp:BoundField HeaderText="申請部門"  DataField="EmployeeDept" SortExpression ="EmployeeDept" meta:resourcekey="BoundFieldResource3" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                     <asp:BoundField HeaderText="匯出日期"  DataField="systemDate" SortExpression ="systemDate" meta:resourcekey="BoundFieldResource4" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="假別" DataField="LEAVE_REFERENCE_CLASS" SortExpression="LEAVE_REFERENCE_CLASS ASC" meta:resourcekey="BoundFieldResource5">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="可用" DataField="ANNUAL_MEMO"  SortExpression="ANNUAL_LEAVE ASC,LEAVE_UNIT ASC" meta:resourcekey="BoundFieldResource6" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="已用" DataField="USED_MEMO"  SortExpression="USED_LEAVE ASC,LEAVE_UNIT ASC" meta:resourcekey="BoundFieldResource7" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="剩餘"  DataField="SURPLUS_MEMO" SortExpression ="SURPLUS_LEAVE ASC,LEAVE_UNIT ASC" meta:resourcekey="BoundFieldResource8" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
            </Ede:Grid>
         
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfuserGuid" runat="server" />
    <asp:HiddenField ID="hidIsExporting" runat="server" />    
    <asp:label ID="lblError" runat="server" Text="員工編號不存在資料庫中" ForeColor="Red" Visible="False" meta:resourcekey="lblErrorResource1"/>
</asp:Content>
