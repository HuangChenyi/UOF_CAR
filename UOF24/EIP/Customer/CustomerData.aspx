<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_CustomerData" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CustomerData.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td valign="top" style="width: 25%" align="left">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <contenttemplate>
                    <telerik:RadTabStrip ID="RadTabStrip1" MultiPageID="RadMultiPage1" runat="server"  Width="100%" SelectedIndex="0" meta:resourcekey="rts1Resource1" OnTabClick="RadTabStrip1_TabClick" >
                        <Tabs>
                           <telerik:RadTab runat="server" Text="類別" Value="tabClass" PageViewID="rdPageView1" meta:resourcekey="RadTabResource2" Selected="True">
                           </telerik:RadTab>
                           <telerik:RadTab runat="server" Text="行業別" Value="tabIndustry" PageViewID="rdPageView2" meta:resourcekey="RadTabResource3" >
                           </telerik:RadTab>
                           <telerik:RadTab runat="server" Text="地區別" Value="tabArea" PageViewID="rdPageView3" meta:resourcekey="RadTabResource4">
                           </telerik:RadTab>
                        </Tabs>
                    </telerik:RadTabStrip>
                    <telerik:RadMultiPage ID="RadMultiPage1" Runat="server" SelectedIndex="0" Width="100%">
                        <telerik:RadPageView runat="server" id="rdPageView1" style="text-align:left;">
                                <telerik:RadTreeView Runat="server" ID="rdClasstree" OnNodeClick="rdClasstree_NodeClick"></telerik:RadTreeView>
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" id="rdPageView2" style="text-align:left;">
                                <telerik:RadTreeView Runat="server" ID="industrytree" OnNodeClick="industrytree_NodeClick"></telerik:RadTreeView>
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" id="rdPageView3">
                                <telerik:RadTreeView Runat="server" ID="areatree" ></telerik:RadTreeView>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>              
               </contenttemplate>
                </asp:UpdatePanel>
            </td>

            <td valign="top" style="width: 75%">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <contenttemplate>
                <table class ="PopTable" cellspacing="1" style="width: 51%">
                    <tr>
                        <td >
                            <asp:Label ID="Label2" runat="server" Text="客戶代號:" Width="70px" 
                                meta:resourcekey="Label2Resource1"></asp:Label></td>
                        <td >
                            <asp:TextBox ID="txtCustID" runat="server" 
                                meta:resourcekey="txtCustIDResource1"></asp:TextBox></td>
                        <td >
                            <asp:Label ID="Label1" runat="server" Text="客戶簡稱/名稱:" Width="110px" 
                                meta:resourcekey="Label1Resource1"></asp:Label></td>
                        <td >
                            <asp:TextBox ID="txtCustName" runat="server" 
                                meta:resourcekey="txtCustNameResource1"></asp:TextBox></td>
                        <td  class="PopTableLeftTD">
                            <telerik:RadButton ID="rdbtnQuery" runat="server" Text="查詢" meta:resourcekey="ibtnQueryResource1" OnClick="rdbtnQuery_Click"></telerik:RadButton>
                        </td>
                    </tr>
                </table>
               <fast:grid id="grd" runat="server" AllowSorting="True" 
                        AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
                         DataKeyNames="CUSTOMER_ID" 
                        DataKeyOnClientWithCheckBox="False" 
                        EnhancePager="True" PageSize="15"   
                        Width="100%" AllowPaging="True" OnRowDataBound="grd_RowDataBound" 
                        DefaultSortDirection="Ascending" >
                    <EnhancePagerSettings
                        ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:TemplateField HeaderText="客戶代號" SortExpression="CU.CUSTOMER_ID" 
                            meta:resourcekey="TemplateFieldResource1">
                            <itemtemplate>
<asp:LinkButton id="lbtnCustomerID"  runat="server" Text='<%# Eval("CUSTOMER_ID") %>' 
                                    meta:resourcekey="lbtnCustomerIDResource1" ></asp:LinkButton> 
</itemtemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CUSTOMER_ABBREVIATION" HeaderText="客戶簡稱" 
                            SortExpression="CU.CUSTOMER_ABBREVIATION" 
                            meta:resourcekey="BoundFieldResource1" />
                        <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="客戶名稱" 
                            SortExpression="CU.CUSTOMER_NAME" meta:resourcekey="BoundFieldResource2" />
                        <asp:BoundField DataField="GRADE_NAME" HeaderText="等級" 
                            SortExpression="GR.GRADE_NAME" meta:resourcekey="BoundFieldResource3" />
                        <asp:BoundField DataField="OWNER" HeaderText="負責人" 
                            meta:resourcekey="BoundFieldResource4" />
                        <asp:TemplateField HeaderText="聯絡人" meta:resourcekey="TemplateFieldResource2">
                            <itemtemplate>
<asp:LinkButton id="lbtnContactID" runat="server" Text='联络人清单' meta:resourcekey="lbtnContactIDResource1"></asp:LinkButton> 
</itemtemplate>
                        </asp:TemplateField>
                    </Columns>
                </fast:grid>
                  </contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="Label4" runat="server" Text="全部類別" Visible="False" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="一周內發佈的客戶" Visible="False" meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="客戶資料" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetBrowseCustDataSet_Count"
        SelectMethod="GetBrowseCustDataSet" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
        TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <selectparameters>
            <asp:Parameter Name="StructClassID" Type="Object" />
            <asp:Parameter Name="custID" Type="String" />
            <asp:Parameter Name="custName" Type="String" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
        </selectparameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetBrowseCustDataSet_Count"
        SelectMethod="GetBrowseCustDataSet" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
        TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <selectparameters>
            <asp:Parameter Name="dateStart" Type="DateTime" />
            <asp:Parameter Name="dateEnd" Type="DateTime" />
            <asp:Parameter Name="custID" Type="String" />
            <asp:Parameter Name="custName" Type="String" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
        </selectparameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetBrowseCustDataSetByIndustryID_Count"
        SelectMethod="GetBrowseCustDataSetByIndustryID" SortParameterName="strSortExpression"
        StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <selectparameters>
            <asp:Parameter Name="StructIndustryID" Type="Object" />
            <asp:Parameter Name="custID" Type="String" />
            <asp:Parameter Name="custName" Type="String" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
        </selectparameters>
    </asp:ObjectDataSource>

    <asp:Label ID="lblContactEdit" runat="server" Text="聯絡人資料維護" Visible="False" meta:resourcekey="lblContactEditResource1"></asp:Label>
    <asp:Label ID="lblEdit" runat="server" Text="瀏覽客戶資料" Visible="False" meta:resourcekey="lblEditResource1"></asp:Label>
    <asp:Label ID="lblContact" runat="server" Text="瀏覽聯絡人資料" Visible="False" meta:resourcekey="lblContactResource1"></asp:Label>
    <asp:Label ID="Label9" runat="server" Text="全部行業別" Visible="False" meta:resourcekey="Label9Resource1"></asp:Label>
    <asp:Label ID="Label10" runat="server" Text="無設定行業別客戶" Visible="False" meta:resourcekey="Label10Resource1"></asp:Label>

</asp:Content>

