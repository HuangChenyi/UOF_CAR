<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="LogoSetting.aspx.cs" Inherits="Ede.Uof.Web.Sys.Organization.Department.LogoSetting" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>
<%@ Register Src="~/Common/Organization/DepartmentTree.ascx" TagPrefix="uc1" TagName="DepartmentTree" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script>
    function OnClientClicking(sender, args) {
            var fid = $("#<%=hideFileGroupID.ClientID %>").val();
            $uof.dialog.open2("~/System/Config/EditLogo.aspx", sender,
          "", 500, 400, OpenDialogResult, { 'filegroupid': fid });
        }
        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined")
                return false;
            else
                return true;
        }

        function bigPictureDelete(sender, args) {
            if (confirm("<%=lbConfirmDelete.Text%>")) {
                args.set_cancel(false);
            }
            else {
                args.set_cancel(true);
            }
        }
        function Setting_chbParentSetting_Click() {
        var toolbarbutton = $find("<%=settingToolBar.ClientID%>").findItemByValue("useParent");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentSetting"));
        if (settingCheckBox.checked) {
            if (!confirm('<%=lbConfirmCheckBox.Text%>'))
                    settingCheckBox.checked = false;
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:DepartmentTree runat="server" ID="DepartmentTree" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="settingToolBar" runat="server" Width="100%" meta:resourcekey="settingToolBarResource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="useParent" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="chbParentSetting" runat="server" Text="使用上一部門設定" AutoPostBack="True" Enabled="False"
                                OnCheckedChanged="chbParentSetting_CheckedChanged" onClick="Setting_chbParentSetting_Click()" meta:resourcekey="chbParentSettingResource1" />
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table>
                <tr>
                    <td>       
                        <asp:Image ID="imgLogo" runat="server" Height="47px" Width="145px" Visible="False" meta:resourcekey="imgLogoResource1"/>
                        <br />
                        <telerik:RadButton ID="btnEdit" runat="server" Text="編輯" OnClientClicking="OnClientClicking" OnClick="btnEdit_Click" meta:resourcekey="btnEditResource1"></telerik:RadButton>
                        <telerik:RadButton ID="btnDelete" runat="server" Text="刪除" OnClientClicking="bigPictureDelete" OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource1"></telerik:RadButton>
                        <br />
                        <asp:Label ID="lbllogoSizeRemind" runat="server" Text="最適圖片大小： 145(w)*47(h)" meta:resourcekey="lbllogoSizeRemindResource1" ForeColor="Blue"></asp:Label>                             
                        <asp:HiddenField ID="hideFileGroupID" runat="server" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lbConfirmCheckBox" runat="server" 
    Text="確定要使用上一部門設定?     \r\n注意:確認後會刪除此部門所有的自訂資料!!" Visible="False" meta:resourcekey="lbConfirmCheckBoxResource1"></asp:Label>
</asp:Content>

