<%@ Page Title="站點簽核自訂字詞設定" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetFvrSiteCustomWords.aspx.cs" Inherits="Ede.Uof.Web.WKF.FlowManagement.SetFvrSiteCustomWords" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .cwCenterImportant {
            text-align:center !important;
        }
    </style>
    <asp:Table id="Table1" runat="server" CssClass="PopTable" meta:resourcekey="Table1Resource1">
        <asp:TableRow Style="white-space: nowrap" ID="trLanguage">
            <asp:TableCell CssClass="PopTableHeader" Style="width: 16.66%">
                <div style="text-align: center">
                    <asp:Label ID="lbllanguage" runat="server" Text="語系" meta:resourcekey="lbllanguageResource1"></asp:Label>
                </div>
            </asp:TableCell>
            <asp:TableCell CssClass="PopTableHeader" ColumnSpan="3" >
                <div style="text-align: center">
                    <asp:Label ID="lblButtonShow" runat="server" Text="簽核鈕顯示字詞" meta:resourcekey="lblButtonShowResource1"></asp:Label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    
    <asp:Label ID="hfSignResult" runat="server" Text="預設" meta:resourcekey="hfSignResultResource1" Visible="False"></asp:Label>
    <asp:Label ID="hfApprove" runat="server" Text="同意" meta:resourcekey="hfApproveResource1" Visible="False"></asp:Label>
    <asp:Label ID="hfReturn" runat="server" Text="退簽" meta:resourcekey="hfReturnResource1" Visible="False"></asp:Label>
    <asp:Label ID="hfDisapprove" runat="server" Text="否決" meta:resourcekey="hfDisapproveResource1" Visible="False"></asp:Label>
    <asp:Label ID="lblMemo" runat="server" CssClass="SizeMemo" Text="註：不輸入自訂字詞將會套用預設值" meta:resourcekey="lblMemoResource1"></asp:Label>
    <asp:HiddenField ID="hfFormVersionId" runat="server" />
    <asp:HiddenField ID="hfSiteId" runat="server" />
    <asp:HiddenField ID="hfParentSiteId" runat="server" />
</asp:Content>
