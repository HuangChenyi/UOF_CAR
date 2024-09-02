<%@ Page Title="匯入結算類別" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ImportSETT.aspx.cs" Inherits="EIP_Duty_Settlement_Stage_ImportSETT" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" class="PopTable">
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblImportLocation" runat="server" Text="匯入結算類別" meta:resourcekey="lblImportLocationResource1"></asp:Label>
            </td>        
            <td>
                <uc1:UC_FileCenter runat="server" id="UC_FileCenter" allowedfiletype="Excel" allowedmultiplefileselection="false" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EIP/Duty/Settlement/Stage/Import_DutySett_Sample.xls" Text="下載Excel範例" Target="_blank" meta:resourcekey="btnDownloadResource1"></asp:HyperLink>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txtMsg" runat="server" ReadOnly="True" Rows="15" TextMode="MultiLine" Visible="False" Width="100%" meta:resourcekey="txtMsgResource1"></asp:TextBox>

    <asp:Label ID="lblFormatErrorMsg" runat="server" Text="格式不正確" Visible="False" meta:resourcekey="lblFormatErrorMsgResource1" ></asp:Label>
    <asp:Label ID="lblNotAllowNull" runat="server" Text="欄位不得為空" Visible="False" meta:resourcekey="lblNotAllowNullResource1"></asp:Label>
    <asp:Label ID="lblError" runat="server" Text="匯入發生錯誤" Visible="False" meta:resourcekey="lblErrorResource1"></asp:Label>
    <asp:Label ID="lblImportFail" runat="server" Text="請檢查檔案是否為Excel 97-2003 活頁簿(*.xls)格式" Visible="False" meta:resourcekey="lblImportFailResource1" ></asp:Label>
    <asp:Label ID="lblSuccessMsg" runat="server" Text="新增\更新成功" Visible="False" meta:resourcekey="lblSuccessMsgResource1"></asp:Label>   
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>        
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
