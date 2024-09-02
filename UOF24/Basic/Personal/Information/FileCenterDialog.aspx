<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_Information_FileCenterDialog" Title="新增電子簽章" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="FileCenterDialog.aspx.cs" %>
<%@ Register src="~/Common/ImageEditor/UC_ImageEditor.ascx" tagname="UC_ImageEditor" tagprefix="uc1" %>


<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript">


         function SaveImage(isCut) {
             var editor = $find("<%=UC_ImageEditor1.ClientID  %>");
             if(isCut === "true")
                 editor.saveimage();
             else
                 editor.saveorginalimage();

             if (Page_IsValid) {
                 setTimeout(function() {
                     $uof.dialog.set_returnValue("<%=UC_ImageEditor1.CutImgFileGroupID  %>");
                     $uof.dialog.close();
                 }, 700); 
             }
             else
                 $uof.dialog.set_returnValue("");
            
             return false;
         }

         function ClientValidate(source, arguments) {
             var editor = $find("<%=UC_ImageEditor1.ClientID  %>");
             var isupload = editor.CheckUpload();
             if (isupload === "true") {
                 arguments.IsValid = true;                 
             } else {
                 arguments.IsValid = false;
             }
         }
    </script>
    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請上傳電子簽章" Display="Dynamic"  ClientValidationFunction="ClientValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <table>
    <tr><td ></td><td>        
        <%--<uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />--%>
         <uc1:UC_ImageEditor ID="UC_ImageEditor1" runat="server" Width="640" Height="480"  />
        </td></tr>
    
    </table>
    <asp:Label ID="lblUpload" runat="server" Text="原圖上傳" Visible="false" meta:resourcekey="lblUploadResource1"></asp:Label>
</asp:Content>
