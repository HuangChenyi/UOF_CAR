<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DirInfo" Title="目錄資訊" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DirInfo.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;">
                <tr>
                    <td style="border-collapse: inherit;">

                        <telerik:RadTabStrip ID="tabFolder" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" OnTabClick="tabFolder_TabClick1">
                            <Tabs>
                                <telerik:RadTab runat="server" Text="內容" Value="FolderContent" Selected="True">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="權限" Value="FolderPrivilege">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="狀態" Value="FolderStatus">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="訂閱者" Value="SubscribeUser" Visible="False">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
                            <telerik:RadPageView runat="server" ID="RadPageView1">
                                <table style="padding-right: 1px; width: 100%">
                                    <tr>
                                        <td>
                                            <table border="1" width="100%" class="PopTable" cellpadding="0" cellspacing="0">


                                                <tr>
                                                    <td style="white-space: nowrap;">
                                                        <img src="../../DMS/images/open.gif" />
                                                        <asp:Label ID="Label8" runat="server" Text="目錄名稱" meta:resourcekey="Label8Resource1"></asp:Label></td>
                                                    <td style="width: auto">
                                                        <asp:Label ID="labFolderName" runat="server" meta:resourcekey="labFolderNameResource1"></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td>

                                                        <asp:Label ID="Label2" runat="server" Text="路徑" meta:resourcekey="Label2Resource1"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="labFolderPath" runat="server" meta:resourcekey="labFolderPathResource1"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                        <asp:Label ID="Label3" runat="server" Text="建立者" meta:resourcekey="Label3Resource1"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="labCreateUser" runat="server" meta:resourcekey="labCreateUserResource1"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                        <asp:Label ID="Label4" runat="server" Text="建立時間" meta:resourcekey="Label4Resource1"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="labCreateTime" runat="server" meta:resourcekey="labCreateTimeResource1"></asp:Label></td>
                                                </tr>

                                                <tr>
                                                    <td>

                                                        <asp:Label ID="Label7" runat="server" Text="修改時間" meta:resourcekey="Label7Resource1"></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="labModifyTime" runat="server" meta:resourcekey="labModifyTimeResource1"></asp:Label></td>
                                                </tr>


                                                <tr>
                                                    <td align="right">
                                                        <asp:Label ID="Label5" runat="server" Text="備註" meta:resourcekey="Label5Resource1"></asp:Label></td>
                                                    <td>
                                                        <asp:TextBox ID="textComment" runat="server" Height="91px" TextMode="MultiLine" Width="100%" ReadOnly="false" meta:resourcekey="textCommentResource1"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />


                                <img src="../../DMS/images/closed.gif" />
                                <asp:Label ID="Label6" runat="server" Text="子目錄數：" meta:resourcekey="Label6Resource1"></asp:Label>
                                <asp:Label ID="lblSubFolderCount" runat="server" meta:resourcekey="lblSubFolderCountResource1"></asp:Label>
                                &nbsp;&nbsp;
    <img src="../../DMS/images/icon/unknown.gif" />
                                <asp:Label ID="Label9" runat="server" Text="已公佈的文件數：" meta:resourcekey="Label9Resource1"></asp:Label>
                                <asp:Label ID="labDocsNum" runat="server" meta:resourcekey="labDocsNumResource1"></asp:Label>

                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView2">
                                <div style="overflow: auto; width: 100%; height: 336px">
                                    <b>
                                        <asp:Label ID="Label1" runat="server" Text="管理者：" meta:resourcekey="Label1Resource1"></asp:Label></b><br />
                                    &nbsp;<uc1:UC_ChoiceList ID="chManager" runat="server" ExpandToUser="false" IsAllowEdit="false" />
                                    <hr />
                                    <b>
                                        <asp:Label ID="Label10" runat="server" Text="作者：" meta:resourcekey="Label10Resource1"></asp:Label></b><br />
                                    &nbsp;
            <uc1:UC_ChoiceList ID="chAuthor" runat="server" ExpandToUser="false" IsAllowEdit="false" />
                                    <hr />
                                    <b>
                                        <asp:Label ID="Label11" runat="server" Text="讀者：" meta:resourcekey="Label11Resource1"></asp:Label></b><br />
                                    &nbsp;<uc1:UC_ChoiceList ID="chReader" runat="server" ExpandToUser="false" IsAllowEdit="false" />
                                </div>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView3">
                                <div style="overflow: auto; width: 100%; height: 100%">
                                    <b>
                                        <asp:Label ID="Label12" runat="server" Text="一週內所公佈的文件：" meta:resourcekey="Label12Resource1"></asp:Label></b><br />
                                    <Fast:Grid ID="Grid4" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                        AutoGenerateColumns="False"
                                        Width="100%" AllowPaging="True" OnPageIndexChanging="Grid4_PageIndexChanging" OnRowDataBound="Grid4_RowDataBound" DataKeyOnClientWithCheckBox="False"  DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15"  >
                                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:BoundField DataField="DOC_SERIAL" HeaderText="文件編號" meta:resourcekey="BoundFieldResource1">
                                                <HeaderStyle Wrap="False" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource1">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DOC_NAME") %>' ID="lblDocName" meta:resourceKey="lblDocNameResource1" __designer:wfdid="w3"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource2">
                                                <HeaderStyle Wrap="False" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource2">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblAuthor" meta:resourceKey="lblAuthorResource1" __designer:wfdid="w5"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="時間" meta:resourcekey="BoundFieldResource3">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblTime" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                    <br />
                                    <b>
                                        <asp:Label ID="Label13" runat="server" Text="一週內所作廢的文件：" meta:resourcekey="Label13Resource1"></asp:Label></b><br />
                                    <Fast:Grid ID="Grid5" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                        AutoGenerateColumns="False"
                                        Width="100%" AllowPaging="True" OnPageIndexChanging="Grid5_PageIndexChanging" OnRowDataBound="Grid5_RowDataBound" DataKeyOnClientWithCheckBox="False"  DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15"  >
                                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                        <ExportExcelSettings AllowExportToExcel="False" />
                                        <Columns>
                                            <asp:BoundField DataField="DOC_SERIAL" HeaderText="文件編號" meta:resourcekey="BoundFieldResource4">
                                                <HeaderStyle Wrap="False" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource3">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Bind("DOC_NAME") %>' ID="lblDocName2" meta:resourceKey="lblDocName2Resource1" __designer:wfdid="w6"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource5">
                                                <HeaderStyle Wrap="False" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource4">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblAuthor2" meta:resourceKey="lblAuthor2Resource1" __designer:wfdid="w7"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="時間" meta:resourcekey="BoundFieldResource6">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lblTime" ></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                    <br />
                                </div>
                            </telerik:RadPageView>
                            <telerik:RadPageView ID="RadPageView4" runat="server">
                                <br />
                                <telerik:RadButton ID="btnPreSubscribe" runat="server" Text="預設訂閱"
                                    meta:resourcekey="btnPreSubscribeResource1">
                                </telerik:RadButton>
                                <br />
                                <br />
                                <asp:Label ID="Label14" runat="server" Text="系統預設訂閱：" meta:resourcekey="Label14Resource1"></asp:Label><br />
                                <Fast:Grid ID="Grid7" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                    AutoGenerateColumns="False"
                                    Width="100%" DataKeyOnClientWithCheckBox="False">
                                    <Columns>
                                        <asp:BoundField DataField="部門" HeaderText="部門" meta:resourcekey="BoundFieldResource7" />
                                        <asp:BoundField DataField="姓名" HeaderText="姓名" meta:resourcekey="BoundFieldResource8" />
                                        <asp:BoundField DataField="時間" HeaderText="時間" meta:resourcekey="BoundFieldResource9" />
                                    </Columns>
                                </Fast:Grid>
                                <br />
                                <br />
                                <asp:Label ID="Label15" runat="server" Text="已訂閱此目錄的使用者：" meta:resourcekey="Label15Resource1"></asp:Label><br />
                                <Fast:Grid ID="Grid6" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                    AutoGenerateColumns="False"
                                    Width="100%" DataKeyOnClientWithCheckBox="False">
                                    <Columns>
                                        <asp:BoundField DataField="部門" HeaderText="部門" meta:resourcekey="BoundFieldResource10" />
                                        <asp:BoundField DataField="姓名" HeaderText="姓名" meta:resourcekey="BoundFieldResource11" />
                                        <asp:BoundField DataField="時間" HeaderText="時間" meta:resourcekey="BoundFieldResource12" />
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                        </telerik:RadMultiPage>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>    
    <asp:HiddenField ID="hdAppPath" runat="server" />
    <asp:Label ID="lblContent" runat="server" Text="內容" Visible="False" meta:resourcekey="lblContentResource1"></asp:Label>
    <asp:Label ID="lblPermission" runat="server" Text="權限" Visible="False" meta:resourcekey="lblPermissionResource1"></asp:Label>
    <asp:Label ID="lblStatus" runat="server" Text="狀態" Visible="False" meta:resourcekey="lblStatusResource1"></asp:Label>
    <asp:Label ID="lblFolderIsDelete" runat="server" Text="目錄已被刪除" Visible="false" meta:resourcekey="lblFolderIsDeleteResource1"></asp:Label>
    <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1" Text="文件庫" Visible="False"></asp:Label>
</asp:Content>

