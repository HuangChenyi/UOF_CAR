<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="Common_GlobalSearch" Trace="false" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="GlobalSearch.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .titlecss {
           font-size: larger;
           font-weight: bold;        
        }
        .showPrompt {
            padding-top: 10%;
        }
   </style>
    <script type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args) {

            var Key = args.get_item().get_value();

            if (Key == "AdvanceSearch") {
                var keywordCid=$uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hfKeyworCID.Value,true)%>')
                var keyword = $("#" +keywordCid).val();
                if (keyword == "") {
                    alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                } else {
                    var msg = checkStrPass(keyword, "Normal");
                    if (msg != "PASS") {
                        alert('<%=lblErrmsg.Text %>' + msg);
                        args.set_cancel(true);
                    }
                }
            }
        }

        /// <summary> 
        /// 檢查是否有特殊字元
        /// </summary> 
        function checkStrPass(str, source) {
            var illegalch;
            if (source == "Normal")
                illegalCh = new Array("\'", "\''\'", "\"\"", ">", "<", ";", "+", "--", "/\"", ":", "/", "\\"); // 特殊字元
            else {

                illegalCh = new Array("\'", "\''\'", "\"\"", ">", "<", ";", "+", "--", "*", "/\"", "?", "|", "\"", "*", ":", "/", "\\", "&"); // 特殊字元
            }
            var sqlCmd = new Array("select", "update", "insert", "union", "delete", "drop"); // sql指令
            var msg = "";

            if (typeof (str) !== 'undefined' && str != "" && str.length > 0) {
                for (var key in illegalCh) { // 先檢查特殊字元
                    if (str.indexOf(illegalCh[key]) != -1) {
                        if (msg == "") {
                            msg += illegalCh[key];
                        } else {
                            msg += (" " + illegalCh[key]);
                        } // end else

                    } // end if
                } // end for()

                str = str.toLowerCase(); // 統一轉小寫比較
                for (var key in sqlCmd) { // 再檢查sql指令
                    var address = str.indexOf(sqlCmd[key]);
                    if (address == 0) { // 在起始位置發現，檢查下個字元是否為空白
                        if (str.charAt(sqlCmd[key].length) == " ") { // 是空白
                            if (msg == "") {
                                msg += sqlCmd[key];
                            } else {
                                msg += (" " + sqlCmd[key]);
                            } // end else
                        } // end if
                    } else if (address > 0) { // 在中間發現，分別檢查上下字元是否為空白
                        if (str.charAt(address - 1) == " ") { // 上個字元是空白
                            if (str.length == address + sqlCmd[key].length) { // 他在字串最末端，後面不用檢查了
                                if (msg == "") {
                                    msg += sqlCmd[key];
                                } else {
                                    msg += (" " + sqlCmd[key]);
                                } // end else
                            } else { // 在字串中間，要檢查下一個
                                if (str.charAt(address + sqlCmd[key].length) == " ") { // 前後都空白-->非法
                                    if (msg == "") {
                                        msg += sqlCmd[key];
                                    } else {
                                        msg += (" " + sqlCmd[key]);
                                    } // end else
                                } // end if
                            } // end else
                        } // end if
                    } // end else if
                } // end for()

                // 有找到可疑輸入回傳msg，否則回傳true
                if (msg != "") {
                    return msg;
                } else {
                    return "PASS";
                } // end else
            } else {
                return "PASS";
            } // end else

        } // end checkStrPass()
</script>
    <asp:Panel ID="plGlobalSearch" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
            <tr>
                <td style="vertical-align: top; width: 80%;">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking"
                                            OnButtonClick="RadToolBar1_ButtonClick">
                                            <Items>
                                                <telerik:RadToolBarButton runat="server" Value="DDL">
                                                    <ItemTemplate>
                                                        <table>
                                                            <tr>
                                                                <td style="padding-left: 2px; padding-right: 1px">
                                                                    <asp:DropDownList ID="ddlSiteName" runat="server" Width="120px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="padding-left: 2px; padding-right: 1px">
                                                                    <asp:DropDownList ID="ddlSearchItem" runat="server" Width="120px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" IsSeparator="True">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" Value="Querystr">
                                                    <ItemTemplate>
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="padding-left: 2px; padding-right: 1px">
                                                                    <telerik:RadDatePicker ID="WebDateChooserBegin" runat="server">
                                                                    </telerik:RadDatePicker>
                                                                </td>
                                                                <td style="padding-left: 2px; padding-right: 1px">
                                                                    <asp:Label runat="server" ID="Label1">~</asp:Label>
                                                                </td>
                                                                <td style="padding-left: 2px; padding-right: 1px">
                                                                    <telerik:RadDatePicker ID="WebDateChooserEnd" runat="server">
                                                                    </telerik:RadDatePicker>
                                                                </td>
                                                                <td style="padding-left: 2px; padding-right: 1px">
                                                                    <asp:TextBox ID="Keyword" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" IsSeparator="True">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                    Value="AdvanceSearch" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                    Text="搜尋" meta:resourcekey="TBarButtonResource9">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" IsSeparator="True">
                                                </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" Value="Text">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Text" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:RadToolBarButton>
                                            </Items>
                                        </telerik:RadToolBar>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <style>
                                    OL {
                                        padding-right: 0px;
                                        padding-left: 0px;
                                        padding-bottom: 0px;
                                        margin: 0px;
                                        padding-top: 0px;
                                        font-family: arial,sans-serif;
                                    }

                                    .med {
                                        padding-right: 0px;
                                        padding-left: 0px;
                                        font-size: 16px;
                                        padding-bottom: 0px;
                                        margin: 0px;
                                        padding-top: 0px;
                                    }

                                    OL LI {
                                        list-style-type: none;
                                        margin: 8px;
                                        list-style-position: outside;
                                    }

                                    H3 {
                                        padding-right: 0px;
                                        padding-left: 0px;
                                        font-size: 16px;
                                        padding-bottom: 0px;
                                        margin: 0px;
                                        padding-top: 0px;
                                    }

                                        H3 A SPAN {
                                            font-size: 16px;
                                            text-decoration: underline;
                                        }

                                    .m {
                                        font-size: 13px;
                                        color: #676767;
                                        font-weight: normal;
                                    }

                                    .ss {
                                        font-size: 13px;
                                        color: #676767;
                                        font-weight: normal;
                                        font-weight: bold;
                                    }

                                    .g {
                                        margin: 1em;
                                        color: #000000;
                                    }

                                    LI DIV {
                                        font-weight: normal;
                                    }

                                    EM {
                                        color: #c03;
                                        font-style: normal;
                                    }
                                </style>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <div>
                                            <ol>
                                                <cc1:Grid ID="Grid22" runat="server" AutoGenerateCheckBoxColumn="False" AllowPaging="True"
                                                    EnhancePager="True" DataKeyOnClientWithCheckBox="False"
                                                    PageSize="15" DefaultSortDirection="Ascending"
                                                    DefaultSortColumnName="" GridLines="None" ShowHeader="False" OnSorting="Grid22_Sorting"
                                                    AllowSorting="True" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px"
                                                    OnRowDataBound="Grid22_RowDataBound" Width="100%" OnPageIndexChanging="Grid22_PageIndexChanging">
                                                    <ExportExcelSettings AllowExportToExcel="false" ExportType="GridContent" />
                                                    <EnhancePagerSettings FirstAltImageUrl="~/App_Themes/SecondTheme/images/grid/arrow_01.gif"
                                                        FirstImageUrl="~/App_Themes/SecondTheme/images/grid/arrow_01.gif" LastAltImage="~/App_Themes/SecondTheme/images/grid/arrow_04.gif"
                                                        LastImageUrl="~/App_Themes/SecondTheme/images/grid/arrow_04.gif" NextImageUrl="~/App_Themes/SecondTheme/images/grid/arrow_03.gif"
                                                        PreviousImageUrl="~/App_Themes/SecondTheme/images/grid/arrow_02.gif" NextIAltImageUrl="~/App_Themes/SecondTheme/images/grid/arrow_03.gif"
                                                        PreviousAltImageUrl="~/App_Themes/SecondTheme/images/grid/arrow_02.gif" PageInfoCssClass="GridPagerPagerInfo"
                                                        PageNumberCssClass="GridPagerNumber" PageNumberCurrentCssClass="GridPagerCurrentNumber"
                                                        PageRedirectCssClass="GridPagerPagerInfoRedirect" ShowHeaderPager="True" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <li class="g">
                                                                    <h3>
                                                                        <asp:HyperLink runat="server" ID="hlLink" NavigateUrl='<%# Eval("Link")%>'>
                                                                            <asp:Label runat="server" Text='<%#Eval("Subject") %>' ID="Label11"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:Label runat="server" CssClass="m" Text='<%# Eval("Time") %>' ID="lblTime"></asp:Label>
                                                                        <asp:Label runat="server" CssClass="m" Text='<%# Eval("ModuleName") %>' ID="lbDisplayName"></asp:Label>
                                                                        <asp:Label runat="server" CssClass="ss" Text='<%# Eval("SiteName") %>' ID="lblSiteName"></asp:Label>
                                                                    </h3>
                                                                    <div>
                                                                        <asp:Label runat="server" Text='<%# Eval("Abstract") %>' ID="lbCount"></asp:Label>
                                                                    </div>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </cc1:Grid>
                                                <asp:DataList ID="DataList1" runat="server" ShowFooter="False" ShowHeader="False"
                                                    OnItemDataBound="DataList1_ItemDataBound" Visible="False">
                                                    <ItemTemplate>
                                                        <li class="g">
                                                            <h3>
                                                                <asp:HyperLink runat="server" ID="hlLink" NavigateUrl='<%# Eval("Link")%>'>
                                                                    <asp:Label runat="server" Text='<%#Eval("Subject") %>' ID="Label11"></asp:Label>
                                                                </asp:HyperLink>
                                                                <asp:Label runat="server" CssClass="m" Text='<%# Eval("Time") %>' ID="lblTime"></asp:Label>
                                                                <asp:Label runat="server" CssClass="m" Text='<%# Eval("ModuleName") %>' ID="lbDisplayName"></asp:Label>
                                                            </h3>
                                                            <div>
                                                                <asp:Label runat="server" Text='<%# Eval("Abstract") %>' ID="lbCount"></asp:Label>
                                                            </div>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </ol>
                                        </div>
                                        <asp:Panel ID="plError" runat="server" Visible="false">
                                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="搜尋時發生下列錯誤" meta:resourcekey="Label4Resource9"></asp:Label>
                                            <asp:DataList ID="DataList2" runat="server" ShowFooter="False" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Text='<%# Eval("Key")  %>' ID="lbCount"></asp:Label>
                                                    <asp:Label runat="server" Text='<%# Eval("Value")  %>' ID="Label3"></asp:Label>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </asp:Panel>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                                        <%--<asp:AsyncPostBackTrigger ControlID="RepeaterHotkeyWords" EventName="ItemCommand" />--%>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="plShowPrompt" runat="server" CssClass="showPrompt">
        <center>
            <table style="text-align: center;">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="Images/TSP/img-search-ad.png" Width="250px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblShowPrompt1" runat="server" Text="尚未啟用站內搜尋功能" CssClass="titlecss" meta:resourcekey="lblShowPrompt1Resource1"></asp:Label><br>
                        <asp:Label ID="lblShowPrompt2" runat="server" Text="相關產品資訊請參考" meta:resourcekey="lblShowPrompt2Resource1"></asp:Label>
                        <asp:HyperLink ID="hyShowPrompt" runat="server" Text="官網" NavigateUrl="https://www.edetw.com" Target="_blank" meta:resourcekey="hyShowPromptResource1"></asp:HyperLink>
                        <asp:Label ID="lblShowPrompt3" runat="server" Text="或請洽業務人員了解詳情" meta:resourcekey="lblShowPrompt3Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
         </center>
    </asp:Panel>
    <asp:Label runat="server" ID="lblSearchDurtionTime" Text="共有{0}項結果 共耗時 {1:#,0.00;(#,0.00)}秒" Visible="false" meta:resourcekey="lblSearchDurtionTimResource1"></asp:Label>
    <asp:Label runat="server" ID="lblSearchAll" Text="全部" Visible="false" meta:resourcekey="lblSearchAllResource1"></asp:Label>
    <asp:Label runat="server" ID="lblAllSites" Text="全部" Visible="false" meta:resourcekey="lblAllSitesResource1"></asp:Label>
    <asp:Label runat="server" ID="lblLocal" Text="本地" Visible="false" meta:resourcekey="lblLocalResource1"></asp:Label>
    <asp:Label runat="server" ID="lblSource" Text="來源" Visible="false" meta:resourcekey="lblSourceResource1"></asp:Label>
    <asp:Label ID="lblErrmsg" runat="server" Text="關鍵字請勿輸入符號或指令" Visible="false" meta:resourcekey="lblErrmsgResource1"></asp:Label>
    <asp:HiddenField ID="hfKeyworCID" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
