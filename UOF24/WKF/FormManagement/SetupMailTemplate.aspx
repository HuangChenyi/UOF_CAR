<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupMailTemplate" Title="設定郵件樣板" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupMailTemplate.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/WKF/Common/UC_VariableList.ascx" TagName="UC_VariableList" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        td.JustAddBorder table tr td  {
            border-width: 1px;
            border-style: solid;
        }
    </style>
    <script type="text/javascript" id="telerikClientEvents1">

        var selectedAlertTypeValue
        var selectedCultureValue
        var formVersionID

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "Insert") {//類別管理

                selectedAlertTypeValue = $('#<%=ddlAlertType.ClientID %> option:selected').val();
                selectedCultureValue = $('#<%=ddlCulture.ClientID %> option:selected').val();
                formVersionID = $("#<%=hfdFormVersionID.ClientID %>").val();
                var Insert = "Insert";

                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/MaintainMailTemplate.aspx", args.get_item(), "", 1280, 1024, function () { return true; },
                    {
                        "ALERT_TYPE": selectedAlertTypeValue,
                        "CULTURE": selectedCultureValue,
                        "FORM_VERSION_ID": formVersionID,
                        "Mode": Insert
                    });
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
    <script id="redirectjs" type="text/javascript">
        //導頁
        function RedirectPage(url) {
            window.location = url;
            return false;
        }
    </script>

    <table width="100%">
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <telerik:RadButton ID="ibtnDesignField" runat="server" Text="1.設計欄位>>" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFieldResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupCondition" runat="server" Text="2.設定條件>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupConditionResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupNotify" runat="server" Text="3.設定起結案通知>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupNotifyResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnDesignFlow" runat="server" Text="4.設定流程>>" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFlowResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupRelease" runat="server" Text="5.設定發佈資訊>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupReleaseResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupMail" runat="server" Text="6.設定郵件樣板>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupMailResource1" AutoPostBack="false">
                            </telerik:RadButton>
                        </td>
                                                <td>
                            <telerik:RadButton ID="ibtnSetupDes" runat="server" Text="7.設定使用說明>>" CausesValidation="False" 
                                AutoPostBack="false" meta:resourcekey="ibtnSetupDesResource1">
                            </telerik:RadButton>
                        </td>      
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <contenttemplate>
                        <table width = 100% cellpadding = 0 cellspacing=0>
                            <tr>
                                <td>
                                    <telerik:RadToolBar ID="RadToolBar1" Runat="server" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="UltraWebToolbar1Resource1" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">

                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Text="Button 0" Value="ddl">
                                                <ItemTemplate>
                                                    <table id="Table1" width=100% runat="server">
                                                <tr id="Tr1" runat="server">
                                                    <td id="Td1" valign=middle runat="server">
                                                        <asp:Label ID="Label1" runat="server" Text="型態:" 
                                                            meta:resourcekey="Label1Resource1"></asp:Label>
                                                    </td>
                                                    <td id="Td2" valign=middle runat="server">
                                                    
                                                        <asp:DropDownList ID="ddlAlertType" runat="server" AutoPostBack="True" 
                                                            OnSelectedIndexChanged="ddlAlertType_SelectedIndexChanged" Width="130px" 
                                                            meta:resourcekey="ddlAlertTypeResource1">
                                                            <asp:ListItem Value="ALL" meta:resourcekey="ListItemResource1">全部</asp:ListItem>
                                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource2">簽核通知</asp:ListItem>
                                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource3">表單知會</asp:ListItem>
                                                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource4">表單結案</asp:ListItem>
                                                            <asp:ListItem Value="3" meta:resourcekey="ListItemResource5">表單作廢</asp:ListItem>
                                                            <asp:ListItem Value="4" meta:resourcekey="ListItemResource6">表單退簽</asp:ListItem>
                                                            <asp:ListItem Value="12" meta:resourcekey="ListItemResource14" Text="表單退簽知會"></asp:ListItem>
                                                            <asp:ListItem Value="5" meta:resourcekey="ListItemResource7">表單核准</asp:ListItem>
                                                            <asp:ListItem Value="6" meta:resourcekey="ListItemResource8">表單否決</asp:ListItem>   
                                                            <asp:ListItem Value="7" meta:resourcekey="ListItemResource9">表單討論</asp:ListItem>   
                                                            <asp:ListItem Value="8" meta:resourcekey="ListItemResource10" Text="表單取回"></asp:ListItem>
                                                            <asp:ListItem Value="9" meta:resourcekey="ListItemResource11" Text="表單徵詢"></asp:ListItem>
                                                            <asp:ListItem Value="10" meta:resourcekey="ListItemResource12" Text="表單解除鎖定"></asp:ListItem>
                                                            <asp:ListItem Value="11" meta:resourcekey="ListItemResource13" Text="表單代填寫"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    
                                                    </td>
                                                    <td id="Td3" valign=middle runat="server">
                                                        <asp:Label ID="Label2" runat="server" Text="語系:" 
                                                            meta:resourcekey="Label2Resource1"></asp:Label>
                                                    </td>
                                                    <td id="Td4" valign=middle runat="server">
                                                    
                                                        <asp:DropDownList ID="ddlCulture" runat="server" AutoPostBack="True" 
                                                            OnSelectedIndexChanged="ddlCulture_SelectedIndexChanged" 
                                                            meta:resourcekey="ddlCultureResource1">
                                                        </asp:DropDownList>
                                                    
                                                    </td>
                                                </tr>
                                            </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server"  Value="Insert" Text="新增" 
                                                meta:resourcekey="TBarButtonResource1" 
                                                DisabledImageUrl="~/System/icon_images/icon_m02.gif" 
                                                HoveredImageUrl="~/System/icon_images/icon_m02.gif" 
                                                ImageUrl="~/System/icon_images/icon_m02.gif" 
                                                CheckedImageUrl="~/System/icon_images/icon_m02.gif">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="Delete" Text="刪除" 
                                                meta:resourcekey="TBarButtonResource2" 
                                                DisabledImageUrl="~/System/icon_images/icon_m03.gif" 
                                                HoveredImageUrl="~/System/icon_images/icon_m03.gif" 
                                                ImageUrl="~/System/icon_images/icon_m03.gif" 
                                                CheckedImageUrl="~/System/icon_images/icon_m03.gif">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                                            </telerik:RadToolBarButton>
                                        </Items>

                                    </telerik:RadToolBar>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblAlertMes" CssClass="SizeMemo" runat="server" Text="PS.此型態於9.1版之後已無作用，如要設定結案相關的郵件內容，請選擇表單核准或表單否決的型態進行設定。" ForeColor="Blue" Visible="false" 
                                        meta:resourcekey="lblAlertMesResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                
                                <td>
                                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn =True 
                                        AllowSorting="True" AutoGenerateColumns="False"  
                                        DataKeyNames="CULTURE,ALERT_TYPE" DataKeyOnClientWithCheckBox="False" 
                                        EnhancePager="True" PageSize="15" 
                                          
                                        onrowdatabound="Grid1_RowDataBound" Width = "90%" 
                                        onsorting="Grid1_Sorting" >
                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" 
                                            FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" 
                                            NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" 
                                            PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" 
                                            PreviousImageUrl="" />
                                        <Columns>
                                            <asp:BoundField DataField="ALERT_TYPE" HeaderText="型態" 
                                                SortExpression="ALERT_TYPE" meta:resourcekey="BoundFieldResource1" >
                                                   <ItemStyle Width="80px" HorizontalAlign="Center" />
                                            </asp:BoundField>  
                                            <asp:BoundField DataField="CULTURE" HeaderText="語系" SortExpression="CULTURE" 
                                                meta:resourcekey="BoundFieldResource2">
                                                <ItemStyle Width="80px" />
                                            </asp:BoundField>
                                       
                                            <asp:BoundField DataField="SUBJECT" HeaderText="郵件主旨"  HtmlEncode=false HtmlEncodeFormatString=false
                                                meta:resourcekey="BoundFieldResource3" >
                                                <ItemStyle Width="150px"/>
                                            </asp:BoundField>      
                                            <asp:BoundField DataField="CONTENT" HeaderText="郵件內容" HtmlEncode=false HtmlEncodeFormatString=false  ItemStyle-CssClass="editorcontentstyle JustAddBorder"
                                                meta:resourcekey="BoundFieldResource4" />
                                            <asp:BoundField DataField="DEFAULT" HeaderText="預設" 
                                                meta:resourcekey="BoundFieldResource5" >
                                            <ItemStyle Width="60px" HorizontalAlign="Center" />
                                            </asp:BoundField>  
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                                <ItemTemplate>
                                                    
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="lbtnEdit" 
                                                        meta:resourcekey="lbtnEditResource1" Text="編輯"></asp:LinkButton>
                                                </ItemTemplate>
                                            <ItemStyle Width = 60px HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible =False 
                            meta:resourcekey="lblDeleteResource1"></asp:Label>
                        <asp:Label ID="lblTrue" runat="server" Text="是" Visible =False 
                            meta:resourcekey="lblTrueResource1" ></asp:Label>
                        <asp:Label ID="lblFalse" runat="server" Text="否" Visible =False 
                            meta:resourcekey="lblFalseResource1" ></asp:Label>
                        <asp:Label ID="lblSign" runat="server" Text="簽核通知" Visible =False 
                            meta:resourcekey="lblSignResource1"></asp:Label>
                        <asp:Label ID="lblAlert" runat="server" Text="表單知會" Visible =False 
                            meta:resourcekey="lblAlertResource1"></asp:Label>
                        <asp:Label ID="lblFinish" runat="server" Text="表單結案" Visible =False 
                            meta:resourcekey="lblFinishResource1"></asp:Label>
                        <asp:Label ID="lblCancel" runat="server" Text="表單作廢" Visible =False 
                            meta:resourcekey="lblCancelResource1"></asp:Label>
                        <asp:Label ID="lblBackSign" runat="server" Text="表單退簽" Visible=False 
                            meta:resourcekey="lblBackSignResource1"></asp:Label> 
                        <asp:Label ID="lblAgree" runat="server" Text="表單核准" Visible=False 
                            meta:resourcekey="lblAgreeResource1"></asp:Label>
                        <asp:Label ID="lblReject" runat="server" Text="表單否決" Visible=False 
                            meta:resourcekey="lblRejectResource1"></asp:Label>
                                   
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
                        <asp:Label ID="lblALL" runat="server" Text="全部" Visible="False" 
                            meta:resourcekey="lblALLResource1"></asp:Label>
                        
                        <asp:HiddenField ID="hfdFormVersionID" runat="server" />
                        <asp:Label ID="lblForum" runat="server" Text="表單討論" Visible="false" meta:resourcekey="lblFouumResource1"></asp:Label>
                    </contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

</asp:Content>

