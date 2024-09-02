<%@ Page Title="匯入表單" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ImportForm" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ImportForm.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" cellpadding="0" cellspacing="1" style="width:100%;text-align:left;" >
        <tr>
            <td class="PopTableLeftTD" style=" white-space:nowrap;">
                <asp:Label ID="Label1" runat="server" Text="表單類別" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" >
                <asp:Label ID="lblCategoruName" runat="server" meta:resourcekey="lblCategoruNameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="Label2" runat="server" Text="表單名稱" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" >
                <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="PopTableRightTD" style="text-align:left" >
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter1" AllowedMultipleFileSelection="false" ModuleName="WKF" ProxyEnabled="false"/>
            </td>

        </tr>
        <tr>
            <td colspan="2" class="PopTableRightTD" style=" padding-top:1px; padding-bottom :1px; text-align:left;">
                <Fast:Grid ID="Grid1" runat="server" AllowSorting="False" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False" 
                    Width="100%" PageSize="15" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                    EmptyDataText="沒有資料" EnableModelValidation="True" EnhancePager="True" 
                    KeepSelectedRows="False" meta:resourcekey="Grid1Resource1">
                    <Columns>
                        <asp:BoundField DataField="ERROR_MSG" HeaderText="錯誤訊息" HeaderStyle-Wrap="False" meta:resourcekey="BoundFieldResource1" />
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblMsg" runat="server" Text="請上傳檔案!" Visible="False"  meta:resourcekey="lblMsgResource1"></asp:Label>
</asp:Content>

