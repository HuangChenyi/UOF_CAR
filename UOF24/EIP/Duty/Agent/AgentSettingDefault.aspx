<%@ Page Title="批次設定代理人" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Agent_AgentSettingDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="AgentSettingDefault.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc2" TagName="UC_DeptManagerTree" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" Runat="Server">
<script type="text/javascript">
    function rdBar_OnClientButtonClicking(sender, args) {
        var key = args.get_item().get_value();
        switch (key) {
            case "Import":
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Duty/Agent/ImportAgentUser.aspx", args.get_item(), '<%=lblImportTitle.Text%>', 500, 450, openDialogResult);
                break;
        }
    }
    function openDialogResult(returnValue) {

        if (returnValue === '' || returnValue === null)
            return false;
        else
            return true;
    }
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <uc2:UC_DeptManagerTree runat="server" ID="UC_DeptManagerTree" ShowDeptManagerTree="true" ShowDeptPersonalTree="false" ShowSuperiorTree="false" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="rdBar_OnClientButtonClicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Value="withChild" >
                            <ItemTemplate>
                                <asp:CheckBox ID="chbChild" runat="server" Text="包含子部門" meta:resourcekey="chbChildResource1"/>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            meta:resourcekey="rdToolBarQueryResource1">                                    
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="匯入Excel人員" Value="Import"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                            meta:resourcekey="rdToolBarImportResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <table cellspacing="1" class="PopTable" width="100%">
                    <tr>
                        <td style="width:150px">
                            <asp:Label ID="Label2" runat="server" Text="人員" meta:resourcekey="Label2Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1"></asp:TextBox>
                        </td>
                    </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                    <ContentTemplate>
                        <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False"  
                Width="100%"  DataKeyOnClientWithCheckBox="False"
                PageSize="15" DefaultSortDirection="Ascending" EnableModelValidation="True" DefaultSortColumnName="NAME" 
                            EnhancePager="True" EmptyDataText="沒有資料" KeepSelectedRows="False" 
                            onpageindexchanging="Grid1_PageIndexChanging" 
                            onrowdatabound="Grid1_RowDataBound" onsorting="Grid1_Sorting" meta:resourcekey="Grid1Resource1"
                >
                <ExportExcelSettings AllowExportToExcel="False" />
                <EnhancePagerSettings ShowHeaderPager="True" />
                            <Columns>
                                <asp:TemplateField HeaderText="人員姓名" SortExpression="NAME" 
                                    meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnName" runat="server" onclick="lbtnName_Click" 
                                            Text='<%#: Bind("NAME") %>' meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAME") %>' 
                                            meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="第一代理人" 
                                    meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAgentFirst" runat="server" 
                                            meta:resourcekey="lblAgentFirstResource1"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="第二代理人" 
                                    meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAgentSecond" runat="server" 
                                            meta:resourcekey="lblAgentSecondResource1"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="第三代理人" 
                                    meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAgentThird" runat="server" 
                                            meta:resourcekey="lblAgentThirdResource1"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        </table>
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" meta:resourcekey="Label1Resource1" Visible="false"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="代理人設定" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblImportTitle" runat="server" Text="匯入檔案" Visible="False" meta:resourcekey="lblImportTitleResource1" ></asp:Label>                                        
</asp:Content>