<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_QueryEventLog" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryEventLog.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <table class ="PopTable" cellspacing="1">                  
        <tr>
            <td align="right">
                <asp:Label ID="Label1" runat="server" Text="動作日期:" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
            <table>
            <tr>
            <td>
                <telerik:RadDatePicker ID="rdStart" runat="server"></telerik:RadDatePicker>
            </td>
            <td><asp:Label ID="Label2" runat="server" Text="~" meta:resourcekey="Label2Resource1"></asp:Label>            
            </td>
            <td>
                <telerik:RadDatePicker ID="rdEnd" runat="server"></telerik:RadDatePicker>
            </td>
            </tr>
            </table>                
            </td>            
        </tr>
        <tr>
        <td align="right" valign="top">
            <asp:Label ID="Label3" runat="server" Text="動作者:" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <uc1:UC_ChoiceList ID="ucChoiceList1" runat="server" TreeHeight="80px"/>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label4" runat="server" Text="動作:" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td valign="top">
                <asp:CheckBoxList ID="cbl" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="Insert" meta:resourcekey="ListItemResource1">新增</asp:ListItem>
                    <asp:ListItem Value="Update" meta:resourcekey="ListItemResource2">修改</asp:ListItem>
                    <asp:ListItem Value="Delete" meta:resourcekey="ListItemResource3">刪除</asp:ListItem>
                    <asp:ListItem Value="Publish" meta:resourcekey="ListItemResource4">發佈</asp:ListItem>
                </asp:CheckBoxList></td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label6" runat="server" Text="資料狀態:" meta:resourcekey="Label6Resource1"></asp:Label></td>
            <td valign="top">
                <asp:DropDownList ID="ddlType" runat="server">
                    <asp:ListItem Value="ALL" meta:resourcekey="ListItemResource5">全部</asp:ListItem>
                    <asp:ListItem Value="Y" meta:resourcekey="ListItemResource6">已發佈</asp:ListItem>
                    <asp:ListItem Value="N" meta:resourcekey="ListItemResource7">未發佈</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center; ">
                <div style="float:left; left:50%; position:relative">                    
                    <telerik:RadButton ID="rdbtnQuery" runat="server" Text="查詢" meta:resourcekey="ibtnQueryResource1" OnClick="rdbtnQuery_Click"></telerik:RadButton>
                </div>
            </td>
        </tr>
    </table>
    <table  class ="PopTable" cellspacing="1">
        <tr>
            <td  style="text-align:left; vertical-align:top;">
                <asp:Label ID="Label5" runat="server" Text="查詢符合筆數:" meta:resourcekey="Label5Resource1"></asp:Label>
                <asp:Label ID="lblCount" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align:left; vertical-align:top;" >
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                <Fast:Grid ID="grd" runat="server" AutoGenerateCheckBoxColumn="False" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"  EnhancePager="True" PageSize="30"   OnRowDataBound="grd_RowDataBound" Width="100%" >
                    <EnhancePagerSettings
                        ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <Columns>
                        <asp:BoundField DataField="CUSTOMER_TYPE" HeaderText="客戶別" SortExpression="CONTACT_NAME" meta:resourcekey="BoundFieldResource1" >
                            <headerstyle width="20%" wrap="False" />                                                        
                        </asp:BoundField>
                        <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="客戶名稱" SortExpression="CUSTOMER_NAME" meta:resourcekey="BoundFieldResource2" >
                            <headerstyle width="20%" wrap="False" />                            
                        </asp:BoundField>
                        <asp:BoundField DataField="CONTACT_NAME" HeaderText="聯絡人姓名" SortExpression="CONTACT_NAME" meta:resourcekey="BoundFieldResource3" >                            
                            <headerstyle width="20%" wrap="False" />                            
                        </asp:BoundField>
                        <asp:BoundField DataField="EVENT_ACTION" HeaderText="動作" SortExpression="EVENT_ACTION" meta:resourcekey="BoundFieldResource4" >
                            <headerstyle width="10%" wrap="False" />                            
                        </asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="動作者" SortExpression="NAME" meta:resourcekey="BoundFieldResource5" >                            
                            <headerstyle width="10%" wrap="False" />                            
                        </asp:BoundField>
                       <%-- <asp:BoundField DataField="EVENT_TIME" HeaderText="動作時間" SortExpression="EVENT_TIME" meta:resourcekey="BoundFieldResource6" >                            
                            <headerstyle width="10%" wrap="False" />                            
                        </asp:BoundField>--%>
                        <asp:TemplateField HeaderText="動作時間" SortExpression="EVENT_TIME" meta:resourcekey="BoundFieldResource6">
                            <headerstyle width="10%" wrap="False" />                              
                    <itemtemplate>
                    <asp:Label runat="server" ID="lblActiontime" ></asp:Label>
                    </itemtemplate>
                    <ItemStyle Wrap="False" />
                     </asp:TemplateField>

                        <asp:BoundField DataField="CONFIRM_PUBLISH" HeaderText="資料狀態" SortExpression="L.CONFIRM_PUBLISH" meta:resourcekey="BoundFieldResource7">
                          <headerstyle width="10%" wrap="False" />                            

                        </asp:BoundField>
                    </Columns>
                </Fast:Grid>
           </ContentTemplate>
            <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="rdbtnQuery" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
            </td>
        </tr>
    </table>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
            OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetEventLogData_Count"
            SelectMethod="GetEventLogData" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
            TypeName="Ede.Uof.EIP.Customer.UCO.CUSEventLogUCO">
            <SelectParameters>
                <asp:Parameter Name="QueryCon" Type="Object" />
                <asp:Parameter Name="startDate" Type="DateTime" />
                <asp:Parameter Name="endDate" Type="DateTime" />
                <asp:Parameter Name="DataType" Type="String" />
                <asp:Parameter Name="intStartIndex" Type="Int32" />
                <asp:Parameter Name="intMaxRows" Type="Int32" />
                <asp:Parameter Name="strSortExpression" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
 
    <asp:Label ID="lblCustomer" runat="server" Text="客戶主檔" Visible="False" meta:resourcekey="lblCustomerResource1"></asp:Label>


    <asp:Label ID="lblTitle" runat="server" Text="檢視客戶資料事件" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblContact" runat="server" Text="聯絡人" Visible="False" meta:resourcekey="lblContactResource1"></asp:Label>
    <asp:Label ID="lblAdd" runat="server" Text="新增" Visible="False" meta:resourcekey="lblAddResource1"></asp:Label>
    <asp:Label ID="lblUpdate" runat="server" Text="修改" Visible="False" meta:resourcekey="lblUpdateResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="發佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="已發佈" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" runat="server" Text="未發佈" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>

</asp:Content>

