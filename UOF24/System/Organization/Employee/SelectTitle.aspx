<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_SelectTitle"
    Title="設定部門職級" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="SelectTitle.aspx.cs" %>

<%@ Register Src="~/Common/Organization/Hierarchical_Department.ascx" TagPrefix="uc1" TagName="Hierarchical_Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    function resizeLeftTree(X, Y) {
        var tree = $find("<%=HRDepartmentTree.TreeClientId %>");
        tree.get_element().style.overflow = "auto";
        var minusY = 60;
        if ($("#<%=hfIsAdmin.ClientID%>").val() == "True") {
            minusY = 30;
        }
        tree.get_element().style.height = (Y - minusY) + "px";
        var newx=X/3-3
        if (newx < 200)
            newx=200

        tree.get_element().style.width = newx + "px";


        window.setTimeout(function () {
              var selectedNode = tree.get_selectedNode();

                if (selectedNode != null) {
                    selectedNode.scrollIntoView();
                }
            }, 500);
        }

</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadSplitter ID="MainRadSplitter" runat="server" BorderSize="0" LiveResize="true"
                ResizeWithBrowserWindow="true" ResizeWithParentPane="true">
                <telerik:RadPane ID="RadPaneLeft" runat="server" Scrolling="none" Width="33%" MinWidth="200">
                    <telerik:RadSplitter ID="RadSplitterLeft" runat="server" Orientation="Horizontal" BorderSize="0">
                        <telerik:RadPane ID="RadSplitterLeftTop" runat="server" Height="30px" Scrolling="None">
                            <table style="height: 100%; width: 100%"
                                class="NormalPopTable">
                                <tr>
                                    <td class="PopTableHeader" style="text-align: left">
                                        <asp:Label ID="Label1" runat="server" Text="部門" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPane>
                        <telerik:RadPane ID="RadSplitterLeftDown" runat="server" Scrolling="None">
                            <table runat="server" id="tbDepartment" style="margin-bottom: 5px;">
                                <tr>
                                    <td style="white-space: nowrap;">
                                        <asp:Label ID="Label4" runat="server" Text="可管理部門：" meta:resourcekey="TBLabelResource1"></asp:Label>
                                    </td>
                                    <td style="overflow: auto; width: 200px;">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"
                                            meta:resourcekey="ddlDepartmentResource1">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                            <uc1:Hierarchical_Department runat="server" ID="HRDepartmentTree" Width="300px" Height="500px" DisplayActiveControl="true" />
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </telerik:RadPane>
                <telerik:RadPane ID="RadPaneMiddle" runat="server" Scrolling="none" Width="33%" MinWidth="200">
                    <telerik:RadSplitter ID="RadSplitterMiddle" runat="server" Orientation="Horizontal" BorderSize="0">
                        <telerik:RadPane ID="RadSplitterMiddleTop" runat="server" Height="30px" Scrolling="None">
                            <table style="height: 100%; width: 100%"
                                class="NormalPopTable">
                                <tr>
                                    <td class="PopTableHeader" style="text-align: left">
                                        <asp:Label ID="Label2" runat="server" Text="職級" meta:resourcekey="Label2Resource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPane>
                        <telerik:RadPane ID="RadSplitterMiddleDown" runat="server">
                            <asp:RadioButtonList ID="rdoTitle" runat="server" meta:resourcekey="rdoTitleResource1">
                            </asp:RadioButtonList>
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </telerik:RadPane>
                <telerik:RadPane ID="RadPaneRight" runat="server" Scrolling="none" Width="33%" MinWidth="200">
                    <telerik:RadSplitter ID="RadSplitterRight" runat="server" Orientation="Horizontal" BorderSize="0">
                        <telerik:RadPane ID="RadSplitterRightTop" runat="server" Height="30px" Scrolling="None">
                            <table style="height: 100%; width: 100%"
                                class="NormalPopTable">
                                <tr>
                                    <td class="PopTableHeader" style="text-align: left">
                                        <asp:Label ID="Label3" runat="server" Text="職務" meta:resourcekey="Label3Resource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </telerik:RadPane>
                        <telerik:RadPane ID="RadSplitterRightDown" runat="server">
                            <asp:CheckBoxList ID="chkFunc" runat="server" meta:resourcekey="chkFuncResource1">
                            </asp:CheckBoxList>
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:HiddenField ID="hfIsAdmin" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
