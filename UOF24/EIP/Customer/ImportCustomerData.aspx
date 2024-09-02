<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_ImportCustomerData" Title="匯入客戶資料" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ImportCustomerData.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" />
   <table  class ="PopTable" style="width:100%; text-align:left; border-spacing:1;">
        <tr>
            <td style="width: 100px; text-align:left;" class="PopTableHeader">
                <asp:Label ID="Label1" runat="server" Text="選擇上傳EXCEL檔案" Width="157px" meta:resourcekey="Label1Resource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 100px; text-align:left;" class="PopTableRightTD">
            <INPUT id="uploadFile" type="file" runat="server" NAME="uploadFile" size="32" visible="false">
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
                <asp:HyperLink ID="lbtnDownUS" runat="server" NavigateUrl="~/EIP/Customer/ImportCustomerSampleData(US).xls"  Text="下載EXCEL範例檔案" Target="_blank" meta:resourcekey="lbtnDownUSResource1"></asp:HyperLink>
                <asp:HyperLink ID="lbtnDownCHT" runat="server" NavigateUrl="~/EIP/Customer/ImportCustomerSampleData(CHT).xls"  Text="下載EXCEL範例檔案" Target="_blank" meta:resourcekey="lbtnDownCHTResource1"></asp:HyperLink>
                <asp:HyperLink ID="lbtnDownCHS" runat="server" NavigateUrl="~/EIP/Customer/ImportCustomerSampleData(CHS).xls"  Text="下載EXCEL範例檔案" Target="_blank" meta:resourcekey="lbtnDownCHSResource1"></asp:HyperLink>
               
            </td>
        </tr>
    </table>
    <asp:Label ID="lblExcel" runat="server" Text="請選擇一個正確的EXCEL文件" Visible="False" meta:resourcekey="lblExcelResource1"></asp:Label>
    <asp:Label ID="lblSelectMsg" runat="server" Text="請選擇上傳的EXCEL檔案" Visible="False" meta:resourcekey="lblSelectMsgResource1"></asp:Label>
    <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None" ForeColor="White" Visible="False" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
    <asp:Label ID="lblErrorMSG" runat="server" Text="匯入失敗： " Visible="False"></asp:Label>
    <asp:Label ID="lblImportFail" runat="server" Text="匯入客戶資料失敗" Visible="False" meta:resourcekey="lblImportFailResource1"></asp:Label>
    <asp:Label ID="lblExcelFormatError" runat="server" Text="匯入的檔案格式錯誤" Visible="False" meta:resourcekey="lblExcelFormatErrorResource1"></asp:Label>
    <asp:Label ID="lblColumnFormatError" runat="server" Text="匯入的檔案欄位不符合" Visible="False" meta:resourcekey="lblColumnFormatErrorResource1"></asp:Label>
    <asp:Label ID="lblDownFail" runat="server" Text="下載EXCEL范例檔案失敗" Visible="False" meta:resourcekey="lblDownFailResource1"></asp:Label>
    <asp:Label ID="lblMsg1" runat="server" Text="有*號欄位為必輸欄位, 不能為空值" Visible="False" meta:resourcekey="lblMsg1Resource1"></asp:Label>
    <asp:Label ID="lblMsg2" runat="server" Text="性別欄位必須輸入F或M" Visible="False" meta:resourcekey="lblMsg2Resource1"></asp:Label>
    <asp:Label ID="lblCustMsg" runat="server" Text="客戶代號為" Visible="False" meta:resourcekey="lblCustMsgResource1"></asp:Label>
    <asp:Label ID="lblCustNameMsg" runat="server" Text="客戶名稱為" Visible="False" meta:resourcekey="lblCustNameMsgResource1"></asp:Label>
    <asp:Label ID="lblAbbreviationMsg" runat="server" Text="客戶簡稱為" Visible="False" meta:resourcekey="lblAbbreviationMsgResource1"></asp:Label>
    <asp:Label ID="lblExist" runat="server" Text="已存在資料庫" Visible="False" meta:resourcekey="lblExistResource1"></asp:Label>
    <asp:Label ID="lblMsg" runat="server" Text="EXCEL資料重複，客戶代號 :" Visible="False" meta:resourcekey="lblMsgResource1"></asp:Label>
    <asp:Label ID="lblImportDataSuccess" runat="server" Text="匯入資料成功" Visible="False" meta:resourcekey="lblImportDataSuccessResource1"></asp:Label>
    <asp:Label ID="lblCustDataMsg" runat="server" Text="客戶資料第{0}筆" Visible="false"  meta:resourcekey="lblCustDataMsgResource1"></asp:Label>
    <asp:Label ID="lblContactDataMsg" runat="server" Text="聯絡人資料第{0}筆"  Visible=False meta:resourcekey="lblContactDataMsgResource1"></asp:Label>
    <asp:Label ID="lblMsg3" runat="server" Text="客戶代號並不存在在客戶資料中" Visible=false meta:resourcekey="lblMsg3Resource1"> </asp:Label>
    <asp:Label ID="lblEmailFormatError" runat="server" Text="Email格式不正確" Visible=false meta:resourcekey="lblEmailFormatErrorResource1"> </asp:Label>
    <asp:Label ID="lblOther" runat="server" Text="其他" Visible=false meta:resourcekey="lblOtherErrorResource1"> </asp:Label>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>
</asp:Content>

