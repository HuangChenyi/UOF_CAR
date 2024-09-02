<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_AddTrigger" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="AddTrigger.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable" style="width: 100%; border: 1px; background-color: #999999;" cellpadding="0" cellspacing="1">
        <tr>
            <td class="PopTableHeader" align="center" colspan="3">
                <center>
            <asp:Label ID="lblTitle" runat="server" meta:resourcekey="lblTitleResource1"></asp:Label>
        </center>
            </td>
        </tr>
        <tr>
            <td width="80px" class="PopTableLeftTD" nowrap="noWrap">
                <asp:Label ID="lblTriggerClassName" runat="server" Text="分類"
                    meta:resourcekey="lblTriggerClassNameResource1"></asp:Label></td>
            <td bgcolor="white" width="350px" colspan="2">
                <asp:DropDownList ID="ddlClass" runat="server"
                    meta:resourcekey="ddlClassResource1">
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="ddlClass" Display="Dynamic" ErrorMessage="請至少新增一筆類別"
                    meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="80px" class="PopTableLeftTD" nowrap="noWrap">
                <asp:Label ID="lblTriggerName" runat="server" Text="外部組件名稱"
                    meta:resourcekey="lblTriggerNameResource1"></asp:Label></td>
            <td bgcolor="white" width="350px">
                <asp:TextBox ID="txtTriggerName" runat="server" Width="350px" meta:resourcekey="txtTriggerNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTriggerName" Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="80px" class="PopTableLeftTD" nowrap="noWrap">
                <asp:Label ID="lblFILE"
                    runat="server" Text="DLL名稱" meta:resourcekey="lblFILEResource1"></asp:Label></td>
            <td bgcolor="white" width="350px">
                <asp:TextBox ID="txtFILE" runat="server" Width="350px" meta:resourcekey="txtFILEResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFILE" Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="80px" class="PopTableLeftTD" nowrap="noWrap">
                <asp:Label ID="lblType" runat="server" Text="組件路徑" meta:resourcekey="lblTypeResource1"></asp:Label>
            </td>
            <td bgcolor="white" width="350px">
                <asp:TextBox ID="txtType" runat="server" Width="350px" meta:resourcekey="txtTypeResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtType" Display="Dynamic" 
                    ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator4Resource1">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="80px" class="PopTableLeftTD" nowrap="noWrap">
                <asp:Label ID="lblModuleName" runat="server" Text="備註" meta:resourcekey="lblModuleNameResource1"></asp:Label></td>
            <td bgcolor="white" width="350px">
                <asp:TextBox ID="txtModuleName" runat="server" Width="350px" meta:resourcekey="txtModuleNameResource1"></asp:TextBox></td>
        </tr>
    </table>
    <asp:LinkButton ID="lbtnExternalAuthExample" runat="server" Text="範例說明" ForeColor="Blue" CausesValidation="false" meta:resourcekey="lbtnExternalAuthExampleResource1"></asp:LinkButton>

    <asp:HiddenField ID="hfInsert" runat="server" Value="新增表單異動設定" />
    <asp:HiddenField ID="hfUpdate" runat="server" Value="修改表單異動設定" />
    <asp:HiddenField ID="hfTriggerType" runat="server" />
    <asp:HiddenField ID="hfTriggerID" runat="server" />
    <asp:Label ID="lblSTART_FORM" runat="server" Text="起單" Visible="False" meta:resourcekey="lblSTART_FORMResource1"></asp:Label>
    <asp:Label ID="lblEND_FORM" runat="server" Text="結案" Visible="False" meta:resourcekey="lblEND_FORMResource1"></asp:Label>
    <asp:Label ID="lblCHANGES_FORM" runat="server" Text="狀態變更" Visible="False" meta:resourcekey="lblCHANGES_FORMResource1"></asp:Label>
    <asp:Label ID="lblInsert" runat="server" Text="新增呼叫外部組件設定" meta:resourcekey="lblInsertResource1" Visible="false"></asp:Label>
    <asp:Label ID="lblUpdate" runat="server" Text="修改呼叫外部組件設定" meta:resourcekey="lblUpdateResource1" Visible="false"></asp:Label>
</asp:Content>

