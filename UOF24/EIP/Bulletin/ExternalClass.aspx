<%@ Page Title="外部類別" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_ExternalClass" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ExternalClass.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRadPane" runat="server" Height="25px" Scrolling="None">
                    <table>
                        <tr>
                            <td style="width: 5px;"></td>
                            <td>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/images/icon/icon_m47.png" />
                                <asp:Label ID="Label1" runat="server" Text="有發佈權限" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td style="width: 10px;"></td>
                            <td>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/images/icon/icon_m47a.png" />
                                <asp:Label ID="Label2" runat="server" Text="沒有發佈權限" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </telerik:RadPane>
                <telerik:RadPane ID="TreeRadPane" runat="server" Scrolling="None">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請選擇一公告類別" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <telerik:RadTreeView ID="classTree" runat="server" Width="100%" Height="100%">
                        <Nodes>
                            <telerik:RadTreeNode runat="server" Text="Root RadTreeNode1" Value="outerclass" Enabled="false">
                            </telerik:RadTreeNode>
                        </Nodes>
                    </telerik:RadTreeView>
                    <asp:Label ID="msgOuterclass" runat="server" Text="外部公告" Visible="False" meta:resourcekey="msgOuterclassResource1"></asp:Label>
                    <asp:Label ID="lblNoAuthority" runat="server" Text="選擇的外部類別沒有發佈權限，請選擇其他外部類別" Visible="False" meta:resourcekey="lblNoAuthorityResource1"></asp:Label>
                </telerik:RadPane>
            </telerik:RadSplitter>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfApplicant" runat="server" Value="" />
</asp:Content>

