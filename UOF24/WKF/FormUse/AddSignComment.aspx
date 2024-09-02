<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_AddSignComment" Title="加入簽核意見" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="AddSignComment.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="1" class="PopTable" width="100%">
        <tr>
            <td class="PopTableHeader">

                <asp:Label ID="lblAddSignCommentMsg" runat="server"
                    Text="加入簽核意見" meta:resourcekey="lblAddSignCommentMsgResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableRightTD" style="text-align: left;">
                <asp:DropDownList ID="ddlCulture" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlCulture_SelectedIndexChanged"
                    meta:resourcekey="ddlCultureResource1">
                    <asp:ListItem Selected="True" Value="ALL" meta:resourcekey="ListItemResource1">全部</asp:ListItem>
                    <asp:ListItem Value="Personal" meta:resourcekey="ListItemResource2">個人</asp:ListItem>
                    <asp:ListItem Value="System" meta:resourcekey="ListItemResource3">系統</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="PopTableRightTD" style="text-align: left">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <Fast:Grid ID="DGCommentList" runat="server" Width="100%"
                            EnhancePager="True"
                            PageSize="15" DataKeyOnClientWithCheckBox="False"
                            AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False"
                            AllowSorting="True" AllowPaging="True"
                            DefaultSortDirection="Ascending" OnRowDataBound="DGCommentList_RowDataBound"
                            OnPageIndexChanging="DGCommentList_PageIndexChanging"
                            OnSorting="DGCommentList_Sorting" OnRowCommand="DGCommentList_RowCommand">
                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl=""
                                FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl=""
                                NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                                PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                PreviousImageUrl="" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:BoundField DataField="IS_SYSTEM" HeaderText="類別"
                                    SortExpression="IS_SYSTEM" meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="內容" SortExpression="COMMENT_CONTENT"
                                    meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False"
                                            meta:resourcekey="LinkButton1Resource1">LinkButton</asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="85%" HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Left" />
                        </Fast:Grid>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlCulture"
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblSaveMsg" runat="server" Text="儲存" Visible="False"
        meta:resourcekey="lblSaveMsgResource1"></asp:Label>
    <asp:Label ID="lblConfirmMsg" runat="server" Text="確定" Visible="False"
        meta:resourcekey="lblConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblDeleteMsg" runat="server" Text="刪除" Visible="False"
        meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
    <asp:Label ID="lblSaved" runat="server" Text="簽核意見已儲存!!" Visible="False"
        meta:resourcekey="lblSavedResource1"></asp:Label>
    <asp:Label ID="lblChoseMsg" runat="server" Text="請選擇" Visible="False"
        meta:resourcekey="lblChoseMsgResource1"></asp:Label>
    <asp:Label ID="lblChoose" runat="server" Text="請選擇簽核意見" Visible="False"
        meta:resourcekey="lblChooseResource1"></asp:Label>
    <asp:Label ID="lblIsSystemMsg" runat="server" Text="系統預設的簽核意見不可刪除"
        Visible="False"></asp:Label>
    <asp:Label ID="lblDeleted" runat="server" Text="簽核意見已刪除!!" Visible="False"
        meta:resourcekey="lblDeletedResource1"></asp:Label>
    <asp:Label ID="lblSystemMsg" runat="server" Text="系統" Visible="False"
        meta:resourcekey="lblSystemMsgResource1"></asp:Label>
    <asp:Label ID="lblPersonalMsg" runat="server" Text="個人" Visible="False"
        meta:resourcekey="lblPersonalMsgResource1"></asp:Label>
</asp:Content>

