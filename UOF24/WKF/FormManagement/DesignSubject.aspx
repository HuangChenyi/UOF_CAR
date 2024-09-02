<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_DesignSubject" Title="設定顯示標題" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="DesignSubject.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="DesignSubjectjs" type="text/javascript">
        function OnBarMainClick(sender, args) {
            if (args.get_item().get_value() == "DeleteField") {
                if (confirm('<%=lbl_ConfirmDelete.Text %>') == false)
                    oEvent.needPostBack = false;
            }
        }
    </script>
    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="PopTableRightTD">
                        <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                            OnButtonClick="webToolBar_ButtonClick" Width="100%">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="DisplayTitle">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="目前設定顯示標題：" meta:resourcekey="TBLabelResource1"></asp:Label>
                                        <asp:Label ID="lbl_DisplayField" runat="server" meta:resourcekey="lbl_DisplayFieldResource1"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="tbbTitle">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtTitle" runat="server" Width="400px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:RegularExpressionValidator ID="lengthValidator" runat="server" Display="Dynamic" ValidationExpression=".{0,200}" 
                                                        ErrorMessage="顯示標題字元上限不可超過200" ControlToValidate="txtTitle" meta:resourcekey="lengthValidatorResource1"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </table>

                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%; padding-left: 5px">
                        <asp:Label ID="lblMemo" runat="server" Text="註：顯示標題會依當時表單資訊替換掉欄位變數。" CssClass="SizeMemo" meta:resourcekey="lblMemoResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="PopTableRightTD">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 100%">
                                    <telerik:RadTreeView ID="treeFiledList" runat="server" OnNodeClick="treeFiledList_NodeClick"></telerik:RadTreeView>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lbl_NotSet" runat="server" Text="未設定" Visible="False" meta:resourcekey="lbl_NotSetResource1"></asp:Label>
    <asp:Label ID="lbl_ConfirmDelete" runat="server" Text="確定取消標題設定嗎？" Visible="False"
        meta:resourcekey="lbl_ConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lbl_SetFinish" runat="server" Text="設定已儲存！" Visible="False" meta:resourcekey="lbl_SetFinishResource1"></asp:Label>
    <asp:Label ID="lbl_NotSelNode" runat="server" Text="請選擇顯示欄位！" Visible="False" meta:resourcekey="lbl_NotSelNodeResource1"></asp:Label>
</asp:Content>
