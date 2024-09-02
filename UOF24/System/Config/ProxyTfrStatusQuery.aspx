<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master"
    AutoEventWireup="true" Inherits="System_Config_ProxyTfrStatusQuery"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ProxyTfrStatusQuery.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script language="javascript">
    function OnValueChanging(sender, args) {
      
        if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }
   
</script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="RBBCustom">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="lblQueryDate" runat="server" Text="傳送日期" meta:resourcekey="lblQueryDateResource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpDateStart" runat="server" AutoPostBack="true">
                                    <DateInput runat="server" ClientEvents-OnValueChanging ="OnValueChanging"></DateInput>
                                </telerik:RadDatePicker>
                            </td>
                            <td width="10px">
                                ~
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpDateEnd" runat="server" AutoPostBack="true">
                                    <DateInput runat="server" ClientEvents-OnValueChanging ="OnValueChanging"></DateInput>
                                </telerik:RadDatePicker>
                            </td>
                            <td width="10px">
                            </td>
                            <td>
                                <asp:Label ID="lblState1" runat="server" Text="狀態" meta:resourcekey="lblState1Resource1"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlState" runat="server">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">等待排程中</asp:ListItem>
                                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">等待上傳</asp:ListItem>
                                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource3">上傳中</asp:ListItem>
                                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource4">完成</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Query" Text="查詢" meta:resourcekey="TBarButtonResource1"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Fast:Grid ID="GridProxy" runat="server" AllowSorting="True" AllowPaging="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                EnhancePager="True" Width="100%" EmptyDataText="沒有資料"
                KeepSelectedRows="False" OnPageIndexChanging="GridProxy_PageIndexChanging" OnRowDataBound="GridProxy_RowDataBound"
                OnRowCommand="GridProxy_RowCommand" OnSorting="GridProxy_Sorting" meta:resourcekey="GridProxyResource1"
                PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""   >
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="檔案名稱" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblFileName" runat="server" Text='<%#: Eval("FILE_NAME") %>' meta:resourcekey="lblFileNameResource1"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                        <HeaderStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="原始檔案位置" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblSource" runat="server" Text='<%#: Eval("SOURCE") %>' meta:resourcekey="lblSourceResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="傳送檔案位置" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblTarget" runat="server" Text='<%#: Eval("TARGET") %>' meta:resourcekey="lblTargetResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblState" runat="server" Text='<%#: Eval("STATE") %>' ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="檔案路徑" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblFilePath" runat="server" Text='<%#: Eval("FILE_PATH") %>' meta:resourcekey="lblFilePathResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="傳送日期" SortExpression="SEND_TIME" meta:resourcekey="BoundFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SEND_TIME") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSendTime" runat="server" Text='<%# Bind("SEND_TIME", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="錯誤次數" meta:resourcekey="TemplateFieldResource6">
                        <ItemTemplate>
                            <asp:Label ID="lblErrorCount" runat="server" Text='<%#: Eval("TRY") %>' meta:resourcekey="lblErrorCountResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="建立日期" SortExpression="CREATE_TIME" meta:resourcekey="BoundFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CREATE_TIME") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreateTime" runat="server" Text='<%# Bind("CREATE_TIME", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="錯誤原因" meta:resourcekey="TemplateFieldResource7">
                        <ItemTemplate>
                            <asp:Label ID="lblError" runat="server" Text='<%#: Eval("ERROR") %>' meta:resourcekey="lblErrorResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Left"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="動作" meta:resourcekey="TemplateFieldResource8">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnClear" runat="server" Text='清除錯誤次數' meta:resourcekey="lbtnClearResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblWait" runat="server" Text="等待排程中" Visible="False" meta:resourcekey="lblWaitResource1"></asp:Label>
    <asp:Label ID="lblPrepare" runat="server" Text="等待上傳" Visible="False" meta:resourcekey="lblPrepareResource1"></asp:Label>
    <asp:Label ID="lblProcess" runat="server" Text="上傳中" Visible="False" meta:resourcekey="lblProcessResource1"></asp:Label>
    <asp:Label ID="lblDone" runat="server" Text="完成" Visible="False" meta:resourcekey="lblDoneResource1"></asp:Label>
</asp:Content>
