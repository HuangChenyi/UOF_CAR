<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Query_StatistcsDocAuthor" Title="發表文件數" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="StatistcsDocAuthor.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width:100%">
                <tr style="height: 80%;">
                    <td style="width: 40%" valign="top">
                        <Fast:Grid ID="gridChart" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                            AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                            OnRowDataBound="gridChart_RowDataBound"
                            Width="90%" AllowPaging="True" EnhancePager="True" OnPageIndexChanging="gridChart_PageIndexChanging" PageSize="15" OnSorting="gridChart_Sorting"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False"  >
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource1" SortExpression="DOC_AUTHOR">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("DOC_AUTHOR") %>' ID="TextBox1" ></asp:TextBox>

                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#: Bind("DOC_AUTHOR") %>' ID="lblAuthor" ></asp:Label>

                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="文件數" meta:resourcekey="TemplateFieldResource2" SortExpression="DOC_NUM">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DOC_NUM") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="50px" Wrap="False" />
                                    <ItemTemplate>
                                        &nbsp;<asp:LinkButton ID="lkDocNum" OnClick="lkDocNum_Click" runat="server" Text='<%# Bind("DOC_NUM") %>' ForeColor="Blue"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EnhancePagerSettings
                                ShowHeaderPager="True" />
                            <HeaderStyle Wrap="False" />
                        </Fast:Grid>
                    </td>

                    <td valign="top">
                        <Fast:Grid ID="gridAuthor" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                            AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" Width="100%"
                            OnRowDataBound="gridAuthor_RowDataBound" AllowPaging="True" OnPageIndexChanging="gridAuthor_PageIndexChanging" OnSorting="gridAuthor_Sorting"  DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15"  >
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:BoundField DataField="DOC_SERIAL" HeaderText="文件編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_SERIAL">
                                    <HeaderStyle Width="5%" Wrap="False" />
                                    <ItemStyle Width="5%" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="文件名稱" meta:resourcekey="TemplateFieldResource3" SortExpression="DOC_NAME">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("DOC_NAME") %>' ID="TextBox1" ></asp:TextBox>

                                    </EditItemTemplate>
                                    <HeaderStyle Width="20%" Wrap="False" />
                                    <ItemTemplate>
                                        <span style="word-break: break-all;">
                                            <asp:Image runat="server" ID="docIcon" ></asp:Image>
                                            <asp:Label runat="server" Text='<%#: Bind("DOC_NAME") %>' ID="Label1"></asp:Label>
                                        </span>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource2" SortExpression="MANUAL_VERSION">
                                    <HeaderStyle Width="10%" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource4" SortExpression="DOC_STATUS">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("DOC_STATUS") %>' ID="TextBox2" ></asp:TextBox>

                                    </EditItemTemplate>
                                    <HeaderStyle Width="20%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("DOC_STATUS") %>' ID="labStatus" ></asp:Label>

                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="DOC_VER_GRADE" HeaderText="文件評比" meta:resourcekey="BoundFieldResource3" SortExpression="DOC_VER_GRADE">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="15%" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DL_NUM" HeaderText="下載數" meta:resourcekey="BoundFieldResource4" SortExpression="DL_NUM">
                                    <HeaderStyle Width="20%" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="修改日期" meta:resourcekey="BoundFieldResource5" SortExpression="MODIFY_DATE">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblModifyDate" ></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="13%" Wrap="False" />
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                            </Columns>
                            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                                NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                                PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                                ShowHeaderPager="True" />
                            <HeaderStyle Wrap="False" />
                        </Fast:Grid>
                    </td>
                </tr>

            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblPublish" runat="server" meta:resourcekey="lblPublishResource1" Text="已公佈" Visible="False"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" meta:resourcekey="lblOldVerResource1" Text="舊版本" Visible="False"></asp:Label>
</asp:Content>

