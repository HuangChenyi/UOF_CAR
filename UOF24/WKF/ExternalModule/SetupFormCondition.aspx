<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_ExternalModule_SetupFormCondition" Title="設定表單條件" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupFormCondition.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <script id="SetupFormConditionJS" type="text/javascript">
    //導頁
    function RedirectPage(url) {
        window.location = url;
        return false;
    }

 </script>
    <script type="text/javascript" id="telerikClientEvents1">
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "AddConditionBase") {//新增判斷式
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageFormConditionBase.aspx", args.get_item(), "", 1000, 270, openDialogResult, { "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true) %>"), "FormCondition": "Y" });
            }
            else if (value == "AddCondition") {//新增條件
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageFormCondition.aspx", args.get_item(), "", 800, 270, openDialogResult, { "formVersionId": $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(formVersionId, true) %>") });
            }
            else if (value == "DeleteCondition") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    args.set_cancel(true);
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>

     <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
         <contenttemplate>
<TABLE width="100%"><TBODY><TR><TD>

    <telerik:RadButton ID="ibtnSetupCondition" runat="server" Text="1.設定表單條件&gt;&gt;" CausesValidation="False" AutoPostBack="false"
        meta:resourcekey="ibtnSetupConditionResource1"></telerik:RadButton>
    <telerik:RadButton ID="ibtnDesignFlow" runat="server" Text="2.設定表單流程&gt;&gt;" CausesValidation="False" AutoPostBack="false"
        meta:resourcekey="ibtnDesignFlowResource1"></telerik:RadButton>
</TD></TR><TR><TD>
    <telerik:RadToolBar ID="RadToolBar1" Runat="server" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%">

        <Items>
            <telerik:RadToolBarButton runat="server" Text="新增判斷式" meta:resourceKey="TBarButtonResource1"
                ImageUrl="~/Common/Images/Icon/icon_m06.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m06.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m06.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m06.gif"
                Value="AddConditionBase">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="新增條件" meta:resourceKey="TBarButtonResource2"
                ImageUrl="~/Common/Images/Icon/icon_m07.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m07.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m07.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m07.gif"
                Value="AddCondition">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="刪除表單條件" meta:resourceKey="TBarButtonResource3"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                Value="DeleteCondition">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
        </Items>

    </telerik:RadToolBar>
 </TD></TR><TR><TD style="HEIGHT: 149px" vAlign=top><Fast:Grid runat="server"   EnhancePager="True" Width="100%" DataKeyOnClientWithCheckBox="False" AllowSorting="True" PageSize="15" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" ID="Grid1"  DataKeyNames="COND_ID" OnRowDataBound="Grid1_RowDataBound" OnRowCommand="Grid1_RowCommand">
<EnhancePagerSettings PageNumberCurrentCssClass="" NextImageUrl="" FirstImageUrl="" LastAltImage="" ShowHeaderPager="True" PageNumberCssClass="" PageInfoCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" PageRedirectCssClass="" NextIAltImageUrl="" FirstAltImageUrl="" LastImageUrl=""></EnhancePagerSettings>
<Columns>
<asp:TemplateField HeaderText="表單條件" meta:resourceKey="TemplateFieldResource1">
<ItemStyle Width="85%"></ItemStyle>

<HeaderStyle Width="85%"></HeaderStyle>
<ItemTemplate>
<asp:LinkButton runat="server" ID="LinkButton1" Text='<%# Eval("COND_NAME") %>' meta:resourceKey="LinkButton1Resource1"></asp:LinkButton>


 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="屬性" meta:resourceKey="TemplateFieldResource2"><EditItemTemplate>
<asp:TextBox runat="server" Text='<%# Bind("COND_ATTRIBUTE") %>' ID="TextBox2" meta:resourceKey="TextBox2Resource1"></asp:TextBox>



</EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
<ItemTemplate>
<asp:Label runat="server" Text='<%# Bind("COND_ATTRIBUTE") %>' ID="dgItem_lblCondAttribute" Visible="False" meta:resourceKey="dgItem_lblCondAttributeResource1"></asp:Label>


 <asp:Label runat="server" ID="dgItem_lblCondAttributeName" meta:resourceKey="dgItem_lblCondAttributeNameResource1"></asp:Label>



</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField Visible="False" meta:resourceKey="TemplateFieldResource3"><EditItemTemplate>
<asp:TextBox runat="server" Text='<%# Bind("COND_ID") %>' ID="TextBox1" meta:resourceKey="TextBox1Resource1"></asp:TextBox>


 
</EditItemTemplate>
<ItemTemplate>
<asp:Label runat="server" Text='<%# Bind("COND_ID") %>' ID="dgItem_lblCondId" meta:resourceKey="dgItem_lblCondIdResource1"></asp:Label>


 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField Visible="False" meta:resourceKey="TemplateFieldResource4"><EditItemTemplate>
<asp:TextBox runat="server" Text='<%# Bind("COMBINE_TYPE") %>' ID="TextBox3" meta:resourceKey="TextBox3Resource1"></asp:TextBox>


 
</EditItemTemplate>
<ItemTemplate>
<asp:Label runat="server" Text='<%# Bind("COMBINE_TYPE") %>' ID="dgItem_lblcombineType" meta:resourceKey="dgItem_lblcombineTypeResource1"></asp:Label>


 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField Visible="False" meta:resourceKey="TemplateFieldResource5"><EditItemTemplate>
<asp:TextBox runat="server" Text='<%# Bind("IS_COMBINED") %>' ID="TextBox4" meta:resourceKey="TextBox4Resource1"></asp:TextBox>


 
</EditItemTemplate>
<ItemTemplate>
<asp:Label runat="server" Text='<%# Bind("IS_COMBINED") %>' ID="dgItem_lblIsCombined" meta:resourceKey="dgItem_lblIsCombinedResource1"></asp:Label>


 
</ItemTemplate>
</asp:TemplateField>
</Columns>
</Fast:Grid>
 </TD></TR></TBODY></TABLE>
</contenttemplate>
         <TRIGGERS ><ASP:ASYNCPOSTBACKTRIGGER EventName="ButtonClick" ControlID="RadToolBar1" />
             </TRIGGERS>
     </asp:UpdatePanel>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblFormCondition" runat="server"
        Text="1.設定表單條件>>" Visible="False" meta:resourcekey="lblFormConditionResource1"></asp:Label>
    <asp:Label ID="lblFormFlow" runat="server"
        Text="2.設定表單流程>>" Visible="False" meta:resourcekey="lblFormFlowResource1"></asp:Label>&nbsp;
    <asp:Label ID="lblSelf" runat="server" meta:resourcekey="lblSelfResource1" Text="自訂"
        Visible="False"></asp:Label>
    <asp:Label ID="lblSystem" runat="server" meta:resourcekey="lblSystemResource1" Text="系統"
        Visible="False"></asp:Label>
    <asp:Label ID="lblDeleteCondition" runat="server" meta:resourcekey="lblDeleteConditionResource1"
        Text="刪除的條件被流程所使用，不允許刪除" Visible="False"></asp:Label>
</asp:Content>

