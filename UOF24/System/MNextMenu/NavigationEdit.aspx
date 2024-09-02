<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="NavigationEdit.aspx.cs" Inherits="System_MNextMenu_NavigationEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function cvCheckFileCenter(source, args) {           
            var file = $find('<%=UC_FileCenter.ClientID%>'); 
           
            if (file.get_count() == 0 ) {
                args.IsValid = false;
                return;
            }
        }                
    </script>
 <table border="0" class="PopTable" style="width: 100%">
        <tr>
            <td white-space: nowrap ;text-align:right" class="PopTableLeftTD">
                  <asp:Label ID="lblmark1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblmark1Resource1" />
                <asp:Label ID="lblName" runat="server" Text="名稱" meta:resourcekey="lblNameResource1" />
            </td>
            <td>
                <asp:TextBox ID="txtname" runat="server" MaxLength="50" meta:resourcekey="txtnameResource1"/>
                <asp:RequiredFieldValidator ID="rfValidator" ControlToValidate="txtname" Display="Dynamic" runat="server" ErrorMessage="請輸入名稱" meta:resourcekey="rfValidatorResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td white-space: nowrap ;text-align:right" class="PopTableLeftTD">
                <asp:Label ID="lblmark2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblmark2Resource1" />
                <asp:Label ID="lblInfo" runat="server" Text="內容" meta:resourcekey="lblInfoResource1"/>
            </td>
            <td colspan="3">
                <table>
                    <tr>
                        <td>
                            <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Image" AllowedMultipleFileSelection="false" />
                            <asp:CustomValidator ID="cvFileCenter" runat="server" Display="Dynamic" ErrorMessage="請上傳照片" ClientValidationFunction="cvCheckFileCenter" meta:resourcekey="cvFileCenterResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblmsg" runat="server" Text="【使用限制】" ForeColor="Blue" meta:resourcekey="lblmsgResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblmsg1" runat="server" Text="1.支援文件格式：jpg、png、bmp、gif。" ForeColor="Blue" meta:resourcekey="lblmsg1Resource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblmsg2" runat="server" Text="2.建議圖片大小：828(w)*1792(h)。" ForeColor="Blue" meta:resourcekey="lblmsg2Resource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblmsg3" runat="server" Text="3.只能上傳一個檔案。" ForeColor="Blue" meta:resourcekey="lblmsg3Resource1"></asp:Label>
                        </td>
                    </tr>
                </table>                  
             </td>
         </tr>    
  </table>
    <asp:HiddenField ID="hfnavigationGuid" runat="server" />
    <asp:HiddenField ID="hfnavigationName" runat="server" />
    <asp:HiddenField ID="hfnavigationfileId" runat="server" />
</asp:Content>
