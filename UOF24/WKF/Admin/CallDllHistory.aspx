<%@ Page Title="安" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_CallDllHistory" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CallDllHistory.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%">
        <tr>
            <td colspan="5" align="center">
                 <asp:Label ID="Label1" runat="server" Text="呼叫DLL狀態歷史記錄" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" 
                    AllowSorting="True" AutoGenerateColumns="False"  
                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                     EnhancePager="True" PageSize="15" 
                      
                    onrowdatabound="Grid1_RowDataBound" Width="100%">
<EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:BoundField DataField="DOC_NBR" HeaderText="表單編號" 
                            meta:resourcekey="BoundFieldResource1" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FORM_NAME" HeaderText="表單名稱" 
                            meta:resourcekey="BoundFieldResource2" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField  HeaderText="申請日期" meta:resourcekey="BoundFieldResource3" >
                            <ItemTemplate>
                                <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                            </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderText="重新發送日期" meta:resourcekey="BoundFieldResource4" >
                            <ItemTemplate>
                                <asp:Label ID="lblModifyDate" runat="server"></asp:Label>
                            </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="STATUS" HeaderText="傳送狀態" 
                            meta:resourcekey="BoundFieldResource5" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="REMARK" HeaderText="訊息" 
                            meta:resourcekey="BoundFieldResource6" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
    </table>
        <asp:Label ID="lblSuccess" runat="server" Text="傳送成功"
        Visible="False" meta:resourcekey="lblSuccessResource1" ></asp:Label>
    <asp:Label ID="lblUnSuccess" runat="server" Text="傳送失敗"
        Visible="False" meta:resourcekey="lblUnSuccessResource1" ></asp:Label>

</asp:Content>

