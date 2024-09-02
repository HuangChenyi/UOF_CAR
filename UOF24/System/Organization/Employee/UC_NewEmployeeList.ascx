<%@ Control Language="C#" AutoEventWireup="true" Inherits="System_Organization_Employee_UC_NewEmployeeList" Codebehind="UC_NewEmployeeList.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" meta:resourcekey="Grid1Resource1"  
            Width="100%" BorderStyle="None" BorderWidth="0px" ShowHeader="False" SkinID="HomepageBlockStyle" OnRowDataBound="Grid1_RowDataBound"
            AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging">
            <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <Itemtemplate>
                    <table width="100%" border=0>
                        <tr>
                            <td width=16 style="min-width:16px">
                                <img height=16 src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16" /> 
                            </td>
                            <td width="15%">
                                <asp:Label runat="server" Text='<%# Bind("ARRIVE_DATE", "{0:d}") %>' ID="lblArriveDate" meta:resourcekey="lblArriveDateResource1"></asp:Label>
                            </td>
                            <td width="55%">
                                <asp:Label runat="server" ID="LinkButton1" meta:resourcekey="LinkButton1Resource1"></asp:Label>
                            </td>
                            <td width="30%">
                                <asp:Label runat="server" Text='<%#: Eval("ACCOUNT") %>' ID="lblAccount" meta:resourcekey="lblAccountResource1"></asp:Label>
                            </td>
                        </tr>
                    </table> 
                    </Itemtemplate>
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
    </ContentTemplate>
</asp:UpdatePanel>
