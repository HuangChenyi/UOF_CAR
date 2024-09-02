<%@ Page Title="文件異地發佈狀態歷史記錄" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_RemoteDocHistory" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="RemoteDocHistory.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table width="800px">
        <tr>
            <td colspan="5" align="center">
                <asp:Label ID="Label1" runat="server" Text="文件異地發佈狀態歷史記錄" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
              <fast:grid ID="historyGrid" runat="server" AutoGenerateCheckBoxColumn="False" 
                    AllowSorting="True" AutoGenerateColumns="False"  
                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                     EnhancePager="True" PageSize="15" 
                      
                    onrowdatabound="historyGrid_RowDataBound" EmptyDataText="沒有資料" 
                    EnableModelValidation="True" KeepSelectedRows="False" 
                    onpageindexchanging="historyGrid_PageIndexChanging" 
                    onsorting="historyGrid_Sorting" AllowPaging="True" 
                    meta:resourcekey="historyGridResource1" >
<EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:BoundField HeaderText="文件標題" DataField="DOC_NAME" 
                            meta:resourcekey="BoundFieldResource1" >
                        <HeaderStyle Width="200px" />
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="發佈者" DataField="CREATE_USER" 
                            meta:resourcekey="BoundFieldResource2" >
                        <HeaderStyle Width="100px" />
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="發佈時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblCreateDate" runat="server" Text="" ></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="80px" />
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="發佈狀態" SortExpression="STATUS" 
                            meta:resourcekey="TemplateFieldResource1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("STATUS") %>' 
                                    meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSendStatus" runat="server" Text='<%# Bind("STATUS") %>' 
                                    meta:resourcekey="lblSendStatusResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="80px" />
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="訊息" DataField="MESSAGE" 
                            meta:resourcekey="BoundFieldResource4" >
                        <HeaderStyle Width="400px" />
                        <ItemStyle Width="400px" />
                        </asp:BoundField>
                  </Columns>
                </fast:grid>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hidDocID" runat="server" />
    <asp:HiddenField ID="hidRemoteSite" runat="server" />
    <asp:HiddenField ID="hidRemoteFolderPath" runat="server" />
    <asp:Label ID="lblMsgSuccess" runat="server" Text="發佈成功" Visible="False" 
            meta:resourcekey="lblMsgSuccessResource1"></asp:Label>
    <asp:Label ID="lblMsgFail" runat="server" Text="發佈失敗" Visible="False" 
            meta:resourcekey="lblMsgFailResource1"></asp:Label>
    <asp:Label ID="lblMsgProcess" runat="server" Text="處理中" Visible="False" 
            meta:resourcekey="lblMsgProcessResource1"></asp:Label>
            </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

