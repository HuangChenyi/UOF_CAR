<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetFvrSiteMail" Title="站點郵件資訊" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetFvrSiteMail.aspx.cs" %>

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
        //<![CDATA[
        var selectedAlertTypeValue;
        var selectedCultureValue;
        var formVersionID;
        var siteID;
        var parentSiteID;

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "Insert") {//類別管理

                selectedAlertTypeValue = $("#<%=ddlAlertType.ClientID %>").val();
                selectedCultureValue = $("#<%=ddlCulture.ClientID %>").val();
                formVersionID = $("#<%=hfdFormVersionID.ClientID %>").val();
                siteID = $("#<%=hfdSiteID.ClientID %>").val();
                parentSiteID = $("#<%=hfdParentsiteID.ClientID %>").val();

                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/MaintainMailTemplate.aspx", args.get_item(), "", 1280, 1024, openDialogResult,
                    {
                        "ALERT_TYPE": selectedAlertTypeValue,
                        "CULTURE": selectedCultureValue,
                        "FORM_VERSION_ID": formVersionID,
                        "Mode":"Insert",
                        "SITE_ID": siteID,
                        "PARENT_SITE_ID":parentSiteID
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

    <table width="100%">
        <tr>
            <td>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <contenttemplate>
                        <table width = 100% cellpadding = 0 cellspacing=0>
                            <tr>
                                <td>
                                    <telerik:RadToolBar ID="RadToolBar1" Runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="UltraWebToolbar1Resource1">

                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Text="Button 0" Value="TBCustom1">
                                                <ItemTemplate>
                                                      <table id="Table1" width=100% runat="server" style="margin: 1px">
                                                <tr id="Tr1" runat="server">
                                                    <td id="Td1"  runat="server" style="vertical-align: middle">
                                                        <asp:Label ID="Label1" runat="server" Text="型態:" 
                                                            meta:resourcekey="Label1Resource1"></asp:Label>
                                                    </td>
                                                    <td id="Td2"  runat="server" style="vertical-align: middle">
                                                    
                                                        <asp:DropDownList ID="ddlAlertType" runat="server" AutoPostBack="True" 
                                                            OnSelectedIndexChanged="ddlAlertType_SelectedIndexChanged" Width="100px" 
                                                            meta:resourcekey="ddlAlertTypeResource1">
                                                            <asp:ListItem Value="ALL" meta:resourcekey="ListItemResource1">全部</asp:ListItem>
                                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource2">簽核通知</asp:ListItem>
                                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource3">表單知會</asp:ListItem>
<%--                                                        //2011/12/17    跟進鑫確認後，表單結案和表單作廢沒用故此選項拿掉
                                                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource4">表單結案</asp:ListItem>
                                                            <asp:ListItem Value="3" meta:resourcekey="ListItemResource5">表單作廢</asp:ListItem>--%>
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
                                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn =True 
                                        AllowSorting="True" AutoGenerateColumns="False"  
                                        DataKeyNames="CULTURE,ALERT_TYPE" DataKeyOnClientWithCheckBox="False" 
                                        EnhancePager="True" PageSize="15" 
                                          
                                        onrowdatabound="Grid1_RowDataBound" Width = "100%" 
                                        onsorting="Grid1_Sorting" >
                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" 
                                            FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" 
                                            NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" 
                                            PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" 
                                            PreviousImageUrl="" />
                                        <Columns>
                                            <asp:BoundField DataField="ALERT_TYPE" HeaderText="郵件" 
                                                SortExpression="ALERT_TYPE" meta:resourcekey="BoundFieldResource1" >
                                                   <ItemStyle Width="80px" HorizontalAlign="Center" />
                                            </asp:BoundField>  
                                            <asp:BoundField DataField="CULTURE" HeaderText="郵件" SortExpression="CULTURE" 
                                                meta:resourcekey="BoundFieldResource2">
                                                <ItemStyle Width="80px" />
                                            </asp:BoundField>
                                       
                                            <asp:BoundField DataField="SUBJECT" HeaderText="郵件主旨" HtmlEncode=false HtmlEncodeFormatString=false
                                                meta:resourcekey="BoundFieldResource3" >
                                                <ItemStyle Width="150px"/>
                                            </asp:BoundField>      
                                            <asp:BoundField DataField="CONTENT" HeaderText="郵件內容"  HtmlEncode=false HtmlEncodeFormatString=false  ItemStyle-CssClass="editorcontentstyle JustAddBorder"
                                                meta:resourcekey="BoundFieldResource4" />
                                            <asp:BoundField DataField="DEFAULT" HeaderText="預設" 
                                                meta:resourcekey="BoundFieldResource5" >
                                            <ItemStyle Width="60px" HorizontalAlign="Center" />
                                            </asp:BoundField>  
                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                            <ItemStyle Width = 60px HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="lbtnEdit" 
                                                        meta:resourcekey="lbtnEditResource1" Text="編輯"></asp:LinkButton>
                                                </ItemTemplate>
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
                        <asp:Label ID="lblALL" runat="server" Text="全部" Visible="False" 
                            meta:resourcekey="lblALLResource1"></asp:Label>
                        
                        <asp:HiddenField ID="hfdFormVersionID" runat="server" />
                        <asp:HiddenField ID="hfdSiteID" runat="server" />
                        <asp:HiddenField ID="hfdParentsiteID" runat="server" />
                    </contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>

