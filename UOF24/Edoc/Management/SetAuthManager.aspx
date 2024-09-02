<%@ Page Title="權限設定" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="SetAuthManager.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Management.SetAuthManager" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <telerik:RadTreeView ID="RadTreeView1" runat="server" OnNodeClick="RadTreeView1_NodeClick"></telerik:RadTreeView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <style type="text/css">
        .cssHidden{
            display: none;
        }

        .cssCenter{
            text-align: center;
        }
    </style>
    <script type="text/javascript">
    
            function OnRoleSetClicking(sender, args) {
                if (args.get_item().get_value() == "Create") {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/Edoc/Management/SetOrgManagerDialog.aspx", args.get_item(), '<%=lblCreate.Text%>', 600, 400, openDialogResult,
                        {"TYPE" : "Add", "ROLE_ID" : '<%=hfRoleId.Value%>'});
                }
                else if (args.get_item().get_value() == "Delete") {
                    var int = 0;
                    var checkbox = $('#' + '<%=grdOrg.ClientID%>' + ' input[type=checkbox][purpose=autocheck]')
                        .each(function () {
                            if ($(this).prop("checked")) { int++; }
                        });
                    if (int == 0) {
                        alert("<%=lblPleaseSelectOrg.Text%>");
                        args.set_cancel(true);
                    }
                    else {
                        if (confirm('<%=lblDelete.Text%>')) {
                            args.set_cancel(false);
                        }
                        else {
                            args.set_cancel(true);
                        }
                    }
                }
            }
        
            function openDialogResult(returnValue) {
                if (typeof (returnValue) == "undefined") {
                    return false;
                }
                return true;
            }
    </script>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
                    <table width="100%" class="PopTable" cellspacing="1" >
                        <tr>
                            <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">
                                <asp:Label ID="lblRole" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table id="tbEdocManager" width="100%" class="PopTable" cellspacing="1" runat="server">
                        <tr>
                            <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False" IsAllowEdit="false"/>
                            </td>
                        </tr>
                        <%--<telerik:RadToolBar ID="rtbRoleSet" runat="server" Width="100%" OnClientButtonClicking="OnRoleSetClicking" OnButtonClick="rtbRoleSet_ButtonClick">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="Create" Text="新增"
                                    ImageUrl="~/Common/Images/Icon/icon_m71.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m71.png">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="Delete" Text="刪除"
                                    ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03_g.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m03_g.gif">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="true"></telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>--%>
                        <tr>
                            <td class="PopTableHeader" style="text-align: center; padding: 0;">
                                <center>
                                    <asp:Label ID="Label2" runat="server" Text="可使用功能列表"></asp:Label>
                                </center>
                            </td>
                        </tr>
                    </table>
                    <table id="tbOrgManager" width="100%" class="PopTable" cellspacing="1" runat="server">
                        <tr>
                            <td style="background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif); text-align: left;">
                                <Ede:Grid ID="grdOrg" runat="server" AllowSorting="True"
                                    AutoGenerateColumns="False" Width="100%" EmptyDataText="沒有資料" PageSize="5"
                                    OnRowDataBound="grdOrg_RowDataBound" AutoGenerateCheckBoxColumn="false"
                                    DataKeyNames="ORG_AUTH_ID">
                                    <Columns>
                                        <asp:BoundField  DataField="ORG_AUTH_ID" HeaderText="管理員權限代碼">
                                            <HeaderStyle CssClass="cssHidden"/>
                                            <ItemStyle CssClass="cssHidden"/>
                                        </asp:BoundField>
                                        <asp:BoundField  DataField="ORG_NAME" HeaderText="收發文機關">
                                            <HeaderStyle Wrap="false" CssClass="cssCenter" Width="40%"/>
                                            <ItemStyle Wrap="false"/>
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="機關管理員">
                                            <ItemTemplate>
                                                <uc1:UC_ChoiceList ID="UC_ChoiceList2" runat="server" IsAllowEdit="false" />
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="false" CssClass="cssCenter"/>
                                            <ItemStyle Wrap="false"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="操作">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lbtnEdit" Text="編輯" OnClick="lbtnEdit_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="false" CssClass="cssCenter" Width="50px"/>
                                            <ItemStyle Wrap="false" CssClass="cssCenter" Width="50px"/>
                                        </asp:TemplateField>
                                    </Columns>
                                </Ede:Grid>
                            </td>
                        </tr>
                        <tr>
                            <td class="PopTableHeader" style="text-align: center; padding: 0;">
                                <center>
                                    <asp:Label ID="Label1" runat="server" Text="可使用功能列表"></asp:Label>
                                </center>
                            </td>
                        </tr>
                    </table>
                    <Ede:Grid ID="grdOrgUser" runat="server" AllowSorting="True"
                        AutoGenerateColumns="False" Width="100%" EmptyDataText="沒有資料" PageSize="5"
                        OnRowDataBound="grdOrgUser_RowDataBound" AutoGenerateCheckBoxColumn="false"
                        DataKeyNames="ORG_AUTH_ID">
                        <Columns>
                            <asp:BoundField  DataField="ORG_AUTH_ID" HeaderText="管理員權限代碼">
                                <HeaderStyle CssClass="cssHidden"/>
                                <ItemStyle CssClass="cssHidden"/>
                            </asp:BoundField>
                            <asp:BoundField  DataField="ORG_NAME" HeaderText="收發文機關" >
                                <HeaderStyle Wrap="false" CssClass="cssCenter" Width="40%"/>
                                <ItemStyle Wrap="false"/>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="發文機關使用者">
                                <ItemTemplate>
                                    <uc1:UC_ChoiceList ID="UC_ChoiceList2" runat="server" IsAllowEdit="false" ExpandToUser="false"/>
                                </ItemTemplate>
                                <HeaderStyle Wrap="false" CssClass="cssCenter"/>
                                <ItemStyle Wrap="false"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lbtnEdit" Text="編輯" OnClick="lbtnEdit_Click"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="false" CssClass="cssCenter" Width="50px"/>
                                <ItemStyle Wrap="false" CssClass="cssCenter" Width="50px"/>
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>

                    <Ede:Grid ID="grdFunction" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False" Width="100%"
                        OnRowDataBound="grdFunction_RowDataBound" AllowPaging="False">
                        <Columns>
                            <asp:BoundField  DataField="FUNC_NAME" HeaderText="功能名稱">
                                <HeaderStyle Wrap="false" CssClass="cssCenter"/>
                                <ItemStyle Wrap="false"/>
                            </asp:BoundField>
                        </Columns>
                    </Ede:Grid>

            <asp:HiddenField runat="server" ID="hfRoleId" />
            <asp:Label ID="lblRoleTip" runat="server" Text="角色說明：" Visible="false"></asp:Label>
            <asp:Label ID="lblEdocManager" runat="server" Text="被設定為電子公文管理員的人員，才可使用電子公文所有的功能。" Visible="False" ></asp:Label>
            <asp:Label ID="lblOrgManager" runat="server" Text="被設定為機關管理員的人員，才可使用電子公文收發文相關功能。" Visible="False" ></asp:Label>
            <asp:Label ID="lblSendOrgUser" runat="server" Text="被設定為發文機關使用者的人員，填寫電子發文申請單時才可選擇該機關來作為發文機關。" Visible="False" ></asp:Label>
            <asp:Label ID="lblCreate" runat="server" Text="新增" Visible="false"></asp:Label>
            <asp:Label ID="lblModify" runat="server" Text="維護" Visible="false"></asp:Label>
            <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="false"></asp:Label>
            <asp:Label ID="lblPleaseSelectOrg" runat="server" Text="請選擇收發文機關" Visible="false"></asp:Label>
            <asp:Label ID="lblList" runat="server" Text="角色列表" Visible="false"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
