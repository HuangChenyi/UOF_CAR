<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Config_EditLogo" Codebehind="EditLogo.aspx.cs" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register src="~/Common/ImageEditor/UC_ImageEditor.ascx" tagname="UC_ImageEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <script type="text/javascript">
                Sys.Application.add_load(function () {
                    var editor = $find("<%=UC_ImageEditor1.ClientID  %>");
                    editor.SetCropSize(145, 47);
                });

                
                function SaveImage(isCut) {
                    var editor = $find("<%=UC_ImageEditor1.ClientID  %>");
                    if (isCut === "true")
                        editor.saveimage();
                    else
                        editor.saveorginalimage();
                    if (Page_IsValid) {
                        setTimeout(function () {
                            $uof.dialog.set_returnValue($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(UC_ImageEditor1.CutImgFileGroupID,true)%>'));
                            $uof.dialog.close();
                        }, 700);
                    }
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
    
        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請上傳圖檔" Display="Dynamic" ClientValidationFunction="ClientValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
     <table style="width: 100%;">
        <tr > <td >
    <uc1:UC_ImageEditor ID="UC_ImageEditor1" runat="server" Width="450" Height="280" ModuleName="EIP" />
         
      </td></tr>  </table>
    <asp:Label ID="lblUpload" runat="server" Text="原圖上傳" Visible="False" meta:resourcekey="lblUploadResource1"></asp:Label>
</asp:Content>

