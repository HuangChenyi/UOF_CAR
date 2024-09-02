<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupBranchSite" Title="設定分岔式站點"   Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupBranchSite.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>    
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <script id="SetupBranchSitejs" type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, e) {
            var value = args.get_item().get_value();
            var siteId = "<%=siteId %>"
            var flowId = "<%=flowId %>"
            var siteSeq = "<%=siteSeq %>>"

            if (value == "NewBranch") {
                if (siteId != "")//只是新增節點
                {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/WKF/FlowManagement/SelectBranchNode.aspx", args.get_item(), "", 480, 600, openDialogResult, {"siteId":siteId});

                }
                else if (flowId != "")//新增站點與節點
                {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/WKF/FlowManagement/SelectBranchNode.aspx", args.get_item(), "", 480, 600, openDialogResult,
                        { "flowId": flowId, "siteSeq": siteSeq, "branchType": "<%=m_branchType%>" });
                }
            }
            else if (value == "AdjustPriority") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/AdjustBranchPriority.aspx", args.get_item(), "", 480, 660, openDialogResult, {"siteId":siteId});

            }
            else if (value == "DeleteNodes") {
                if (confirm('<%=lbConfirmDelete.Text %>') == false)
                    args.set_cancel(true);

            }
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
</script>
<table cellpadding=0 cellspacing=0 width="100%">
<tr><td>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="187px" OnButtonClick="RadToolBar1_ButtonClick" 
        OnClientButtonClicking="RadToolBar1_ButtonClicking">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="新增分支" Value="NewBranch" meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="刪除分支" Value="DeleteNodes" meta:resourcekey="TBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar></td></tr>
<tr><td>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" meta:resourcekey="RadioButtonList1Resource1">
            <asp:ListItem Selected="True" Value="0" meta:resourcekey="ListItemResource1">由上一站點指定</asp:ListItem>
            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">依條件設定</asp:ListItem>
        </asp:RadioButtonList>
</td></tr>
<tr><td colspan='2'>
    <Fast:Grid ID="NodeGrid" runat="server" DataKeyNames="SITE_ID,BRANCH_SEQ" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"   OnRowDataBound="NodeGrid_RowDataBound"  HorizontalAlign="Justify" Width="96%" meta:resourcekey="NodeGridResource1" >
        <Columns>
            <asp:TemplateField HeaderText="流程名稱" meta:resourcekey="TemplateFieldResource1">
                <edititemtemplate>
<asp:TextBox runat="server" Text='<%# Bind("FLOW_NAME") %>' ID="TextBox1" __designer:wfdid="w10" meta:resourcekey="TextBox1Resource1"></asp:TextBox>

</edititemtemplate>
                <itemtemplate>
<asp:LinkButton runat="server" ID="LinkButton1" Text='<%# Eval("FLOW_NAME") %>' __designer:wfdid="w6" meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>

</itemtemplate>
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
    &nbsp;
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetBranchSiteNodes"
        TypeName="Ede.Uof.WKF.Design.SetupFlowUCO" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="TbSiteId" ConvertEmptyStringToNull="False" Name="siteId"
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:TextBox ID="TbSiteId" runat="server" Visible="False" meta:resourcekey="TbSiteIdResource1"></asp:TextBox></td></tr>
</table>
<asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1" ></asp:Label>             

</asp:Content>

