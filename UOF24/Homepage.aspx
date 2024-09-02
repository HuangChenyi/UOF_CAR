<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" EnableEventValidation="false" Inherits="Homepage" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Homepage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .TopZonetb {
            width: 100%;
        }

        .PersomZonetb {
            width: 100%;
        }

        .divTB {
            margin-right: 8px;
        }

        .RadDock_Design {
            border: 0;
            padding: 2px !important;
            min-height: 0px;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            background: none;
            border-radius: 0px;
            -moz-border-radius: 0px;
            -webkit-border-radius: 0px;
            box-shadow: none;
            -moz-box-shadow: none;
            -webkit-box-shadow: none;
            border-collapse: separate;
            background-image: none;
        }
    </style>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server"></telerik:RadAjaxManager>
    <div style="margin-bottom: 3px;">

        <span style="padding-left: 20px; margin-top: 2px; margin-right: 2px; margin-left: auto; display: block; width: 60px; height: 24px; background-image: url(Common/Images/Buttons/webpart_but03.png)">
            <a id="lbtnCatalog" href="#" runat="server">
                <asp:Literal ID="Literal1" runat="server" Text="設計" meta:resourcekey="Literal1Resource1" /></a>
            <a id="lbtnClose" href="#" runat="server">
                <asp:Literal ID="Literal2" runat="server" Text="關閉" meta:resourcekey="Literal2Resource1" /></a>
        </span>

    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadDockLayout runat="server" ID="RadDockLayout1" OnSaveDockLayout="RadDockLayout1_SaveDockLayout"
                OnLoadDockLayout="RadDockLayout1_LoadDockLayout" EnableEmbeddedSkins="False"
                Skin="None" StoreLayoutInViewState="True">

                <div style="float: left; width: 100%;" id="webpartPad" runat="server">


                    <table runat="server" id="sysTable" class="TopZonetb">
                        <tr>
                            <td>
                                <div id="systemDiv" runat="server">
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
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:PlaceHolder ID="pdEntControl" runat="server" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <table runat="server" id="personTable" class="PersomZonetb">
                        <tr>
                            <td>
                                <div id="persondiv" runat="server">
                                    <table border="0" style="width: 100%" id="personbanner">
                                        <tr>
                                            <td>
                                                <img src="<%=themePath %>/images/webpart/bar_L.png" /></td>
                                            <td style="white-space: nowrap; text-align: center; width: 9%; background-image: url(<%=themePath %>/images/webpart/bar_Main.png)">
                                                <asp:Label ID="Label4" runat="server" Text="個人面板" meta:resourcekey="LabelPersonResource1"></asp:Label></td>
                                            <td>
                                                <img src="<%=themePath %>/images/webpart/bar_R.png" /></td>
                                            <td style="width: 90%; background-image: url(<%=themePath %>/images/webpart/bar_line.png)"></td>
                                        </tr>

                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:PlaceHolder ID="phdControl" runat="server" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>


                </div>
                <div style="float: left; width: 14%; display: none;" id="controlPad" runat="server">

                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="版面設定:" meta:resourcekey="Label3Resource2"></asp:Label>
                            </td>
                            <td></td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Label1" runat="server" Text="面板清單:" meta:resourcekey="Label1Resource2"></asp:Label>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <telerik:RadButton ID="ButtonClear" runat="server" OnClientClicking="OnClientClicking" OnClick="ButtonClear_Click" Text="重設" meta:resourcekey="ButtonClearResource1"></telerik:RadButton>
                                        <br />
                                        <%--<telerik:RadListBox ID="lbWebParts" runat="server" CheckBoxes="True" Width="200px" Skin="Hay" Culture="zh-TW" meta:resourcekey="lbWebPartsResource1">
                                        <ButtonSettings TransferButtons="All" />
                                    </telerik:RadListBox>--%>
                                        <telerik:RadDockZone runat="server" ID="dockWebparts" Orientation="Vertical">
                                        </telerik:RadDockZone>

                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </td>
                        </tr>

                    </table>

                </div>
            </telerik:RadDockLayout>

        </ContentTemplate>

    </asp:UpdatePanel>


    <asp:Label ID="lbConfirm" runat="server" Text="確定要全部重設?" Visible="False" meta:resourcekey="lbConfirmResource1"></asp:Label>
    <telerik:RadScriptBlock runat="server">
        <script type="text/javascript">
            var dockwidth;
            Sys.Application.add_load(function () {
                $("#<%=lbtnCatalog.ClientID%>").on("click", function () {
                    $uof.tool.showBlockLoading();
                    window.location.href = 'DesignPanel.aspx'; //'Homepage.aspx?mode=design';
                });

                $("#<%=lbtnClose.ClientID%>").on("click", function () {
                    $uof.tool.showBlockLoading();
                    window.location.href = 'Homepage.aspx';
                });
                InitZone();

                resizeTitleText();

                //}
            });

            $(window).resize(function () {
                //$uof.telerikFix.dock.resizeTitleText();
                resizeTitleText();
            });

            function resizeTitleText() {
                var tmp;
                $(".rdTitleBar em").children(".TitleBarText").each(function (i, val) {
                    if ($(this).length > 0) {

                        tmp = $(this).parent().parent().width();
                        //if ($(".TitleBarTextSys[title]")[i] != undefined) {
                        $(this).parent(".rdTitleBar em").width(tmp - 50);
                        $(this).width(tmp - 150);
                        //}
                    }


                });
            }

            function InitZone() {
                var $rdTable = $('.RadDock_Design');
                $rdTable.find(".rdMiddle").hide();
                $rdTable.find(".rdBottom").hide();
                $(".SpanStyle .TitleBarImg").each(function () {
                    $(this).height(27);
                });
                $(".SpanStyle .TitleBarTextSys").each(function () {
                    $(this).css("line-height", "27px");
                });
                var count_center = 0;
                var str_center = "";
                var count_bottom = 0;
                var str_bottom = "";
                $(".UserZoneCss").each(function (i, val) {
                    var zone = $find(val.id);
                    if (zone == null)
                        return;
                    var docksCount = zone.get_docks().length;
                    if (val.id.indexOf("userZone1") >= 0) {
                        if (docksCount == 0)
                            zone.get_element().style.display = "none";
                    }
                    else if (val.id.indexOf("userZone2") >= 0 || val.id.indexOf("userZone3") >= 0) {
                        if (docksCount == 0) {
                            count_center++;
                            str_center += val.id + ",";
                        }
                        if (count_center == 2) {
                            var list = str_center.split(',');
                            jQuery.each(list, function (j, item) {
                                if (item != "") {
                                    var tmpzone = $find(item);
                                    if (tmpzone != null)
                                        tmpzone.get_element().style.display = "none";
                                }
                            });
                        }

                    }
                    else if (val.id.indexOf("userZone4") >= 0 || val.id.indexOf("userZone5") >= 0 || val.id.indexOf("userZone6") >= 0) {
                        if (docksCount == 0) {
                            count_bottom++;
                            str_bottom += val.id + ",";
                        }
                        if (count_bottom == 3) {
                            var list = str_bottom.split(',');
                            jQuery.each(list, function (j, item) {
                                if (item != "") {
                                    var tmpzone = $find(item);
                                    if (tmpzone != null)
                                        tmpzone.get_element().style.display = "none";
                                }
                            });
                        }

                    }
                    //   alert(docksCount);
                });
            }

            function OnClientDragStart(dock, args) {
                // dock.set_collapsed(false);
                var zoneid = dock.get_dockZoneID();
                if (zoneid.indexOf("sysZone") >= 0)
                    args.set_cancel(true);


            }

            function OnClientDragEnd(dock, e) {
                // dock.set_collapsed(false);

                var paras = {};
                paras.Tag = dock.get_tag();
                paras.dockZoneID = dock.get_dockZoneID();
                setTimeout(function () {
                    $find("<%=RadAjaxManager1.ClientID %>").ajaxRequest(JSON.stringify(paras));

                }, 50);
            }

            function OnClientClicking(sender, args) {
                if (!confirm('<%=lbConfirm.Text %>'))
                    args.set_cancel(true);

            }

            function OnClientInitialize(dock, args) {
                var paras = {};
                paras.Tag = dock.get_tag();
                paras.dockZoneID = dock.get_dockZoneID();
                $find("<%=RadAjaxManager1.ClientID %>").ajaxRequest(JSON.stringify(paras));
            }
            function OnClientCommand(sender, eventArgs) {
                if (sender.get_dockZoneID() != "") {
                    dockwidth = sender.get_width().replace('px', '');
                }
            }
        </script>
    </telerik:RadScriptBlock>
</asp:Content>
