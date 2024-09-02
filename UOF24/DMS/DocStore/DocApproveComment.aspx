<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocApproveComment" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="DocApproveComment.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="height: 90%; border: 0px; width: 100%;" class="PopTable">
        <tr runat="server" id="trgrid">
            <td colspan="2" class="PopTableRightTD">
                <Fast:Grid runat="server" ID="gridApproved" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" EnhancePager="True" OnRowDataBound="gridApproved_RowDataBound" PageSize="15" Width="100%">
                    <EnhancePagerSettings ShowHeaderPager="True" />
                    <Columns>
                        <asp:BoundField DataField="DOC_NAME" HeaderText="已被審核文件" SortExpression="DOC_NAME" meta:resourcekey="BoundFieldResource1" />
                        <asp:TemplateField HeaderText="調閱人" SortExpression="LEND_USER" meta:resourcekey="TemplateFieldResource1">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%#: Bind("LEND_USER") %>' ID="TextBox1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#: Bind("LEND_USER") %>' ID="lblAuthor" __designer:wfdid="w49"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="APPROVE_USER" HeaderText="審核者" SortExpression="APPROVE_USER" meta:resourcekey="BoundFieldResource2" />
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="lblStar" runat="server" Text="*" Visible="true" ForeColor="Red"></asp:Label>
                <asp:Label ID="lblComment" runat="server"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="99%" Width="99%" ></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:RequiredFieldValidator ID="rfComment" runat="server" ErrorMessage="不允許空白" Display="Dynamic" ControlToValidate="txtComment" meta:resourcekey="rfCommentResource"></asp:RequiredFieldValidator>                          
    <asp:Label ID="lblAccept" runat="server" Text="允許備註" Visible="False" meta:resourcekey="lblAcceptResource1"></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="拒絕理由" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
    <asp:Label ID="lblAlreadyApprove" runat="server" Text="您選擇的文件已被其他審核者審核，請關閉視窗重新選擇" Visible="False" meta:resourcekey="lblAlreadyApproveResource1"></asp:Label>
    <asp:HiddenField ID="hfType" runat="server" />
    <asp:HiddenField ID="hfStatus" runat="server" />
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:HiddenField ID="hfUserIp" runat="server" />
</asp:Content>

