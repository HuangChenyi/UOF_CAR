<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOpenIdAccount.aspx.cs" Inherits="Ede.Uof.Web.Login.CheckOpenIdAccount" %>

<body  runat="server" id="Body">
    <form id="form1" runat="server">
     <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryExternal.js" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/jquery.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/jquery-migrate.min.js" ScriptMode="Release"/>
                <asp:ScriptReference Path="~/Common/javascript/json2.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery-ui.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/ticker.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/uofScript.js?v=18.5"  ScriptMode="Release"/>
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.cookie.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/signature_pad.min.js" ScriptMode="Release"/>
            </Scripts>
        </telerik:RadScriptManager>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
        </form>
</body>


<script type="text/javascript" src="../Common/javascript/jQuery/jquery.js">
          
    </script>
    <script type="text/javascript">
        var ajaxManager;
      
            setTimeout(function () {
                if (ajaxManager == null)
                    ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SendNotifyClick", "Value": "" }));
            return false; }, 300); 
    </script>

