<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_DisplayLayout.ascx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.MultiColumnDesign.UC_DisplayLayout" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/hiddenFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/SingleLineTextMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/MultiLineTextMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AutoNumberUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CalculateTextMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CheckBoxMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DataGridMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DateSelectMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DropDownListMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/FileButtonMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/HyperLinkMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/NumberTextMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/RadioButtonMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/TimeSelectMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/ProposerMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AllUserSetMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AggregateTextMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/LimitUserSetMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/UserAgentMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/HtmlEditorMobileUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DisplayUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CanvasUC.ascx" %>
<style>
    .fieldWidth{
        width: calc(100% - 20px);
        table-layout: fixed;
    }

    .fieldPadding {
        padding-top: 5px;
    }

    .fieldPaddingPrint{
        margin-top: 5px !important;
        min-height: 25px !important;
    }
    
    .optionalFieldPadding{
        padding-top: 5px;
    }

    .fieldPadding input[type='text'][readonly='readonly']:focus{
        border-left:none !important;
        border-right:none !important;
        border-top:none !important;
        border-bottom:none !important;
        outline: none !important;
    }

    .fieldPadding input[type='text'][disabled='disabled']:focus{
        border-left:none !important;
        border-right:none !important;
        border-top:none !important;
        border-bottom:none !important;
        outline: none !important;
    }

    .fieldPadding input[type='text'][readonly='readonly']:hover{
        border-left:none !important;
        border-right:none !important;
        border-top:none !important;
        border-bottom:none !important;
        outline: none !important;
    }

    .fieldPadding input[type='text'][disabled='disabled']:hover{
        border-left:none !important;
        border-right:none !important;
        border-top:none !important;
        border-bottom:none !important;
        outline: none !important;
    }

    .fieldPadding input[type='text']:focus{
        border-left:1px solid #25a0da !important;
        border-right:1px solid #25a0da !important;
        border-top:1px solid #25a0da !important;
        border-bottom:1px solid #25a0da !important;
    }

    .fieldPadding input[type='text']:hover {
        border-left:1px solid #25a0da !important;
        border-right:1px solid #25a0da !important;
        border-top:1px solid #25a0da !important;
        border-bottom:1px solid #25a0da !important;
        
    }

    .fieldPadding input[type='text'] {
        border-left:none !important;
        border-right:none !important;
        border-top:none !important;
        border-bottom:none !important;
        
    }



    .fieldPadding textarea[readonly='readonly']:hover{
        border-left:none !important;
        border-right:none !important;
        border-top:none !important;
        border-bottom:none !important;
        outline: none !important;
        resize: none !important;
    }

    .fieldPadding textarea[readonly='readonly']:focus{
        border-left:none !important;
        border-right:none !important;
        border-top:none !important;
        border-bottom:none !important;
        outline: none !important;
        resize: none !important;
    }


    .fieldPadding textarea:hover {
        border-left:1px solid #25a0da !important;
        border-right:1px solid #25a0da !important;
        border-top:1px solid #25a0da !important;
        border-bottom:1px solid #25a0da !important;
    }

    .fieldPadding textarea:focus {
        border-left:1px solid #25a0da !important;
        border-right:1px solid #25a0da !important;
        border-top:1px solid #25a0da !important;
        border-bottom:1px solid #25a0da !important;
    }

    .fieldPadding textarea {
        border-left:none !important;
        border-right:none !important;
        border-top:none !important;
        border-bottom:none !important;
        padding-bottom:0px !important;
    }


    .ul {
        border: 1px solid silver;
        vertical-align: middle;
        
    }
    .TableLayout {
        table-layout:fixed;
         border-radius: 6px 0 0 0;
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    }

    .TitleFont {
        font-size:15px;
        border-bottom-style: solid;
        border-bottom-width: 1px;
    }

    .TitleFontPrint{
        font-weight:bold;
        font-size:14px;
        border-bottom-width: 1px !important;
        border-bottom-style: solid;
    }


    .TableLayout > tbody > tr > td {
        border-bottom-style:solid !important;
        border-color : #EFEFEF !important;
        border-width: 1px !important;
        padding-top: 3px !important;
    }

    .TableLayoutPrint > tbody > tr > td {
        border-bottom-style:solid !important;
        border-color : #EFEFEF !important;
        border-width: 1px !important;
        padding-top: 5px !important;
        padding-bottom: 8px !important;
    }


    .TableLayout > tbody > tr > td > table {
        margin-bottom: 6px !important;
        min-height: 50px;
    }


    .RowHide {
        display : none;
    }

    .FieldHide {
        display : none;
    }
</style>
<script type="text/javascript">
    $(function () {
        $("#<%=hfWidth.ClientID%>").val($("#view").width());
     });

</script>
<div id="view" style="width:100%">
    <asp:Table ID="Table1" runat="server" Width="100%" CssClass="TableLayout" meta:resourcekey="Table1Resource1"></asp:Table>
    <asp:Table ID="viewDt" runat="server" Width="100%" meta:resourcekey="viewDtResource1"></asp:Table>
</div>
<asp:HiddenField ID="hfWidth" runat="server" />
