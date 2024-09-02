<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ContactPersonDialogDetail.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Personal.ContactPersonDialogDetail" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style type="text/css">
        .cssHidden{
            display: none;
        }

        .cssCenter{
            text-align: center;
        }
    </style>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Ede:Grid ID="grdContact" runat="server" Width="100%" PageSize="15" OnPageIndexChanging="grdContact_PageIndexChanging"
                DataKeyNames="CONTACT_GUID" AutoGenerateCheckBoxColumn="False" AllowPaging="true"
                AutoGenerateColumns="False" EnhancePager="True" EmptyDataText="沒有資料"
                OnRowDataBound="grdContact_RowDataBound" AllowSorting="true" OnSorting="grdContact_Sorting">
                <Columns>
                    <asp:BoundField  DataField="CONTACT_GUID" HeaderText="聯絡人代碼">
                        <HeaderStyle CssClass="cssHidden"/>
                        <ItemStyle CssClass="cssHidden"/>
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="">
                        <HeaderStyle Wrap="false" Width="6%"/>
                        <ItemStyle Wrap="false" CssClass="cssCenter" Width="6%"/>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnContact" runat="server" Text="選擇" OnClick="lbtnContact_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField  DataField="CONTACT_USER" HeaderText="聯絡人" SortExpression="CONTACT_USER">
                        <HeaderStyle Wrap="false" Width="10%"/>
                        <ItemStyle Wrap="false" Width="10%"/>
                    </asp:BoundField>

                    <asp:BoundField  DataField="TITLE" HeaderText="職稱" SortExpression="TITLE">
                        <HeaderStyle Wrap="false" Width="10%"/>
                        <ItemStyle Wrap="false" Width="10%"/>
                    </asp:BoundField>

                    <asp:BoundField  DataField="PHONE" HeaderText="電話" SortExpression="PHONE">
                        <HeaderStyle Wrap="false" Width="12%"/>
                        <ItemStyle Wrap="false" Width="12%"/>
                    </asp:BoundField>

                    <asp:BoundField  DataField="FAX" HeaderText="傳真" SortExpression="FAX">
                        <HeaderStyle Wrap="false" Width="12%"/>
                        <ItemStyle Wrap="false" Width="12%"/>
                    </asp:BoundField>

                    <asp:BoundField  DataField="EMAIL" HeaderText="電子信箱" SortExpression="EMAIL">
                        <HeaderStyle Wrap="false" Width="20%"/>
                        <ItemStyle Wrap="false" Width="20%"/>
                    </asp:BoundField>

                    <asp:BoundField  DataField="ADDRESS" HeaderText="地址" SortExpression="ADDRESS">
                    </asp:BoundField>
                </Columns>
            </Ede:Grid>  
        </ContentTemplate>
    </asp:UpdatePanel>     
    <asp:HiddenField ID="hfUserGuid" runat="server"></asp:HiddenField>
</asp:Content>
