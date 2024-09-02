<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_WKFFlowModify" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="WKFFlowModify.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    function checkchange()
    {
        if (!confirm('<%=lblCheckChange.Text %>')) {
            return false;
        }
    }
</script>
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>

<Fast:Grid runat="server" ID="gridChangeFolder" DefaultSortColumnName="FOLDER_NAME" DefaultSortDirection="Ascending" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False" EnhancePager="True" OnRowDataBound="gridChangeFolder_RowDataBound" OnSorting="gridChangeFolder_Sorting" PageSize="2"   Width="100%">
    <EnhancePagerSettings
        ShowHeaderPager="True" />
    <Columns>
        <asp:TemplateField HeaderText="名稱" SortExpression="FOLDER_NAME" meta:resourcekey="TemplateFieldResource1">
            <edititemtemplate>
                <asp:TextBox runat="server" Text='<%# Bind("FOLDER_ID") %>' ID="TextBox2"></asp:TextBox>
            </edititemtemplate>
            <itemtemplate>
                <asp:Label runat="server" Text='<%# Bind("FOLDER_ID") %>' ID="lblName" __designer:wfdid="w5"></asp:Label>
            </itemtemplate>
            <HeaderStyle Wrap="false" Width="60%"/>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="流程" meta:resourcekey="TemplateFieldResource2">
            <edititemtemplate>
                <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
            </edititemtemplate>
            <itemtemplate>
                <asp:DropDownList runat="server" ID="ddlWKFFlow" __designer:wfdid="w29"></asp:DropDownList>
            </itemtemplate>
            <HeaderStyle Wrap="false" Width="40%"/>
        </asp:TemplateField>
    </Columns>
</Fast:Grid></contenttemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblCheckChange" runat="server" Text="確定要更換這些資料夾的流程嗎?" Visible="False" meta:resourcekey="lblCheckChangeResource1"></asp:Label>
</asp:Content>

