<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeFile="Dialog.aspx.cs" Inherits="CDS_WebPage_Dialog" %>

<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script>
        function Button2OnClick() {
            alert($('#<%= txtButton2.ClientID %>').val());

    }
</script>

    <table class="PopTable" >
        <tr>
            <td class="PopTableLeftTD" >
                <asp:Label ID="Label1" runat="server" Text="從主頁面傳來的參數"></asp:Label>
            </td>
            <td class="PopTableRightTD" colspan=2>
                <asp:Label ID="lblParam" runat="server" Text=""></asp:Label>
            </td>            
        </tr>
        <tr>
            <td class="PopTableLeftTD" >
                <asp:Label ID="Label2" runat="server" Text="Button1的名稱"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtButton1" runat="server"></asp:TextBox>
            </td>            
            <td class="PopTableRightTD" rowspan=6>
                <asp:Button ID="btn" runat="server" Text="設定Button" onclick="btn_Click" />
            </td>
        </tr>       
        <tr>
            <td class="PopTableLeftTD"  >
                <asp:Label ID="Label3" runat="server" Text="Button2的名稱"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtButton2" runat="server"></asp:TextBox>
            </td>            
        </tr> 
        <tr>
            <td class="PopTableLeftTD"  >
                <asp:Label ID="Label4" runat="server" Text="Button3的名稱"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtButton3" runat="server"></asp:TextBox>
            </td>            
        </tr> 
        <tr>
            <td class="PopTableLeftTD"  >
                <asp:Label ID="Label5" runat="server" Text="Button4的名稱"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtButton4" runat="server"></asp:TextBox>
            </td>            
        </tr> 
        <tr>
            <td class="PopTableLeftTD"  >
                <asp:Label ID="Label6" runat="server" Text="Button5的名稱"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtButton5" runat="server"></asp:TextBox>
            </td>            
        </tr>     
        <tr>
            <td class="PopTableLeftTD"  >
                <asp:Label ID="Label7" runat="server" Text="Button6的名稱"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtButton6" runat="server"></asp:TextBox>
            </td>            
        </tr>      
        <tr>
            <td class="PopTableLeftTD"  >
                <asp:Label ID="Label8" runat="server" Text="設定回傳的參數"></asp:Label>
            </td>
            <td class="PopTableRightTD" colspan=2>
                <asp:TextBox ID="txtReturnValue" runat="server"></asp:TextBox>
            
            </td>            
        </tr>                          
    </table>

 
</asp:Content>

