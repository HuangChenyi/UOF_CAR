<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_QusProperty" Title="" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="QusProperty.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript" language="javascript">
        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/QUE/Design/QusPropertyMA.aspx", args.get_item(), "<%=lblType.Text%>", 500, 400, openDialogResult, { "Type": "Add" });
                break;
                case "Delete":
                    if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')){
                        var CheckedData = $uof.fastGrid.getChecked('<%= gridProperty.ClientID %>') ;
	                    var choose = '<%= lblSelectDelete.Text %>';//信息
	                    if(CheckedData == ""){
	                        args.set_cancel(true);
	                        return;
	                    }
	                    else{
	                        args.set_cancel(false);
	                    }
	                }
	                else{
	                    args.set_cancel(true);
	                } 
                break;
            }
        }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined') {
            return false;
        }
        return true;
    }
    </script>
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <table style="width: 100%">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBar1ButtonClicking" >
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="新增屬性" Value="Add"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                            meta:resourcekey="RadToolBarAddResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="刪除屬性" Value="Delete"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            meta:resourcekey="RadToolBarDeleteResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvMessage" runat="server" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
                <Fast:Grid ID="gridProperty" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                     DataKeyOnClientWithCheckBox="False" 
                     Width="100%" DataKeyNames="PROPERTY_GUID" AllowPaging="True"
                     EnhancePager="True" AllowSorting="True" PageSize="15"
                    OnRowDataBound="gridProperty_RowDataBound" HorizontalAlign="Center" 
                    >
                    <EnhancePagerSettings
                        ShowHeaderPager="True"></EnhancePagerSettings>
                    <Columns>
                        <asp:TemplateField HeaderText="屬性" 
                            SortExpression="TB_QUE_PROPERTIES.PROPERTY_GUID" 
                            meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnProperty" runat="server" Text='<%#: Eval("PROPERTY_NAME") %>'
                                    OnClick="lbtnProperty_Click" meta:resourcekey="lbtnPropertyResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="30%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="屬性值" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <div id='div_pro' runat="server" style=" word-wrap: break-word;overflow-x:visible;">
                                    <asp:Literal ID="ltr" runat="server" meta:resourcekey="ltrResource1"></asp:Literal>
                                </div>
                            </ItemTemplate>
                            <ItemStyle Width="70%" />
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                    OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetProperties_Count"
                    SelectMethod="GetProperties" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
                    TypeName="Ede.Uof.EIP.QUE.PropertiesUCO">
                    <SelectParameters>
                        <asp:Parameter Name="intStartIndex" Type="Int32" />
                        <asp:Parameter Name="intMaxRows" Type="Int32" />
                        <asp:Parameter Name="strSortExpression" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <asp:Label ID="lblType" runat="server" Text="新增/維護填寫人屬性" Visible="False" meta:resourcekey="lblTypeResource1"></asp:Label>
        <asp:HiddenField ID="hiddenDelete" runat="server" Value="請選擇要刪除的資料行" />
        <asp:Label ID="lblSelectDelete" runat="server" Text="請選擇要刪除的資料行" Visible="False" meta:resourcekey="llblSelectDeleteResource1"></asp:Label>
        <asp:Label ID="lblDelete" runat="server" Text="已被使用，不可以刪除" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
