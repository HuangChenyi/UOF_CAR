<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ChoiceAggregateField"
    Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChoiceAggregateField.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="center">
        <br />
        <table cellspacing="1" class="PopTable" style="width: 300px; height: 400px">
            <tr>
                <td class="PopTableRightTD" style="text-align:center;" style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
                    height: 27px">
                    <asp:Label ID="lblChoiceAggFiledTitle" runat="server" meta:resourcekey="lblSubFlowResource1"
                        Text="加總平均欄位選擇"></asp:Label>
                    <asp:CustomValidator ID="CustomValidatorAggField" runat="server" Display="Dynamic"
                        ErrorMessage="請選擇欄位" meta:resourcekey="CustomValidatorSubFlowResource1"></asp:CustomValidator></td>
            </tr>
            <tr>
                <td align="center" valign="top" style="padding:0 0 0 0 ">
                <table width="100%" style="height:375px"><tr>
                    <td valign="top" class="PopTableRightTD" style="height:100%;text-align:left;">
                    <telerik:RadTreeView ID="treeAggField" runat="server"></telerik:RadTreeView>
                </td></tr></table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
