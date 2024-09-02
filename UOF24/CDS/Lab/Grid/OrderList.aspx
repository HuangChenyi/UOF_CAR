<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="CDS_Lab_Grid_OrderList" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="Label1" runat="server" Text="關鍵字:"></asp:Label>
    <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>
    <asp:Button ID="btnQuery" runat="server" Text="查詢" OnClick="btnQuery_Click" />

    <Ede:Grid ID="Grid1" runat="server"  
        AutoGenerateColumns="false"  OnRowDataBound="Grid1_RowDataBound"
        AutoGenerateCheckBoxColumn="false"  >
        <Columns>
            <asp:TemplateField HeaderText="訂單編碼">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnOrderId" runat="server"
                        
                        Text='<%#Bind("OrderID") %>'
                        ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="訂單日期" DataField="OrderDate" />
            <asp:BoundField HeaderText="客戶代號" DataField="CustomerID" />
        </Columns>
    </Ede:Grid>

</asp:Content>

