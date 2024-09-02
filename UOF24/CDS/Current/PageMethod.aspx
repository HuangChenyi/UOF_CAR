<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="PageMethod.aspx.cs" Inherits="CDS_Utility_PageMethod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script>
         function CallSync() {
             var data = [
                 "同步",
                 123
             ];


             var a = $uof.pageMethod.sync("UofMethodDemo", data);

             $('#<%=TextBox1.ClientID%>').val(a);

             alert('End');

         }

         function CallASync() {
             var data = [
                 "非同步",
                123];


             $uof.pageMethod.async("UofMethodDemo", data, function (response) {
                 $('#<%=TextBox1.ClientID%>').val(response);
             });

             alert('End');
         }

    </script>

     <table class="PopTable">
        <tr>
            <td>
                <asp:Button ID="btnSync" runat="server" Text="同步" OnClientClick=" CallSync();" />
              
                <asp:Button ID="btnASync" runat="server" Text="非同步" OnClientClick=" CallASync();"  />
            </td>
            
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr> 
</table>
   
</asp:Content>

