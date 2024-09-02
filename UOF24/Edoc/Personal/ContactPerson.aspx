<%@ Page Title="常用聯絡人設定" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="ContactPerson.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Personal.ContactPerson" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
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

    <script type="text/javascript">

        function OnContactClicking(sender, args) {
            if (args.get_item().get_value() == "Create") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Edoc/Personal/ContactPersonDialog.aspx", args.get_item(), '<%=lblCreateContact.Text%>', 600, 400, openDialogResult, {"TYPE":"Add"});
            }
        }

        function ConfirmDelete() {
            if (confirm('<%=lblDelete.Text%>')) {
                return true;
            }
            else {
                return false;
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="rtbContactPerson" runat="server" Width="100%" OnClientButtonClicking="OnContactClicking" OnButtonClick="ContactPerson_ButtonClick">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="Create" Text="新增" meta:resourcekey="CreateContactResource1"
                        ImageUrl="~/Common/Images/Icon/icon_m71.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m71.png">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Default" Text="取消預設" meta:resourcekey="DefaultContactResource1"
                        ImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03_g.gif">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Cancel">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCancel" Text="已取消" Visible="false" ForeColor="Blue"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <Ede:Grid ID="grdContact" runat="server" Width="100%" EmptyDataText="沒有資料"
                DataKeyNames="CONTACT_GUID" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" OnRowDataBound="grdContact_RowDataBound" 
                AllowSorting="true" OnSorting="grdContact_Sorting">
                <Columns>
                    <asp:BoundField  DataField="CONTACT_GUID" HeaderText="聯絡人代碼">
                        <HeaderStyle CssClass="cssHidden"/>
                        <ItemStyle CssClass="cssHidden"/>
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="預設" SortExpression="DEFAULT">
                        <HeaderStyle Wrap="false" Width="4%"/>
                        <ItemStyle Wrap="false" Width="4%" CssClass="cssCenter"/>
                        <ItemTemplate>
                            <asp:Label ID="lblDefault" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="聯絡人" SortExpression="CONTACT_USER">
                        <HeaderStyle Wrap="false" Width="8%"/>
                        <ItemStyle Width="8%"/>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnContactName" runat="server" OnClick="lbtnContactName_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField  DataField="TITLE" HeaderText="職稱" SortExpression="TITLE">
                        <HeaderStyle Wrap="false" Width="8%"/>
                        <ItemStyle Width="8%"/>
                    </asp:BoundField>

                    <asp:BoundField  DataField="PHONE" HeaderText="電話" SortExpression="PHONE">
                        <HeaderStyle Wrap="false" Width="10%"/>
                        <ItemStyle Width="10%"/>
                    </asp:BoundField>

                    <asp:BoundField  DataField="FAX" HeaderText="傳真" SortExpression="FAX">
                        <HeaderStyle Wrap="false" Width="10%"/>
                        <ItemStyle Width="10%"/>
                    </asp:BoundField>

                    <asp:BoundField  DataField="EMAIL" HeaderText="電子信箱" SortExpression="EMAIL">
                        <HeaderStyle Wrap="false" Width="20%"/>
                        <ItemStyle Width="20%"/>
                    </asp:BoundField>

                    <asp:BoundField  DataField="ADDRESS" HeaderText="地址" SortExpression="ADDRESS">
                        <HeaderStyle Wrap="false" Width="20%"/>
                        <ItemStyle Width="20%"/>
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="操作">
                        <HeaderStyle Wrap="false" Width="10%"/>
                        <ItemStyle Wrap="false" Width="10%" HorizontalAlign="Center"/>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDefault" runat="server" OnClick="lbtnDefault_Click" Text="設為預設" CausesValidation="false"></asp:LinkButton>
                            <asp:LinkButton ID="lbtnDelete" runat="server" OnClick="lbtnDelete_Click" OnClientClick="return ConfirmDelete()" Text="刪除" CausesValidation="false"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>     
            <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="false"></asp:Label>
            <asp:Label ID="lblCheck" runat="server" Text="V" Visible="false"></asp:Label>
            <asp:Label ID="lblCreateContact" runat="server" Text="新增聯絡人" Visible="false"></asp:Label>
            <asp:Label ID="lblModifyContact" runat="server" Text="維護聯絡人" Visible="false"></asp:Label>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>
