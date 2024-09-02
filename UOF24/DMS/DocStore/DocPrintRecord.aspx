<%@ Page Title="紙本分發管制" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master"
    AutoEventWireup="true" Inherits="DMS_DocStore_DocPrintRecord" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocPrintRecord.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            if (key == "New") {
                args.set_cancel(true);
                var docId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["docid"], true)%>');
                var manualVersion = $uof.tool.htmlDecode($("#<%= hfmanualversionJS.ClientID %>").val());
                var fileId = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(fileid, true)%>');
                var mode = "New";
                $uof.dialog.open2("~/DMS/DocStore/DocPrintControl.aspx", args.get_item(), "", 500, 400, function (returnValue) {
                    return true;
                }, { "docid": docId, "manualversion": manualVersion, "fileid": fileId, "status": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(status, true)%>"), "folderid": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["folderid"], true)%>"), "mode": mode });
            }
            else if (key == "Delete") {
                //var CheckedData = $uof.fastGrid.getChecked('<%=Grid1.ClientID %>');                
                //if (CheckedData == "" || CheckedData == null) {
                //    alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>');
                //    return;
                //}
                //else {
                    if (!window.confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                        args.set_cancel(true);
                    }
                //}
            }
    }
    function OpenDialogResult(returnValue) {
        if (returnValue == null || typeof (returnValue) == "undefined") {
            return false;
        }
        else {
            return true;
        }
    }
    function OpenNewDialogResult(returnValue) {
        return true;
    }

    </script>
    <table style="width: 100%">
        <tr>
            <td>
                <table class="PopTable" style="width: 100%;">
                    <tr>
                        <td style="white-space: nowrap; width: 25%">
                            <asp:Label ID="Label1" runat="server" Text="文件編號"
                                meta:resourcekey="Label1Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDocNbr" runat="server" meta:resourcekey="lblDocNbrResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="文件名稱"
                                meta:resourcekey="Label3Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDocName" runat="server"
                                meta:resourcekey="lblDocNameResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="作者"
                                meta:resourcekey="Label5Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblAuthor" runat="server" meta:resourcekey="lblAuthorResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="最新版本"
                                meta:resourcekey="Label7Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblPublish" runat="server"
                                meta:resourcekey="lblPublishResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTime" runat="server" Text="" ></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblModifyDate" runat="server"
                                meta:resourcekey="lblModifyDateResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" SingleClick="None" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="分發" Value="New"
                            ClickedImageUrl="~/Common/Images/Icon/icon_m189.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m189.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m189.gif" ImageUrl="~/Common/Images/Icon/icon_m189.gif" meta:resourcekey="RadToolBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                            ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="Status" meta:resourcekey="RadToolBarButtonResource5">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" meta:resourcekey="ddlStatusResource1">
                                    <asp:ListItem Text="全部" Value="All" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                    <asp:ListItem Text="已分發" Value="0" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                    <asp:ListItem Text="已回收" Value="1" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                

                        <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                            DataKeyNames="COPY_ID" AutoGenerateColumns="False" 
                            DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Descending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15"
                              Width="100%"  OnPageIndexChanging="Grid1_PageIndexChanging"
                            OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting"
                            meta:resourcekey="Grid1Resource1" DefaultSortColumnName="PRINT_DATE" OnBeforeExport="Grid1_BeforeExport">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                            <ExportExcelSettings AllowExportToExcel="True" datasourcetype="ObjectDataSource"></ExportExcelSettings>
                            <Columns>
                                <asp:BoundField HeaderText="列印記錄編號" DataField="COPY_ID" Visible="False"
                                    meta:resourcekey="BoundFieldResource1" />
                                <asp:TemplateField HeaderText="分發時間" SortExpression="PRINT_DATE"
                                    meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnPrintDate" runat="server" Text="" OnClick="lbtnPrintDate_Click" meta:resourcekey="lblPrintDateResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="10%" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="版本" DataField="DOC_VERSION" SortExpression="DOC_VERSION" meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Wrap="False" Width="45px" />
                                    <ItemStyle HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="發送者" SortExpression="PRINT_NAME"
                                    meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPrintPerson" runat="server"
                                            Text='<%# Bind("PRINT_PERSON") %>'
                                            meta:resourcekey="lblPrintPersonResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="分發對象" SortExpression="SEND_NAME"
                                    meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblApplicant" runat="server" Text='<%# Bind("APPLICANT") %>'
                                            meta:resourcekey="lblApplicantResource1"></asp:Label>
                                        <asp:Label ID="lblIsRecalled" Visible="False" runat="server" Text='<%# Bind("IS_RECALLED") %>'
                                            meta:resourcekey="lblIsRecalledResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="15%" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="份數" DataField="NUMBER_OF_COPY" SortExpression="NUMBER_OF_COPY" meta:resourcekey="BoundFieldResource3">
                                    <HeaderStyle Wrap="False" Width="40px" />
                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="理由" DataField="REASON" SortExpression="REASON"
                                    meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="狀態" SortExpression="IS_RECALLED" meta:resourcekey="TemplateFieldResource5">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("IS_RECALLED") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="60px" Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField  HeaderText="回收時間"  SortExpression="RECALL_TIME" meta:resourcekey="BoundFieldResource5">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRecallTime" runat="server" Text="" ></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" Width="10%" />
                                    <ItemStyle Wrap="False" HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="回收份數" DataField="SUM_NUMBER_OF_RECALL" SortExpression="SUM_NUMBER_OF_RECALL" meta:resourcekey="BoundFieldResource6">
                                    <HeaderStyle Wrap="False" Width="60px" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="遺失份數" DataField="SUM_NUMBER_OF_VOID" SortExpression="SUM_NUMBER_OF_VOID" meta:resourcekey="numberofvoidResource">
                                    <HeaderStyle Wrap="False" Width="60px" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                        </Fast:Grid>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblSelectItem" runat="server" Text="請選擇分發紀錄" Visible="False" meta:resourcekey="lblSelectItemResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="新增分發紀錄" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblRetrieve" runat="server" Text="已回收" Visible="False" meta:resourcekey="lblRetrieveResource1"></asp:Label>
    <asp:Label ID="lblSend" runat="server" Text="已分發" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>
    <asp:Label ID="lblCountErr" runat="server" Text="總回收份數(含遺失份數)大於分發份數" Visible="False" meta:resourcekey="lblCountErrResource1"></asp:Label>
    <asp:Label ID="lblModifyDateText" runat="server" Text="修改時間" Visible="False" meta:resourcekey="lblModifyDateTextResource1"></asp:Label>
    <asp:Label ID="lblPublishDateText" runat="server" Text="公佈時間" Visible="false" meta:resourcekey="Label9Resource1"></asp:Label>
    <asp:Label ID="lblNoAuthority" runat="server" Text="無權限使用此功能" Visible="False" meta:resourcekey="lblNoAuthorityResource1"></asp:Label>
    <asp:HiddenField ID="hfmanualversionJS" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
