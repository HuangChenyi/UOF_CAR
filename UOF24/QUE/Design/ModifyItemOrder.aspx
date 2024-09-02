<%@ Page Language="C#" Title="修改題目順序" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ModifyItemOrder" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="ModifyItemOrder.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" id="igClientScript">

        function ibtnTop_OnClick() {
            var tree = $find('<%= this.treeItem.ClientID %>');
    }

    function treeItem_OnClientNodeDropping(sender, args) {

    }

    </script>

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="lblNoData" runat="server" Text="沒有題目可進行排序。" ForeColor="Red" Visible="False" meta:resourcekey="lblNoDataResource1"></asp:Label>
                <table>
                    <tr style="height:5px"></tr>
                    <tr>
                        <td style="width:20px;height:30px"></td>
                        <td >
                            <asp:ImageButton ID="ibtnTop" runat="server" ImageUrl="~/Common/Images/Icon/icon22_03.png" 
                                OnClientClick="ibtnTop_OnClick()" OnClick="ibtnTop_Click" meta:resourcekey="ibtnTopResource1" />
                        </td>
                        <td style="width:20px;height:30px"></td>
                        <td >
                            <asp:ImageButton ID="ibtnUp" runat="server" ImageUrl="~/Common/Images/Icon/icon22_04.png"
                                OnClick="ibtnUp_Click" meta:resourcekey="ibtnUpResource1" />
                        </td>
                        <td style="width:20px;height:30px"></td>
                        <td >
                            <asp:ImageButton ID="ibtnDown" runat="server" ImageUrl="~/Common/Images/Icon/icon22_05.png"
                                OnClick="ibtnDown_Click" meta:resourcekey="ibtnDownResource1" />
                        </td>
                        <td style="width:20px;height:30px"></td>
                        <td >
                            <asp:ImageButton ID="ibtnButtom" runat="server" ImageUrl="~/Common/Images/Icon/icon22_06.png"
                                OnClick="ibtnButtom_Click" meta:resourcekey="ibtnButtomResource1" />
                        </td>
                    </tr>
                    <tr style="height:5px"></tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <contenttemplate>
                        <telerik:RadTreeView ID="treeItem" Runat="server" EnableDragAndDrop="True"  EnableNodeTextHtmlEncoding="true"
                            OnNodeDrop="treeItem_NodeDrop" OnClientNodeDropping="treeItem_OnClientNodeDropping" meta:resourcekey="treeItemResource2"></telerik:RadTreeView>
                    </contenttemplate>
                    <triggers>
                        <asp:AsyncPostBackTrigger ControlID="ibtnButtom" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ibtnDown" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ibtnTop" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ibtnUp" EventName="Click" />
                    </triggers>
                </asp:UpdatePanel>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>
