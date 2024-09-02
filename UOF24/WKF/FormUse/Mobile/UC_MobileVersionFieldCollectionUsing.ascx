<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_MobileVersionFieldCollectionUsing.ascx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.UC_MobileVersionFieldCollectionUsing" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/SingleLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/MultiLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AutoNumberUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CalculateTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CheckBoxUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DataGridUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DateSelectUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DropDownListUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/FileButtonUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/HyperLinkUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/MultiLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/NumberTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/SingleLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/RadioButtonUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/TimeSelectUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/ProposerUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AllUserSetUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AggregateTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/hiddenFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/LimitUserSetUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/UserAgentUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DisplayUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/HtmlEditorUC.ascx" %>
<style>
.ul{border-bottom:1px dotted silver}

.content2
{
    padding-bottom:15px
}

    .noPadding {
        padding:0px
    }

    .xScroll {
        overflow-x:auto
    }
</style>
<script type="text/javascript">

    //將計算欄位加上千分位及小數點後強制補0 (對應多國語數值顯示)
    function number_format(n, digit, cultureInfo) {

        n += "";
        var arr = n.split("."); // n 都會是由[.]代表小數點
        var re = /(\d{1,3})(?=(\d{3})+$)/g;

        switch (cultureInfo) {
            case 'vi':
                if (arr.length > 1) {
                    var addZero = digit - arr[1].length;
                    if (addZero > 0) {
                        for (var i = 0; i < addZero; i++) {
                            arr[1] += "0";
                        }
                    }
                    return arr[0].replace(re, "$1.") + ("," + arr[1]);
                }
                else {
                    var addZero = "";
                    if (digit > 0) {
                        addZero = ",";
                        for (var i = 0; i < digit; i++) {
                            addZero += "0";
                        }
                    }
                    var ree = arr[0].replace(re, "$1.") + addZero;
                    return ree;
                }
                break;
            default:
                if (arr.length > 1) {
                    var addZero = digit - arr[1].length;
                    if (addZero > 0) {
                        for (var i = 0; i < addZero; i++) {
                            arr[1] += "0";
                        }
                    }
                    return arr[0].replace(re, "$1,") + ("." + arr[1]);
                }
                else {
                    var addZero = "";
                    if (digit > 0) {
                        addZero = ".";
                        for (var i = 0; i < digit; i++) {
                            addZero += "0";
                        }
                    }
                    var ree = arr[0].replace(re, "$1,") + addZero;
                    return ree;
                }
                break;
        }
    }

</script>

    <telerik:RadPageLayout ID="RadPageLayout1" runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
        <Columns>
            <telerik:CompositeLayoutColumn ID="CompositeLayoutColumn1" runat="server" Span="12" CssClass="noPadding" >

            </telerik:CompositeLayoutColumn>
        </Columns>
    </telerik:LayoutRow>
    </telerik:RadPageLayout>

<asp:Table ID="tbFieldCollection" runat="server"  BorderWidth="0px" CellPadding="2" Width="100%" meta:resourcekey="tbFieldCollectionResource1"/>

<asp:Label ID="lblMemo" runat="server" Text="註：" meta:resourcekey="lblMemoResource1" Visible="False"></asp:Label>&nbsp;
<asp:Label ID="lblDivZiroMsg" runat="server" Text="錯誤！不允許除以零" Visible="False" meta:resourcekey="lblDivZiroMsgResource1"></asp:Label><br />
<br />