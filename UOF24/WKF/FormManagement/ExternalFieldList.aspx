<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ExternalFieldList" Title="選擇表單" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ExternalFieldList.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" style="width:100%" >
        <tr>
            <td class = "PopTableHeader"  >
                <center>
                                    <asp:Label ID="lblFormList" runat="server" Text="表單範本" meta:resourcekey="lblFormListResource1"></asp:Label></td>
                </center>

        </tr>
        <tr>
            <td class="PopTableRightTD" style="text-align:left">
                <asp:Label ID="Label2" runat="server" Text="表單類別" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:DropDownList ID="ddlFormListClass" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlFormListClass_SelectedIndexChanged" 
                    meta:resourcekey="ddlFormListClassResource1">
                </asp:DropDownList>
                <asp:Label ID="Label1" runat="server" Text="表單名稱" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:DropDownList ID="ddlFormList" runat="server" OnSelectedIndexChanged="ddlFormList_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="ddlFormListResource1">
                </asp:DropDownList>
                
                <Fast:Grid ID="dgFormFields" runat="server" AllowSorting="True" 
                    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" 
                     DataKeyNames="FIELD_ID" 
                    DataKeyOnClientWithCheckBox="False"  
                    EnhancePager="True" PageSize="15"   
                    OnRowDataBound="dgFormFields_RowDataBound" 
                    Width="600px" 
                    DefaultSortDirection="Ascending">
                                <EnhancePagerSettings
                                    ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" 
                                    LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" 
                                    PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" 
                                    PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                <ExportExcelSettings AllowExportToExcel="False" />
                                <Columns>
                                    <asp:BoundField DataField="FIELD_ID" HeaderText="欄位代號" meta:resourcekey="BoundFieldResource1">
                                        <headerstyle wrap="False" />
                                        <itemstyle wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FIELD_NAME" HeaderText="欄位名稱" meta:resourcekey="BoundFieldResource2">
                                        <headerstyle wrap="False" />
                                        <itemstyle wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="FIELD_TYPE" HeaderText="欄位型態" meta:resourcekey="BoundFieldResource3">
                                        <headerstyle wrap="False" />
                                        <itemstyle wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                            </Fast:Grid>
                
            </td>
        </tr>
    </table>
        </ContentTemplate>
    </asp:UpdatePanel>

             <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
             <asp:Label ID="lblSingleLineText" runat="server" Text="單行文字欄位" Visible="False" meta:resourcekey="lblSingleLineTextResource1"></asp:Label>
             <asp:Label ID="lblMultiLineText" runat="server" Text="多行文字欄位" Visible="False" meta:resourcekey="lblMultiLineTextResource1"></asp:Label>
             <asp:Label ID="lblNumberText" runat="server" Text="數值欄位" Visible="False" meta:resourcekey="lblNumberTextResource1"></asp:Label>
             <asp:Label ID="lblFileButton" runat="server" Text="檔案選取欄位" Visible="False" meta:resourcekey="lblFileButtonResource1"></asp:Label>
             <asp:Label ID="lblDateSelect" runat="server" Text="日期欄位" Visible="False" meta:resourcekey="lblDateSelectResource1"></asp:Label>
             <asp:Label ID="lblTimeSelect" runat="server" Text="時間欄位" Visible="False" meta:resourcekey="lblTimeSelectResource1"></asp:Label>
             <asp:Label ID="lblCheckBox" runat="server" Text="核選方塊" Visible="False" meta:resourcekey="lblCheckBoxResource1"></asp:Label>
             <asp:Label ID="lblRadioButton" runat="server" Text="單選鈕" Visible="False" meta:resourcekey="lblRadioButtonResource1"></asp:Label>
             <asp:Label ID="lblDropDownList" runat="server" Text="下拉式選單" Visible="False" meta:resourcekey="lblDropDownListResource1"></asp:Label>
             <asp:Label ID="lblDataGrid" runat="server" Text="明細欄位" Visible="False" meta:resourcekey="lblDataGridResource1"></asp:Label>
             <asp:Label ID="lblHyperLink" runat="server" Text="超連結" Visible="False" meta:resourcekey="lblHyperLinkResource1"></asp:Label>
             <asp:Label ID="lblCalculateText" runat="server" Text="表單計算欄位" Visible="False" meta:resourcekey="lblCalculateTextResource1"></asp:Label>
             <asp:Label ID="lblAggregateText" runat="server" Text="加總平均欄位" Visible="False" meta:resourcekey="lblAggregateTextResource1"></asp:Label>
             <asp:Label ID="lblUserProposer" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblUserProposerResource1"></asp:Label>
             <asp:Label ID="lblUserDept" runat="server" Text="申請者部門" Visible="False" meta:resourcekey="lblUserDeptResource1"></asp:Label>
             <asp:Label ID="lblUserRank" runat="server" Text="申請者職級" Visible="False" meta:resourcekey="lblUserRankResource1"></asp:Label>
             <asp:Label ID="lblAllDept" runat="server" Text="所有部門" Visible="False" meta:resourcekey="lblAllDeptResource1"></asp:Label>
             <asp:Label ID="lblAllRank" runat="server" Text="所有職級" Visible="False" meta:resourcekey="lblAllRankResource1"></asp:Label>
             <asp:Label ID="lblAllFunction" runat="server" Text="所有職務" Visible="False" meta:resourcekey="lblAllFunctionResource1"></asp:Label>
             <asp:Label ID="lblAllUser" runat="server" Text="所有人員" Visible="False" meta:resourcekey="lblAllUserResource1"></asp:Label>
             <asp:Label ID="lblHiddenField" runat="server" Text="隱藏欄位" Visible="False" meta:resourcekey="lblHiddenFieldResource1"></asp:Label>
             <asp:Label ID="lblAutoNumber" runat="server" Text="自動編號欄位" Visible="False" meta:resourcekey="lblAutoNumberResource1"></asp:Label>
       
</asp:Content>

