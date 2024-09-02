<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_OMS_QueryOnlineLook" Title="線上觀看" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryOnlineLook.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script id="OnlineLookjs" type="text/javascript">
        Sys.Application.add_load(function() {
            var movieID = "<%=Request.QueryString["movieID"]%>";
            if (movieID !== "") {
                if ($('#<%=HiddenFieldPostBack.ClientID%>').val() != 'True') return;
                $('#<%=HiddenFieldPostBack.ClientID%>').val('False');

                window.open("OnlineLookShow.aspx?MovieID=" + movieID, "", "height=550, width=670, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no");
            }
        });
        function ibtnShow_Click(sender, MovieID) {
            window.open("OnlineLookShow.aspx?MovieID=" + MovieID, "", "height=550, width=670, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no");
           
            return false;
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) != 'undefinded') {              
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <telerik:RadTreeView ID="classTree" runat="server" OnNodeClick="classTree_NodeClick">
                <Nodes>
                    <telerik:RadTreeNode runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m15.gif" ForeColor="Black"
                        Enabled="False" ImageUrl="~/Common/Images/Icon/icon_m14.gif" Value="MovieClass">
                    </telerik:RadTreeNode>
                </Nodes>
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <Fast:Grid ID="listGrid" runat="server"
                AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowPaging="True"
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="TOPIC"
                EnhancePager="True" PageSize="15" Width="100%"
                OnPageIndexChanging="listGrid_PageIndexChanging" OnSorting="listGrid_Sorting" OnRowDataBound="listGrid_RowDataBound" >
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Image ID="imgNew" runat="server" Visible="False" ImageUrl="~/EIP/OMS/images/BulletinNew.gif" meta:resourcekey="imgNewResource1" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle Wrap="False" Width="20px" />
                        <ItemStyle Width="20px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="檔案名稱" SortExpression="TOPIC" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnFileName" runat="server" CommandArgument='<%#: Eval("FILE_GROUP_ID") %>' OnClick="lbtnFileName_Click"
                                Text='<%#: Eval("TOPIC") %>' meta:resourcekey="lbtnFileNameResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="簡介" SortExpression="CONTEXT" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblContext" runat="server" Text='<%#: Eval("CONTEXT") %>' meta:resourcekey="lblContextResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="開放起始" DataFormatString="{0:yyyy/MM/dd}" DataField="OPEN_DATE" SortExpression="OPEN_DATE" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="開放終止" SortExpression="CLOSE_DATE" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblCloseDate" runat="server" Text='<%#: Eval("CLOSE_DATE", "{0:yyyy/MM/dd}") %>' meta:resourcekey="lblCloseDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="觀看次數" SortExpression="LOOK_COUNT" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblLookCount" runat="server" Text='<%#: Eval("LOOK_COUNT") %>' meta:resourcekey="lbtnLookCountResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right" />
                    </asp:TemplateField>
                </Columns>
                <EnhancePagerSettings FirstAltImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_01.gif"
                    FirstImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_01.gif"
                    LastAltImage="&lt;%=themePath %&gt;/images/grid/arrow_04.gif"
                    LastImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_04.gif" NextImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_03.gif"
                    PreviousImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_02.gif"
                    NextIAltImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_03.gif"
                    PreviousAltImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_02.gif"
                    PageInfoCssClass="GridPagerPagerInfo" PageNumberCssClass="GridPagerNumber"
                    PageNumberCurrentCssClass="GridPagerCurrentNumber"
                    PageRedirectCssClass="GridPagerPagerInfoRedirect" ShowHeaderPager="True" />
            </Fast:Grid>
            <asp:Label ID="lblNoAuthMsg" runat="server" Text="沒有權限觀看" Visible="false" ForeColor="Red" meta:resourcekey="lblNoAuthMsgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="msgClass" runat="server" Text="影音類別" Visible="False" meta:resourcekey="msgClassResource1"></asp:Label>
    <asp:Label ID="lblOnlineLikeHistoryTitle" runat="server" Text="觀看記錄" Visible="False" meta:resourcekey="lblOnlineLikeHistoryTitleResource1"></asp:Label>
    <asp:HiddenField ID="hidNewMovie" runat="server" Value="0" />
    <asp:Label ID="lblOpenNoLimit" runat="server" Text="永久開放" Visible="False" meta:resourcekey="lblOpenNoLimitResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" meta:resourcekey="Label1Resource1" Text="影音類別列表" Visible="false"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="HiddenFieldPostBack" runat="server" Value="True" />
</asp:Content>
