<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_CommonMailSetting" Title="郵件樣板維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CommonMailSetting.aspx.cs" %>


<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <script type="text/javascript" id="telerikClientEvents1">
        var ddlAlertTypeSelectedValue;
        var ddlCultureSelectedValue;

        function RadToolBar1_Clicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "Insert") {//類別管理

                ddlAlertTypeSelectedValue = $("#<%=ddlAlertType.ClientID %>").val();
                ddlCultureSelectedValue = $("#<%=ddlCulture.ClientID %>").val();

                $uof.dialog.open2("~/WKF/FormManagement/MaintainMailInfo.aspx", args.get_item(), "", 1280, 1024, openDialogResult, {"ALERT_TYPE":ddlAlertTypeSelectedValue,"CULTURE":ddlCultureSelectedValue,"Mode":"Insert"});
            }

            if (value == "Delete") {
                if (confirm('<%=lblDelete.Text%>') == false) {
                    args.set_cancel(true);
                }
            }
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>


    <style type="text/css">
        td.JustAddBorder table tr td  {
            border-width: 1px;
            border-style: solid;
        }
    </style>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1" OnClientButtonClicking="RadToolBar1_Clicking" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">

                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="Button 0" Value="Temp">
                                    <ItemTemplate>
                                        <table id="Table1" width="100%" runat="server">
                                            <tr id="Tr1" runat="server">
                                                <td id="Td1" style="vertical-align: top; padding-left: 6px" runat="server">
                                                    <asp:Label ID="Label1" runat="server" Text="型態:" meta:resourcekey="Label1Resource1"></asp:Label>
                                                </td>
                                                <td id="Td2" valign="middle" runat="server">

                                                    <asp:DropDownList ID="ddlAlertType" runat="server" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlAlertType_SelectedIndexChanged" Width="130px"
                                                        meta:resourcekey="ddlAlertTypeResource1">
                                                        <asp:ListItem Value="ALL" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource2" Text="簽核通知"></asp:ListItem>
                                                        <asp:ListItem Value="1" meta:resourcekey="ListItemResource3" Text="表單知會"></asp:ListItem>
                                                        <asp:ListItem Value="2" meta:resourcekey="ListItemResource4" Text="表單結案"></asp:ListItem>
                                                        <asp:ListItem Value="3" meta:resourcekey="ListItemResource5" Text="表單作廢"></asp:ListItem>
                                                        <asp:ListItem Value="4" meta:resourcekey="ListItemResource6" Text="表單退簽"></asp:ListItem>
                                                        <asp:ListItem Value="12" meta:resourcekey="ListItemResource14" Text="表單退簽知會"></asp:ListItem>
                                                        <asp:ListItem Value="5" meta:resourcekey="ListItemResource7" Text="表單核准"></asp:ListItem>
                                                        <asp:ListItem Value="6" meta:resourcekey="ListItemResource8" Text="表單否決"></asp:ListItem>
                                                        <asp:ListItem Value="7" meta:resourcekey="ListItemResource9" Text="表單討論"></asp:ListItem>
                                                        <asp:ListItem Value="8" meta:resourcekey="ListItemResource10" Text="表單取回"></asp:ListItem>
                                                        <asp:ListItem Value="9" meta:resourcekey="ListItemResource11" Text="表單徵詢"></asp:ListItem>
                                                        <asp:ListItem Value="10" meta:resourcekey="ListItemResource12" Text="表單解除鎖定"></asp:ListItem>
                                                        <asp:ListItem Value="11" meta:resourcekey="ListItemResource13" Text="表單代填寫"></asp:ListItem>
                                                    </asp:DropDownList>

                                                </td>
                                                <td id="Td3" valign="middle" runat="server">
                                                    <asp:Label ID="Label2" runat="server" Text="語系:"
                                                        meta:resourcekey="Label2Resource1"></asp:Label>
                                                </td>
                                                <td id="Td4" valign="middle" runat="server">
                                                    <asp:DropDownList ID="ddlCulture" runat="server" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlCulture_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server"
                                    Value="Insert"
                                    Text="新增"
                                    meta:resourcekey="TBarButtonResource1"
                                    DisabledImageUrl="~/System/icon_images/icon_m02.gif"
                                    HoveredImageUrl="~/System/icon_images/icon_m02.gif"
                                    ImageUrl="~/System/icon_images/icon_m02.gif"
                                    CheckedImageUrl="~/System/icon_images/icon_m02.gif">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" Value="insertTBSep" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server"
                                    Value="Delete"
                                    Text="刪除"
                                    meta:resourcekey="TBarButtonResource2"
                                    DisabledImageUrl="~/System/icon_images/icon_m03.gif"
                                    HoveredImageUrl="~/System/icon_images/icon_m03.gif"
                                    ImageUrl="~/System/icon_images/icon_m03.gif"
                                    CheckedImageUrl="~/System/icon_images/icon_m03.gif">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" Value="last" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td >
                        <Fast:Grid ID="Grid1" runat="server" AllowSorting="True"
                            AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                            DataKeyNames="CULTURE,ALERT_TYPE"
                            DataKeyOnClientWithCheckBox="False"
                            EnhancePager="True" OnRowCommand="Grid1_RowCommand"
                            OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" PageSize="15"
                            Width="95%"
                            DefaultSortDirection="Ascending">
                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl=""
                                FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl=""
                                NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                                PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                PreviousImageUrl="" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:BoundField DataField="ALERT_TYPE" HeaderText="型態"
                                    SortExpression="ALERT_TYPE" meta:resourcekey="BoundFieldResource1">
                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CULTURE" HeaderText="語系" SortExpression="CULTURE"
                                    meta:resourcekey="BoundFieldResource2">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SUBJECT" HeaderText="郵件主旨" HtmlEncodeFormatString="false"
                                    meta:resourcekey="BoundFieldResource3">
                                    <ItemStyle Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="郵件內容" DataField="CONTENT" ItemStyle-CssClass="editorcontentstyle JustAddBorder"
                                    meta:resourcekey="BoundFieldResource4" HtmlEncode="False">
                                    <ItemStyle VerticalAlign="Top" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DEFAULT" HeaderText="預設"
                                    meta:resourcekey="BoundFieldResource5">
                                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td nowrap="nowrap">
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="lbtnEdit"
                                                        meta:resourcekey="lbtnEditResource1" Text="編輯"></asp:LinkButton>
                                                    &nbsp;
                                                </td>
                                                <td nowrap="nowrap">
                                                    <asp:LinkButton ID="lbtnDefault" runat="server" CommandName="lbtnDefault"
                                                        Enabled='<%# Bind("IS_SYS") %>' meta:resourcekey="lbtnDefaultResource1"
                                                        Text="回復初始設定"></asp:LinkButton>
                                                    <asp:Label ID="lblCulture" runat="server" Text='<%# Bind("CULTURE") %>'
                                                        Visible="False" meta:resourcekey="lblCultureResource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False"
                meta:resourcekey="lblDeleteResource1"></asp:Label>
            <asp:Label ID="lblTrue" runat="server" Text="是" Visible="False"
                meta:resourcekey="lblTrueResource1"></asp:Label>
            <asp:Label ID="lblFalse" runat="server" Text="否" Visible="False"
                meta:resourcekey="lblFalseResource1"></asp:Label>
            <asp:Label ID="lblSign" runat="server" Text="簽核通知" Visible="False"
                meta:resourcekey="lblSignResource1"></asp:Label>
            <asp:Label ID="lblAlert" runat="server" Text="表單知會" Visible="False"
                meta:resourcekey="lblAlertResource1"></asp:Label>
            <asp:Label ID="lblFinish" runat="server" Text="表單結案" Visible="False"
                meta:resourcekey="lblFinishResource1"></asp:Label>
            <asp:Label ID="lblCancel" runat="server" Text="表單作廢" Visible="False"
                meta:resourcekey="lblCancelResource1"></asp:Label>
            <asp:Label ID="lblBackSign" runat="server" Text="表單退簽" Visible="False"
                meta:resourcekey="lblBackSignResource1"></asp:Label>
            <asp:Label ID="lblTimeOut" runat="server" Text="表單逾時" Visible="False"
                meta:resourcekey="lblTimeOutResource1"></asp:Label>
            <asp:Label ID="lblAgree" runat="server" Text="表單核准" Visible="False"
                meta:resourcekey="lblAgreeResource1"></asp:Label>
            <asp:Label ID="lblReject" runat="server" Text="表單否決" Visible="False"
                meta:resourcekey="lblRejectResource1"></asp:Label>
            <asp:Label ID="lblDefault" runat="server" Text="確定要回復初始設定嗎?" Visible="False"
                meta:resourcekey="lblDefaultResource1"></asp:Label>
            <asp:Label ID="lblALL" runat="server" Text="全部" Visible="False"
                meta:resourcekey="lblALLResource1"></asp:Label>
            <asp:Label ID="lblFormForum" runat="server" Text="表單討論" Visible="False"
                meta:resourcekey="lblFormForumResource1"></asp:Label>
            <asp:Label ID="lblFormRetrieve" runat="server" Text="表單取回" Visible="False"
                meta:resourcekey="lblFormRetrieveResource1"></asp:Label>
            <asp:Label ID="lblFormInquiry" runat="server" Text="表單徵詢" Visible="False"
                meta:resourcekey="lblFormInquiryResource1"></asp:Label>
            <asp:Label ID="lblFormUnlock" runat="server" Text="表單解除鎖定" Visible="False"
                meta:resourcekey="lblFormUnlockResource1"></asp:Label>
            <asp:Label ID="lblFormApplyByDelegate" runat="server" Text="表單代填寫" Visible="False"
                meta:resourcekey="lblFormApplyByDelegateResource1"></asp:Label>
             <asp:Label ID="lblReturnSignAlert" runat="server" Text="表單退簽知會" Visible="False"
                meta:resourcekey="lblReturnSignAlertResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblAlertMsg" runat="server" Text="系統預設郵件樣板不可刪除" Visible="False"
        meta:resourcekey="lblAlertMsgResource1"></asp:Label>
</asp:Content>

