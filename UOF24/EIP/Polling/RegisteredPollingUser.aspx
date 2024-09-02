<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Polling_RegisteredPollingUser" Title="已投票人數" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="RegisteredPollingUser.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <table style="width:100%;">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbItem" runat="server" Text='<%# Eval("議題項目") %>' meta:resourcekey="lbItemResource1"></asp:Label></td>
                                    <td valign="top">
                                        &nbsp;<asp:Label ID="lbLeftAll" runat="server" Text="共" meta:resourcekey="lbLeftAllResource1"></asp:Label>
                                        <asp:Label ID="lbCount" runat="server" Text='<%# Eval("總人數") %>' meta:resourcekey="lbCountResource1"></asp:Label>
                                        <asp:Label ID="lbLeftPerson" runat="server" Text="人" meta:resourcekey="lbLeftPersonResource1"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <Fast:Grid ID="Grid1" Width="100%" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                AutoGenerateColumns="False"   DataSourceID="ObjectDataSource1" AllowPaging="True"  >
                                <Columns>
                                    <asp:BoundField DataField="NAME" HeaderText="投票者名稱" SortExpression="NAME" meta:resourcekey="BoundFieldResource1" />
                                    <asp:BoundField DataField="POLLING_TIME" HeaderText="投票時間" SortExpression="POLLING_TIME" meta:resourcekey="BoundFieldResource2" />
                                </Columns>
                            </Fast:Grid>
                        </td>
                    </tr>
                </table>
    <asp:Label ID="lbTopicGuid" runat="server" Visible="False" meta:resourcekey="lbTopicGuidResource1"></asp:Label>
    <asp:Label ID="lbItemGuid" runat="server" Visible="False" meta:resourcekey="lbItemGuidResource1"></asp:Label>
    <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetRegisteredPollingUser"
        TypeName="Ede.Uof.EIP.Polling.MasterReadUCO">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="lbTopicGuid" Name="topicGUID" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="lbItemGuid" Name="itemGUID" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

