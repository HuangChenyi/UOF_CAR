<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Chat_Default" Title="對話室紀錄查詢" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>
<%@ Register src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" tagname="UC_BtnChoiceOnce" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript">
    function OnValueChanging(sender, args) {
        if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">  
    <ContentTemplate>    
        <table style="width: 100%; height:100%;">
            <tr>
                <td>
                    <telerik:RadToolBar ID="RadToolBar1" Runat="server" OnButtonClick="RadToolBar1_ButtonClick" Width="100%" meta:resourcekey="RadToolBar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="Button 0" Value="Period" meta:resourcekey="RadToolBarButtonResource1">
                                <ItemTemplate>
                                    <table  style="margin-left:2px;margin-right:2px;">
                                        <tr>
                                            <td>
                                                  <asp:Label ID="Label5" runat="server" Text="期間" meta:resourcekey="Label5Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="rdpDateStart" runat="server" AutoPostBack="true">
                                                   <DateInput runat="server" ClientEvents-OnValueChanging ="OnValueChanging"></DateInput>
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                &nbsp;<asp:Label ID="Label1" runat="server" Text="~" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="rdpDateEnd" runat="server" AutoPostBack="true">
                                                    <DateInput runat="server" ClientEvents-OnValueChanging ="OnValueChanging"></DateInput>
                                                </telerik:RadDatePicker>
                                            </td>
                                          
                                        </tr>
                                    </table>
                                   
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="Button 2" Value="RoomName" meta:resourcekey="RadToolBarButtonResource3">
                                <ItemTemplate>
                                    <table  style="margin-left:2px;margin-right:2px;">
                                        <tr>
                                            <td>
                                                 &nbsp;<asp:Label runat="server" Text="對話室名稱" meta:resourcekey="LabelResource1"></asp:Label> &nbsp;
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtRoomName" runat="server" meta:resourcekey="txtRoomNameResource1" Width="120px"></asp:TextBox>
                                            </td>
                                        
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="Button 4" Value="SelectMember" meta:resourcekey="RadToolBarButtonResource5">
                                <ItemTemplate>
                                    <table style="margin-left:2px;margin-right:2px;">
                                        <tr>
                                           
                                            <td>
                                             <asp:Label ID="lblMemberName" runat="server" BackColor="White"  BorderStyle="Solid" BorderWidth="1px" Height="1.8em" Width="110px" meta:resourcekey="lblMemberNameResource1"></asp:Label>
                                            </td>
                                            <td>
                                                   <asp:Label ID="lblMemberGuid" runat="server" Visible="False" meta:resourcekey="lblMemberGuidResource1"></asp:Label>
                                            </td>
                                         
                                            <td>
                                                 <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" ButtonText="選擇成員" meta:resourcekey="UC_BtnChoiceOnce1Resource1" />
                                            </td>
                                           
                                        </tr>
                                    </table>
                                       
                             
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m31.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m31.gif" ImageUrl="~/Common/Images/Icon/icon_m31.gif" Text="取消成員"
                               Enabled="False" Visible="False" Value="btnClearMember" meta:resourcekey="RadToolBarButtonResource6">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" meta:resourcekey="RadToolBarButtonResource7">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="查詢" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Value="btnQuery" meta:resourcekey="RadToolBarButtonResource8">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7" meta:resourcekey="RadToolBarButtonResource9">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                 
                </td>
            </tr>
            <tr style="vertical-align:top; height:480px;">
                <td>
                    <Fast:Grid ID="gridChatRoom" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateCheckBoxColumn="False" 
                        AutoGenerateColumns="False"  
                        DataKeyNames="ROOM_ID" DataKeyOnClientWithCheckBox="False" 
                        DefaultSortDirection="Descending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" 
                        onpageindexchanging="gridChatRoom_PageIndexChanging" 
                        onrowdatabound="gridChatRoom_RowDataBound" onsorting="gridChatRoom_Sorting" 
                        PageSize="15"   Width="100%"  meta:resourcekey="gridChatRoomResource1"  >
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="對話室名稱"
                                SortExpression="ROOM_NAME" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnRoomName" runat="server" Text='<%# Bind("ROOM_NAME") %>' meta:resourcekey="lbtnRoomNameResource1"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CHAIR_NAME" HeaderText="主席" SortExpression="CHAIR_NAME" meta:resourcekey="BoundFieldResource1" />
                            <asp:BoundField DataField="CREATE_DATE" HeaderText="開始時間"  SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource2" />
                            <asp:BoundField DataField="CLOSE_DATE" HeaderText="結束時間" meta:resourcekey="BoundFieldResource3" />
                            <asp:TemplateField HeaderText="結束原因" SortExpression="CLOSE_REASON" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblReason" runat="server" Text='<%# Bind("CLOSE_REASON") %>' meta:resourcekey="lblReasonResource1"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CLOSE_REASON") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="保存期限" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblDeadLine" runat="server" meta:resourcekey="lblDeadLineResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                </td>
            </tr>
        </table>

<br />

    </ContentTemplate>
</asp:UpdatePanel> 
    <asp:Label ID="lblMsgNull" runat="server" Text="正在使用" Visible="False" meta:resourcekey="lblMsgNullResource1"></asp:Label>
    <asp:Label ID="lblMsgNormal" runat="server" Text="正常關閉" Visible="False" meta:resourcekey="lblMsgNormalResource1"></asp:Label>
    <asp:Label ID="lblMsgTimeout" runat="server" Text="逾時" Visible="False" meta:resourcekey="lblMsgTimeoutResource1"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="對話室記錄" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
  
</asp:Content>

