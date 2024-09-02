<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="FileCenterV3.aspx.cs" Inherits="CDS_FileCenter_FileCenterV3" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="CDS" SubFolder="FileCenter" OnClientUploaded="onClientUploaded"  />

    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="FileGroupId"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblFileGroupId" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnEnable" runat="server" Text="SetEnable" OnClick ="btnEnable_Click" />
            </td>
            <td>
                <asp:Label ID="lblEnable" runat="server" Text=""></asp:Label>
            </td>
        </tr>
                <tr>
            <td>
                <asp:Button ID="btnEditable" runat="server" Text="SetEditable" OnClick="btnEditable_Click" />
            </td>
            <td>
                <asp:Label ID="lblEditable" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnFileLinkEnabled" runat="server" Text="SetFileLinkEnabled" OnClick="btnFileLinkEnabled_Click" />
            </td>
            <td>
                <asp:Label ID="lblFileLinkEnabled" runat="server" Text=""></asp:Label>
            </td>
        </tr>
                <tr>
            <td>
                <asp:Button ID="btnAllowMultiFileSelection" runat="server" Text="SetAllowMultiFileSelection" OnClick="btnAllowMultiFileSelection_Click" />
            </td>
            <td>
                <asp:Label ID="lblAllowMultiFileSelection" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Button ID="lbtnLoad" runat="server" Text="LoadFileGroupId" OnClick="lbtnLoad_Click" />
            </td>
            <td>
                <asp:TextBox ID="txtFileGroupId" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td colspan="2" class="PopTableRightTD" style="text-align:left">



                 <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="PopTableRightTD" style="text-align:left">
                <asp:Button ID="btn" runat="server" Text="GetFileGroupIdByClient" OnClientClick="GetGroupId(); return false;" />
            </td>

        </tr>

    </table>

    <script>
        function GetGroupId() {
            var file1 = $find("<%=UC_FileCenter.ClientID%>");
            alert(file1.get_fileGroupId());
            alert(file1.get_editable());
            // file1.set_editable(!file1.get_editable());
            alert(file1.get_count());
        }

        function onClientUploaded(id, name, folder, size, type) {
            alert('File_ID=' + id + '\r\nFileName=' + name + '\r\nFolder=' + folder + '\r\nSize=' + size + '\r\nType=' + type);
        }

    </script>

   
</asp:Content>

