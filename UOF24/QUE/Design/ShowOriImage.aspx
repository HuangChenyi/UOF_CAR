<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ShowOriImage" Title="" Codebehind="ShowOriImage.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function RemoveImage() {
            $("#<%=imgBigPicture.ClientID %>").attr('src', '').hide();
        }
    </script>

    <asp:Image ID="imgBigPicture" runat="server" />
    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" Editable="false" AllowedMultipleFileSelection="false" OnClientRemoved="RemoveImage()" />
</asp:Content>
