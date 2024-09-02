<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ViewDetailList" Title="未命名頁面" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ViewDetailList.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function OnValueChanging(sender, args)
        {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>
<table width="100%" >
<tr>
<td colspan="4">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="btnQuery"
                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                meta:resourcekey="RadToolBarbtnQueryResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <table style="width: 100%" cellspacing="1" class="PopTable">
 <tr>
<td >
    <asp:Label ID="Label1" runat="server" Text="問卷名稱" 
        meta:resourcekey="Label1Resource1" ></asp:Label>
    </td>
<td >
    <asp:Label ID="lblDesignName" runat="server" 
        meta:resourcekey="lblDesignNameResource1"></asp:Label>
    </td>
<td >
    <asp:Label ID="Label2" runat="server" Text="狀態" 
        meta:resourcekey="Label2Resource1"></asp:Label>
    </td>
<td>
    <asp:Label ID="lblDesignStatus" runat="server" 
        meta:resourcekey="lblDesignStatusResource1"></asp:Label>
    </td>

</tr>             
<tr>

<td>
    <asp:Label ID="Label5" runat="server" Text="問卷填寫日期(起)" 
        meta:resourcekey="Label5Resource1"></asp:Label></td>
<td>
      
    <telerik:RadDatePicker ID="rdpFrom" runat="server">
        <DateInput ID="DateInput2" runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>      
    </telerik:RadDatePicker>  

    </td>
 
<td>
    <asp:Label ID="Label6" runat="server" Text="問卷填寫日期(訖)" 
        meta:resourcekey="Label6Resource1"></asp:Label>
    </td>
<td>
    <telerik:RadDatePicker ID="rdpTo" runat="server">
        <DateInput ID="DateInput1" runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
    </telerik:RadDatePicker>
    </td>
</tr>

<tr>
<td>
    <asp:Label ID="Label3" runat="server" Text="填寫者備註" 
        meta:resourcekey="Label3Resource1"></asp:Label></td>
<td  colspan="3">
    <asp:TextBox ID="txtQusDetailRemark" runat="server" 
        meta:resourcekey="txtQusDetailRemarkResource1"></asp:TextBox>
    </td>


</tr>
</table>
</td>
</tr>
<tr>
<td colspan="4">
    <Fast:Grid ID="grd" AutoGenerateCheckBoxColumn="True" runat="server" 
        AllowSorting="True"  
        DataKeyOnClientWithCheckBox="False" 
        EnhancePager="True" onrowdatabound="grd_RowDataBound" PageSize="15" 
          AutoGenerateColumns="False" 
        Width="100%" DataKeyNames="QUS_DETAIL_GUID" AllowPaging="True" 
        DefaultSortDirection="Ascending" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" >
        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>
       
<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
       
       <Columns>
           <asp:TemplateField HeaderText="填寫者備註" meta:resourcekey="BoundFieldResource1">
               <ItemTemplate>
                   <asp:Label ID="lblRemark" runat="server"></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText="狀態" meta:resourcekey="BoundFieldResource2">
               <ItemTemplate>
                   <asp:Label ID="lblStatus" runat="server"></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText="送出時間" 
               meta:resourcekey="BoundFieldResource3">
               <ItemTemplate>
                   <asp:Label ID="lblSendTime" runat="server" Text=""></asp:Label>
               </ItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText = "操作" meta:resourcekey="TemplateFieldResource1">
               <ItemTemplate>
                   <asp:LinkButton ID="lbtn" runat="server" onclick="lbtn_Click" 
                       meta:resourcekey="lbtnResource1"></asp:LinkButton>
               </ItemTemplate>
           </asp:TemplateField>
       </Columns>
       
    </Fast:Grid>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                                SelectCountMethod="GetQueryQusDetailTable_Count" SelectMethod="GetQueryQusDetailTable" SortParameterName="strSortExpression"
                                StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusUCO">
                                <SelectParameters>
                                    <asp:Parameter Name="condition" />
                                    <asp:Parameter Name="intStartIndex" />
                                    <asp:Parameter Name="intMaxRows" />
                                    <asp:Parameter Name="strSortExpression" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
</td>
</tr>
</table>
       
<asp:Label ID="lblEM" runat="server" Text="調查中" Visible="False" meta:resourcekey="lblEMResource1" ></asp:Label>
<asp:Label ID="lblSP" runat="server" Text="中止" Visible="False" meta:resourcekey="lblSPResource1" ></asp:Label>
<asp:Label ID="lblCL" runat="server" Text="結束" Visible="False" meta:resourcekey="lblCLResource1" ></asp:Label>
<asp:Label ID="lblSA" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSAResource1" ></asp:Label>
<asp:Label ID="lblSM" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSMResource1" ></asp:Label>
<asp:Label ID="lblEdit" runat="server" Text="修改" Visible="False" meta:resourcekey="lblEditResource1" ></asp:Label>
<asp:Label ID="lblLook" runat="server" Text="查看內容" Visible="False" meta:resourcekey="lblLookResource1" ></asp:Label>
<asp:Label ID="lblFillOutTitle" runat="server" Text="填寫問卷" Visible="False" meta:resourcekey="lblFillOutTitleResource1" ></asp:Label>
<asp:Label ID="lblDetailListTitle" runat="server" Text="個人問卷填寫情況" Visible="False" meta:resourcekey="lblDetailListTitleResource1" ></asp:Label>
<asp:HiddenField ID="hidDesignGuidEncode" runat="server" />
</asp:Content>


