<%@ Page Language="C#" AutoEventWireup="true" Inherits="EIP_EM_EMUrl" Codebehind="EMUrl.aspx.cs" %>

<!DOCTYPE html>
<html>

    <head runat="server">
        <link rel="home" id="ApplicationRoot" href="" runat="server" EnableViewState="False" ClientIDMode="Static" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        
        <script type="text/javascript">
            function ComputeScreenSize(t, size) {
                if (t == "h") {
                    if (size == 0 || size > screen.availHeight) {
                        return screen.availHeight;
                    }
                    else {
                        return size;
                    }
                }
                else if (t == "w") {
                    if (size == 0 || size > screen.availWidth) {
                        return screen.availWidth;
                    }
                    else {
                        return size;
                    }
                }
            }
        </script>
        <title></title>

    </head>
<body>
    <script src="../../Common/javascript/jQuery/jquery.js" type="text/javascript"></script>
    <script src="../../Common/javascript/jQuery/plugin/jquery.blockUI.js" type="text/javascript"></script>
    <script src="../../Common/javascript/uofScript.js" type="text/javascript"></script>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000" EnableEmbeddedjQuery="False">
        </telerik:RadScriptManager>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="True"
            ReloadOnShow="true" DestroyOnClose="True" ShowOnTopWhenMaximized="False"
            EnableShadow="True" ShowContentDuringLoad="false"            
            OnClientCommand="$uof.telerikFix.windowManager.onClientCommand"
            Style="z-index: 9001" Behaviors="Resize, Maximize, Move, Close" VisibleStatusbar="False">
        </telerik:RadWindowManager>
        <div>
        </div>
    </form>
</body>
</html>
