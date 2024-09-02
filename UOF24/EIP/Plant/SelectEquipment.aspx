<%@ Page Title="借用設備" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SelectEquipment.aspx.cs" Inherits="Ede.Uof.Web.EIP.Plant.SelectEquipment" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(
            function () {              
                var curwindow = $uof.dialog.getOpener();
                var pd;
                var nodeEnable = "<%=Request.QueryString["IsNodeEnable"]%>";               
                if (curwindow) {
                    pd = curwindow.document;
                }
                else if (typeof (dialogArguments) != "undefined") {
                    pd = dialogArgument.document;
                }               
                if ($("#<%= hfIsPostBack.ClientID%>").val() === 'false') {
                    var parentNode = [];
                    var tree = $find("<%= treeEquipment.ClientID %>");
                    if (pd) {                        
                        var guids = $("#<%=Request.QueryString["HiddenClientID"]%>", pd).val();                        
                        $("#<%=hfSetEnableNode.ClientID%>").val(guids);
                        if (guids != "") {                           
                            var guidList = guids.split(",");               
                                guidList.forEach(function (item, index, array) {
                                  
                                    var findNode = tree.findNodeByValue(item);
                                    if (findNode) {
                                        findNode.set_checked(true);                                      
                                        if (nodeEnable == "true") {
                                            findNode.set_enabled(false);
                                        }                                       
                                        if (findNode.get_level() === 0) {
                                            parentNode.push(item);
                                        }                                       
                                    }
                            });
                                
                            if (parentNode.length > 0) {                                       
                                parentNode.forEach(function (item, index, array) {
                                    var parentNode = tree.findNodeByValue(item);
                                    for (var i = 0; i < parentNode.get_nodes().get_count(); i++) {
                                        if (parentNode.get_nodes().getNode(i).get_checked() === false) {
                                            if (nodeEnable == 'true') {
                                                parentNode.set_enabled(true);
                                            }                                               
                                                parentNode.set_checked(false);
                                                var updateGuidList = guids.split(",");  
                                                var index = updateGuidList.indexOf(item);
                                                //項目沒有全選的話就刪掉類別，這樣在觸發勾選事件的時候全選功能能正常使用。
                                                updateGuidList.splice(index, 1);                                              
                                                $("#<%=hfSetEnableNode.ClientID%>").val(updateGuidList.join(","));
                                                break;
                                            } 
                                        }
                                    });
                                }
                        }                                          
                    }
                }              
                $("#<%= hfIsPostBack.ClientID%>").val("true");            
            }
        );

        function treeEquipment_NodeClicking(sender, args) {            
            var node = args.get_node();            
            var IsMeetingRoom = node.get_attributes().getAttribute("IsMeetingRoom");
            args.set_cancel(true);
            var nodeValue = node.get_value();
            if (node.get_level() === 1) {
                $uof.dialog.open2("~/EIP/Plant/ChoicePlant.aspx", node, "", 1100, 700, openDialogResult, { "PlantGuid": nodeValue, "IsMeetingRoom": IsMeetingRoom });
            }
        }
        var WebTreeCheckedStatus = false;
        function treeEquipment_NodeChecked(sender, args) {         
            var node = args.get_node();
            var count = 0;
            if (node.get_level() === 0) {
                if (WebTreeCheckedStatus === false) {
                    WebTreeCheckedStatus = true;
                    if (node.get_nodes().get_count() > 0) {
                        for (var i = 0; i < node.get_nodes().get_count() ; i++) {
                            node.get_nodes().getNode(i).set_checked(node.get_checked());
                        }
                    }
                    WebTreeCheckedStatus = false;
                }
            }
            else {
                if (WebTreeCheckedStatus === false) {
                    WebTreeCheckedStatus = true;
                    var parentNode = node.get_parent();
                    for (var i = 0; i < parentNode.get_nodes().get_count() ; i++) {
                        if (parentNode.get_nodes().getNode(i).get_checked() === false) {
                            parentNode.set_checked(false);
                            WebTreeCheckedStatus = false;
                            break;
                        } else {
                            count++;
                        }
                    }
                    if (count === parentNode.get_nodes().get_count()) {
                        parentNode.set_checked(true);
                        WebTreeCheckedStatus = false;
                    }
                }
            }
        }

        function UpdateHiddenValue() {
            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            }
            else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArgument.document;
            }
            $("#<%=Request.QueryString["HiddenClientID"]%>", pd).val($("#<%=hfSetReturnValue.ClientID%>").val());
           }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null)
                return false;
            else {
                return true;
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" Height="150px" Visible="False" ScrollBars="Vertical" BorderWidth="1px" BorderStyle="Solid" meta:resourcekey="Panel1Resource1" >  
                <asp:Table ID="errorDT" runat="server" CellPadding="0" CellSpacing="0" meta:resourcekey="errorDTResource1"></asp:Table>            
            </asp:Panel>
            <telerik:RadTreeView ID="treeEquipment" CheckBoxes="True" EnableNodeTextHtmlEncoding="True" runat="server" OnNodeCheck="treeEquipment_NodeCheck" OnClientNodeChecked="treeEquipment_NodeChecked" OnClientNodeClicking="treeEquipment_NodeClicking" meta:resourcekey="treeEquipmentResource1" TriStateCheckBoxes="False"></telerik:RadTreeView>
            <asp:Label ID="lblTip" runat="server" Text="借用限制天數:{0}天" Visible="False" meta:resourcekey="lblTipResource1"></asp:Label>
            <asp:Label ID="lblUnlimited" runat="server" Text="借用限制天數:不限定" Visible="False" meta:resourcekey="lblUnlimitedResource1"></asp:Label>   
            <asp:Label ID="lblSampleShowLimitMsg" runat="server" Text="設備只開放借用到{0}。" Visible="False" meta:resourcekey="lblSampleShowLimitMsgResource1"></asp:Label>
            <asp:Label ID="lblRangeLimitMsg" runat="server" Text="設備{0}~{1}不開放借用。" Visible="False" meta:resourcekey="lblRangeLimitMsgResource1"></asp:Label>
            <asp:Label ID="lblErr" runat="server" Text="借用時間:{0}<br />借用設備:{1}" Visible="False" meta:resourcekey="lblErrResource1" ></asp:Label>
            <asp:Label ID="lblLimitErr" runat="server" Text="借用設備:{0}" Visible="False" meta:resourcekey="lblLimitErrResource1" ></asp:Label>
            <asp:Label ID="lblErrDetail" runat="server" Text="以上設備已被借出/預約，請重新選擇要借用的設備<br />借用者:{0}" Visible="False" meta:resourcekey="lblErrDetailResource1" ></asp:Label>
            <asp:Label ID="lblSelfBrorrow" runat="server" Text="您已預約該設備, 無法再次新增。" Visible="False" meta:resourcekey="lblSelfBrorrowResource1"></asp:Label>   
            <asp:HiddenField ID="hfSetReturnValue" runat="server" /> 
            <asp:HiddenField ID="hfSetEnableNode" runat="server" /> 
            <asp:HiddenField ID="hfIsPostBack" runat="server" Value="false" />     
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>