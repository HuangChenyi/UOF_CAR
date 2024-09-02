<%@ Control Language="C#" AutoEventWireup="true" Inherits="System_Organization_Employee_UC_ThisMonthBirthdayList" Codebehind="UC_ThisMonthBirthdayList.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
        AutoGenerateColumns="False" OnPageIndexChanging="Grid1_PageIndexChanging"
        ShowHeader="False"  Width="100%" AllowPaging="True" BorderStyle="None" BorderWidth="0px" OnRowDataBound="Grid1_RowDataBound" SkinID="HomepageBlockStyle" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource1" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" >            
        <Columns>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                <itemtemplate>
        <table style="width:100%" border=0>
            <tbody>
                <tr>
                    <td style="width:16px;min-width:16px">
                        <img height=16 src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width=16 /> 
                    </td>
                    <td id="tdBirthday" runat="server" width="20%" >
                        <asp:Label runat="server" Text='<%# Bind("BIRTHDAY", "{0:m}") %>' ID="lblBirthday" meta:resourcekey="lblBirthdayResource1"></asp:Label>
                    </td>
                    <td id="tdLBAccount" runat="server" width="50%" >
                        <asp:Label runat="server" ID="LinkButton1"  meta:resourcekey="LinkButton1Resource1"></asp:Label>     
                    </td>
                    <td id="tdAccount" runat="server" width="30%" >
                        <asp:Label runat="server" Text='<%#: Eval("ACCOUNT") %>' ID="lblAccount" meta:resourcekey="lblAccountResource1"></asp:Label>
                    </td>
                </tr>
            </tbody>
        </table>
        </itemtemplate>
            </asp:TemplateField>
        </Columns>
        </Fast:Grid>
    </ContentTemplate>
</asp:UpdatePanel>
