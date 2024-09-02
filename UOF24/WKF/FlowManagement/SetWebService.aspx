<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetWebService" Title="Web Service設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetWebService.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style type="text/css">
        .topTableTD
        {
            background-color: #FFFFFF;
            height: 30px;
            border: 1px;
            border-style: solid;
            border-color: #868581;
        }

        .Table
        {
            background-color: white;
        }
    </style>

    <script type="text/javascript" id="telerikClientEvents1">

        function RadToolBar1_Clicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "ws_Set") {

                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Admin/EndFormCallBack_Dialog.aspx",args.get_item(),"",820,580,openDialogResult);
            }

        }

        function RadToolBar2_Clicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "add_Field") {
                <%
        if (Request.QueryString["Applicant"] == null)
        {
        %>
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/SelFieldList.aspx", args.get_item(), "", 700, 450, openDialogResult, {
                    "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formversionId"].ToString(), true)%>"),
                    "siteId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["siteId"].ToString(), true)%>"),
                    "parent_siteId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["parentSiteId"].ToString(), true)%>"),
                });
                <%
    }
        else
        {
        %>
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/SelFieldList.aspx", args.get_item(), "", 700, 450, openDialogResult, {
                    "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formversionId"].ToString(), true)%>"),
                    "Applicant": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["Applicant"].ToString(), true)%>")
                });
                <%
    }
        %>

                args.set_cancel(false);
            }
            if (value == "del_Field") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    args.set_cancel(true);
            }
            if (value == "seq_Field") {
                <%
        if (Request.QueryString["Applicant"] == null)
        {
        %>  
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/ChangeFieldSeq.aspx", args.get_item(), "", 400, 530, openDialogResult, {
                    "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formversionId"].ToString(), true)%>"),
                    "siteId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["siteId"].ToString(), true)%>"),
                    "parent_siteId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["parentSiteId"].ToString(), true)%>"),
                });
                <%
        }
        else
        {
        %>
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/ChangeFieldSeq.aspx", args.get_item(), "", 400, 530, openDialogResult, {
                    "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formversionId"].ToString(), true)%>"),
                    "Applicant": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["Applicant"].ToString(), true)%>")
                });
        <%
                }
        %>
                 args.set_cancel(false);
             }

        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>

    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="PopTable">
        <tr>
            <td class="PopTableHeader">
                <center>
                    <asp:Label ID="Label2" runat="server"
                        Text="Web Service設定" meta:resourcekey="Label2Resource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; padding: 0; margin: 0">
                <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_Clicking" meta:resourcekey="UltraWebToolbar2Resource1" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton runat="server"
                            DisabledImageUrl="~/App_Themes/DefaultTheme/images/wkf/site_SetWS.gif"
                            HoveredImageUrl="~/App_Themes/DefaultTheme/images/wkf/site_SetWS.gif"
                            Value="ws_Set"
                            CheckedImageUrl="~/App_Themes/DefaultTheme/images/wkf/site_SetWS.gif"
                            ImageUrl="~/App_Themes/DefaultTheme/images/wkf/site_SetWS.gif"
                            Text="設定Web Service資訊"
                            meta:resourceKey="btnSetWsSendResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                    </Items>

                </telerik:RadToolBar>

            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="PopTable">
        <tr>
            <td class="PopTableRightTD" style="text-align: left">
                <asp:CheckBox ID="chkValitor" runat="server"
                    Text="表單送出(簽核)前，需呼叫Web Service進行驗證，如驗證失敗，表單不允許送出："
                    meta:resourcekey="chkValitorResource1" />
                <asp:DropDownList ID="dropDownListValitor" runat="server"
                    meta:resourcekey="dropDownListValitorResource1">
                </asp:DropDownList>
                &nbsp;<asp:CustomValidator ID="cv_validate" runat="server" ErrorMessage="您未選取任何傳送的Web Service！" Display="Dynamic" meta:resourcekey="cv_validateMsgResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableRightTD" style="text-align: left">
                <asp:CheckBox ID="chkSend" runat="server"
                    Text="表單送出(簽核)後，需呼叫Web Service傳出表單內容：" AutoPostBack="True"
                    oncheckedchanged="chkSend_CheckedChanged" meta:resourcekey="chkSendResource1" />
                <asp:DropDownList ID="dropDownListSend" runat="server"
                    meta:resourcekey="dropDownListSendResource1">
                </asp:DropDownList>
                &nbsp;<asp:CustomValidator ID="cv_Send" runat="server" ErrorMessage="您未選取任何傳送的Web Service！" Display="Dynamic" meta:resourcekey="cv_validateMsgResource1"></asp:CustomValidator>
            </td>
        </tr>
        <asp:Panel ID="PanelDll" runat="server" meta:resourcekey="PanelDllResource1">
            <tr>
                <td class="PopTableRightTD" style="text-align: left">

                    <asp:CheckBox ID="cbDll" runat="server" Text="表單送出(簽核)後，需呼叫DLL：" meta:resourcekey="cbDllResource1" />
                    <asp:DropDownList ID="ddlDllList" runat="server"
                        meta:resourcekey="ddlDllListResource1">
                    </asp:DropDownList>
                    &nbsp;<asp:CustomValidator ID="cv_Dll" runat="server" ErrorMessage="您未選取任何傳送的DLL！" Display="Dynamic" meta:resourcekey="cv_DllMsgResource1"></asp:CustomValidator>

                </td>
            </tr>
        </asp:Panel>
        <tr style="border-style: solid; border-color: #868581; border: 1px">
            <td class="PopTableHeader">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <contenttemplate>
                    <center>
                <asp:Label ID="lblFieldInfo" runat="server" 
                Text="表單送出後，呼叫的Web Service，需傳送的欄位資訊" meta:resourcekey="lblFieldInfoResource1" 
                        Visible="False"></asp:Label>
                        </center>
                </contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>

    </table>
    <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <contenttemplate>
            <telerik:RadToolBar ID="RadToolBar2" Runat="server" Width="100%" OnClientButtonClicking="RadToolBar2_Clicking" OnButtonClick="RadToolBar2_ButtonClick" meta:resourcekey="UltraWebToolbar1Resource1" Visible="False" CausesValidation="false">

                <Items>
                    <telerik:RadToolBarButton runat="server" Value="add_Field" meta:resourceKey="TBarButtonResource1" 
                        Text="新增欄位">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="seq_Field" meta:resourceKey="TBarButtonResource2" 
                        Text="調整欄位順序">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="del_Field" meta:resourceKey="TBarButtonResource3" 
                        Text="刪除欄位">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </contenttemplate>
            <triggers>
            <asp:AsyncPostBackTrigger ControlID="chkSend" EventName="CheckedChanged" />
        </triggers>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <contenttemplate>
            <Fast:Grid ID="dgFormFields" runat="server" AllowSorting="True" 
    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" 
     DataKeyNames="FIELD_ID" 
    DataKeyOnClientWithCheckBox="False" 
    EnhancePager="True" PageSize="15"   
    Width="100%" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" 
                EnableModelValidation="True" KeepSelectedRows="False" 
                meta:resourcekey="dgFormFieldsResource2">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:BoundField DataField="FIELD_ID" HeaderText="欄位代號" 
                        meta:resourceKey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FIELD_NAME" HeaderText="欄位名稱" 
                        meta:resourceKey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FIELD_TYPE" HeaderText="欄位型態" 
                        meta:resourceKey="BoundFieldResource3">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
            </Fast:Grid>
            
        </contenttemplate>
            <triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar2" 
                EventName="ButtonClick" />
            <asp:AsyncPostBackTrigger ControlID="chkSend" EventName="CheckedChanged" />
        </triggers>
        </asp:UpdatePanel>
    </asp:Panel>

    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <contenttemplate>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ErrorMessage="請選擇相關欄位" Display="Dynamic" EnableTheming="True" 
                meta:resourcekey="CustomValidator1Resource1" Visible="False"></asp:CustomValidator>
            </contenttemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblSingleLineText" runat="server" Text="單行文字欄位" Visible="False" meta:resourcekey="lblSingleLineTextResource1"></asp:Label>
    <asp:Label ID="lblMultiLineText" runat="server" Text="多行文字欄位" Visible="False" meta:resourcekey="lblMultiLineTextResource1"></asp:Label>
    <asp:Label ID="lblNumberText" runat="server" Text="數值欄位" Visible="False" meta:resourcekey="lblNumberTextResource1"></asp:Label>
    <asp:Label ID="lblFileButton" runat="server" Text="檔案選取欄位" Visible="False" meta:resourcekey="lblFileButtonResource1"></asp:Label>
    <asp:Label ID="lblDateSelect" runat="server" Text="日期欄位" Visible="False" meta:resourcekey="lblDateSelectResource1"></asp:Label>
    <asp:Label ID="lblTimeSelect" runat="server" Text="時間欄位" Visible="False" meta:resourcekey="lblTimeSelectResource1"></asp:Label>
    <asp:Label ID="lblCheckBox" runat="server" Text="核選方塊" Visible="False" meta:resourcekey="lblCheckBoxResource1"></asp:Label>
    <asp:Label ID="lblRadioButton" runat="server" Text="單選鈕" Visible="False" meta:resourcekey="lblRadioButtonResource1"></asp:Label>
    <asp:Label ID="lblDropDownList" runat="server" Text="下拉式選單" Visible="False" meta:resourcekey="lblDropDownListResource1"></asp:Label>
    <asp:Label ID="lblDataGrid" runat="server" Text="明細欄位" Visible="False" meta:resourcekey="lblDataGridResource1"></asp:Label>
    <asp:Label ID="lblHyperLink" runat="server" Text="超連結" Visible="False" meta:resourcekey="lblHyperLinkResource1"></asp:Label>
    <asp:Label ID="lblCalculateText" runat="server" Text="表單計算欄位" Visible="False" meta:resourcekey="lblCalculateTextResource1"></asp:Label>
    <asp:Label ID="lblAggregateText" runat="server" Text="加總平均欄位" Visible="False" meta:resourcekey="lblAggregateTextResource1"></asp:Label>
    <asp:Label ID="lblUserProposer" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblUserProposerResource1"></asp:Label>
    <asp:Label ID="lblUserDept" runat="server" Text="申請者部門" Visible="False" meta:resourcekey="lblUserDeptResource1"></asp:Label>
    <asp:Label ID="lblUserRank" runat="server" Text="申請者職級" Visible="False" meta:resourcekey="lblUserRankResource1"></asp:Label>
    <asp:Label ID="lblAllDept" runat="server" Text="所有部門" Visible="False" meta:resourcekey="lblAllDeptResource1"></asp:Label>
    <asp:Label ID="lblAllRank" runat="server" Text="所有職級" Visible="False" meta:resourcekey="lblAllRankResource1"></asp:Label>
    <asp:Label ID="lblAllFunction" runat="server" Text="所有職務" Visible="False" meta:resourcekey="lblAllFunctionResource1"></asp:Label>
    <asp:Label ID="lblAllUser" runat="server" Text="所有人員" Visible="False" meta:resourcekey="lblAllUserResource1"></asp:Label>
    <asp:Label ID="lblHiddenField" runat="server" Text="隱藏欄位" Visible="False" meta:resourcekey="lblHiddenFieldResource1"></asp:Label>
    <asp:Label ID="lblAutoNumber" runat="server" Text="自動編號欄位" Visible="False" meta:resourcekey="lblAutoNumberResource1"></asp:Label>
</asp:Content>