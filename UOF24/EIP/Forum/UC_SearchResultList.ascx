<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Forum_UC_SearchResultList" Codebehind="UC_SearchResultList.ascx.cs" %>
 <%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
 <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1"></asp:Label><br />
                <fast:grid id="Grid2" runat="server" autogeneratecheckboxcolumn="False" width="100%"
                    allowsorting="True"   autogeneratecolumns="False"
                    datakeynames="TOPIC_GUID"
                    allowpaging="True"  OnPageIndexChanging="Grid2_PageIndexChanging" OnRowDataBound="Grid2_RowDataBound"  OnSorting="Grid2_Sorting" DataKeyOnClientWithCheckBox="False">
                    <Columns>
                        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                            <itemstyle width="30px" />
                            <itemtemplate>
<center><asp:Image runat="server" DescriptionUrl="~/Common/Images/Icon05.gif" ID="Image1" meta:resourceKey="Image1Resource1"></asp:Image>

 </center>
</itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="標題" meta:resourcekey="TemplateFieldResource2">
                            <itemtemplate>
<asp:HyperLink runat="server" ID="HyperLink2" meta:resourceKey="HyperLink2Resource1"></asp:HyperLink>


</itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource3">
                            <itemtemplate>
<asp:Label runat="server" ID="lblAuthor" meta:resourceKey="lblAuthorResource1"></asp:Label>


</itemtemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="REPLY_TIMES" HeaderText="回覆" SortExpression="REPLY_TIMES" meta:resourcekey="BoundFieldResource1" />
                        <asp:BoundField DataField="READ_TIMES" HeaderText="查看" SortExpression="READ_TIMES" meta:resourcekey="BoundFieldResource2" />
                        <asp:BoundField DataField="RECOMMEND_TIMES" HeaderText="推薦" SortExpression="RECOMMEND_TIMES" meta:resourcekey="BoundFieldResource3" />
                        <asp:TemplateField HeaderText="最後發表" meta:resourcekey="TemplateFieldResource4">
                            <itemtemplate>
<asp:Label runat="server" ID="lblLastUser" meta:resourceKey="lblLastUserResource1"></asp:Label>


</itemtemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BOARD_NAME" HeaderText="討論版" SortExpression="BOARD_NAME" meta:resourcekey="BoundFieldResource4" />
                    </Columns>
                </fast:grid>
            </td>
        </tr>
        <tr>
            <td align="left">
                </td>
        </tr>
    </table>
    &nbsp; &nbsp;&nbsp;
    <input id="hideUser" runat="server" type="hidden" />
<input id="hideSearchCondition" type="hidden" runat="server" /> 
    <br />
    <asp:Label ID="msgSearchresult" runat="server" Text="進階搜尋結果" Visible="False" meta:resourcekey="msgSearchresultResource1"></asp:Label>
    <asp:Label ID="msgNone" runat="server" Text="無" Visible="False" meta:resourcekey="msgNoneResource1"></asp:Label>
    <asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False"></asp:Label>