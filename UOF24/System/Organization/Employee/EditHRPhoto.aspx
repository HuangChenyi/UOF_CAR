<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EditHRPhoto.aspx.cs" Inherits="System_Organization_Employee_EditHRPhoto" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register src="~/Common/ImageEditor/UC_ImageEditor.ascx" tagname="UC_ImageEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var editor = $find("<%=UC_ImageEditor1.ClientID  %>");
            editor.SetCropSize(100, 129);
        });

        function SaveImage(sender, args) {

            var editor = $find("<%=UC_ImageEditor1.ClientID  %>");
            editor.saveimage();
            if (Page_IsValid) {
                $uof.dialog.set_returnValue("<%=UC_ImageEditor1.CutImgFileGroupID  %>");
                $uof.dialog.close();
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
        <tr>
            <td>
                <uc1:UC_ImageEditor ID="UC_ImageEditor1" runat="server" Width="455" Height="390" ModuleName="PERSONAL" />
            </td>
        </tr>
    </table>
</asp:Content>
