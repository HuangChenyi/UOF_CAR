<%@ Page Title="未完成簽核表單" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_SignFormDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SignFormDetail.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" cellspacing="1">
        <tr>
            <td style="white-space:nowrap;width:25%;">
                <asp:Label ID="Label1" runat="server" Text="部門名稱:" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;width:25%;">
                <asp:Label ID="lblDeptName" runat="server" 
                    meta:resourcekey="lblDeptNameResource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;width:25%;">
                <asp:Label ID="Label2" runat="server" Text="表單名稱:" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;width:25%;">
                <asp:Label ID="lblFormName" runat="server" 
                    meta:resourcekey="lblFormNameResource1"></asp:Label>
            </td>
        </tr>
    </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                    <Fast:Grid ID="FormGrid" runat="server" AllowPaging="True" AllowSorting="True" 
                        AutoGenerateCheckBoxColumn="False" 
                         
                        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                        EmptyDataText="沒有資料" EnhancePager="True" 
                        PageSize="15"  
                         Width="100%" KeepSelectedRows="False" 
                        AutoGenerateColumns="False" onrowdatabound="FormGrid_RowDataBound" 
                        onpageindexchanging="FormGrid_PageIndexChanging" 
                        onsorting="FormGrid_Sorting" meta:resourcekey="FormGridResource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" >
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>                                                  
                            <asp:BoundField DataField="OWNER" HeaderText="申請人" SortExpression="OWNER"> 
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnFornNbr" runat="server" Text='<%#: Bind("DOC_NBR") %>' meta:resourcekey="btnFornNbrResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("DOC_NBR") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="申請日期" SortExpression="APPLY_DATE" meta:resourcekey="TemplateFieldResource3" >
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("APPLY_DATE") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblApplyDate" runat="server" Text='<%#: Bind("APPLY_DATE") %>' meta:resourcekey="lblApplyDateResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1" >
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnHurryToSign" runat="server" Text="跟催" 
                                        meta:resourcekey="lbtnHurryToSignResource1" ></asp:LinkButton>
                                    <asp:LinkButton ID="lbtnNodeSigner" runat="server" Text="指定簽核" 
                                        meta:resourcekey="lbtnNodeSignerResource1" ></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                </Fast:Grid>
            </ContentTemplate>
        </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

