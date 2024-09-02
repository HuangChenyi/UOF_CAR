<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Settlement_Stage_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    
                    var settid = $("#<%=hfSettID.ClientID%>").val();

                    $uof.dialog.open2("~/EIP/Duty/Settlement/Stage/add.aspx", args.get_item(), "", 480, 380, openDialogResult, { "sett": settid});
                    break;
            }
        }

        function RadToolBar2ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);

                    $uof.dialog.open2("~/EIP/Duty/Settlement/Stage/AddSETT.aspx", args.get_item(), "", 480, 450, openDialogResult);
                    break;
                case "Import":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Duty/Settlement/Stage/ImportSETT.aspx", args.get_item(), "", 600, 500, openDialogResult);
                    break;
            }
        }
        function openDialogResult(returnValue) {
            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }
    </script>
    <style>
        .cursor {
         cursor: pointer; }
    </style>
    <telerik:RadTabStrip ID="rdSettStageTab" runat="server" SelectedIndex="0" MultiPageID="rdMultiPage" meta:resourcekey="rdSettStageTabResource1">
        <Tabs>
            <telerik:RadTab runat="server" Text="期別處理" Value="tabStage" PageViewID="rdStagePageView" meta:resourcekey="tabStageResource1"  Selected="True"></telerik:RadTab>
            <telerik:RadTab runat="server" Text="類別維護" Value="tabSETT" PageViewID="rdSETTPageView" meta:resourcekey="tabSETTResource1" ></telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="rdMultiPage" runat="server" BackColor="White" meta:resourcekey="rdMultiPageResource1" SelectedIndex="0">
        <telerik:RadPageView ID="rdStagePageView" runat="server" Width="100%" meta:resourcekey="rdStagePageViewResource1" Selected="True">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
                <ContentTemplate>
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBarButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblSETT" runat="server" Text="類別:" meta:resourcekey="lblSETTResource1"></asp:Label>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="SETT" meta:resourcekey="RadToolBarButtonResource2">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlSETT" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSETT_SelectedIndexChanged" meta:resourcekey="ddlSETTResource1" >
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource4">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="年度:" meta:resourcekey="RadToolBarYearResource1"></asp:Label>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="Years" meta:resourcekey="RadToolBarButtonResource5">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlYears" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYears_SelectedIndexChanged" meta:resourcekey="ddlYearsResource1">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                                ImageUrl="~/Common/Images/Icon/icon_m71.png"
                                meta:resourcekey="RadToolBarAddResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource7"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="重新整理" Value="Refresh"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m38.png"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m38.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m38.png"
                                ImageUrl="~/Common/Images/Icon/icon_m38.png"
                                meta:resourcekey="RadToolBarRefreshResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource8"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                        DataKeyNames="YEAR,STAGE" DataKeyOnClientWithCheckBox="False"
                        DefaultSortDirection="Ascending" EnableModelValidation="True" EnhancePager="False"
                        OnRowDataBound="Grid1_RowDataBound" PageSize="15"
                        Width="100%" KeepSelectedRows="False" OnRowCommand="Grid1_RowCommand"
                        AllowSorting="True" EmptyDataText="沒有資料"
                        meta:resourcekey="Grid1Resource1" >
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:TemplateField HeaderText="期別" ShowHeader="False"
                                meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Width="100%"
                                        Text='<%#: Eval("STAGE") %>' meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="START_DATE" HeaderText="開始日期"
                                DataFormatString="{0:d}" meta:resourcekey="BoundFieldResource1" />
                            <asp:BoundField DataField="END_DATE" HeaderText="結束日期" DataFormatString="{0:d}"
                                meta:resourcekey="BoundFieldResource2" />
                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                [<asp:LinkButton ID="lbtnLock" runat="server" CommandName="Lock" Text="鎖單"
                                                    CommandArgument='<%#: Eval("STAGE") %>' meta:resourcekey="lbtnLockResource1" />]
                                                [<asp:LinkButton ID="lbtnSettle" runat="server" CommandName="Settle" CommandArgument='<%#: Eval("STAGE") %>'
                                                    Text="結算" meta:resourcekey="lbtnSettleResource1" />]
                                                [<asp:LinkButton ID="lbtnUnLock" runat="server" CommandName="Unlock" Text="解鎖"
                                                    CommandArgument='<%#: Eval("STAGE") %>' meta:resourcekey="lbtnUnLockResource1" />]
                                                [<asp:LinkButton ID="lbtnClose" runat="server" CommandName="Close" Text="關帳"
                                                    CommandArgument='<%#: Eval("STAGE") %>' meta:resourcekey="lbtnCloseResource1" />]
                                                [<asp:LinkButton ID="lbtnOpen" runat="server" CommandName="Open" Text="開帳"
                                                    CommandArgument='<%#: Eval("STAGE") %>'  meta:resourcekey="lbtnOpenResource1"/>]
                                            </td>
                                            <td style="width:30px"></td>
                                            <td><asp:Label  CssClass="SizeMemo" ID="lblModifyTime" runat="server" Text=""> </asp:Label></td>
                                        </tr>
                                    </table>
                                     <asp:Label ID="lbSettleStatus" runat="server" Text="結算狀態:" Visible="False"
                                                    meta:resourcekey="lbSettleStatusResource1"></asp:Label>
                                                <asp:Label ID="lbStatusText" runat="server"
                                                    meta:resourcekey="lbStatusTextResource1"></asp:Label>
                                    <asp:CustomValidator ID="cvClose" runat="server" ErrorMessage="關帳失敗!!" Display="Dynamic" meta:resourcekey="cvCloseResource1"></asp:CustomValidator>
                                    
                                    <asp:Label ID="lbErrorMessage" runat="server" ForeColor="Red"
                                        Text="<br/>此期別區間尚有{0}筆未完成簽核的差勤表單，請先將表單結案後再重新關帳:"
                                        Visible="False" meta:resourcekey="lbErrorMessageResource1"></asp:Label>
                                    <asp:HyperLink ID="HyperLinkQueryForm" runat="server" Visible="False" Text="表單簽核統計(管理員)"
                                        Target="_blank" CssClass="cursor"  meta:resourcekey="HyperLinkQueryFormResource1" ForeColor="Blue"></asp:HyperLink>
                                    <asp:CustomValidator ID="cvCheckDelete" runat="server" ErrorMessage="只允許刪除未關帳的期別" Display="Dynamic"></asp:CustomValidator>

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                    <asp:HiddenField ID="hfSettID" runat="server" />
                    <asp:HiddenField ID="hfLastCloseYear" runat="server" />
                    <asp:HiddenField ID="hfLastCloseStage" runat="server" />
                    <asp:HiddenField ID="hfIsSett" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Label ID="lbStatus1" runat="server" Text="等候處理中,請稍候." Visible="False"
                meta:resourcekey="lbStatus1Resource1"></asp:Label>
            <asp:Label ID="lbStatus2" runat="server" Text="處理中,請稍候." Visible="False"
                meta:resourcekey="lbStatus2Resource1"></asp:Label>
            <asp:Label ID="lbStatus3" runat="server" Text="失敗,請洽系統管理員" Visible="False"
                meta:resourcekey="lbStatus3Resource1"></asp:Label>
            <asp:Label ID="lbStatus4" runat="server" Text="完成" Visible="False"
                meta:resourcekey="lbStatus4Resource1"></asp:Label>
            <asp:Label ID="lbConfirm1" runat="server" Text="確定要結算嗎?" Visible="False"
                meta:resourcekey="lbConfirm1Resource1"></asp:Label>
            <asp:Label ID="lbConfirm2" runat="server" Text="確定要關帳嗎?" Visible="False"
                meta:resourcekey="lbConfirm2Resource1"></asp:Label>    
            <asp:Label ID="lbtnOpenConfirm" runat="server" Text="開帳時如有最新一筆期別則會先刪除，確定要開帳嗎?" Visible="False" meta:resourcekey="lbtnOpenConfirmResource1"></asp:Label>

            <asp:Label ID="lblModifyTitle" runat="server" Text="最後更新時間" Visible="False" meta:resourcekey="lblModifyTitleResource1"></asp:Label>
        </telerik:RadPageView>
        <telerik:RadPageView ID="rdSETTPageView" runat="server" Width="100%" meta:resourcekey="rdSETTPageViewResource1">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline">
                <ContentTemplate>
                    <telerik:RadToolBar ID="RadToolBar2" runat="server" Width="100%" OnClientButtonClicking="RadToolBar2ButtonClicking" OnButtonClick="RadToolBar2_OnButtonClick" meta:resourcekey="RadToolBar2Resource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                                ImageUrl="~/Common/Images/Icon/icon_m71.png"
                                meta:resourcekey="RadToolBarAddResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource9"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="匯入" Value="Import"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m110.png"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m110.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m110.png"
                                ImageUrl="~/Common/Images/Icon/icon_m110.png"
                                meta:resourcekey="RadToolBarImportResource">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource9"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                    <Fast:Grid ID="Grid2" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                        DataKeyNames="SETT_ID" DataKeyOnClientWithCheckBox="False"
                        DefaultSortDirection="Ascending" EnhancePager="False"
                        OnRowDataBound="Grid2_RowDataBound" PageSize="15"
                        Width="100%" KeepSelectedRows="False" 
                        EmptyDataText="沒有資料"
                        meta:resourcekey="Grid2Resource1" AllowSorting="True" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>

                            <asp:TemplateField HeaderText="類別" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnSETT" runat="server" 
                                        Text='<%#: Eval("SETT_NAME") %>' meta:resourcekey="lbtnSETTResource1" ></asp:LinkButton>                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SETT_TIME" HeaderText="結算時間" meta:resourcekey="BoundFieldResource3" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="結算時區" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblTimeZone" runat="server" Text='<%#: Bind("TIME_ZONE") %>' meta:resourcekey="lblTimeZoneResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="REMARK" HeaderText="備註" meta:resourcekey="BoundFieldResource4" />

                        </Columns>
                    </Fast:Grid>
                    <asp:Label ID="lblSettTitle" runat="server" Text="結算類別維護" Visible="False"
                        meta:resourcekey="lblSettTitleResource1"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>

