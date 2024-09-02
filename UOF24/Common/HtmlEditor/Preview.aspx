<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="Preview.aspx.cs" Inherits="Ede.Uof.Web.Common.HtmlEditor.Preview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        body {
                background-image:url('../../App_Themes/DefaultTheme/images/po_04.gif') !important;  
            }
  div.JustAddBorder table tr td {
    border-width:1px;
    border-style:solid;
} 

      </style>
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var content = window.sessionStorage["viewdata"];
            $('#<%=lblPreivewContent.ClientID %>').html(content);
         //   $("a").removeAttr('href');
            $("a").attr("target", "_blank");
        });
        
    </script>

    <div class="editorcontentstyle JustAddBorder">
         <asp:Label ID="lblPreivewContent" runat="server" ></asp:Label>
    </div>
</asp:Content>
