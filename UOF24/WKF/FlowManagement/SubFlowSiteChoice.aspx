<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SubFlowSiteChoice" Title="選擇站點類型" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SubFlowSiteChoice.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language=javascript>
    
    function rbClick(i)
    {
        var o = $('#<%=Label2.ClientID%>');
         var target;
        if (i == 1)
        {
            target = $('#<%=lblSignSiteMsg.ClientID%>');
            o.text(target.text());
        }
        if (i == 2)
        {
  
            target = $('#<%=lblCustGroupSiteMsg.ClientID%>');
            o.text(target.text())


        
        }
         if (i == 3)
        {

             target = $('#<%=lblFieldSiteMsg.ClientID%>');
             o.text(target.text())
        }
        if (i == 4)
        {
           
            target = $('#<%=lblAlertSiteMsg.ClientID%>');
            o.text(target.text())
        }
    }
    
    function ChoicePopDialog() {
        //簽核式
        if ($('#ctl00_ContentPlaceHolder1_rbAssignableSite').prop("checked")) {
            $uof.dialog.open2($uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(signableSiteUrl, true)%>"), this, "", 900, 550, openDialogResult);
            return false;
        }

        //表單欄位式

        if ($('#ctl00_ContentPlaceHolder1_rbFieldSite').prop("checked")) {
            $uof.dialog.open2($uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(fieldSiteUrl, true)%>"), this, "", 700, 550, openDialogResult);
            return false;
        }

        //知會站點
        if ($('#ctl00_ContentPlaceHolder1_rbAlertSite').prop("checked")) {
            $uof.dialog.open2($uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(alertSiteUrl, true)%>"), this, "", 700, 550, openDialogResult);
            return false;
        }
    }
    function openDialogResult(returnValue) {
        if (typeof (returnValue) == "undefined") {
            return false;
        }
        return true;
    }

</script>


    <center>
        <br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="height: 160px;" width="80%">
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
                             <td align="left" class="PopTableRightTD" height="30"><asp:RadioButton ID="rbCustSite" runat="server" Text="自訂流程站點" GroupName="MasterFlowSite" meta:resourcekey="rbCustSiteResource1"  onclick="rbClick(2)" /></td>
                        </tr>
                        <tr>
                            <td align="left" class="PopTableRightTD" height="30"><asp:RadioButton ID="rbFieldSite" runat="server" Text="組織欄位站點" GroupName="MasterFlowSite" meta:resourcekey="rbFieldSiteResource1"  onclick="rbClick(3)" /></td>
                            <td align="left" class="PopTableRightTD" height="30">
                                <asp:RadioButton ID="rbAlertSite" runat="server" Text="知會站點" 
                                    GroupName="MasterFlowSite"   onclick="rbClick(4)" 
                                    meta:resourcekey="rbAlertSiteResource1" /></td>
                        </tr>                
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" class="PopTableRightTD" height="30"></td>
            </tr>
             <tr>
                <td align="left" class="PopTableRightTD" height="30"><asp:Label ID="Label2" 
                        runat="server" ForeColor="#0033CC" meta:resourcekey="Label2Resource1"></asp:Label></td>
            </tr>
        </table>
    </center>
    
    <asp:Label ID="lblSignSiteMsg" runat="server" Text="單一站點設定，可直接設定特殊人員或是挑選一般簽核人員" style="display:none" meta:resourcekey="lblSignSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblCustGroupSiteMsg" runat="server" Text="由使用者在表單進行時，自行設定簽核流程" style="display:none" meta:resourcekey="lblCustGroupSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblFieldSiteMsg" runat="server" Text="選擇表單組織人員型態的欄位，簽核時由欄位選擇的內容進行簽核" style="display:none" meta:resourcekey="lblFieldSiteMsgResource1"></asp:Label>
        <asp:Label ID="lblAlertSiteMsg" runat="server" Text="僅提供知會，不需設定簽核人員"
        Style="display: none" meta:resourcekey="lblAlertSiteMsgResource1"></asp:Label>
</asp:Content>

