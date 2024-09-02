<%@ Page Title="字號類別維護" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="SendNumberStringMaintain.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Management.SendNumberStringMaintain" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<%--<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
    </telerik:RadAjaxManager>
</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden {
            display: none;
        }

        .cssCenter {
            text-align: center !important;
        }

        .lbtnUpPadding {
            padding-left: 5px;
            width: 65px;
        }
    </style>

    <script type="text/javascript">
        <%--$(document).ready(function () {

            // 點擊checkBox觸發的事件
            $(document).on('click', 'input[type="checkbox"]', function () {
                var selectedList = $('#<%=grdNumberStringList.ClientID %> tr[class="GridItemSelected"]');
                var length = selectedList.length;

                if (length > 0) {

                    // 把刪除按鈕打開
                    $find("<%=rtbNumberStringMantain.ClientID%>").findItemByValue('Delete').enable();
                }
                else {

                    // 沒勾選項目把新增以外的按鈕都disable
                    $find("<%=rtbNumberStringMantain.ClientID%>").findItemByValue('Delete').disable();
                }
            });
        });--%>

        function RadNumberStrClientClick(sender, args) {
            if (args.get_item().get_value() == "Create") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Edoc/Management/SendNumberStringDialog.aspx", args.get_item(), '<%=lblAddDialogTitle.Text %>', 600, 400,
                    function (returnValue) {
                        if (typeof (returnValue) === 'undefined' || returnValue === null) {
                            return false;
                        } else {
                            return true;
                        }
                    }, { "mode": "create", "orgId": $('#<%=hfOrgId.ClientID%>').val() });
            }
            else if (args.get_item().get_value() == "Delete") {
                args.set_cancel(!confirm($('#<%=lblDelete.ClientID %>').text()));
            }
        }

    </script>

    <asp:Label ID="lblAddDialogTitle" runat="server" Text="新增" Visible="false" ></asp:Label>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="rtbNumberStringMantain" runat="server" OnButtonClick="rtbNumberStringMantain_ButtonClick" OnClientButtonClicking="RadNumberStrClientClick" Width="100%">
                <Items>
                    <telerik:RadToolBarButton Text="新增" Value="Create" ID="rtbbCreate" CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m71.png" HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                        ImageUrl="~/Common/Images/Icon/icon_m71.png" runat="server">
                    </telerik:RadToolBarButton>

                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sKeyword" />
                    <telerik:RadToolBarButton>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m132.gif" />
                            <asp:Label ID="Label6" runat="server" Text="：啟用" ForeColor="Blue"></asp:Label>
                            &nbsp;
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_m141.gif" />
                            <asp:Label ID="Label7" runat="server" Text="：停用" ForeColor="Blue"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            
    <asp:Label ID="lblEditDialogTitle" runat="server" Text="維護" CssClass="cssHidden"></asp:Label>

            <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎 ?" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblNoDelete" runat="server" Text="使用過的類別不可刪除" CssClass="cssHidden"></asp:Label>

            <asp:HiddenField ID="hfPageIndex" runat="server" Value="0" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <div runat="server" id="treeBG" style="background-repeat: repeat; width: 100%; height: 80%">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="padding-left: 5px">
                    <asp:CheckBox runat="server" ID="cbAllOrg" Text="顯示已停用機關" AutoPostBack="true" OnCheckedChanged="cbAllOrg_CheckedChanged" />
                </div>
                <telerik:RadTreeView runat="server" ID="RadTreeView1"  OnNodeClick="RadTreeView1_NodeClick" EnableNodeTextHtmlEncoding="true">
                </telerik:RadTreeView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="width: 100%; float: left; display: block">

                <Ede:Grid ID="grdNumberStringList" runat="server" DataKeyNames="NUMBER_STRING_GUID" Width="100%"
                    EmptyDataText="沒有資料" AutoGenerateColumns="False"
                    OnRowDataBound="grdNumberStringList_RowDataBound"
                    AutoGenerateCheckBoxColumn="false">
                    <Columns>
                        <asp:BoundField DataField="NUMBER_STRING_GUID" HeaderText="GUIDHidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>

                        <asp:BoundField DataField="STATUS" HeaderText="狀態Hidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="狀態">
                            <HeaderStyle Width="80" Wrap="False" />
                            <ItemTemplate>
                                <asp:Image ID="imgStatus" runat="server" />
                            </ItemTemplate>
                            <ItemStyle CssClass="cssCenter" Wrap="False" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="NUMBER_STRING_TYPE" HeaderText="字號類別Hidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="字號類別">
                            <HeaderStyle Width="120" Wrap="False" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnNumberString" OnClick="lbtnNumberString_Click" runat="server"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="DESCRIPTION" HeaderText="說明">
                            <HeaderStyle Wrap="False" Width="400" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="可使用人員">
                            <HeaderStyle Wrap="False" Width="50%" />
                            <ItemTemplate>
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" IsAllowEdit="false" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="排序">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <div class="lbtnUpPadding">
                                                <asp:Image ID="imgup" ImageUrl="~/Common/Images/Icon/icon_m113.gif" runat="server" />
                                                <asp:LinkButton ID="lbtnup" Text="上移" OnClick="btnup_Click" runat="server"></asp:LinkButton>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <asp:Image ID="imgdown" ImageUrl="~/Common/Images/Icon/icon_m114.gif" runat="server" />
                                                <asp:LinkButton ID="lbtndown" Text="下移" OnClick="btndown_Click" runat="server"></asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" Width="150px" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" Width="150px" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="IS_USED" HeaderText="IS_USEDHidden">
                            <HeaderStyle CssClass="cssHidden" />
                            <ItemStyle CssClass="cssHidden" />
                        </asp:BoundField>
                    </Columns>
                </Ede:Grid>
            </div>
            <asp:HiddenField ID="hfOrgId" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblList" runat="server" Text="收發文機關列表" Visible="false"></asp:Label>

    

    <asp:HiddenField ID="hfOrderCount" runat="server" />

</asp:Content>


