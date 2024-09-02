<%@ Page Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_ScriptPrint" Title="列印" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ScriptPrint.aspx.cs" %>

<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx"
    TagName="VersionFieldCollectionUsingUC" TagPrefix="uc1" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <style type="text/css">
    .auto-style1 {
        height: 20px;
    }
    </style>
    <link id="Link4" href="~/Common/Style/cssReset.css" rel="stylesheet" runat="server" />
    <link id="Link2" href="~/Common/Style/uof-fixed.css" rel="stylesheet" runat="server" />
    <link id="Link3" href="~/Common/Style/telerik.css" rel="stylesheet" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
  <script type="text/javascript">
        function PrintPage()
        {
            event.srcElement.style.display = "none";
            $(".PrintHide").hide();
            window.print();
            event.srcElement.style.display = "";
            $(".PrintHide").show();
        }
        
        function IfChangeVersion() 
        {
            if ($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["IfChangeversion"], true)%>') != "NO")
            {
                if (confirm('<%=lblVerssionOverdue.Text %>'))
                {
                    var data = [
                        $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["formVersionId"], true)%>'),
                        $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["scriptId"], true)%>')];
                    var returnValue = new Array();
                    returnValue = $uof.pageMethod.sync("CopyFormData", data);
                    if(returnValue[0] == "true")
                    {
                        var m_scriptId=returnValue[1];
                        var m_formId=returnValue[2];
                        var m_formVersionId=returnValue[3];            
                        document.location.href="AddFormScript.aspx?scriptId="+m_scriptId+"&formId="+m_formId+"&formVersionId="+m_formVersionId;
                    }
                    else
                    {
                        alert('<%=lblChangeNewVersionMsg.Text%>');
                    }
                }
            }
        }
       
        //window.attachEvent('onload', IfChangeVersion);
      //$telerik = {};
    </script>

        
         <telerik:RadScriptManager  ID="RadScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeOut="36000" EnableEmbeddedjQuery="False" >
    <Scripts>
	        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            <asp:ScriptReference Path="~/Common/javascript/json2.min.js" />
            <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery-ui.min.js" />
            <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" />
            <asp:ScriptReference Path="~/Common/javascript/uofScript.js" />
        </Scripts>
    </telerik:RadScriptManager>        
<table width="100%">
   <tr>
      <td valign="top">
         <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
               <td style="width: 19px"></td>
               <td>&nbsp;</td>
               <td width="18"></td>
            </tr>
            <tr>
               <td style="width: 19px">&nbsp;</td>
               <td valign="top">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                     <tr>
                        <td>
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">                              
                              <tr>
                                 <td>
                                    <table width="100%">
                                        <tr>
                                            <td align="right" colspan="6" style="height: 25px">
                                                &nbsp; <input id="Button1" onclick="PrintPage();" type="button" value="列印" runat="server"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="6" style="height: 25px"><%--
                                                可放公司的標題--%>
                                            </td>
                                        </tr>
                                    <tr>                                       
                                       <td>
                                           <asp:Label ID="Label1" runat="server" Text="申請人：" meta:resourcekey="Label1Resource1"></asp:Label>
                                           <asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label></td>
                                    </tr>
                                                                        <tr>                                       
                                       <td>
                                           <asp:Label ID="Label2" runat="server" Text="申請時間：" ></asp:Label>
                                           <asp:Label ID="lblApplyTime" runat="server" ></asp:Label></td>
                                    </tr>
                                    <tr>                                       
                                       <td>
                                           <asp:Label ID="Label5" runat="server" Text="列印時間：" meta:resourcekey="Label5Resource1"></asp:Label>
                                           <asp:Label ID="lblPrintTime" runat="server" meta:resourcekey="lblPrintTimeResource1"></asp:Label></td>
                                    </tr>
                                    </table>
                                     <uc1:VersionFieldCollectionUsingUC ID="VersionFieldCollectionUsingUC1" runat="server" />
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                 </td>
                              </tr>
                           </table>
                                           <Fast:Grid ID="DGSiteComment" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"   Width="100%"  meta:resourcekey="DGSiteCommentResource1">
                                               <Columns>
                                                   <asp:BoundField HeaderText="站點" DataField="站點" meta:resourcekey="BoundFieldResource1" />
                                                   <asp:BoundField DataField="類別" HeaderText="類別" meta:resourcekey="BoundFieldResource2" />
                                                   <asp:BoundField DataField="狀態" HeaderText="狀態" meta:resourcekey="BoundFieldResource3" />
                                                   <asp:BoundField DataField="簽核時間" HeaderText="簽核時間" meta:resourcekey="BoundFieldResource4" />
                                                   <asp:BoundField DataField="應處理者" HeaderText="應處理者" meta:resourcekey="BoundFieldResource5" />
                                                   <asp:BoundField HeaderText="處理者" DataField="處理者" meta:resourcekey="BoundFieldResource6" />
                                                   <asp:BoundField HeaderText="意見" DataField="意見" meta:resourcekey="BoundFieldResource7" />
                                               </Columns>
                                           </Fast:Grid>
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
          <asp:Label ID="lblPrint" runat="server" Text="列印" Visible="False" meta:resourcekey="lblPrintResource1"></asp:Label>
          <asp:Label ID="lblVerssionOverdue" runat="server" meta:resourcekey="lblVerssionOverdueResource1" Text="此草稿版本已過期，您是否要將他轉成新版本？" Visible="False"></asp:Label>
          <asp:Label ID="lblChangeNewVersionMsg" runat="server" Text="轉換版本失敗!!" Visible="False" meta:resourcekey="lblChangeNewVersionMsgResource1"></asp:Label>
          <asp:HiddenField ID="hfScriptID" runat="server" />
          <asp:HiddenField ID="hfFormID" runat="server" />
          <asp:HiddenField ID="hfFormVersionID" runat="server" />
          <asp:HiddenField ID="hfIfChangeVersion" runat="server" />
          <asp:HiddenField ID="hfApplicantGuid" runat="server" />
          <asp:Label ID="lblMassage" runat="server" Text="此草稿版本已過期" Visible="False" meta:resourcekey="lblMassageResource1"></asp:Label>
       </td>
   </tr>
</table>
 </form>
</body>

