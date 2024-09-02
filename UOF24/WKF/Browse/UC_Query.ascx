<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Browse_UC_Query" CodeBehind="UC_Query.ascx.cs" %>

<script type="text/javascript">

</script>
<asp:Panel ID="Panel1" runat="server" Width="100%" Visible="False" meta:resourcekey="Panel1Resource1">
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td class="PopTableHeader" style="height: 25px" align="center" colspan="2">
                <center>
                <asp:Label ID="lblSpecialQuery" runat="server" Text="進階查詢" meta:resourcekey="lblSpecialQueryResource1"></asp:Label></center>
            </td>
        </tr>
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <tr>
            <td style="height: 25px;" align="right" nowrap="nowrap">
                <asp:Label ID="lblFormVersion" runat="server" Text="表單版本" meta:resourcekey="lblFormVersionResource1"></asp:Label></td>
            <td style="height: 25px;" align="left" class="PopTableRightTD">
                <asp:DropDownList ID="ddlFormVersion" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFormVersion_SelectedIndexChanged" meta:resourcekey="ddlFormVersionResource1">
                </asp:DropDownList>
                <asp:Label ID="lblIssueVersion" runat="server" Text="(已發佈)" meta:resourcekey="lblIssueVersionResource1"></asp:Label>
                <asp:Label ID="lblMsgChoice" runat="server" ForeColor="Red" Text="請選擇表單" meta:resourcekey="lblMsgChoiceResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" style="height: 25px" nowrap="nowrap">
                <asp:Label ID="lblFieldcondition1" runat="server" Text="欄位條件1" meta:resourcekey="lblFieldcondition1Resource1"></asp:Label></td>
            <td align="left" style="height: 25px" class="PopTableRightTD" nowrap="nowrap">
                <asp:TextBox ID="tbxQueryFieldCond1" runat="server" Width="270px" ReadOnly="True" meta:resourcekey="tbxQueryFieldCond1Resource1"></asp:TextBox>
                <asp:LinkButton ID="linkBtnChoiceCond1" runat="server" OnClick="linkBtnChoiceCond_Click" meta:resourcekey="linkBtnChoiceCond1Resource1" Text="選擇"></asp:LinkButton>
                <asp:LinkButton ID="linkBtnCleanCond1" runat="server" OnClick="linkBtnCleanCond1_Click" meta:resourcekey="linkBtnCleanCond1Resource1" Text="清除"></asp:LinkButton></td>
        </tr>
        <tr>
            <td align="right" style="height: 25px" nowrap="nowrap">
                <asp:Label ID="lblFieldcondition2" runat="server" Text="欄位條件2" meta:resourcekey="lblFieldcondition2Resource1"></asp:Label></td>
            <td align="left" style="height: 25px" class="PopTableRightTD" nowrap="nowrap">
                <asp:TextBox ID="tbxQueryFieldCond2" runat="server" ReadOnly="True" Width="270px" meta:resourcekey="tbxQueryFieldCond2Resource1"></asp:TextBox>
                <asp:LinkButton ID="linkBtnChoiceCond2" runat="server" OnClick="linkBtnChoiceCond2_Click" meta:resourcekey="linkBtnChoiceCond2Resource1" Text="選擇"></asp:LinkButton>
                <asp:LinkButton ID="linkBtnCleanCond2" runat="server" OnClick="linkBtnCleanCond2_Click" meta:resourcekey="linkBtnCleanCond2Resource1" Text="清除"></asp:LinkButton></td>
        </tr>
        <tr>
            <td align="right" style="height: 25px" nowrap="nowrap">
                <asp:Label ID="lblFieldcondition3" runat="server" Text="欄位條件3" meta:resourcekey="lblFieldcondition3Resource1"></asp:Label></td>
            <td align="left" style="height: 25px" class="PopTableRightTD">
                <asp:TextBox ID="tbxQueryFieldCond3" runat="server" ReadOnly="True" Width="270px" meta:resourcekey="tbxQueryFieldCond3Resource1"></asp:TextBox>
                <asp:LinkButton ID="linkBtnChoiceCond3" runat="server" OnClick="linkBtnChoiceCond3_Click" meta:resourcekey="linkBtnChoiceCond3Resource1">選擇</asp:LinkButton>
                <asp:LinkButton ID="linkBtnCleanCond3" runat="server" OnClick="linkBtnCleanCond3_Click" meta:resourcekey="linkBtnCleanCond3Resource1">清除</asp:LinkButton></td>
        </tr>
    </table>
    <asp:HiddenField ID="HiddenFieldQueryCond1" runat="server" />
    <asp:HiddenField ID="HiddenFieldQueryCond2" runat="server" />
    <asp:HiddenField ID="HiddenFieldQueryCond3" runat="server" />
    <asp:HiddenField ID="hfEliminateFiler" Value="false" runat="server" />
    &nbsp;
    <asp:Label ID="lblTitleFieldQueryCond" runat="server" Text="欄位查詢條件" Visible="False" meta:resourcekey="lblTitleFieldQueryCondResource1"></asp:Label>
    <asp:Panel ID="Panel2" runat="server" Height="50px" Width="125px" Visible="False" meta:resourcekey="Panel2Resource1">
        <asp:LinkButton ID="linkBtnCancel1" runat="server" meta:resourcekey="linkBtnCancel1Resource1" Text="取消"></asp:LinkButton>
        <asp:LinkButton ID="linkBtnCancel2" runat="server" Visible="False" meta:resourcekey="linkBtnCancel2Resource1" Text="取消"></asp:LinkButton>
        <asp:LinkButton ID="linkBtnCancel3" runat="server" Visible="False" meta:resourcekey="linkBtnCancel3Resource1">取消</asp:LinkButton>
    </asp:Panel>
    <asp:HiddenField ID="HiddenFieldDisplay" runat="server" />
</asp:Panel>
