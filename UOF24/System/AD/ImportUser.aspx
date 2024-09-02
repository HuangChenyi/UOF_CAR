<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_AD_ImportUser" Title="匯入AD帳號"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ImportUser.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0">
                <telerik:RadPane ID="TopRadPane" runat="server" Height="35px" Scrolling="None">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="Domain">
                                <ItemTemplate>
                                    <asp:Label ID="lblTitleDomain" runat="server" Text="網域：" meta:resourcekey="lblTitleDomainResource1"></asp:Label>
                                    <asp:DropDownList ID="ddlDomain" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDomain_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="Keyword" meta:resourcekey="TBTextBoxResource1">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtKeyWord" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                Value="Search" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="搜尋AD人員"
                                meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="CheckDomain">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chIsContainDomain" runat="server" Text="使用AD驗證" meta:resourcekey="chIsContainDomainResource1" />
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPane>
                <telerik:RadPane ID="ContentRadPane" runat="server" Scrolling="None">
                    <telerik:RadSplitter ID="ContentRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" BorderSize="0">
                        <telerik:RadPane ID="LeftRadPane" runat="server" Width="200px">
                            <telerik:RadTreeView ID="RadTreeView1" runat="server" AllowNodeEditing="false"
                                EnableDragAndDrop="false" OnNodeClick="RadTreeView1_NodeClick">
                            </telerik:RadTreeView>
                        </telerik:RadPane>
                        <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward">
                        </telerik:RadSplitBar>
                        <telerik:RadPane ID="RightRadPane" runat="server">
                            <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                AutoGenerateColumns="False" BackColor="White" BorderColor="White" DataKeyNames="sAMAccountName"
                                OnSorting="Grid1_Sorting" SelectedRowColor="White" AllowPaging="True" Width="100%"
                                OnPageIndexChanging="Grid1_PageIndexChanging" DataKeyOnClientWithCheckBox="False">
                                <Columns>
                                    <asp:BoundField DataField="sAMAccountName" HeaderText="帳號" SortExpression="sAMAccountName"
                                        meta:resourcekey="BoundFieldResource1" HeaderStyle-Wrap="false" ItemStyle-Wrap="false" />
                                    <asp:BoundField DataField="sn" HeaderText="姓氏" SortExpression="sn" meta:resourcekey="BoundFieldResource2" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="givenName" HeaderText="名字" SortExpression="givenName"
                                        meta:resourcekey="BoundFieldResource3" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="initials" HeaderText="英文縮寫" SortExpression="initials"
                                        meta:resourcekey="dFieldResource4" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="displayName" HeaderText="顯示名稱" SortExpression="displayName"
                                        meta:resourcekey="BoundFieldResource5" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="description" HeaderText="描述" SortExpression="description"
                                        meta:resourcekey="BoundFieldResource6" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="postalCode" HeaderText="郵遞區號" SortExpression="postalCode"
                                        meta:resourcekey="BoundFieldResource7" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="co" HeaderText="國家/地區" SortExpression="co" meta:resourcekey="BoundFieldResource8" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="st" HeaderText="省份" SortExpression="st" meta:resourcekey="BoundFieldResource9" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="l" HeaderText="縣市" SortExpression="l" meta:resourcekey="BoundFieldResource10" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="streetAddress" HeaderText="街道" SortExpression="streetAddress"
                                        meta:resourcekey="BoundFieldResource11" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="postOfficeBox" HeaderText="郵政信箱" SortExpression="postOfficeBox"
                                        meta:resourcekey="BoundFieldResource12" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="telephoneNumber" HeaderText="電話號碼" SortExpression="telephoneNumber"
                                        meta:resourcekey="BoundFieldResource13" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="facsimileTelephoneNumber" HeaderText="傳真" SortExpression="facsimileTelephoneNumber"
                                        meta:resourcekey="BoundFieldResource14" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="company" HeaderText="公司" SortExpression="company" meta:resourcekey="BoundFieldResource15" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="department" HeaderText="部門" SortExpression="department"
                                        meta:resourcekey="BoundFieldResource16" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="title" HeaderText="職級" SortExpression="title" meta:resourcekey="BoundFieldResource17" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="manager" HeaderText="主管" meta:resourcekey="BoundFieldResource18" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="physicalDeliveryOfficeName" HeaderText="辦公室" SortExpression="physicalDeliveryOfficeName"
                                        meta:resourcekey="BoundFieldResource19" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="info" HeaderText="注意事項" SortExpression="info" meta:resourcekey="BoundFieldResource20" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="wWWHomePage" HeaderText="網頁" SortExpression="wWWHomePage"
                                        meta:resourcekey="BoundFieldResource21" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="mail" HeaderText="電子郵件" SortExpression="mail" meta:resourcekey="BoundFieldResource22" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="homePhone" HeaderText="住家電話" SortExpression="homePhone"
                                        meta:resourcekey="BoundFieldResource23" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="mobile" HeaderText="行動電話" SortExpression="mobile" meta:resourcekey="BoundFieldResource24" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="ipPhone" HeaderText="IP電話" SortExpression="ipPhone" meta:resourcekey="BoundFieldResource25" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                    <asp:BoundField DataField="pager" HeaderText="呼叫器" SortExpression="pager" meta:resourcekey="BoundFieldResource26" HeaderStyle-Wrap="false" ItemStyle-Wrap="false"/>
                                </Columns>
                            </Fast:Grid>
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:HiddenField ID="hidADServerIP" runat="server" />
            <asp:HiddenField ID="hidADUser" runat="server" />
            <asp:HiddenField ID="hidPW" runat="server" />
            <asp:HiddenField ID="hidIsSearch" runat="server" />
            <asp:HiddenField ID="hidKeyword" runat="server" />
            <asp:HiddenField ID="hidFullyDomainName" runat="server" />
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
