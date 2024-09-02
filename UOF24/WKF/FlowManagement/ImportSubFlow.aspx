<%@ Page Title="匯入副流程" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Ede.Uof.Web.WKF.FlowManagement.ImportSubFlow" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ImportSubFlow.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="PopTable" cellpadding="0" cellspacing="1" style="width:100%;text-align:left;" >
        <tr>
            <td class="PopTableRightTD" style="text-align:left" >
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter1" AllowedMultipleFileSelection="false" ModuleName="WKF" ProxyEnabled="false"/>
            </td>

        </tr>
        <tr>
            <td class="PopTableRightTD" style=" padding-top:1px; padding-bottom :1px; text-align:left;">
                <Fast:Grid ID="Grid1" runat="server" AutoGenerateColumns="False"  AutoGenerateCheckBoxColumn="False"
                    Width="100%" PageSize="15" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                    EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource1" 
                    CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="ERROR_MSG" HeaderText="錯誤訊息" HeaderStyle-Wrap="False" meta:resourcekey="BoundFieldResource1" />
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblMsg" runat="server" Text="請上傳檔案!" Visible=False 
        meta:resourcekey="lblMsgResource1"></asp:Label>
    <asp:Label ID="lblCategoryNotToExist" runat="server" Text="請選擇副流程類別!" Visible=False></asp:Label>
</asp:Content>
