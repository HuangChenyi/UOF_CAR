<%@ Page Title="事件檢視" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="LogViewer.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Management.LogViewer" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden {
            display: none;
        }
    </style>
    <script type="text/javascript">

        // 按查詢後，動作名稱會跳回全部，故加這段，使查詢後會再跑一次OnActionTypeSelectedChange()
        Sys.Application.add_load(function () {
            OnActionTypeSelectedChange();
        });
        // 類別切換時，顯示對應動作名稱
        function OnActionTypeSelectedChange() {

            // 取得所選擇的動作類別
            var actionType = $("#<%=ddlActionType.ClientID%> > option:selected").val();

            // 取得動作名稱   
            var actionName = $("#<%=ddlActionName.ClientID%>");

            var originalActionName = $("#<%=hforiginalActionName.ClientID%>");

            //先記錄選取的項目到HiddenField
            $(originalActionName).val($('#<%=ddlActionName.ClientID%>' + ' > option:selected').val());

            //清空動作名稱下拉選單
            $(actionName).html("");

            // 加入對應項目到ddlActionName
            switch (actionType) {
                case 'SEND':
                    $(actionName).append($("<option></option>").val('ALL').html('全部'));
                    $(actionName).append($("<option></option>").val('APPROVE').html('核准'));
                    $(actionName).append($("<option></option>").val('BUILD').html('產生公文檔'));
                    break;

                case 'RECEIVE':
                    $(actionName).append($("<option></option>").val('ALL').html('全部'));
                    $(actionName).append($("<option></option>").val('RECEIVE').html('收文'));
                    $(actionName).append($("<option></option>").val('UPLOAD').html('起單'));
                    $(actionName).append($("<option></option>").val('DELETE').html('刪除'));
                    break;
            }
            // 如果ddlActionName裡面有任一項目與HiddenFeild選取的項目相符，則選取該項目
            $('#<%=ddlActionName.ClientID%>' + ' > option').each(function () {
                if ($(originalActionName).val() !== null && $(this).val() === $(originalActionName).val()) {
                    $(this).attr('selected', 'selected');
                }
            });
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <%-- 查詢 Button--%>
            <telerik:RadToolBar ID="rtbLogViewer" runat="server" OnButtonClick="rtbLogViewer_ButtonClick" Width="100%" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton Text="查詢" Value="Query" runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sKeyword" />

                    <telerik:RadToolBarButton runat="server" Value="CheckBox" meta:resourcekey="RadToolBarButtonResource7">
                        <ItemTemplate>
                            <asp:Label ID="lblFourteenDayTip" Text="可查詢六個月內的記錄" ForeColor="Blue" runat="server"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <%-- 欄位條件 --%>
            <table class="PopTable">
                <%-- 動作日期 + 類別 --%>
                <tr>
                    <td>
                        <asp:Label ID="lblActionDate" runat="server" Text="動作日期"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="rdpActionStartDate" runat="server"></telerik:RadDatePicker>
                        <asp:Label ID="Label5" runat="server" Text="~"></asp:Label>
                        <telerik:RadDatePicker ID="rdpActionEndDate" runat="server"></telerik:RadDatePicker>
                    </td>
                    <td>
                        <asp:Label ID="lblType" runat="server" Text="類別"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlActionType" onchange="OnActionTypeSelectedChange()" Width="200px" runat="server">
                            <asp:ListItem Text="收文" Value="RECEIVE"></asp:ListItem>
                            <asp:ListItem Text="發文" Value="SEND"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <%-- 動作者 + 動作 --%>
                <tr>
                    <td>
                        <asp:Label ID="lblActionUser" runat="server" Text="動作者"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbActionUser" Width="400px" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblActionName" runat="server" Text="動作"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlActionName" Width="200px" runat="server">
                            <asp:ListItem Text="全部" Value="ALL"></asp:ListItem>
                            <asp:ListItem Text="收文" Value="RECEIVE"></asp:ListItem>
                            <asp:ListItem Text="起單" Value="UPLOAD"></asp:ListItem>
                            <asp:ListItem Text="刪除" Value="DELETE"></asp:ListItem>
                            <asp:ListItem Text="核准" Value="APPROVE"></asp:ListItem>
                            <asp:ListItem Text="產生公文檔" Value="BUILD"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <%-- 關鍵字 --%>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="機關名稱"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSendUnitName" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblKeyword" runat="server" Text="關鍵字"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbKeyWord" Width="400px" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <%-- Grid --%>
            <Ede:Grid ID="grdActionLogViewer" runat="server" Width="100%" DataKeyNames="LOG_ID"
                EmptyDataText="沒有資料" PageSize="15" EnhancePager="True" AutoGenerateColumns="False"
                AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                OnSorting="grdActionLogViewer_Sorting"
                OnRowDataBound="grdActionLogViewer_RowDataBound"
                OnBeforeExport="grdActionLogViewer_BeforeExport"
                OnPageIndexChanging="grdActionLogViewer_PageIndexChanging"
                DefaultSortColumnName="ACTION_TIME" DefaultSortDirection="Descending"
                CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False"
                KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="">
                <ExportExcelSettings AllowExportToExcel="True" />
                <EnhancePagerSettings ShowHeaderPager="True" />
                <Columns>
                    <asp:BoundField DataField="LOG_ID" SortExpression="LOG_ID" HeaderText="Log代碼Hidden">
                        <HeaderStyle CssClass="cssHidden" />
                        <ItemStyle CssClass="cssHidden" />
                    </asp:BoundField>

                    <asp:BoundField DataField="DOC_ID" SortExpression="DOC_ID" HeaderText="公文代碼Hidden">
                        <HeaderStyle CssClass="cssHidden" />
                        <ItemStyle CssClass="cssHidden" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="類別" SortExpression="ACTION_TYPE" HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lblActionType" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>

                    <asp:BoundField DataField="ORG_NAME" SortExpression="ORG_NAME" HeaderText="機關名稱" HeaderStyle-Wrap="false">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>

                    <asp:BoundField DataField="NUMBER_STRING" HeaderText="發文字號" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>

                    <asp:BoundField DataField="SUBJECT" HeaderText="主旨/事由" HeaderStyle-Wrap="false">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="動作" SortExpression="ACTION_NAME" HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lblActionName" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="動作者" SortExpression="ACTION_USER_DISPLAYNAME" HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lblActionUserDisplayName" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="動作時間" SortExpression="ACTION_TIME" HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lblActionTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>

            <asp:HiddenField ID="hfPageIndex" runat="server" Value="0" />
            <asp:HiddenField ID="hfNowSortColumnName" runat="server" />
            <asp:HiddenField ID="hfNowSortDirection" runat="server" />

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblPlaceHolder" runat="server" Text="可搜尋發文字號、公文主旨或事由" CssClass="cssHidden"></asp:Label>
    
    <%-- ActionType + ActionName用 --%>
    <asp:Label ID="lblReceive" runat="server" Text="收文" Visible="false"></asp:Label>
    <asp:Label ID="lblSend" runat="server" Text="發文" Visible="false"></asp:Label>
    <asp:Label ID="lblUpload" runat="server" Text="起單" Visible="false"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="刪除" Visible="false"></asp:Label>
    <asp:Label ID="lblApprove" runat="server" Text="核准" Visible="false"></asp:Label>
    <asp:Label ID="lblBuild" runat="server" Text="產生公文檔" Visible="false"></asp:Label>

    <asp:HiddenField ID="hforiginalActionName" runat="server" />
</asp:Content>
