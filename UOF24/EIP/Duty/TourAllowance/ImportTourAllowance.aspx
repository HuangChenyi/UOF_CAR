<%@ Page Title="匯入旅遊補助資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_TourAllowance_ImportTourAllowance" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ImportTourAllowance.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function CopyFiled() {
            //Add code to handle your event here.

            clipboardData.setData("Text", $('#<%= txtMsg.ClientID %>').val());

        }
    </script>
    <asp:CustomValidator ID="cvError" runat="server" Display="None" ForeColor="Red" 
        meta:resourcekey="cvErrorResource1"></asp:CustomValidator>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        meta:resourcekey="ValidationSummary1Resource1" />
    <table cellpadding="0" cellspacing="1" class="PopTable">
        <tr>
            <td style="width: 80px" class="PopTableLeftTD">
                <asp:Label ID="Label1" runat="server" Text="匯入年度" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:DropDownList ID="ddlYear" runat="server" meta:resourcekey="ddlYearResource1">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td>                
                <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Excel" AllowedMultipleFileSelection="false" />
                <asp:HyperLink ID="hyLink" runat="server" NavigateUrl="~/Eip/Duty/TourAllowance/TourAllowanceSample.xls"
                    Text="下載Excel範例" meta:resourcekey="hyLinkResource1"></asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblClick" runat="server" Text="*點擊這裡可複製錯誤訊息" CssClass="SizeMemo"
                    Visible="False" meta:resourcekey="lblClickResource1"></asp:Label>
                <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Width="100%" Height="150px"
                    Visible="False" meta:resourcekey="txtMsgResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblFormatError" runat="server" Text="匯入格式錯誤" Visible="False" 
        meta:resourcekey="lblFormatErrorResource1" ></asp:Label>
    <asp:Label ID="lblNoFile" runat="server" Text="請匯入檔案" Visible="False" 
        meta:resourcekey="lblNoFileResource1" ></asp:Label>
    <asp:Label ID="lblDomainError" runat="server" Text="網域名稱不存在" Visible="False" 
        meta:resourcekey="lblDomainErrorResource1" ></asp:Label>
    <asp:Label ID="lblRow" runat="server" Text="第{0}資料" Visible="False" 
        meta:resourcekey="lblRowResource1" ></asp:Label>
    <asp:Label ID="lblAccountNotExist" runat="server" Text="帳號不存在" Visible="False" 
        meta:resourcekey="lblAccountNotExistResource1"></asp:Label>
    <asp:Label ID="lblNotArraveDate" runat="server" Text="沒有設定員工到職日" 
        Visible="False" meta:resourcekey="lblNotArraveDateResource1"></asp:Label>  
    <asp:Label ID="lblYearthNotInt" runat="server" Text="年資不為整數" Visible="False" 
        meta:resourcekey="lblYearthNotIntResource1" ></asp:Label>
    <asp:Label ID="lblCompanyNotInt" runat="server" Text="公司補助金額不為整數" 
        Visible="False" meta:resourcekey="lblCompanyNotIntResource1" ></asp:Label>
    <asp:Label ID="lblCommitteeNotInt" runat="server" Text="福委補助金額不為整數" 
        Visible="False" meta:resourcekey="lblCommitteeNotIntResource1" ></asp:Label>
    <asp:Label ID="lblConpanyInRange" runat="server" Text="公司補助金額必須在0~99999之間" 
        Visible="False" meta:resourcekey="lblConpanyInRangeResource1" ></asp:Label>
    <asp:Label ID="lblCommitteeInRange" runat="server" Text="福委補助金額必須在0~99999之間" 
        Visible="False" meta:resourcekey="lblCommitteeInRangeResource1" ></asp:Label>
    <asp:Label ID="lblTotalInRange" runat="server" Text="總補助金額必須在0~999999之間" 
        Visible="False" meta:resourcekey="lblTotalInRangeResource1" ></asp:Label>
    <asp:Label ID="lblUsed" runat="server" Text="該年度旅遊補助已使用" Visible="False" 
        meta:resourcekey="lblUsedResource1" ></asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server"  Text="匯入的檔案無法解析" 
        Visible="False" meta:resourcekey="lblFileNotParseResource1"></asp:Label>

    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

