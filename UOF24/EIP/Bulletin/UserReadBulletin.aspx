<%@ Page Title="人員公告瀏覽記錄" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_UserReadBulletin" Culture="auto" UICulture="auto" meta:resourcekey="PageResource1" Codebehind="UserReadBulletin.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="toolbarjs" type="text/javascript">

        function RadToolBar1_ButtonClicking(sender, args) {

            var Key = args.get_item().get_value();
            if (Key == "TBQuery") {
                var user = $("#<%=hfUserGuid.ClientID %>").val();            
                var lbltxt = $("#<%=lblPlsChoiceOne.ClientID %>").text();
                //alert(user);
                if (user == null || user == "") {
                    alert(lbltxt);
                    args.set_cancel(true);
                    return;
                }
            }

        }
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>    
    <table width="100%">
        <tr>
            <td style="height: 600px;vertical-align:top">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <contenttemplate>

                                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%"  OnClientButtonClicking="RadToolBar1_ButtonClicking"
                                        onbuttonclick="RadToolBar1_ButtonClick">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Value="QueryValue">
                                                <ItemTemplate>
                                                    <table width="100%" border="5" cellpadding="2" cellspacing="3" >
                                                        <tr>
                                                            <td style="padding-left:1px;padding-right:2px">
                                                                <asp:Label ID="lblCreateDate" runat="server" Text="發佈日期" meta:resourcekey="lblCreateDateResource1"></asp:Label>
                                                            </td>
                                                            <td style="padding-left:1px;padding-right:1px">
                                                                <telerik:RadDatePicker ID="rdStart" Runat="server">
                                                                    <DateInput runat="server" ClientEvents-OnValueChanging ="OnValueChanging"></DateInput>
                                                                </telerik:RadDatePicker>
                                                              
                                                            </td>
                                                            <td style="padding-left:1px;padding-right:1px">~</td>
                                                            <td style="padding-left:1px;padding-right:2px">
                                                                <telerik:RadDatePicker ID="rdEnd" Runat="server">
                                                                    <DateInput runat="server" ClientEvents-OnValueChanging ="OnValueChanging"></DateInput>
                                                                </telerik:RadDatePicker>
                                                            </td>
                                                            <td style="padding-left:1px;padding-right:2px">
                                                                <asp:DropDownList ID="ddlIsReaded" runat="server" meta:resourcekey="ddlIsReadedResource1">
                                                                    <asp:ListItem Text="全部" Value="0" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                                    <asp:ListItem Text="未讀公告" Value="1" Selected="True" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                                                    <asp:ListItem Text="已讀公告" Value="2" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="padding-left:1px;padding-right:2px">
                                                                <asp:CheckBox ID="cbIsExpire" runat="server" Text="含下架" meta:resourcekey="cbIsExpireResource1" />
                                                            </td>
                                                            <td style="padding-left:3px;padding-right:1px">                                                                
                                                                <asp:TextBox runat="server" ID="txtSelectUserName" Enabled="false" BackColor="White" ForeColor="Black"></asp:TextBox>
                                                            </td>
                                                            <td style="padding-left:1px;padding-right:3px">
                                                                <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnceUser" runat="server" ButtonText="" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="TBQuery" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" meta:resourcekey="TBarButtonResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <asp:HiddenField ID="hfUserGuid" runat="server" />
                                </contenttemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <contenttemplate>
                                                <Fast:Grid ID="UserReadBulletinGrid" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%"
                                                    AutoGenerateColumns="False" AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                                                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料" DefaultSortColumnName="CREATE_DATE"
                                                    EnhancePager="True" PageSize="15" AllowPaging="True" DataKeyNames="BULLETIN_GUID"
                                                    OnBeforeExport="UserReadBulletinGrid_BeforeExport" OnRowDataBound="UserReadBulletinGrid_RowDataBound"
                                                    OnSorting="UserReadBulletinGrid_Sorting" OnPageIndexChanging="UserReadBulletinGrid_PageIndexChanging"
                                                    meta:resourcekey="UserReadBulletinGridResource1" KeepSelectedRows="False">
                                                    <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                                                    <ExportExcelSettings AllowExportToExcel="True" ExportType="GridContent">
                                                    </ExportExcelSettings>
                                                    <Columns>
                                                        <asp:BoundField DataField="CLASS_NAME" HtmlEncode="false" HeaderText="公告類別" SortExpression="CLASS_NAME" meta:resourcekey="BoundFieldResource1">
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="180px"></ItemStyle>
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="主旨" SortExpression="TOPIC" meta:resourcekey="TemplateFieldResource1">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbtnTopic" runat="server" Text='<%#: Bind("TOPIC") %>' meta:resourcekey="lbtnTopicResource1"></asp:LinkButton>
                                                                <asp:HiddenField runat="server" ID="hifBulletin" Value='<%#: Bind("BULLETIN_GUID") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle Wrap="False"  />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="發佈者" SortExpression="ANNOUNCER" meta:resourcekey="TemplateFieldResource2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAnnouncer" runat="server" meta:resourcekey="lblAnnouncerResource1"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="200px" Wrap="False"></ItemStyle>                                                            
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="發佈時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource2">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPublishDate" runat="server" Text='<%#: Bind("CREATE_DATE") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="150px"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="瀏覽時間" SortExpression="READ_DATE" meta:resourcekey="BoundFieldResource3">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReadDate" runat="server" Text='<%#: Bind("READ_DATE") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="150px" Wrap="False"/>
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="推薦時間" SortExpression="RECOMMEND_DATE" meta:resourcekey="BoundFieldResource4">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRecommendDate" runat="server" Text='<%#: Bind("RECOMMEND_DATE") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="150px" Wrap="False"/>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </Fast:Grid>
                                            </contenttemplate>
                                            <triggers>
                                                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                                            </triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblChoiceUser" runat="server" Text="選擇人員" Visible="False" meta:resourcekey="lblChoiceUserResource1"></asp:Label>
                <asp:Label ID="lblPlsChoiceOne" runat="server" Text="請先選擇人員" style="display: none" meta:resourcekey="lblPlsChoiceOneResource1"></asp:Label>
                 <asp:Label ID="lblBulletinClass" runat="server" Text="公告類別" style="display: none" meta:resourcekey="BoundFieldResource1"></asp:Label>
                 <asp:Label ID="lblSubject" runat="server" Text="主旨" style="display: none" meta:resourcekey="TemplateFieldResource1"></asp:Label>
                 <asp:Label ID="lblPunlishUser" runat="server" Text="發佈者" style="display: none" meta:resourcekey="TemplateFieldResource2"></asp:Label>
                 <asp:Label ID="lblPublishTime" runat="server" Text="發佈時間" style="display: none" meta:resourcekey="BoundFieldResource2"></asp:Label>
                 <asp:Label ID="lblViewTime" runat="server" Text="瀏覽時間" style="display: none" meta:resourcekey="BoundFieldResource3"></asp:Label>
                 <asp:Label ID="lblRecommendTime" runat="server" Text="推薦時間" style="display: none" meta:resourcekey="BoundFieldResource4"></asp:Label>
            </td>
        </tr>
    </table>    
    <asp:HiddenField runat="server" ID="hfCurrentUser"></asp:HiddenField>
</asp:Content>
