<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_AdvancedQuery" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AdvancedQuery.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script id="igClientScript" type="text/javascript">
    function ibtnExport_Click(sender, args) {
        var CustID = '<%= HiddenField1.ClientID  %>'; 
        $uof.dialog.open2("~/EIP/Customer/AdvancedExportData.aspx", sender, "", 350, 200, OpenDialogResult, { "CustomerID": CustID });
    }
    function NewKeyPress(sender, args) {

        var keyCharacter = args.get_keyCharacter();

        if (keyCharacter == sender.get_numberFormat().DecimalSeparator ||
            keyCharacter == sender.get_numberFormat().NegativeSign) {

            args.set_cancel(true);
        }
    }
    function OpenDialogResult (returnValue) {
        if( typeof(returnValue)==='undefined')
            return false;
        else
            return true;
    }

</script>
<style type="text/css"> 
    .RightAligned 
    { 
        text-align: right; 
    } 
</style>
   
    <table width="100%" cellspacing="1">       
        <tr>
            <td>
                <table width="100%" class="PopTable" cellspacing="1">                         
                    <tr>
                        <td style="width:15%">
                            <asp:Label ID="Label1" runat="server" Text="關鍵字:" meta:resourcekey="Label1Resource1"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlKey" runat="server" meta:resourcekey="ddlKeyResource1">
                                <asp:ListItem Value="CUSTOMER_ID" meta:resourcekey="ListItemResource1">客戶代號</asp:ListItem>
                                <asp:ListItem Value="CUSTOMER_ABBREVIATION" meta:resourcekey="ListItemResource2">客戶簡稱</asp:ListItem>
                                <asp:ListItem Value="CUSTOMER_NAME" meta:resourcekey="ListItemResource3">客戶名稱</asp:ListItem>
                                <asp:ListItem Value="CUSTOMER_ENGLISH_NAME" meta:resourcekey="ListItemResource4">客戶英文名稱</asp:ListItem>
                                <asp:ListItem Value="UNIFIED_ID" meta:resourcekey="ListItemResource5">統一編號</asp:ListItem>
                                <asp:ListItem Value="ADDRESS" meta:resourcekey="ListItemResource6">地址</asp:ListItem>
                                <asp:ListItem Value="TEL" meta:resourcekey="ListItemResource7">公司電話</asp:ListItem>
                                <asp:ListItem Value="COMPANY_FAX" meta:resourcekey="ListItemResource8">公司傳真</asp:ListItem>
                                <asp:ListItem Value="WEB_URL" meta:resourcekey="ListItemResource9">網址</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtKey" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width:15%">
                            <asp:Label ID="Label2" runat="server" Text="資本額:" meta:resourcekey="Label2Resource1"></asp:Label></td>
                        <td>
                            <telerik:RadNumericTextBox ID="rdStartCap" runat="server" CssClass="RightAligned" MaxLength="10" MaxValue="2147483647" MinValue="0">
                                 <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                                <ClientEvents OnKeyPress="NewKeyPress" />
                            </telerik:RadNumericTextBox>
                            <asp:Label ID="Label6" runat="server" Text="(千)" meta:resourcekey="Label6Resource1"></asp:Label>
                            ~
                            <telerik:RadNumericTextBox ID="rdEndCap" runat="server" CssClass="RightAligned" MaxLength="10" MaxValue="2147483647" MinValue="0">
                                <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                                <ClientEvents OnKeyPress="NewKeyPress" />
                            </telerik:RadNumericTextBox>
                            <asp:Label ID="Label7" runat="server" Text="(千)" meta:resourcekey="Label7Resource1"></asp:Label>
                        </td>                        
                    </tr>
                    <tr>
                        <td style="width:15%">
                            <asp:Label ID="Label3" runat="server" Text="聯絡人:" meta:resourcekey="Label3Resource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtContact" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                        <asp:Label ID="Label4" runat="server" Text="發佈日期:" meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                        <td>
                        <table border="0">                        
                        <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdStartPublishDate" runat="server" Width="120px" SkinID="AllowEmpty">
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="~" meta:resourcekey="Label5Resource1"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="rdEndPublishDate" runat="server" Width="120px" SkinID="AllowEmpty">
                            </telerik:RadDatePicker>
                        </td>   
                        </tr>                                     
                        </table>
                        </td>                        
                    </tr>
                    <tr>
                        <td>
                        <asp:Label ID="Label8" runat="server" Text="保固日期:" meta:resourcekey="Label8Resource1"></asp:Label>
                        </td>
                        <td>
                        <table border="0">                        
                        <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdStartWarrantyDate" runat="server" Width="120px" SkinID="AllowEmpty">
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="~" meta:resourcekey="Label9Resource1"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="rdEndWarrantyDate" runat="server" Width="120px" SkinID="AllowEmpty">
                            </telerik:RadDatePicker>
                        </td>   
                        </tr>                                     
                        </table>
                        </td>
                    </tr>
                </table>
                </td>
                </tr>
                </table>
                <asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <ContentTemplate>
                <table width="100%" class="PopTable" cellspacing=1>
                    <tr>                    
                        <td style="text-align:left;">
                            <asp:CheckBox ID="cboClass" runat="server" Text="搜尋所有類別" AutoPostBack="True" OnCheckedChanged="cboClass_CheckedChanged" meta:resourcekey="cboClassResource1" /></td>
                        <td  style="text-align:left;">
                            <asp:CheckBox ID="cboIndustry" runat="server" Text="搜尋所有行業別" AutoPostBack="True" OnCheckedChanged="cboIndustry_CheckedChanged" meta:resourcekey="cboIndustryResource1" /></td>
                        <td style="text-align:left;">
                            <asp:CheckBox ID="cboGrade" runat="server" Text="搜尋所有等級" AutoPostBack="True" OnCheckedChanged="cboGrade_CheckedChanged" meta:resourcekey="cboGradeResource1" /></td>
                        <td style="text-align:left;">
                            <asp:CheckBox ID="cboArea" runat="server" Text="搜尋所有地區" AutoPostBack="True" OnCheckedChanged="cboArea_CheckedChanged" meta:resourcekey="cboAreaResource1" /></td>
                    </tr>
                    <tr>
                        <td style="width:25%; text-align:left;" valign="top">  
                            <telerik:RadTreeView ID="rdtreeClass" Runat="server"  EnableNodeTextHtmlEncoding="true" Width="240px" CheckBoxes="True" Height="200px"></telerik:RadTreeView>                          
                        </td>
                        <td style="width:25%; text-align:left;" valign="top">  
                            <telerik:RadTreeView ID="rdtreeIndustry" Runat="server"  EnableNodeTextHtmlEncoding="true" Width="240px" CheckBoxes="True" Height="200px" ></telerik:RadTreeView>
                        </td>
                        <td style="width:20%; text-align:left;" valign="top">     
                            <telerik:RadTreeView ID="rdtreeGrade" Runat="server"  EnableNodeTextHtmlEncoding="true" Width="240px" CheckBoxes="True" Height="200px"></telerik:RadTreeView>
                        </td>
                        <td style="width:30%; text-align:left;" valign="top"> 
                            <telerik:RadTreeView ID="rdtreeArea" Runat="server"  EnableNodeTextHtmlEncoding="true" Width="250px" CheckBoxes="True" Height="200px"></telerik:RadTreeView>
                        </td>
                    </tr>
                </table>                           
                <table width="100%" class="PopTable" cellspacing="1">                         
               
                    <tr>
                        <td style="text-align:center;">
                            <telerik:RadButton ID="rdbtnQuery" runat="server" Text="查詢" meta:resourcekey="ibtnQueryResource1" OnClick="rdbtnQuery_Click"></telerik:RadButton>
                        </td>
                    </tr>
                </table>
            <table width="100%">
        <tr>
            <td>
                <table width="100%" class="PopTable" cellspacing="1">
                    <tr>
                        <td style="text-align:left;">
                            <asp:Label ID="Label12" runat="server" Text="查詢符合筆數:" Font-Bold="True" meta:resourcekey="Label12Resource1"></asp:Label><asp:Label ID="lblCount" runat="server" Font-Bold="True"></asp:Label></td>
                        <td colspan="2" align="left" >
                            <telerik:RadButton ID="rdbtnExport" runat="server" Text="匯出" meta:resourcekey="ibtnExportResource1" OnClientClicked="ibtnExport_Click" OnClick="rdbtnExport_Click"></telerik:RadButton>
                            <asp:HiddenField ID="HiddenField1" runat="server" />                
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:left;">
                            <Fast:Grid ID="grd" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"
                                 EnhancePager="True" PageSize="30" 
                                 Width="100%" DataKeyNames="CUSTOMER_ID" OnRowDataBound="grd_RowDataBound" >
                                <EnhancePagerSettings
                                    ShowHeaderPager="True" />
                                <Columns>
                                    <asp:TemplateField HeaderText="客戶代號" SortExpression="CUSTOMER_ID" meta:resourcekey="TemplateFieldResource1">
                                        <itemtemplate>
                                    <asp:LinkButton runat="server" Text='<%#: Eval("CUSTOMER_ID") %>' ID="lbtnCustomer" ></asp:LinkButton>

                                    </itemtemplate>
                                        <headerstyle wrap="False" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CUSTOMER_NAME" SortExpression="CUSTOMER_NAME" HeaderText="客戶名稱" meta:resourcekey="BoundFieldResource1" >
                                        <headerstyle wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="WARRANTY_DATE" SortExpression="WARRANTY_DATE" HeaderText="保固日期" DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource5" >
                                        <headerstyle wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CLASS_NAME" SortExpression="CLASS_NAME" HeaderText="類別" meta:resourcekey="BoundFieldResource6" >
                                        <headerstyle wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="INDUSTRY_NAME" SortExpression="INDUSTRY_NAME" HeaderText="行業別" meta:resourcekey="BoundFieldResource3" >
                                        <headerstyle wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="GRADE_NAME" SortExpression="GRADE_NAME" HeaderText="等級" meta:resourcekey="BoundFieldResource2" >
                                        <headerstyle wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AREA_NAME" SortExpression="AREA_NAME" HeaderText="地區" meta:resourcekey="BoundFieldResource4" >
                                        <headerstyle wrap="False" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="聯絡人" meta:resourcekey="TemplateFieldResource2">
                                        <itemtemplate>
                                    <asp:LinkButton runat="server" Text="清單" ID="lbtnContact" meta:resourcekey="lbtnContactResource1"></asp:LinkButton>

                                    </itemtemplate>
                                        <headerstyle wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                            </Fast:Grid>                          
                        </td>
                    </tr>
                </table>              
            </td>
        </tr>
    </table>
    
     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
        OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetAdvancedCustDataSet_Count" 
        SelectMethod="GetAdvancedCustDataSet" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
        TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO">
        <SelectParameters>
            <asp:Parameter Name="QuoCondition" Type="Object" />
            <asp:Parameter Name="QueryKey" Type="String" />
            <asp:Parameter Name="QueryStr" Type="String" />
            <asp:Parameter Name="userGUID" Type="String" />
            <asp:Parameter Name="startCap" Type="Int32" />
            <asp:Parameter Name="endCap" Type="Int32" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="startPublishDate" Type="String" />
            <asp:Parameter Name="endPublishDate" Type="String" />
            <asp:Parameter Name="startWarrantyDate" Type="String" />
            <asp:Parameter Name="endWarrantyDate" Type="String" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</ContentTemplate>
    </asp:UpdatePanel>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblAllClass" runat="server" Text="全部類別" Visible="False" meta:resourcekey="lblAllClassResource1"></asp:Label>
    <asp:Label ID="lblAllArea" runat="server" Text="全部地區" Visible="False" meta:resourcekey="lblAllAreaResource1"></asp:Label>
    <asp:Label ID="lblAllGrade" runat="server" Text="全部等級" Visible="False" meta:resourcekey="lblAllGradeResource1"></asp:Label>
    <asp:Label ID="lblAllIndustry" runat="server" Text="全部行業別" Visible="False" meta:resourcekey="lblAllIndustryResource1"></asp:Label>
    <asp:Label ID="lblBrowseCust" runat="server" Text="瀏覽客戶資料" Visible="False" meta:resourcekey="lblBrowseCustResource1"></asp:Label>
    <asp:Label ID="lblBrowseContact" runat="server" Text="瀏覽聯絡人資料" Visible="False" meta:resourcekey="lblBrowseContactResource1"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="匯出客戶資料" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="客戶資料進階查詢" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
</asp:Content>

