<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetBatchSignTitle" Title="未命名頁面" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetBatchSignTitle.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script id="replacejs" type="text/javascript">

        function ReplaceAll(strOrg, strFind, strReplace) {
            var index = 0;
            while (strOrg.indexOf(strFind, index) != -1) {
                strOrg = strOrg.replace(strFind, strReplace);
                index = strOrg.indexOf(strFind, index);
            }
            return strOrg;
        }

        Sys.Application.add_load(function () {
            if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
                    resizeTwoTree($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());
            });

    function resizeTwoTree(X, Y) {
        var treeLeft = $find("<%=RadTreeView1.ClientID %>");
        var treeRight = $find("<%=RadTreeView2.ClientID %>");

        //解決批次簽核標題超過預設高度時，拉霸拉到底仍有最後3項會看不見，將高度預扣邊框範圍由原40增加到120
        treeLeft.get_element().style.height = Y - 120 + "px";        
        treeLeft.get_element().style.width = X / 2 - 40 + "px";

        //解決批次簽核標題超過預設高度時，拉霸拉到底仍有最後3項會看不見，將高度預扣邊框範圍由原40增加到120 
        treeRight.get_element().style.height = Y - 120 + "px";
        treeRight.get_element().style.width = X / 2 - 40 + "px";

        $("#<%=hiddenX.ClientID%>").val(X);
        $("#<%=hiddenY.ClientID%>").val(Y);

    }

    </script>
    <script type="text/javascript">
        function RadTreeView1_DoubleClick(sender, eventArgs) {

            var node = eventArgs.get_node();
            var nodeTag = node.get_value();
            var formVersionId = "<%=formVersionId%>";
            $uof.dialog.open2("~/WKF/FormManagement/SetBatchSignWidth.aspx", "", "", 350, 300, openDialogResult, { "NodeId": nodeTag, "formVersionId": formVersionId });

        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            else {
                $("#<%=btnRefresh.ClientID%>").click();
                return true;
            }
        }
    </script>
<table style="width: 100%; height: 540px; vertical-align: top" border="0">
    <tr>
        <td rowspan="2" style="text-align: left; vertical-align: top; width: 50%">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <contenttemplate>
                    <table class="PopTable" border="1" style="width:100%;height:540px">
                        <tr>
                            <td  style="text-align:center;height:110px;vertical-align:middle"  class="PopTableLeftTD"   >
                                <table style="width:100%;height:100px"  border="0" >
                                    <tr>
                                        <td style="width:100%">
                                            <center>                             
                                                               <asp:Label ID="lblTitle1" runat="server" Text="要顯示的批次簽核標題" 
                                                meta:resourcekey="lblTitle1Resource1"></asp:Label>
                                                </center>

                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td style="width:100%;text-align:left" >
                                            <asp:Label ID="Label1"  runat="server" Text="*拖曳欄位名稱可改變順序"
                                                meta:resourcekey="Label1Resource1" CssClass="SizeMemo"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:100%;text-align:left">
                                            <asp:Label ID="Label2" runat="server" Text="*連點欄位名稱兩下可設定顯示寬度" 
                                                meta:resourcekey="Label2Resource1" CssClass="SizeMemo"></asp:Label>
                                        </td>
                                    </tr>
                                </table>                                                     
                            </td>
                        </tr>
                        <tr>
                            <td   class="PopTableRightTD" style="height:440px;width:220px;vertical-align:top;text-align:left">
                            <table  border="0" style="height:440px;width:220px"> 
                                <tr>
                                    <td  style="vertical-align: top">
                                        <telerik:RadTreeView ID="RadTreeView1" Runat="server"
                                            height="500px" Width="300px"
                                            EnableDragAndDrop="true" 
                                            OnNodeDrop="RadTreeView1_NodeDrop"
                                            OnClientDoubleClick="RadTreeView1_DoubleClick">

                                        </telerik:RadTreeView>
                                    </td></tr></table>
                          
                        </td></tr></table>
  </contenttemplate>
                <triggers>                    
                    <asp:AsyncPostBackTrigger ControlID="btn_Add" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btn_Delete" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnRefresh" EventName="Click" />
                </triggers>
            </asp:UpdatePanel>
        </td>
        <td style="vertical-align:middle">
            <div style="display: none">
                <asp:Button ID="btnRefresh" runat="server" onclick="btnRefresh_Click" Text="Button" />
            </div>
            <td  style="min-width:50px;vertical-align:middle;text-align:center">
                <telerik:RadButton ID="btn_Add" runat="server" CausesValidation="False" 
                    meta:resourcekey="btn_AddResource1" Text="<--" OnClick="btn_Add_Click"></telerik:RadButton>
                &nbsp;
                <br />
                <br />
                <telerik:RadButton ID="btn_Delete" runat="server"  
                    meta:resourcekey="btn_DeleteResource1" Text="-->" OnClick="btn_Delete_Click"></telerik:RadButton>
            </td>
        </td>
        <td rowspan="2" style="vertical-align:top;width:50%;text-align:left">
            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                <contenttemplate>
                    <table border="1"  class="PopTable" style="width:100%; height:540px;">
                        <tr >
                            <td style="width:220px;text-align:center;vertical-align:middle;height:110px"  >
                            <center>
                                <asp:Label ID="lblTitle2" runat="server" Text="所有欄位" 
                                    meta:resourcekey="lblTitle2Resource1"></asp:Label>                                
                            </center>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableRightTD" style="text-align:left;width:100%;height:440px;vertical-align:top" >   
                                <telerik:RadTreeView ID="RadTreeView2" runat="server" Height="500px" Width="300px"></telerik:RadTreeView> 
                            </td>
                        </tr>
                    </table>
                </contenttemplate>
                <triggers>                    
                    <asp:AsyncPostBackTrigger ControlID="btn_Add" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btn_Delete" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnRefresh" EventName="Click" />
                </triggers>
            </asp:UpdatePanel>
        </td>
    </tr>
</table>
<asp:HiddenField id="hiddenFirstField" runat="server"></asp:HiddenField>
<input id="hiddenNodeId" runat="server" type="hidden"></input></input>            
<asp:HiddenField ID="hiddenX" runat="server" />
<asp:HiddenField ID="hiddenY" runat="server" />
    
</asp:Content>

