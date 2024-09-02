<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="DMS_Admin_WKFFlowMaintain" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="WKFFlowMaintain.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="uwtFlowTree">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="labFolderName" UpdatePanelCssClass="" />
                    <telerik:AjaxUpdatedControl ControlID="gridWKFData" UpdatePanelCssClass="" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="gridWKFData">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="gridWKFData" UpdatePanelCssClass="" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <script id="igClientScript" type="text/javascript">
<!--
    function uwtFlowTree_NodeClicking(sender, e) {
        $('#<%=hdSelectType.ClientID %>').val(e.get_node().get_value());
    }
    // -->
    </script>

    <script type="text/javascript">
        var formVer;
        function DelectFlow(sender, FormVerID) {
            var Type = $('#<%=hdSelectType.ClientID %>').val();
            var id = [FormVerID];
            var date = [FormVerID, Type];
            formVer = FormVerID;
            if ($uof.pageMethod.sync('GetQueryTaskCountWithFormVersion', id) > 0) {
                alert('<%=lblVerIsUsing.Text %>');
                return true;
            }

            if ($uof.pageMethod.sync('GetUseFlowCount', date) == 0) {
                if (confirm('<%=lblDeleteFlow.Text %>')) {
                    var deleteResult =  $uof.pageMethod.sync('DeleteFlow', id);
                    if (deleteResult == 0)
                        alert('<%=lblVerIsUsing.Text %>');
                    else if (deleteResult != 1 && deleteResult != null && typeof (deleteResult) != 'undefined' && deleteResult != "")
                        alert("Error:" + deleteResult);
                    return true;
                }
                else {
                    return true;
                }
            }
            else {
                alert('<%=lblNoDelete.Text %>');
                $uof.dialog.open2("~/DMS/Admin/WKFFlowModify.aspx", sender, "", 450, 400, OpenDocDialogResult, { "formVersionId": FormVerID, "type": Type });
                return false;
            }
        }

        function OpenDocDialogResult(returnValue) {
            if (returnValue == "ok") {
                $uof.pageMethod.sync('DeleteFlow', [formVer]);
                return true;
            }
        }
    </script>

    <div runat="server" id="treeBG" style="background-repeat: repeat; width: 100%; height: 100%">
        <telerik:RadTreeView ID="uwtFlowTree" runat="server" Height="100%" Width="100%"
            OnNodeClick="uwtFlowTree_NodeClick" OnClientNodeClicking="uwtFlowTree_NodeClicking">
        </telerik:RadTreeView>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">

    <asp:Label ID="labFolderName" runat="server" Font-Bold="True" Font-Italic="True"
        CssClass="SizeL" Text="流程維護" meta:resourcekey="labFolderNameResource1"></asp:Label>

    <br />
    <Fast:Grid runat="server" ID="gridWKFData" AutoGenerateCheckBoxColumn="False" Width="100%"
        AllowSorting="True" AutoGenerateColumns="False"
        DataKeyOnClientWithCheckBox="False" EnhancePager="True" OnRowDataBound="gridWKFData_RowDataBound"
        PageSize="15" AllowPaging="True" OnSorting="gridWKFData_Sorting" DefaultSortColumnName="FLOW_NAME" DefaultSortDirection="Ascending"
        OnPageIndexChanging="gridWKFData_PageIndexChanging" EmptyDataText="No data found" KeepSelectedRows="False"  >
        <EnhancePagerSettings ShowHeaderPager="True" />

        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="流程名稱" SortExpression="FLOW_NAME" meta:resourcekey="TemplateFieldResource1">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("FLOW_NAME") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <span style="word-break: break-all; width: 150px;">
                        <asp:Image runat="server" ID="imgFlowIcon" ></asp:Image>
                        <asp:Label runat="server" Text='<%#: Bind("FLOW_NAME") %>' ID="lblFlowName"></asp:Label>
                    </span>
                </ItemTemplate>
                <HeaderStyle Wrap="false"/>
                <ItemStyle Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="使用狀態" SortExpression="USE_FOLDER_COUNT" meta:resourcekey="TemplateFieldResource2">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("USE_FOLDER_COUNT") %>' ID="TextBox6"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USE_FOLDER_COUNT") %>' ID="lblUseStatus"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="100px" Wrap="False" />
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="原始建立目錄" SortExpression="FOLDER_NAME" meta:resourcekey="TemplateFieldResource3">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("FOLDER_ID") %>' ID="TextBox2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("FOLDER_ID") %>' ID="lblFloderName"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="false"/>
                <ItemStyle Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="建立者" SortExpression="CREATE_USER" meta:resourcekey="TemplateFieldResource4">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("CREATE_USER") %>' ID="TextBox3"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("CREATE_USER") %>' ID="lblCreateUser"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="250px" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="建立時間" SortExpression="CREATE_TIME" meta:resourcekey="TemplateFieldResource5">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("CREATE_TIME") %>' ID="TextBox4"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text="" ID="lblCreateTime"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="150px" Wrap="False" />
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="功能" meta:resourcekey="TemplateFieldResource6">
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="TextBox5" ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDeleteFlow" Text="刪除" meta:resourcekey="lbtnDeleteFlowResource1" OnClick="lbtnDeleteFlow_Click"></asp:LinkButton>
                    &nbsp;
                                            <asp:LinkButton runat="server" ID="lbtnEditFlow" Text="編輯流程" 
                                                meta:resourcekey="lbtnEditFlowResource1" OnClick="lbtnEditFlow_Click"></asp:LinkButton>
                    &nbsp;
                                            <asp:LinkButton runat="server" ID="lblChangeFolder" Text="更改使用目錄" 
                                                meta:resourcekey="lblChangeFolderResource1" OnClick="lblChangeFolder_Click"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle Width="250px" Wrap="False" />
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
    <asp:Label ID="lblPublishSFlow" runat="server" Text="公佈審核流程" Visible="False" meta:resourcekey="lblPublishSFlowResource1"></asp:Label>
    <asp:Label ID="lblLendFlow" runat="server" Text="調閱審核流程" Visible="False" meta:resourcekey="lblLendFlowResource1"></asp:Label>
    <asp:Label ID="lblDeleteFlow" runat="server" Text="是否要刪除此審核流程?" Visible="False" meta:resourcekey="lblDeleteFlowResource1"></asp:Label>
    <asp:Label ID="lblUse" runat="server" Text="使用中" Visible="False" meta:resourcekey="lblUseResource1"></asp:Label>
    <asp:Label ID="lblNoUse" runat="server" Text="未使用" Visible="False" meta:resourcekey="lblNoUseResource1"></asp:Label>
    <asp:Label ID="lblNoDelete" runat="server" Text="流程有目錄正在使用，請先更改使用目錄" Visible="False" meta:resourcekey="lblNoDeleteResource1"></asp:Label>
    <input id="hdSelectType" type="hidden" runat="server" />
    <asp:Label ID="lblVerIsUsing" runat="server" Text="流程有表單正在使用，無法刪除" Visible="False" meta:resourcekey="lblVerIsUsingResource1"></asp:Label>
    <asp:Label ID="lblVoidFlow" runat="server" Text="作廢審核流程" Visible="false" meta:resourcekey="lblVoidFlowResource1"></asp:Label>
    <asp:Label ID="lblDeleteApproveFlow" runat="server" Text="銷毀審核流程" Visible="false" meta:resourcekey="lblDeleteApproveFlowResource1"></asp:Label>
</asp:Content>