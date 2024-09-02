<%@ Page Language="C#" Title="匯入題目" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ImportItem" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="ImportItem.aspx.cs" %>


<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../Common/UC_QusCategory.ascx" TagName="UC_QusCategory" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      <script type="text/javascript">
          function TwoColumnRadsplitter1_onLoad(sender) {
         
          }
          
         
      </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadSplitter ID="Radsplitter1" runat="server" Orientation="Horizontal"
                Width="100%" PanesBorderSize="0" Height="100%"
                BorderSize="0" LiveResize="True" ResizeWithParentPane="True"
                ResizeWithBrowserWindow="True" OnClientLoad="TwoColumnRadsplitter1_onLoad" >
                <telerik:RadPane ID="Radpane12" runat="server" Scrolling="none">
                    <telerik:RadSplitter ID="Radsplitter2" runat="server" Height="100%" LiveResize="True" Width="100%">
                        <telerik:RadPane ID="leftPane" runat="server" Width="300px" Height="100%" Scrolling="None">
                            <div class="LeftPaneBackground">
                                <telerik:RadSplitter ID="Radsplitter3" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                                    BorderSize="0" PanesBorderSize="0" LiveResize="True" ResizeWithParentPane="True" OnClientLoad="TwoColumnRadsplitter1_onLoad"
                                    ResizeWithBrowserWindow="True">
                                    <telerik:RadPane ID="leftDownPane" runat="server" Height="100%">
                                        <div id="leftTopPane" runat="server" class="LeftPaneTitle">
                                            <asp:Label ID="lbltitle" runat="server" Text="問卷類別" meta:resourcekey="lbltitleResource1"></asp:Label>
                                        </div>

                                        <uc1:UC_QusCategory ID="UC_QusCategory1" runat="server" />

                                    </telerik:RadPane>
                                </telerik:RadSplitter>
                            </div>
                        </telerik:RadPane>
                        <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward">
                        </telerik:RadSplitBar>
                        <telerik:RadPane ID="Radpane2" runat="server">
                           
                                <table class="PopTable" style="width: 100%;">
                                    <tr>
                                        <td style="white-space: nowrap;">
                                            <asp:Label ID="lblQus" runat="server" meta:resourcekey="lblQusResource1" Text="問卷名稱："></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlQus" runat="server" AutoPostBack="True" meta:resourcekey="ddlQusResource1" OnSelectedIndexChanged="ddlQus_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <Fast:Grid ID="gridItems" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyNames="ITEM_GUID" DataKeyOnClientWithCheckBox="False" EnhancePager="True" OnRowDataBound="gridItems_RowDataBound" PageSize="15" Width="100%"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="gridItemsResource2"  >
                                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:BoundField DataField="ITEM_NAME" HeaderText="題目" meta:resourcekey="BoundFieldResource1">
                                            <ItemStyle Width="70%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ITEM_TYPE" HeaderText="題型" meta:resourcekey="BoundFieldResource2">
                                            <ItemStyle Width="30%" />
                                        </asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                          
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows" OldValuesParameterFormatString="original_{0}" SelectCountMethod="QueryItems_Count" SelectMethod="QueryItems" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusItemUCO">
                <SelectParameters>
                    <asp:Parameter Name="designMasterGuid" />
                    <asp:Parameter Name="intStartIndex" />
                    <asp:Parameter Name="intMaxRows" />
                    <asp:Parameter Name="strSortExpression" />
                </SelectParameters>
            </asp:ObjectDataSource>

     </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblSC" runat="server" Text="單選" Visible="False"
        meta:resourcekey="lblSCResource1"></asp:Label>
    <asp:Label ID="lblMS" runat="server" Text="多選" Visible="False"
        meta:resourcekey="lblMSResource1"></asp:Label>
    <asp:Label ID="lblST" runat="server" Text="單行文字" Visible="False"
        meta:resourcekey="lblSTResource1"></asp:Label>
    <asp:Label ID="lblMT" runat="server" Text="多行文字" Visible="False"
        meta:resourcekey="lblMTResource1"></asp:Label>
    <asp:Label ID="lblSM" runat="server" Text="摘要說明" Visible="False"
        meta:resourcekey="lblSMResource1"></asp:Label>
    <asp:HiddenField ID="hiddenCategoryGuid" runat="server" />
    <asp:Label ID="lblQusDesignGuid" runat="server" Visible="False"
        meta:resourcekey="lblQusDesignGuidResource1"></asp:Label>
    <asp:Label ID="lbloldQusDesignGuid" runat="server" Visible="False"
        meta:resourcekey="lbloldQusDesignGuidResource1"></asp:Label>

    <asp:Label ID="lblDT" runat="server" Text="日期欄位" Visible="False"
        meta:resourcekey="lblDTResource1"></asp:Label>
</asp:Content>

