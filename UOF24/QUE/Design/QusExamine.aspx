<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="QusExamine.aspx.cs" Inherits="Ede.Uof.Web.QUE.Design.QusExamine" Title="問卷發佈審核" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
  
            var isOpen = $("#<%=hidIsOpen.ClientID%>").val();
            var DesignMasterGuid = "<%=Request.QueryString["DesignMasterGuid"]%>";
            var qusMasterGuid = "<%=Request.QueryString["QUS_MASTER_GUID"]%>";

            if (DesignMasterGuid != "" && qusMasterGuid != "" && isOpen== "") {
                $uof.dialog.open2("~/QUE/Design/QusExamineView.aspx", "", '<%=lblTitle.Text%>', 1024, 780, openDialogLink, { "DESIGN_MASTER_GUID": DesignMasterGuid, "QUS_MASTER_GUID": qusMasterGuid });
            }
        });

        function openDialogLink(returnValue) {
            $("#<%=hidIsOpen.ClientID%>").val("Yes");
            if (typeof (returnValue) == 'undefined')
                return false;
            else {
                setTimeout(function () {
                    $("#<%=Button1.ClientID%>").click();
                }, 500);
                return true;
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AllowSorting="True" AutoGenerateColumns="False" CustomDropDownListPage="False" 
                DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15" 
                SelectedRowColor="" UnSelectedRowColor="" OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" DefaultSortColumnName="DESIGN_NAME" 
                OnPageIndexChanging="Grid1_PageIndexChanging" OnSorting="Grid1_Sorting" Width="100%" meta:resourcekey="Grid1Resource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="問卷名稱" SortExpression="DESIGN_NAME" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnQueName" runat="server" Text='<%# Bind("DESIGN_NAME") %>' OnClick="lbtnQueName_Click" meta:resourcekey="lbtnQueNameResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="35%" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="問卷類別" DataField="CATEGORY_NAME" SortExpression="CATEGORY_NAME" HtmlEncode="true" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" Width="10%" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="問卷發佈者" SortExpression="NAME" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblPublisher" runat="server" meta:resourcekey="lblPublisherResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False"  Width="20%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="送審時間" SortExpression="MODIFY_DATE">
                        <ItemTemplate>
                            <asp:Label ID="lblAuditTime" runat="server" Text='<%# Bind("MODIFY_DATE") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="15%" Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="調查時間" SortExpression="START_TIME">
                        <ItemTemplate>
                            <asp:Label ID="lblExamineTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="20%" Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblTitle" runat="server" Text="問卷審核" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Button ID="Button1" runat="server" Style="display: none" OnClick="Button1_Click" meta:resourcekey="Button1Resource1" />
    <asp:HiddenField ID="hidIsOpen" runat="server" />
</asp:Content>

