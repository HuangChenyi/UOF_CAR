<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_DataGridUC" CodeBehind="DataGridUC.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/SingleLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/MultiLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AutoNumberUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CalculateTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CheckBoxUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DateSelectUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DropDownListUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/FileButtonUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/HyperLinkUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/MultiLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/NumberTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/SingleLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/RadioButtonUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/TimeSelectUC.ascx" %>

<script language="javascript">
    Sys.Application.add_load(
        function(){
            if($uof.tool.browser.mobile_safari) {
                 $(".mobileLink").show();

            }
            else{
                $(".pcLink").show();
            }
        }
    );

    function PrintDetailHide(id)
    {
        var index = id.lastIndexOf("_");
        var chk = id.substring(0, index + 1);

        var checked = $("." + id + " > input[type='checkbox']").is(":checked");
        if(checked)
        {
            $("." + id).parent( "th" ).css("opacity", 1);
            $("." + id).parent( "th" ).removeClass("PrintHide");
            $("td[hideclass='"+id+"']").css("opacity", 1);
            $("td[hideclass='"+id+"']").removeClass("PrintHide");
        }
        else
        {
            $("." + id).parent( "th" ).css("opacity", 0.3);
            $("." + id).parent( "th" ).addClass("PrintHide");
            $("td[hideclass='"+id+"']").css("opacity", 0.3);
            $("td[hideclass='"+id+"']").addClass("PrintHide");
        }
        

        var isOneChecked = false;
        $("span[class^='"+ chk +"'] > input[type='checkbox']").each(
            function()
            {
                var tmpChecked = $(this).prop("checked");
                if(tmpChecked)
                {
                    isOneChecked = true;
                }
            }
        );
        
        var parentChk = id.substring(0, index);
        if(isOneChecked)
        {
            $("." + parentChk + " > input[type='checkbox']").prop("checked", true);
            if($("#<%=hfFieldStyle.ClientID%>").val() == "Tradition")
            {
                $("." + parentChk).parent().parent().css("opacity", 1);
                $("." + parentChk).parent().parent().removeClass("PrintHide");
            }
            else
            {
                $("." + parentChk).parents( ".fieldWidth" ).css("opacity", 1);
                $("." + parentChk).parents( ".fieldWidth" ).removeClass("PrintHide");
            }
        }
        else
        {
            $("." + parentChk + " > input[type='checkbox']").prop("checked", false);
            if($("#<%=hfFieldStyle.ClientID%>").val() == "Tradition")
            {
                $("." + parentChk).parent().parent().css("opacity", 0.3);
                $("." + parentChk).parent().parent().addClass("PrintHide");
            }
            else
            {
                $("." + parentChk).parents( ".fieldWidth" ).css("opacity", 0.3);
                $("." + parentChk).parents( ".fieldWidth" ).addClass("PrintHide");
            }
        }
    }

    function MyImage(Img) {
        var width = 200; //預先設置的所期望的寬的值
        var height = 200; //預先設置的所期望的高的值
        var oWidth = Img.width;
        var oHeight = Img.height;
        if (oWidth > width || oHeight > height) {//現有圖片只有寬或高超了預設值就進行js控制
            w = oWidth / width;
            h = oHeight / height;
            if (w > h) {//比值比較大==>寬比高大
                Img.width = width; //定下寬度為width的寬度
                Img.height = oHeight / w; //以下為計算高度

            } else {//高比寬大
                Img.height = height; //定下寬度為height高度
                Img.width = oWidth / h; //以下為計算高度
            }
        }
    }
    function ClickThumbnail_<%=this.VersionField.FieldID%>(id)
    {
        $("#"+ id + " a").each(
            function(i, v){ 
                if(i == 0){
                    $(this)[0].click();
                }
            }
        );
    }

    function <%=mfuncName%>(e, args) 
    {
        var hyperlinkFocus1 = $("#<%=hyperlinkFocus1.ClientID%>")

        if ($("#<%=Grid1.ClientID %> tr").length == 1) {
            args.IsValid = false;
            hyperlinkFocus1.focus();
        }
        else {
            args.IsValid = true;
        }
    }
</script>

<style>
    .GrideDetailField {
        word-wrap: break-word;
    }
</style>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" ></telerik:RadAjaxManager>
<%-- 為了避免designer錯誤，所以要與Mobile元件同步 --%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
</asp:UpdatePanel>

<div style="text-align: center;">
</div>
<asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1" ScrollBars="None">
    <div runat="server" id="divField">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr id="trInvisible" runat="server">
                <td>
                    <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
                </td>
            </tr>
            <tr id="trAdd" runat="server">
                <td style="width: 100%; text-align: left;">
                    <telerik:RadButton ID="WebImageButton_AddDgRow" runat="server" Visible="False" Text="新增明細" OnClick="WebImageButton_AddDgRow_Click1" CausesValidation="False" meta:resourcekey="WebImageButton_AddDgRowResource1"></telerik:RadButton>
                </td>
            </tr>
            <tr id="trGrid" runat="server">
                <td style="width: 100%;">
                    <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" EmptyDataRowStyle-Wrap="false"
                        Width="100%" AutoGenerateColumns="False" OnRowDataBound="Grid1_RowDataBound" OnRowCommand="Grid1_RowCommand1" OnRowDeleting="Grid1_RowDeleting" EnableViewState="False" PageSize="20" DataKeyOnClientWithCheckBox="False" EnhancePager="True">
                        <Columns>
                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                <HeaderStyle HorizontalAlign="Center" Width="80px" />
                                <ItemTemplate>
                                    &nbsp;
                                    <asp:LinkButton ID="linkBtnModify" runat="server" CausesValidation="False" Text="修改" CommandName="DetailModify" meta:resourceKey="linkBtnModifyResource1"></asp:LinkButton>
                                    <asp:LinkButton ID="linkBtnDelete" runat="server" CausesValidation="False" Text="刪除" CommandName="DetailDelete" meta:resourceKey="linkBtnDeleteResource1"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                                <ItemTemplate>
                                    <asp:Label ID="lblRowIndex" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                            NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                            PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                            ShowHeaderPager="True" />
                    </Fast:Grid>
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>

<asp:HiddenField ID="hfFieldStyle" runat="server" />
<asp:HiddenField ID="hfGridRowCont" runat="server" />
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAddDetail" runat="server" meta:resourcekey="lblAddDetailResource1" Text="請新增明細" Visible="False"></asp:Label>
<asp:Label ID="lblAddDetailfield" runat="server" meta:resourcekey="lblAddDetailfieldResource1" Text="請新增明細欄位" Visible="False"></asp:Label>
<asp:Label ID="lblConfirmDelete" runat="server" meta:resourcekey="lblConfirmDeleteResource1" Text="確定刪除?" Visible="False"></asp:Label>
<asp:Label ID="lblAddDetail2" runat="server" Text="新增明細" Visible="False" meta:resourcekey="lblAddDetail2Resource1"></asp:Label>
<asp:Label ID="lblOthers" runat="server" Text="其他" Visible="false" meta:resourcekey="lblOthersResource1"></asp:Label>
<telerik:RadNumericTextBox ID="WebNumericFormatValue" runat="server" Visible="False"></telerik:RadNumericTextBox>
<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="不允許空白" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
<asp:HyperLink ID="hyperlinkFocus1" NavigateUrl="#" runat="server"></asp:HyperLink>