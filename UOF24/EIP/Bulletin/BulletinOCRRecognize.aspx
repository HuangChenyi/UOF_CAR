<%@ Page Title="附件辨識" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_BulletinOCRRecognize" Codebehind="BulletinOCRRecognize.aspx.cs" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="Grid1" Width="100%" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"  DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15"   AutoGenerateColumns="False" OnPageIndexChanging="Grid1_PageIndexChanging" OnRowDataBound="Grid1_RowDataBound" OnRowCommand="Grid1_RowCommand" CustomDropDownListPage="False" meta:resourcekey="Grid1Resource1" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="附件名稱" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblDocName" runat="server" meta:resourcekey="lblDocNameResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="辨識結果" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnResult" Text="辨識結果" runat="server" meta:resourcekey="lbtnResultResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="重新辨識" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnReRecognize" Text="重新辨識" runat="server" CommandArgument='<%#: Eval("FILE_ID") %>' CommandName="ReRecognize" meta:resourcekey="lbtnReRecognizeResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
            <asp:HiddenField ID="hfFileGroupID" runat="server" />
            <asp:Label ID="lblTitle" runat="server" Text="辨識結果" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

