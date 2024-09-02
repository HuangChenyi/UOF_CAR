<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_CustomMenu_LinkUrl" Title="" Codebehind="LinkUrl.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
<style type="text/css">  
  
    body{overflow: hidden;}
      
</style>
        <iframe id="linkFrame" scrolling="auto"  src="<%=menu.GetCustomMenuUrl(Request.QueryString["menuID"],User.Identity.Name) %>">
        </iframe>

      <script type="text/javascript">
       
          $(function() {
           
              setSize();
          });
          $(window).on("resize",setSize);

          function setSize() {
              var height = $(window).height() - $("#MasterHeader").height();
              $("#linkFrame").height(height);
              var width = $(window).width();
              $("#linkFrame").width(width);
          }

 </script>

</asp:Content>

