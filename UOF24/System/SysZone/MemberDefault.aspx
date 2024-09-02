<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="MemberDefault.aspx.cs" Inherits="System_SysZone_MemberDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <style type="text/css">
        .RadDock_Design {
            border: 0;
            padding: 2px !important;
            min-height: 0px;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            border-radius: 0px;
            -moz-border-radius: 0px;
            -webkit-border-radius: 0px;
            box-shadow: none;
            -moz-box-shadow: none;
            -webkit-box-shadow: none;
            border-collapse: separate;
        }

            .RadDock_Design .rdTable {
                background-image: url("<%=themePath %>/images/webpart/bg.png");
                background-repeat: repeat-x;
            }
    </style>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" meta:resourcekey="RadAjaxManager1Resource1"></telerik:RadAjaxManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadDockLayout runat="server" ID="RadDockLayout1"
                OnLoadDockLayout="RadDockLayout1_LoadDockLayout" OnSaveDockLayout="RadDockLayout1_SaveDockLayout" EnableEmbeddedSkins="False"
                Skin="None" StoreLayoutInViewState="False">
                <div style="float: left; width: 100%; padding: 3px;" id="webpartPad">
                    <table runat="server" id="sysTable" class="TopZonetb">
                        <tr runat="server">
                            <td runat="server">
                                <table border="0" style="width: 100%">
                                    <tr>
                                        <td>
                                            <img src="<%=themePath %>/images/webpart/bar_L.png" /></td>
                                        <td style="white-space: nowrap; text-align: center; width: 9%; background-image: url(<%=themePath %>/images/webpart/bar_Main.png)">
                                            <asp:Label ID="lblSysPanel" runat="server" Text="企業面板" meta:resourcekey="lblSysPanelResource1"></asp:Label></td>
                                        <td>
                                            <img src="<%=themePath %>/images/webpart/bar_R.png" /></td>
                                        <td style="width: 90%; background-image: url(<%=themePath %>/images/webpart/bar_line.png)"></td>
                                    </tr>

                                </table>

                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server">
                                <telerik:RadDockZone runat="server" ID="TopZone" MinHeight="200px" MinWidth="80%"
                                    Style="float: left; vertical-align: top;">
                                </telerik:RadDockZone>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server">
                                <br />
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server">
                                <table border="0" style="width: 100%" id="personbanner">
                                    <tr>
                                        <td>
                                            <img src="<%=themePath %>/images/webpart/bar_L.png" /></td>
                                        <td style="white-space: nowrap; text-align: center; width: 15%; background-image: url(<%=themePath %>/images/webpart/bar_Main.png)">
                                            <asp:Label ID="Label4" runat="server" Text="個人預設面板" meta:resourcekey="Label4Resource1"></asp:Label></td>
                                        <td>
                                            <img src="<%=themePath %>/images/webpart/bar_R.png" /></td>
                                        <td style="width: 90%; background-image: url(<%=themePath %>/images/webpart/bar_line.png)"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="height: 5px;"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server">
                                <telerik:RadDockZone runat="server" ID="UserTopZone" MinHeight="200px" MinWidth="80%"
                                    Style="float: left; vertical-align: top;">
                                </telerik:RadDockZone>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: left; width: 20%;" id="controlPad">
                    <table style="width: 100%">
                        <tr>
                            <td colspan="2">

                                <br />
                                <telerik:RadButton ID="ButtonClear" runat="server" OnClientClicking="OnClientClicking" OnClick="ButtonClear_Click" Text="清空" meta:resourcekey="ButtonClearResource1"></telerik:RadButton>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="面板清單:" meta:resourcekey="Label1Resource1"></asp:Label>
                                <br />
                                <telerik:RadDockZone runat="server" ID="dockWebparts" meta:resourcekey="dockWebpartsResource1">
                                </telerik:RadDockZone>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                        </tr>
                    </table>

                </div>
                <asp:HiddenField ID="HiddenField3" runat="server" />

            </telerik:RadDockLayout>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lbConfirm" runat="server" Text="確定要全部重設?" Visible="False" meta:resourcekey="lbConfirmResource1"></asp:Label>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <telerik:RadScriptBlock runat="server">
        <script type="text/javascript">
            Sys.Application.add_load(function () {
                var $rdTable = $('.RadDock_Design');
                $rdTable.find(".rdMiddle").hide();
                $rdTable.find(".rdBottom").hide();
                $("#webpartPad").attr("style", "float: left; width:80%; padding: 3px;");
                $("#controlPad").attr("style", "float: left; width: 20%; display:inherit;");
                var dockZone = $find("<%=TopZone.ClientID %>");

                var tmp;
                $(".TitleBarTextSys[title]").each(function (i, val) {
                    if ($(this).length > 0) {
                        if (i == 0)
                            tmp = $(this).parent().parent().width();
                        $(".rdTitleBar em").width(tmp - 50);
                        $(".TitleBarTextSys").width(tmp - 50);
                    }


                });

                $(".rdTitleBar em").children(".TitleBarText").each(function (i, val) {
                    if ($(this).length > 0) {
                        var w = $(this).parent().parent().width();
                        $(this).parent(".rdTitleBar em").width(w - 27);
                        $(this).parent().children(".TitleBarText").width(w - 108);
                    }
                });
            });

            $(window).resize(function () {
                $(".rdTitleBar em").children(".TitleBarText").each(function (i, val) {
                    if ($(this).length > 0) {
                        var w = $(this).parent().parent().width();
                        $(this).parent(".rdTitleBar em").width(w - 27);
                        $(this).parent().children(".TitleBarText").width(w - 108);
                    }
                });

                var tmp;
                $(".TitleBarTextSys[title]").each(function (i, val) {
                    if ($(this).length > 0) {
                        if (i == 0)
                            tmp = $(this).parent().parent().width();
                        $(".rdTitleBar em").width(tmp - 50);
                        $(".TitleBarTextSys").width(tmp - 50);
                    }


                });
            });

            function OnClientDragEnd(dock, e) {

                var paras = {};
                paras.Tag = dock.get_tag();
                paras.dockZoneID = dock.get_dockZoneID();

                setTimeout(function () {
                    $find("<%=RadAjaxManager1.ClientID %>").ajaxRequest(JSON.stringify(paras));

                }, 50);
            }

            function OnClientDragStart(sender) {
                var dockElement = sender.get_element();
                $("#<%=HiddenField3.ClientID%>").val(sender.get_dockZoneID());
            }

            function OnClientClicking(sender, args) {
                if (!confirm('<%=lbConfirm.Text %>'))
                    args.set_cancel(true);
            }

        </script>
    </telerik:RadScriptBlock>
</asp:Content>
