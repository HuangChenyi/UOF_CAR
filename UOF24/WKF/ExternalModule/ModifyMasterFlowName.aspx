<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_ExternalModule_ModifyMasterFlowName" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ModifyMasterFlowName.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%" class="PopTable" cellspacing="1">
        <tr>
            <td class ="PopTableLeftTD">
                <asp:Label ID="lblFlowName" runat="server" Text="流程名稱" meta:resourcekey="lblFlowNameResource1"></asp:Label></td>
            <td class ="PopTableRightTD">
                <asp:TextBox ID="txtFlowName" runat="server" meta:resourcekey="txtFlowNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFlowName"
                    ErrorMessage="流程名稱不允許空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
        </tr>
    </table>
</asp:Content>

