<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_HistoryRecord_Default" Title="表單欄位差異比較表" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>

<%@ Register src="Relatively.ascx" tagname="Relatively" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" cellspacing="1">
    <tr>
       <td class="PopTableHeader" align="center" style="height: 25px"><asp:Label ID="lblTitle" runat="server" Text="表單欄位差異比較表" meta:resourcekey="lblTitleResource1"></asp:Label></td> 
    </tr>
    </table>
    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" 
        Width="100%"  DataKeyOnClientWithCheckBox="False" 
        EnhancePager="True"  PageSize="15" 
          AutoGenerateColumns="False" 
        onrowdatabound="Grid1_RowDataBound" AllowSorting="True" 
        >
        <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
        <Columns>
            <asp:BoundField DataField="ACTUAL_SIGNER" HeaderText="簽核者" 
                meta:resourcekey="BoundFieldResource1">
                <ItemStyle Width="20%" Wrap="True" />
            </asp:BoundField>
            <asp:BoundField DataField="FINISH_TIME" HeaderText="簽核時間" 
                meta:resourcekey="BoundFieldResource2">
                <ItemStyle Width="10%" Wrap="True" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="表單記錄" ItemStyle-Width="70%" 
                ItemStyle-Wrap="false" meta:resourcekey="TemplateFieldResource1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("SITE_ID") %>' 
                        meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>                    
                    <asp:Label ID="lblTASK_ID" runat="server" Text='<%#: Bind("TASK_ID") %>' 
                        Visible="False" meta:resourcekey="lblTASK_IDResource1"></asp:Label>
                    <asp:Label ID="lblSITE_ID" runat="server" Text='<%#: Bind("SITE_ID") %>' 
                        Visible="False" meta:resourcekey="lblSITE_IDResource1"></asp:Label>
                    <asp:Label ID="lblPREV_SITE_ID" runat="server" 
                        Text='<%#: Bind("PREV_SITE_ID") %>' Visible="False" 
                        meta:resourcekey="lblPREV_SITE_IDResource1"></asp:Label>
                    <asp:Label ID="lblNEXT_SITE_ID" runat="server" 
                        Text='<%#: Bind("NEXT_SITE_ID") %>' Visible="False" 
                        meta:resourcekey="lblNEXT_SITE_IDResource1"></asp:Label>
                    <asp:Label ID="lblNODE_SEQ" runat="server" Text='<%#: Bind("NODE_SEQ") %>' 
                        Visible="False" meta:resourcekey="lblNODE_SEQResource1"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="70%" Wrap="False" />
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
</asp:Content>

