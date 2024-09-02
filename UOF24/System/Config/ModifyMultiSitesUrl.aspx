<%@ Page Title="新增/修改多Site網址資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Config_ModifyMultiSitesUrl" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ModifyMultiSitesUrl.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript"></script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable"  style="width:100%" >
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label2Resource1"></asp:Label>
                        <asp:Label ID="lblMenuText" runat="server" Text="顯示名稱" meta:resourcekey="lblMenuTextResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMenuText" runat="server" Columns="50" MaxLength="50" meta:resourcekey="txtMenuTextResource1"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblMenuTxtError" runat="server" Text="此為必要欄位" class="SizeSB" ForeColor="Red" Visible="False" meta:resourcekey="lblMenuTxtErrorResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="lblResource" runat="server" Text="顯示多國語言文字" meta:resourcekey="lblResourceResource1"></asp:Label></td>
                    <td>
                        <table id="tbResourceMenu" runat="server"></table>
                    </td>
                </tr>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                        <asp:Label ID="lblLinkUrl" runat="server" Text="連結網頁" meta:resourcekey="lblLinkUrlResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLinkUrl" runat="server" Columns="50" meta:resourcekey="txtLinkUrlResource1"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblUrlError" runat="server" Text="此為必要欄位" class="SizeSB" ForeColor="Red" Visible="False" meta:resourcekey="lblUrlErrorResource1"></asp:Label>
                        <asp:Label runat="server" ID="lblLinkUrlDesc"  CssClass="SizeMemo" Text="請輸入其他UOF網站位置" meta:resourcekey="lblLinkUrlDescResource1"></asp:Label>
                        <br />
                        <asp:Label runat="server" ID="lblLinkUrlSample" CssClass="SizeMemo" Text="範例: http://www.edetw.com/UOF" meta:resourcekey="lblLinkUrlSampleResource1"></asp:Label>
                    </td>
                </tr>

                <tr style="display: none">
                    <td>
                        <asp:Label ID="lblNewWindow" runat="server" Text="開新視窗" meta:resourcekey="lblNewWindowResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbNewWindow" runat="server" meta:resourcekey="cbNewWindowResource1" />
                    </td>
                </tr>
                <tr style="display: none">
                    <td>
                        <font color="red"></font>
                        <asp:Label ID="lblUserSet" runat="server" Text="選取人員" meta:resourcekey="lblUserSetResource1"></asp:Label>
                    </td>
                    <td style="vertical-align:top"">
                        <uc3:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" />
                    </td>
                </tr>

            </table>
            <asp:HiddenField ID="hidE" runat="server" />
            <asp:HiddenField ID="hidT" runat="server" />
            <asp:HiddenField ID="hidS" runat="server" />
            <asp:HiddenField ID="hidJ" runat="server" />
            <asp:HiddenField ID="hidV" runat="server" />
            <asp:HiddenField ID="hfJsonValue" runat="server" />
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

