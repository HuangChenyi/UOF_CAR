<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UClientUnitDialog.aspx.cs" MasterPageFile="~/Master/DialogMasterPage.master" Inherits="Ede.Uof.Web.Edoc.Management.UClientUnitDialog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden {
            display: none;
        }

        .cssCenter {
            text-align: center !important;
        }
    </style>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
    <script type="text/javascript">
        function OnBlur(sender, args) {
            var rblLength = $find("<%=rtbOrgId.ClientID%>").get_value();
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "OrgIdClick", "Value": rblLength }));
        }

        function ConfirmDelete() {
            var hfOrgId = $('#<%=hfOrgId.ClientID%>').val();
            var data = [hfOrgId];

            //呼叫後端method確認是否可刪除機關
            var checkDelete = $uof.pageMethod.sync("CheckDeleteOrg", data);
            if (checkDelete === 'true') {

                //未使用過可以刪除
                if (confirm('<%=lblDelete.Text%>')) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                //使用過不可刪除
                document.getElementById('delError').style.display = "inherit";
                return false;
            }
           
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td style=" white-space:nowrap;">
                        <asp:Label runat="server" ID="lblNeedOrgId" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label runat="server" ID="Label1" Text="機關代碼"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblOrgId" Text=""></asp:Label>
                        <telerik:RadTextBox ID="rtbOrgId" runat="server" MaxLength="50" Width="250" ClientEvents-OnBlur="OnBlur"></telerik:RadTextBox>
                        <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic"></asp:CustomValidator>
                        <br />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"></asp:CustomValidator>

                    </td>
                </tr>
                <tr>
                    <td style=" white-space:nowrap;">
                        <asp:Label runat="server" ID="Label2" Text="機關名稱"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblOrgName" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style=" white-space:nowrap;">
                        <asp:Label runat="server" ID="Label3" Text="收發模式"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="rbWebjAgent" runat="server" Checked="true" GroupName="blockType" Text="從WebjAgent手動收發公文" /><br />
                        <asp:RadioButton ID="rbAuto" runat="server" Checked="false" GroupName="blockType" Text="使用串接系統自動收發公文" /><br />
                        <asp:RadioButton ID="rbMail" runat="server" Checked="false" GroupName="blockType" Text="郵寄" />
                    </td>
                </tr>
                <tr>
                    <td style=" white-space:nowrap;">
                        <asp:Label runat="server" ID="Label4" Text="狀態"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkStatus" Checked="true" runat="server" Text="啟用" />
                    </td>
                </tr>

            </table>
            <div id="delError" style="display:none">
                <asp:Label ID="lblHasUsed" runat="server" Text="此機關已申請過發文，不可刪除" ForeColor="Red" ></asp:Label>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:HiddenField runat="server" ID="hfOrgId" />

    <asp:Label ID="lblNeedEnter" runat="server" Text="必填" CssClass="cssHidden"></asp:Label>

    <asp:Label ID="lblOrgExist" runat="server" Text="此發文機關已存在，無法新增" CssClass="cssHidden"></asp:Label>

    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" CssClass="cssHidden"></asp:Label>

    

    <asp:Label ID="lblOgrNull" runat="server" Text="通訊錄中無此機關，請修改內容或更新通訊錄" CssClass="cssHidden"></asp:Label>

    <asp:Label ID="lblIsSpecialChar" runat="server" Text="不可輸入特殊符號" CssClass="cssHidden"></asp:Label>

</asp:Content>
