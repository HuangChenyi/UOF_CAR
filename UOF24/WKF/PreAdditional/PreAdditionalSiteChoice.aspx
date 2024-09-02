<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_PreAdditional_PreAdditionalSiteChoice" Codebehind="PreAdditionalSiteChoice.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language=javascript>
    
    function rbClick(i)
    {
        var o = $("#<%=Label2.ClientID%>");
        var target;
        if (i == 1)
        {
            target = $("#<%=lblSignSiteMsg.ClientID%>");            
            o.text( target.text());
        }
        if (i == 2)
        {
            target = $("#<%=lblCustGroupSiteMsg.ClientID%>");            
            o.text(target.text());
        }
        if (i == 8)
        {
            target = $("#<%=lblAlertSiteMsg.ClientID%>");            
            o.text(target.text());
        }
    }

    function ChoicePopDialog() {
        //簽核式
        if ($("#ctl00_ContentPlaceHolder1_rbAssignableSite").prop("checked")) {
            $uof.dialog.open2($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(signableSiteUrl, true)%>'), this, '', 950, 550, openDialogResult);
            return false;
        }
        //自訂流程
        if ($("#ctl00_ContentPlaceHolder1_rbCustSite").prop("checked")) {
            $uof.dialog.open2($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(custSiteUrl, true)%>'), this, '', 1280, 1080, openDialogResult);
            return false;
        }

        //知會
        if ($("#ctl00_ContentPlaceHolder1_rbAlertSite").prop("checked")) {
            $uof.dialog.open2($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(alertSiteUrl, true)%>'), this, '', 760, 580, openDialogResult);
            return false;
        }
    }

    function openDialogResult(returnValue) {
        //判斷是否PostBack

        if (typeof (returnValue) == 'undefined') {
            return false;
        }
        else {
            return true;
        }
    }
</script>


    <center>
        <br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="height: 160px;margin-left:auto; margin-right:auto;" width="80%">
            <colgroup class="PopTableRightTD">
            </colgroup>
            <tr>
                <td style="height: 30px" align="center" class="PopTableLeftTD">
                    <div align="center">
                        <asp:Label ID="Label1" runat="server" Text="請選擇站點類型" meta:resourcekey="Label1Resource1"></asp:Label></div>
                </td>
            </tr>
            <tr>
                <td align="center" class="PopTableRightTD" style="height: 20px"></td>
            </tr>
            <tr>
                <td class="PopTableRightTD" align="center">
                    <table>
                        <tr>
                            <td align="left" class="PopTableRightTD" height="30"><asp:RadioButton ID="rbAssignableSite" runat="server" Checked="True" GroupName="MasterFlowSite"  Text="簽核式站點" meta:resourcekey="rbAssignableSiteResource1" onclick="rbClick(1)" /></td>
                        </tr>
                        <tr>
                            <td align="left" class="PopTableRightTD" height="30"><asp:RadioButton ID="rbCustSite" runat="server" Text="自訂流程站點" GroupName="MasterFlowSite" meta:resourcekey="rbCustSiteResource1"  onclick="rbClick(2)" /></td>
                                
                        </tr>
                        <tr>
                            
                                <td align="left" class="PopTableRightTD" height="30"><asp:RadioButton ID="rbAlertSite" runat="server" Text="知會站點" GroupName="MasterFlowSite" onclick="rbClick(8)" meta:resourcekey="rbAlertSiteResource1" /></td>
                        </tr>                
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" class="PopTableRightTD" height="30"></td>
            </tr>
             <tr>
                <td align="left" class="PopTableRightTD" height="30"><asp:Label ID="Label2" runat="server" CssClass="SizeMemo"></asp:Label></td>
            </tr>
        </table>
    </ center>
    
    <asp:Label ID="lblSignSiteMsg" runat="server" Text="單一站點設定，可直接設定特殊人員或是挑選一般簽核人員" style="display:none" meta:resourcekey="lblSignSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblCustGroupSiteMsg" runat="server" Text="由使用者在表單進行時，自行設定簽核流程" style="display:none" meta:resourcekey="lblCustGroupSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblAlertSiteMsg" runat="server" Text="僅提供知會，不需設定簽核人員" style="display:none" meta:resourcekey="lblAlertSiteMsgResource1" ></asp:Label>
</asp:Content>

