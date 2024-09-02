<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_AddAgentFormScript" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="AddAgentFormScript.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" id="agentjs">
    function IfAgent() {
        if (confirm('是否代理申請') == false) {
            return false;
        }
    }
</script>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
                    <td valign="top" width="25%">
                        <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
                            <tr>
                                <td background="<%=themePath %>/images/tree_title.gif" style="height: 30px; width: 100%;">
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" height="23" width="95%">
                                        <tr>
                                            <td width="23">
                                                <div align="center">
                                                    <img height="7" src="<%=themePath %>/images/icon04.gif" width="7px" /></div>
                                            </td>
                                            <td class="g" width="115px">
                                                <asp:Label ID="Label5" runat="server" meta:resourcekey="Label1Resource1" Text="可設定表單列表"></asp:Label></td>
                                            <td width="3">
                                                <img height="23" src="<%=themePath %>/images/tree_line01.gif" width="3px" /></td>
                                            <td background="<%=themePath %>/images/tree_line02.gif">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td background="<%=themePath %>/images/tree_line04.gif" rowspan="2" style="width: 89%"
                                    valign="top">
                                    <img height="101px" src="<%=themePath %>/images/tree_line03.gif" width="8px" />
                                </td>
                            </tr>
                            <tr>
                                <td background="<%=themePath %>/images/tree_bg.gif" height="433px" valign="top" 
                                    style="width: 100%">
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" width="100%">
                                                <asp:Panel ID="Panel1" runat="server" Width="100%" Height="670px" ScrollBars="Vertical">
                                                    <telerik:RadTreeView ID="RadTreeView1" runat="server" OnNodeClick="RadTreeView1_NodeClick"></telerik:RadTreeView>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top" width="75%" >
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick">
                            <Items>                           
                                <telerik:RadToolBarButton runat="server">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text="帳號/姓名關鍵字:"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton> 
                                <telerik:RadToolBarButton runat="server" Value="txt">
                                    <ItemTemplate>
                                        <asp:TextBox ID="tbxKeyWord" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>                          
                                <telerik:RadToolBarButton runat="server" Text="查詢" 
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    >
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>                            
                                <Fast:Grid id="UserGrid" runat="server" AutoGenerateCheckBoxColumn="False" 
                                    Width="100%" AllowSorting="True" AutoGenerateColumns="False" 
                                     DataKeyOnClientWithCheckBox="False" 
                                    DefaultSortDirection="Ascending" 
                                    EnhancePager="True" PageSize="15"  
                                     onrowdatabound="UserGrid_RowDataBound" 
                                    >
        <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                    <Columns>
                                        <asp:BoundField HeaderText="姓名" DataField="NAME" 
                                            meta:resourcekey="BoundFieldResource1" />
                                        <asp:BoundField HeaderText="部門" DataField="GROUP_NAME" 
                                            meta:resourcekey="BoundFieldResource2" />
                                        <asp:BoundField HeaderText="職級" DataField="TITLE_NAME" 
                                            meta:resourcekey="BoundFieldResource3" />
                                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnAgent" runat="server" onclick="lbtnAgent_Click" 
                                                    meta:resourcekey="lbtnAgentResource1">代理填寫</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="RadTreeView1" EventName="NodeClick" />
                                <asp:AsyncPostBackTrigger ControlID="UltraWebToolbar1" 
                                    EventName="ButtonClicked" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
</table>
</asp:Content>

