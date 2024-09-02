<%@ Page Title="簡易審核歷程" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocApproveHistory" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DocApproveHistory.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <b>
        <i>
            <asp:Label ID="lblTitle" runat="server" Text="審核歷程" CssClass="SizeXL" meta:resourcekey="lblTitleResource1"></asp:Label>
        </i>
    </b>
    <hr color="#99ccff" />
    <table style="width: 100%;">
        <tr>
            <td style="white-space: nowrap; width:100px">
                <asp:Label ID="Label2" runat="server" Text="這份文件的審核歷程：" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td style="text-align:left;">
                <span style="word-break: break-all;">
                    <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource1" />

                    <asp:Label ID="lblDocName" runat="server" meta:resourcekey="lblDocNameResource1"></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DropDownList ID="ddlSource" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSource_SelectedIndexChanged" meta:resourcekey="ddlSourceResource1">
                    <asp:ListItem Selected="True" Value="all" meta:resourcekey="ListItemResource1">全部</asp:ListItem>
                    <asp:ListItem Value="ACCEPT" meta:resourcekey="ListItemResource2">允許</asp:ListItem>
                    <asp:ListItem Value="REJECT" meta:resourcekey="ListItemResource3">拒絕</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <div style="width: 100%; overflow: auto;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <Fast:Grid ID="Grid1" runat="server" Width="100%" PageSize="15"
                                AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
                                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Descending" DefaultSortColumnName="APPORVE_TIME" 
                                EnhancePager="True" EmptyDataText="沒有資料" 
                                KeepSelectedRows="False" 
                                OnPageIndexChanging="Grid1_PageIndexChanging" 
                                OnRowDataBound="Grid1_RowDataBound" 
                                OnSorting="Grid1_Sorting" >
                                <EnhancePagerSettings ShowHeaderPager="True" />
                                <ExportExcelSettings AllowExportToExcel="False" />
                                <Columns>
                                    <asp:BoundField DataField="DOC_VERSION" HeaderText="文件版本" SortExpression="DOC_VERSION" meta:resourcekey="BoundFieldResource1" >
                                        <HeaderStyle Width="5%" wrap="false"/>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="審核者" SortExpression="APPROVE_USER" meta:resourcekey="TemplateFieldResource1">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApproveUser" runat="server" meta:resourcekey="lblApproveUserResource1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="審核日" SortExpression="APPORVE_TIME" meta:resourcekey="BoundFieldResource2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApporveTime" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="類型" SortExpression="APPORVE_TYPE" meta:resourcekey="TemplateFieldResource2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApproveType" runat="server" meta:resourcekey="lblApproveTypeResource1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="5%" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="發佈/變更原因" SortExpression="CHANGE_REASON" meta:resourcekey="TemplateFieldResource4">
                                        <ItemTemplate>
                                            <div style="word-break:break-word; overflow:hidden;">
                                                <asp:Label ID="lblChangeReason" runat="server" meta:resourcekey="lblChangeReasonResource1"></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                        <HeaderStyle Width="40%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="狀態" SortExpression="APPORVE_STATUS" meta:resourcekey="TemplateFieldResource3">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApproveStatus" runat="server" meta:resourcekey="lblApproveStatusResource1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="5%" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="APPROVE_COMMENT" HeaderText="公佈/拒絕備註" meta:resourcekey="BoundFieldResource3">
                                        <HeaderStyle Width="15%" />
                                    </asp:BoundField>
                                </Columns>
                            </Fast:Grid>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </td>
        </tr>
    </table>
    
    <asp:Label ID="lblPublish" runat="server" Text="發佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblAccept" runat="server" Text="允許" Visible="False" meta:resourcekey="lblAcceptResource1"></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="拒絕" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
</asp:Content>

