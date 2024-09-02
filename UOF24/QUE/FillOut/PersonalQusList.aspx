<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="QUE_Design_PersonalQusList" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="PersonalQusList.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <style>
    .SearchBoxMargin {
        margin-top: 2px;
        margin-left: 1px;
    }
    .rbPrimary{
        padding-left:0px !important;
    }
    </style>
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var lblSearch = $("#<%=lblSearch.ClientID%>");
            var txtSearch = $("#<%=txtSearch.ClientID%>");

            txtSearch.attr("placeholder", lblSearch.text());
            txtSearch.keyup(function (e) {
                if ((e.which == 8 && txtSearch.val() == "") ||
                    (e.which == 13 && txtSearch.val() != "") ||
                    (e.which == 46 && txtSearch.val() == "")) {
                    $('#<%= btnSearh.ClientID%>').click();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width:100%">
                        <asp:Label ID="lblSearch" runat="server" Style="display: none;" Text="問卷類別" meta:resourcekey="lblSearchResource1"></asp:Label>
                        <asp:TextBox ID="txtSearch" runat="server" Width="100%" CssClass="SearchBoxMargin"></asp:TextBox>
                    </td>
                    <td>
                        <telerik:RadButton ID="btnSearh" runat="server" OnClick="btnSearh_Click">
                            <Icon PrimaryIconUrl="~/Common/Images/Icon/icon_m39.png" PrimaryIconLeft="2px" />
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>
            <telerik:RadTreeView ID="RadTreeView1" runat="server"
                OnNodeClick="RadTreeView1_NodeClick" EnableNodeTextHtmlEncoding="True"
                meta:resourcekey="RadTreeView1Resource2">
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <asp:Label ID="lblNoAuth" runat="server" Text="沒有權限觀看" ForeColor="Red" Visible="False" meta:resourcekey="lblNoAuthResource1"></asp:Label>
    <table style="width: 100%" id="qusTB" runat="server">
        <tr runat="server">
            <td runat="server">
                <table style="width: 100%" class="PopTable" cellspacing="0">
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="lblQueNameLeft" runat="server" Text="問卷名稱"
                                meta:resourcekey="lblQueNameLeftResource1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQueName" runat="server" Width="200px"
                                meta:resourcekey="txtQueNameResource1"></asp:TextBox>
                        </td>
                        <td style="white-space: nowrap;">
                            <asp:Label ID="lblStatusLeft" runat="server" Text="狀態"
                                meta:resourcekey="lblStatusLeftResource1"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlState" runat="server"
                                meta:resourcekey="ddlStateResource1">
                                <asp:ListItem Value="ALL" Text="全部" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                <asp:ListItem Value="EM" Text="調查中" Selected="True"
                                    meta:resourcekey="ListItemResource2"></asp:ListItem>
                                <asp:ListItem Value="CL" Text="結束" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                <asp:ListItem Value="SP" Text="中止" meta:resourcekey="ListItemResource4"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left; padding: 0 0 0 0">
                            <div class="PopTableRightTD" style="padding-left: 5px; padding-right: 1px;">
                                <telerik:RadButton ID="rbtnQuery" runat="server" Text="查詢"
                                    meta:resourcekey="ibtnQueryResource1" OnClick="rbtnQuery_Click">
                                </telerik:RadButton>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr runat="server">
            <td runat="server">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <Fast:Grid ID="gridQue" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                            DataKeyNames="DESIGN_MASTER_GUID" DataKeyOnClientWithCheckBox="False"
                            EnhancePager="True" OnRowDataBound="gridQue_RowDataBound"
                            PageSize="15" Width="100%"
                            AutoGenerateCheckBoxColumn="False"
                            DefaultSortDirection="Ascending" 
                            EmptyDataText="沒有資料" KeepSelectedRows="False" 
                             meta:resourcekey="gridQueResource2">
                            <EnhancePagerSettings
                                ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="問卷名稱" SortExpression="DESIGN_NAME"
                                    meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnName" Style="word-wrap: break-word; overflow-x: hidden; width: 250px;"
                                            runat="server" Text='<%#: Eval("DESIGN_NAME") %>' OnClick="lbtnName_Click"
                                            meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="儲存數" SortExpression="HAS_SAVE"
                                    meta:resourceKey="BoundFieldResource1" DataField="HAS_SAVE">
                                    <HeaderStyle Wrap="False" Width="100px"/>
                                    <itemstyle wrap="False" Width="100px"/>
                                </asp:BoundField>
                                <asp:BoundField DataField="HAS_SUBMIT" HeaderText="完成數"
                                    meta:resourceKey="BoundFieldResource3" SortExpression="HAS_SUBMIT">
                                    <HeaderStyle Wrap="False" Width="100px"/>
                                    <itemstyle wrap="False" Width="100px"/>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="狀態"
                                    SortExpression="QUS_MASTER_STATUS"
                                    meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Wrap="False" Width="100px"/>
                                    <itemstyle wrap="False" Width="100px"/>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="最近填寫日期" SortExpression="MAX_SUBMIT_DATE" meta:resourcekey="BoundFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLatestDate" runat="server" Text='<%# Bind("MAX_SUBMIT_DATE") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="200px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="結束日期" SortExpression="EDTIME" meta:resourcekey="BoundFieldResource5">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEDtime" runat="server" Text='<%# Bind("EDTIME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="200px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource2" HeaderText="統計圖表">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnReport" runat="server" Text="統計圖表"
                                            meta:resourcekey="lbtnReportResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <itemstyle wrap="False" Width="100px"/>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                    SelectCountMethod="QueryPersonalQus_Count" SelectMethod="QueryPersonalQus" SortParameterName="strSortExpression"
                    StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusUCO">
                    <SelectParameters>
                        <asp:Parameter Name="condition" />
                        <asp:Parameter Name="intStartIndex" />
                        <asp:Parameter Name="intMaxRows" />
                        <asp:Parameter Name="strSortExpression" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
        </ContentTemplate>
    </asp:UpdatePanel>
   
    <div style="display: none">
        <asp:HiddenField ID="lblMailOpenDialog" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hidTreeNodetoXml" runat="server" />
        <asp:Label ID="lblAll" runat="server" Visible="False" Text="全部類別"
            meta:resourcekey="lblAllResource1"></asp:Label>
        <asp:Label ID="lblUN" runat="server" Text="未填寫" Visible="False"
            meta:resourcekey="lblUNResource1"></asp:Label>
        <asp:Label ID="lblSM" runat="server" Text="已填寫" Visible="False"
            meta:resourcekey="lblSMResource1"></asp:Label>
        <asp:Label ID="lblEM" runat="server" Text="調查中" Visible="False"
            meta:resourcekey="lblEMResource1"></asp:Label>
        <asp:Label ID="lblSP" runat="server" Text="中止" Visible="False"
            meta:resourcekey="lblSPResource1"></asp:Label>
        <asp:Label ID="lblCL" runat="server" Text="結束" Visible="False"
            meta:resourcekey="lblCLResource1"></asp:Label>
        <asp:Label ID="lblReport" runat="server" Text="統計圖表" Visible="False"
            meta:resourcekey="lblReportResource1"></asp:Label>
        <asp:Label ID="lblQusMA" runat="server" Text="瀏覽問卷" Visible="False"
            meta:resourcekey="lblQusMAResource1"></asp:Label>
        <asp:Label ID="lblFill" runat="server" Text="填寫問卷" Visible="False"
            meta:resourcekey="lblFillResource1"></asp:Label>
        <asp:Label ID="lblPersonalQusList" Text="選擇填寫/觀看問卷" Visible="False"
            runat="server" meta:resourcekey="lblPersonalQusListResource1"></asp:Label>
        <asp:Label
            ID="lblMsg" runat="server" Text="問卷調查對象與登入者不一致,不允許填寫"
            meta:resourcekey="lblMsgResource1"></asp:Label>
        <asp:Label ID="lblTitle" runat="server" Text="問卷名稱" 
                                            meta:resourcekey="lblQueNameLeftResource1" Visible="False"></asp:Label>
    </div>
</asp:Content>


