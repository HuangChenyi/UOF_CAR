<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true"  CodeBehind="QueryTravelDefault.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.QueryTravelDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
     <script type="text/javascript">
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree ID ="UC_DeptManagerTree1" OnNodeOnClick="UC_DeptManagerTree1_NodeOnClick" runat="server" ShowDeptManagerTree="True" ShowDeptPersonalTree="True" ShowSuperiorTree="True" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>        
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" SingleClick="None" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value ="suDept" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSubDet" runat="server" Text="包含子部門" meta:resourcekey="cbSubDetResource1"></asp:CheckBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>          
            <table class ="PopTable" style="width:100%">
                <tr>                   
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="出差日期(起)" meta:resourcekey="Label3Resource1"/>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="rdTravelDateStart" runat="server" meta:resourcekey="rdTravelDateStartResource1">
                        <Calendar UseColumnHeadersAsSelectors="False" runat="server" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                        <DateInput LabelWidth="40%" runat="server" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
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
                        <asp:Label ID="Label4" runat="server" Text="出差日期(訖)" meta:resourcekey="Label4Resource1"/>
                    </td>
                    <td>                      
                        <telerik:RadDatePicker ID="rdTravelDateEnd" runat="server" meta:resourcekey="rdTravelDateEndResource1">
                        <Calendar UseColumnHeadersAsSelectors="False" runat="server" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                        <DateInput LabelWidth="40%"  runat="server" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
                                <ClientEvents OnValueChanging="OnValueChanging" />
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl=""  />
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                     <td>
                        <asp:Label ID="Label2" runat="server" Text="人員" meta:resourcekey="Label2Resource1"/>
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1" />
                    </td>
                </tr>
            </table>
            <div  style="margin-top: 2px;">
                  <Ede:Grid ID="grdTravel" AutoGenerateCheckBoxColumn="False" Width="100%" OnBeforeExport="grdTravel_BeforeExport" OnAfterExport="grdTravel_AfterExport" 
                      OnPageIndexChanging="grdTravel_PageIndexChanging" OnRowDataBound="grdTravel_RowDataBound" OnSorting="grdTravel_Sorting" AutoGenerateColumns="False" 
                      DataKeyOnClientWithCheckBox="False"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False"  DefaultSortColumnName="EMPLOYEE_NO"
                      AllowPaging="True" AllowSorting="True"  PageSize="15"  runat="server" CustomDropDownListPage="False" EnhancePager="True" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdTravelResource1">
                      <EnhancePagerSettings  ShowHeaderPager="True"/>
                      <ExportExcelSettings AllowExportToExcel="true" />
                      <Columns>
                          <asp:BoundField HeaderText="出差人員" DataField="EMPLOYEE_CNAME" SortExpression="EMPLOYEE_CNAME" meta:resourcekey="BoundFieldResource2">
                           <HeaderStyle Wrap="False" />
                          <ItemStyle Wrap="False" />
                          </asp:BoundField>
                          <asp:BoundField HeaderText="員工編號" DataField="EMPLOYEE_NO" SortExpression="EMPLOYEE_NO" meta:resourcekey="BoundFieldResource3">
                          <HeaderStyle Wrap="False" />
                          <ItemStyle Wrap="False" />
                          </asp:BoundField>
                          <asp:BoundField HeaderText="申請部門" DataField="DEPARTMENT_CNAME" SortExpression="DEPARTMENT_CNAME" meta:resourcekey="BoundFieldResource4">
                          <HeaderStyle Wrap="False" />
                          <ItemStyle Wrap="False" />
                          </asp:BoundField>                         
                          <asp:BoundField HeaderText="出差類別" DataField="LEAVE_SETUP_CLASS" SortExpression="LEAVE_SETUP_CLASS" meta:resourcekey="BoundFieldResource6">
                          <HeaderStyle Wrap="False"/>
                          <ItemStyle Wrap="False"  Width="100px"/>
                          </asp:BoundField>
                          <asp:BoundField HeaderText="出差時間(起)" DataField="ASK_LEAVE_START" SortExpression="ASK_LEAVE_START" meta:resourcekey="BoundFieldResource7">
                          <HeaderStyle Wrap="False" />
                          <ItemStyle Wrap="False"   Width="150px" />
                          </asp:BoundField>
                          <asp:BoundField HeaderText="出差時間(訖)" DataField="ASK_LEAVE_END" SortExpression="ASK_LEAVE_END" meta:resourcekey="BoundFieldResource8">
                          <HeaderStyle Wrap="False" />
                          <ItemStyle Wrap="False"  Width="150px" />
                          </asp:BoundField>
                          <asp:BoundField HeaderText="代理人" DataField="AGENT_CNAME" SortExpression="AGENT_CNAME"  meta:resourcekey="agentBoundFieldResource">
                          <HeaderStyle Wrap="False" />
                          <ItemStyle Wrap="False"  />
                          </asp:BoundField>
                          <asp:TemplateField HeaderText="出差時/天數" SortExpression="ASK_LEAVE_HOUR" meta:resourcekey="TemplateFieldResource1">
                              <ItemTemplate>
                                  <asp:Label ID="lblLeaveHour" runat="server" meta:resourcekey="lblLeaveHourResource1"></asp:Label>
                              </ItemTemplate>
                              <HeaderStyle Wrap="False" />
                              <ItemStyle Wrap="False" HorizontalAlign="Right"  Width="10px" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="單位" meta:resourcekey="TemplateFieldResource2">                             
                              <ItemTemplate>
                                <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
                                <asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
                                <asp:Label ID="lblMin" runat="server" Text="分" Visible="False" meta:resourcekey="lblMinResource1"></asp:Label>
                              </ItemTemplate>
                              <HeaderStyle Wrap="False" />
                              <ItemStyle  Wrap="False"  Width="100px" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="事由" meta:resourcekey="BoundFieldResource9">
                              <ItemTemplate>
                                <asp:Label ID="lblMemo" runat="server" ></asp:Label>                               
                              </ItemTemplate>
                          <HeaderStyle Wrap="False"  />
                          <ItemStyle Wrap="False" Width="120px"/>
                          </asp:TemplateField>
                      </Columns>
                  </Ede:Grid>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>        
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hidIsExporting" runat="server" Value="N"></asp:HiddenField>
    <asp:CustomValidator ID="cvdateNull" runat="server" ErrorMessage="日期不可為空值" Visible="False" meta:resourcekey="cvdateNullResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvdateError" runat="server" ErrorMessage="日期(起)不可以晚於日期(訖)" Visible="False" meta:resourcekey="cvdateErrorResource1"></asp:CustomValidator>
</asp:Content>
