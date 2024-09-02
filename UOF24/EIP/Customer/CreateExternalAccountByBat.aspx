<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_CreateExternalAccountByBat" Title="建立外部會員帳號" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateExternalAccountByBat.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="1" width="100%" class="PopTable">
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label5Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="群組" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblGroup" runat="server" meta:resourcekey="lblGroupResource1"></asp:Label>
                <telerik:RadButton ID="rdbtnGroup" runat="server" CausesValidation="False" OnClick="rdbtnGroup_Click"></telerik:RadButton>
                <input id="hideGroup" runat="server" type="hidden" />
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label2" runat="server" Text="會員類別" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadTreeView ID="RadTreeViewMember" CheckBoxes="true" AllowNodeEditing="false" EnableDragAndDrop="false" runat="server"
                    meta:resourcekey="RadTreeViewMemberResource1"></telerik:RadTreeView>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label3" runat="server" Text="是否自動代入帳號" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rbNeedImport" runat="server" AutoPostBack="True" RepeatColumns="2"
                    RepeatDirection="Horizontal" OnSelectedIndexChanged="rbNeedImport_SelectedIndexChanged"
                    meta:resourcekey="rbNeedImportResource1">
                    <asp:ListItem Value="Y" meta:resourcekey="ListItemResource1">是</asp:ListItem>
                    <asp:ListItem Selected="True" Value="N" meta:resourcekey="ListItemResource2">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <asp:Panel ID="plItem" runat="server" meta:resourcekey="plItemResource1">
        <table cellpadding="0" cellspacing="1" width="100%" class="PopTable">
            <tr>
                <td nowrap="nowrap">
                    <asp:Label ID="Label4" runat="server" Text="自動代入選項" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="rbItemList" runat="server" RepeatColumns="2" RepeatDirection="Horizontal"
                        AutoPostBack="True" OnSelectedIndexChanged="rbItemList_SelectedIndexChanged"
                        meta:resourcekey="rbItemListResource1">
                        <asp:ListItem Value="Number" meta:resourcekey="ListItemResource3">由統一編號</asp:ListItem>
                        <asp:ListItem Value="Email" meta:resourcekey="ListItemResource4">由電子郵件</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Table ID="tbItem" runat="server" CellPadding="0" CellSpacing="1" meta:resourcekey="tbItemResource1">
    <asp:TableRow><asp:TableCell><asp:Label ID="Label6" runat="server"  CssClass="SizeMemo" Text="若帳號有與AD整合請勿使用@字元" meta:resourcekey="lblAccMsgResource1"></asp:Label></asp:TableCell></asp:TableRow>
    </asp:Table>
    <Fast:Grid ID="grd" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
        AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"
        EnhancePager="True" PageSize="15"   AllowPaging="True"
        Width="100%" DefaultSortDirection="Ascending" OnPageIndexChanging="grd_PageIndexChanging">
        <EnhancePagerSettings ShowHeaderPager="True" />
        <ExportExcelSettings AllowExportToExcel="False" />
        <Columns>
            <asp:BoundField DataField="CONTACT_NAME" HeaderText="姓名" meta:resourcekey="BoundFieldResource1" />
            <asp:BoundField DataField="UNIFIED_ID" HeaderText="統一編號" meta:resourcekey="BoundFieldResource2">
                <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" meta:resourcekey="BoundFieldResource3">
                <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="<FONT Color='Red'>*</FONT>帳號" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:TextBox ID="txtAccount" runat="server" MaxLength="50" Text='<%# Eval("EBACCOUNT") %>'
                        meta:resourcekey="txtAccountResource1"></asp:TextBox>
                    <asp:HiddenField ID="hidContactID" runat="server" Value='<%# Eval("CONTACT_ID") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EBACCOUNT") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle Wrap="False" />
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
    <asp:Label ID="lblSet" runat="server" Text="設定" Visible="False" meta:resourcekey="lblSetResource1"></asp:Label>
    <asp:Label ID="lblSave" runat="server" Text="建立帳號" Visible="False" meta:resourcekey="lblSaveResource1"></asp:Label>
    <asp:Label ID="lbIdFormatError" runat="server" Text="帳號格式不正確" Visible="False" meta:resourcekey="lbIdFormatErrorResource1"></asp:Label>
    <asp:Label ID="lblNullAccount" runat="server" Text="帳號不允許空白" Visible="False" meta:resourcekey="lblNullAccountResource1"></asp:Label>
    <asp:Label ID="lblSampleAccount" runat="server" Text="帳號已重覆輸入" Visible="False" meta:resourcekey="lblSampleAccountResource1"></asp:Label>
    <asp:Label ID="lblExistAccount" runat="server" Text="帳號已存在" Visible="False" meta:resourcekey="lblExistAccountResource1"></asp:Label>
    <asp:Label ID="lblUpdateError" runat="server" Text="聯絡人帳號更新失敗" Visible="False" meta:resourcekey="lblUpdateErrorResource1"></asp:Label>
    <asp:Label ID="lblNullGroup" runat="server" Text="群組不允許空白" Visible="False" meta:resourcekey="lblNullGroupResource1"></asp:Label>
    <asp:Label ID="lblEmailFormatErrorMsg" runat="server" Text="{0}的Email格式不正確，請先編輯聯絡人資料" Visible="False" meta:resourcekey="lblEmailFormatErrorMsgResource1"></asp:Label>
</asp:Content>
