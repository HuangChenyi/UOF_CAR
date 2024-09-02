<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_AddressBook_ImportOutlook" Title="未命名頁面" Codebehind="ImportOutlook.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" />
    <br />
    <table  class ="PopTable" cellspacing="1"  width="100%">
            <tr>
               <td align="center" style="width:100%">
                <asp:TextBox ID="TextBox1" runat="server" Height="120px" ReadOnly="True" Width="100%" TextMode="MultiLine" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                </td>
            </tr>
        <tr>
        <td style="width:100px" align="left">
            <asp:Label ID="lblUploadMessage" runat="server" Text="選擇上傳CSV檔案" Width="180px" meta:resourcekey="lblUploadMessageResource1"></asp:Label>
        </td>
        </tr>
          <tr>
            <td style="width: 100%; height: 72px">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="100%" 
                    AutoPostBack="false">
                    <asp:ListItem Value="Express" meta:resourcekey="ListItemResource1">匯入 OutlookExpress 檔案</asp:ListItem>
                    <asp:ListItem Value="Outlook" meta:resourcekey="ListItemResource2">匯入 Outlook 2007 檔案</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
            <td align="left">                
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
           </td>
    <tr>
        <td style="width: 100px" align="left">
        <asp:HyperLink ID="hlDown1" runat="server" NavigateUrl="~/Basic/Personal/AddressBook/SampleFile.csv" Text="下載 OutlookExpress 範例檔案" Target="_blank" ForeColor="BlueViolet" Width="210px" meta:resourcekey="btnDownloadResource1"></asp:HyperLink> 
        <asp:HyperLink ID="hlDown2" runat="server" NavigateUrl="~/Basic/Personal/AddressBook/Outlook_Sample_File.CSV" Text="下載 Outlook 2007 範例檔案" Target="_blank" ForeColor="BlueViolet" Width="200px" meta:resourcekey="btnDownloadResource2"></asp:HyperLink> 
        </td>
    </tr>  
   </table>
<asp:HiddenField ID="hdFileName" runat="server" />   
<asp:CustomValidator ID="cvsMessage" runat="server" BackColor="Red" Display="None" ForeColor="White" Visible="false" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>  
<asp:Label ID="lbPersonId" runat="server" Visible="False" meta:resourcekey="lbPersonIdResource1"></asp:Label>
<asp:Label ID="lbClassGuid" runat="server" Visible="False" meta:resourcekey="lbClassGuidResource1"></asp:Label>
<asp:Label ID="lblFile" runat="server" Text="請選擇檔案進行匯入" Visible="false" meta:resourcekey="lblFileResource1"></asp:Label>    
<asp:Label ID="lblcsv" runat="server" Text="請選擇一個正確的CSV檔案" Visible="false" meta:resourcekey="lblCsvResource1"></asp:Label>   
<asp:Label ID="lblFileColumnsError" runat="server" Text="匯入的檔案欄位不符合" Visible="false"></asp:Label>
<asp:Label ID="lblSuccess" runat="server" Text="匯入成功!如需再匯入聯絡人資料，請再重新選擇" Visible ="false" ></asp:Label>
<asp:Label ID="lblError" runat="server" Text="請修改CSV檔案" Visible="false" Font-Bold =true ></asp:Label>
<asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>        
<asp:HiddenField ID="hdName" runat="server" Value="姓名"/>
<asp:HiddenField ID="hdMessage" runat="server" Value="已存在，重複的資料不再匯入" />
</asp:Content>


