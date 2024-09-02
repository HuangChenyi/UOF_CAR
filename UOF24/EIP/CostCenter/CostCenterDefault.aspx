<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_CostCenter_CostCenterDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CostCenterDefault.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
       function RadToolBar1_Click(sendser, args)
       {
           var value = args.get_item().get_value();
           if (value === "Add")
           {
               args.set_cancel(true);
               $uof.dialog.open2("~/EIP/CostCenter/CostCenterMaintain.aspx", args.get_item(), '', 500, 200, OpenDialogResult);               
           }
       }

       function ConfirmDelete()
        {
            var result = confirm('<%=Resources.Common.ConfirmDelete %>');
            var returnValue = $("#<%= hfReturnValue.ClientID %>").val(result);
        }

        function OpenDialogResult(returnValue)
        {
            if (typeof (returnValue) === 'undefined' || returnValue === null) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate >
         <telerik:RadToolBar ID="RadToolBar1" Runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_Click" meta:resourcekey="RadToolBar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
             <Items>
                 <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m71.png" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png" 
                     HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png" Text="新增" Value="Add" meta:resourcekey="RadToolBarButtonResource1">
                 </telerik:RadToolBarButton>
                 <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" meta:resourcekey="RadToolBarButtonResource2">
                 </telerik:RadToolBarButton>
             </Items>
         </telerik:RadToolBar>
  
    <Fast:Grid ID="costGrid" runat="server" AutoGenerateCheckBoxColumn="False" 
            AllowSorting="True" AutoGenerateColumns="False"  
            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
            EmptyDataText="沒有資料" EnhancePager="True" 
            KeepSelectedRows="False" PageSize="15"  
         
            onrowdatabound="costGrid_RowDataBound" Width="50%" 
                meta:resourcekey="costGridResource1"   >
    <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
 
    <Columns>
        <asp:TemplateField HeaderText="代碼" meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <asp:LinkButton ID="lbtnCost" runat="server" Text='<%#: Bind("COST_CENTER") %>' 
                    onclick="lbtnCost_Click" meta:resourcekey="lbtnCostResource1"></asp:LinkButton>
            </ItemTemplate>
            <HeaderStyle Width="5%" Wrap="False" />
        </asp:TemplateField>
        <asp:BoundField DataField="NAME" HeaderText="名稱" 
            meta:resourcekey="BoundFieldResource1" >
        <HeaderStyle Width="10%" Wrap="False" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="啟用" meta:resourcekey="TemplateFieldResource2">
            <ItemTemplate>
                <asp:Label ID="lblActive" runat="server" meta:resourcekey="lblActiveResource1"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Width="3%" Wrap="False" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
            <ItemTemplate>
            <table width="100%">
                <tr align="left">
                                    <td style="white-space:nowrap; width:40%;text-align:left">
                                        <asp:Panel ID="palUp" runat="server" meta:resourcekey="palUpResource1" Width="100%">
                                            <img id="Img1" src="~/Common/Images/Icon/icon_m113.png" runat="server" style="margin-left:4px"
                                                border="0" />
                                          <asp:LinkButton ID="lbtnUp" runat="server" CommandName="Up" CommandArgument='<%# Eval("COST_CENTER") %>'
                                                OnCommand="CommandBtn_Click" Text="往上移" meta:resourcekey="lbtnUpResource1"></asp:LinkButton>
                                        </asp:Panel>   
                                    </td>
                                    <td style="width:1px"></td>
                                    <td style="white-space:nowrap; width:40%;text-align:left">
                                        <asp:Panel ID="palDown" runat="server" meta:resourcekey="palDownResource1"  Width="100%">
                                            <img id="Img2" src="~/Common/Images/Icon/icon_m114.png" runat="server" style="margin-left:4px"
                                                border="0" />
                                            <asp:LinkButton ID="lbtnDown" runat="server" CommandName="Down" CommandArgument='<%# Eval("COST_CENTER") %>'
                                                OnCommand="CommandBtn_Click" Text="往下移" meta:resourcekey="lbtnDownResource1"></asp:LinkButton>
                                        </asp:Panel>
                                    
                                    </td>
                                    <td style="width:1px"></td>
                                    <td style="white-space:nowrap; width:30%;text-align:left">
                                        <asp:Panel ID="palDel" runat="server" meta:resourcekey="palDelResource1"  Width="100%">
                                            <img id="Img3" src="~/Common/Images/Icon/icon_m03.png" runat="server" style="margin-left:4px"
                                                border="0" />
                                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("COST_CENTER") %>'
                                                OnCommand="CommandBtn_Click" Text="刪除" 
                                                meta:resourcekey="lbtnDeleteResource1" onclientclick="ConfirmDelete()"></asp:LinkButton>
                                        </asp:Panel>
                                    </td>
                                </tr>
                              </table>
            </ItemTemplate>
           
            <HeaderStyle Width="15%" Wrap="False" />
           
        </asp:TemplateField>
    </Columns>
   
    </Fast:Grid>
    </ContentTemplate>
     </asp:UpdatePanel>
     <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" 
        meta:resourcekey="lblYesResource1"></asp:Label>
     <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" 
        meta:resourcekey="lblNoResource1"></asp:Label>
     <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False" 
        meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:HiddenField ID="hfReturnValue" runat="server" />

</asp:Content>

