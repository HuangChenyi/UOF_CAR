<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CDS_Lab_DBHelper_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField HeaderText="產品ID" DataField="ProductID" ItemStyle-Width="100px"  />
             <asp:BoundField HeaderText="產品名稱" DataField="ProductName" ItemStyle-Width="300px"  />
             <asp:BoundField HeaderText="單價" DataField="UnitPrice" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right"  />
        </Columns>
    </asp:GridView>

</asp:Content>

