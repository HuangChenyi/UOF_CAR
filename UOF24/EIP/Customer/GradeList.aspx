<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_GradeList" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="GradeList.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">

        function radToolBarClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "btnAdd":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/GradeEdit.aspx", args.get_item(), "<%= lblGradeAdd.Text %>", 320, 220, OpenDialogResult, { "Mode": "Insert" });
                break;
            case "btnDelete":
                var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                var choose = $('#<%= hiddenDelete.ClientID %>').val();//信息
                if (CheckedData == "") {
                    alert(choose);
                    args.set_cancel(true);
                    return;
                }
                else {
                    if (!window.confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
	                    args.set_cancel(true);
	                }
	            }
                break;
        }
        }
        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) === "undefined" || returnValue === null) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td valign="top" width="230px">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
                    <tr>
                        <td background="<%=themePath %>/images/tree_title.gif" style="height: 30px" width="100%">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" height="23" width="95%">
                                <tr>
                                    <td width="23">
                                        <div align="center">
                                            <img src="<%=themePath %>/images/icon04.gif" width="7" height="7">
                                        </div>
                                    </td>
                                    <td class="g">
                                        <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="主檔維護列表"></asp:Label></td>
                                    <td width="3">
                                        <img src="<%=themePath %>/images/tree_line01.gif" width="3" height="23"></td>
                                    <td background="<%=themePath %>/images/tree_line02.gif" style="height: 23px"></td>
                                </tr>
                            </table>
                        </td>
                        <td rowspan="2" valign="top" background="<%=themePath %>/images/tree_line04.gif"
                            style="width: 89%">
                            <img src="<%=themePath %>/images/tree_line03.gif" width="8" height="101"></td>
                    </tr>
                    <tr>
                        <td background="<%=themePath %>/images/tree_bg.gif" height="433" valign="top" width="100%">
                            <table width="100%" border="0" align="center" cellpadding="5" cellspacing="3">
                                <tr>
                                    <td valign="top" style="height: 50px">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"
                                            RenderMode="Inline">
                                            <contenttemplate>
                                                <telerik:RadTreeView ID="rdTree" runat="server" OnNodeClick="rdTree_NodeClick"></telerik:RadTreeView>
                                            </contenttemplate>
                                            <triggers>
                                                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" /> 
                                           </triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </td>

                    </tr>
                </table>
            </td>
            <td valign="top">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <contenttemplate>
                <div style="width:180">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%"  OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="radToolBarClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增等級" Value="btnAdd"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                               meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除等級" Value="btnDelete"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                meta:resourcekey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </div>
                  <Fast:Grid ID="grd" runat="server" AllowPaging="True" 
                        AutoGenerateCheckBoxColumn="True"  AutoGenerateColumns="False" 
                         DataKeyOnClientWithCheckBox="False" 
                          DataKeyNames="GRADE_ID" 
                               Width="100%"  AllowSorting="True" 
                        EnhancePager="True" PageSize="15" OnRowDataBound="grd_RowDataBound" 
                        DefaultSortDirection="Ascending" >
                            <EnhancePagerSettings ShowHeaderPager="True" />
                                  <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="等級名稱" SortExpression="GRADE_NAME" 
                                    meta:resourcekey="TemplateFieldResource1">
                                    <itemtemplate>
                <asp:LinkButton id="lbtn" runat="server" Text='<%# Eval("GRADE_NAME") %>' OnClick="lbtn_Click" 
                                            meta:resourcekey="lbtnResource1"></asp:LinkButton>
                
</itemtemplate>
                                    <itemstyle width="33%" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="等級" DataField="GRADE" SortExpression="GRADE" 
                                    meta:resourcekey="BoundFieldResource1" >
                                    <footerstyle width="10%" />
                                    <headerstyle width="10%" />
                                    <itemstyle width="10%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="備註" DataField="REMARK" 
                                    meta:resourcekey="BoundFieldResource2" >
                                    <footerstyle width="56%" />
                                    <headerstyle width="56%" />
                                    <itemstyle width="56%" />
                                </asp:BoundField>
                            </Columns>
                        </Fast:Grid>
                  <asp:ObjectDataSource id="ObjectDataSource1" runat="server" TypeName="Ede.Uof.EIP.Customer.UCO.CUSGradeUCO" StartRowIndexParameterName="intStartIndex" SortParameterName="strSortExpression" SelectMethod="GetGradeDataSet" SelectCountMethod="GetGradeDataSet_Count" OldValuesParameterFormatString="original_{0}" MaximumRowsParameterName="intMaxRows" EnablePaging="True">
                                <SelectParameters>
                                    <asp:Parameter Name="intStartIndex" Type="Int32" />
                                    <asp:Parameter Name="intMaxRows" Type="Int32" />
                                    <asp:Parameter Name="strSortExpression" Type="String" />
                </SelectParameters>
                            </asp:ObjectDataSource> 
                </contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <asp:HiddenField ID="hiddenDelete" runat="server" Value="沒有挑選要刪除的項目" />
    <asp:Label ID="lblCustClass" runat="server" Text="客戶類別" Visible="False"
        meta:resourcekey="lblCustClassResource1"></asp:Label>
    <asp:Label ID="lblGrade" runat="server" Text="客戶等級" Visible="False"
        meta:resourcekey="lblGradeResource1"></asp:Label>
    <asp:Label ID="lblIndustry" runat="server" Text="行業別" Visible="False"
        meta:resourcekey="lblIndustryResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="基礎資料維護 – 客戶等級" Visible="False"
        meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblEdit" runat="server" Text="修改等级" Visible="False"
        meta:resourcekey="lblEditResource1"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="主檔維護" Visible="False"
        meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:Label ID="lblArea" runat="server" Text="地區別" Visible="False"
        meta:resourcekey="lblAreaResource1"></asp:Label>
    <asp:Label ID="lblGradeAdd" runat="server" Text="新增等級" Visible="False"
        meta:resourcekey="lblGradeAddResource1"></asp:Label>


</asp:Content>

