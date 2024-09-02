<%@ Page Title="填寫修改權限設定" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupRequiredField.aspx.cs" Inherits="Ede.Uof.Web.WKF.FlowManagement.SetupRequiredField" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        function SureToResume() {
            if (!confirm('<%=lblConfirmResume.Text%>')) {
                return false;
            }
        }
    </script>
    <style>
        .RequireFieldTD > tbody > tr > td {
            text-align: left !important;
            height:25px;
        }
    </style>

    <div>
        <asp:Table CssClass="PopTable RequireFieldTD" ID="TableAutoGenerate" runat="server" meta:resourcekey="TableAutoGenerateResource1">
        </asp:Table>
    </div>
    <br />
    <span class="SizeMemo"><asp:Label ID="lblSeperate" runat="server" Text="以下為明細欄位" meta:resourcekey="lblSeperateResource1"></asp:Label></span>
    <div>
        <asp:Table CssClass="PopTable RequireFieldTD" ID="TableAutoGenerate4Detail" runat="server" meta:resourcekey="TableAutoGenerate4DetailResource1">
        </asp:Table>
    </div>
    <asp:Label ID="lblFormId" runat="server" Text="欄位代號" Visible="False"
        meta:resourcekey="lblFormIdResource1"></asp:Label>
    <asp:Label ID="lblFormName" runat="server" Text="欄位名稱" Visible="False"
        meta:resourcekey="lblFormNameResource1"></asp:Label>
    <asp:Label ID="lblFillingAuth" runat="server" Text="填寫權限" Visible="False" meta:resourcekey="lblFillingAuthResource1"></asp:Label>
    <asp:Label ID="lblModifyAuth" runat="server" Text="修改權限" Visible="False" meta:resourcekey="lblModifyAuthResource1"></asp:Label>
    <asp:Label ID="lblInherit" runat="server" Text="繼承欄位" Visible="False" meta:resourcekey="lblInheritResource1"></asp:Label>
    <asp:Label ID="lblCustom" runat="server" Text="自訂" Visible="False" meta:resourcekey="lblCustomResource1"></asp:Label>
    <asp:Label ID="lblResume" runat="server" Text="清空設定值" Visible="False" meta:resourcekey="lblResumeResource1"></asp:Label>
    <asp:Label ID="lblConfirmResume" runat="server" Text="是否確定要清空設定值" Visible="False" meta:resourcekey="lblConfirmResumeResource1"></asp:Label>
    <asp:Label ID="lblNotAllowModify" runat="server" Text="簽名欄位不支援修改設定" Visible="False" meta:resourcekey="lblNotAllowModifyResource1"></asp:Label>
    <asp:Label ID="lblNoFieldsAvalible" runat="server" Text="沒有可依站點設定填寫/修改權限的表單欄位" meta:resourcekey="lblNoFieldsAvalibleResource1" Visible="false"></asp:Label>
    <asp:HiddenField ID="hfFormVersionId" runat="server" />
    <asp:HiddenField ID="hfSiteId" runat="server" />
    <asp:HiddenField ID="hfParentSiteid" runat="server" />
</asp:Content>
