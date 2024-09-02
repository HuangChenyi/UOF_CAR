<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_ContactDataList" Title="聯絡人清單" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ContactDataList.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            var custumId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["CUSTOMER_ID"],true)%>');
            switch (key) {
                case "btnAdd":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/ContactEdit.aspx", args.get_item(), "<%=lblAddContact.Text%>", 725, 650, OpenDialogResult, { "Mode": "Insert", "CustID": custumId });
                    break;
                case "btnDelete":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                    if (CheckedData == "") {
                        alert("<%= lblhiddenDelete.Text %>");
                        args.set_cancel(true);
                        return;
                    }
                    else {
                        var deletedata = [CheckedData];
                        var haveAccount = $uof.pageMethod.sync("CheckHaveAccount", deletedata);
                        if (haveAccount == "true") {
                            if (!window.confirm('<%=lblDelHaveAccountConfirmMsg.Text %>')) {
                                args.set_cancel(true);
                            }
                        }
                        else {
                            if (!window.confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                                args.set_cancel(true);
                            }
                        }
                    }
                    break;
                case "btnCreate":
                    var CheckedData = $uof.fastGrid.getChecked('<%= grd.ClientID %>');
                    var CustID = custumId;
                    if (CheckedData == "") {
                        alert("<%= lblhiddenCreate.Text %>");
                        args.set_cancel(true);
                        return;
                    }
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/CreateExternalAccountByBat.aspx", args.get_item(), "", 700, 520, CreareDialogResult, { "CONTACT_ID": CheckedData, "CustID": CustID });
                    break;        
            }
        }
        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) === "undefined" || returnValue === null) {
                return false;
            }
            else
                return true;
        }

        function CreareDialogResult(returnValue) {
            if (typeof (returnValue) === "undefined" || returnValue === "AlreadyCreate" || returnValue === null) {
                if (returnValue === "AlreadyCreate") {
                    alert("<%= lblAlreadyCreate.Text %>");
                    }
                    return false;
                }
                else {
                    return true;
                }
            }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBar1ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="新增聯絡人" Value="btnAdd"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        meta:resourcekey="RadToolBarAddResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除聯絡人" Value="btnDelete"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        meta:resourcekey="RadToolBarDeleteResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="建立外部會員帳號" Value="btnCreate"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        meta:resourcekey="RadToolBarCreateResource1">
                    </telerik:RadToolBarButton >
                    <telerik:RadToolBarButton IsSeparator="True" Value="sp" runat="server" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton  runat="server" Value="Title" meta:resourcekey="RadToolBarButtonResource4">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblTitle" Text="關鍵字(姓名/電子郵件/外部會員帳號)" meta:resourcekey="lblTitleResource1"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                     <telerik:RadToolBarButton runat="server" value="Keyword" meta:resourcekey="RadToolBarButtonResource5" >
                        <ItemTemplate>
                            <asp:TextBox ID="txtKeyword" runat="server" Width="120px" meta:resourcekey="txtKeywordResource1"    ></asp:TextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>               
                    <telerik:RadToolBarButton runat="server" 
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        Value="btndSearch" 
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"                       
                        Text="查詢" meta:resourcekey="RadToolBarButtonResource6" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource7" ></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <Fast:Grid ID="grd" runat="server" DataKeyNames="CONTACT_ID" AllowSorting="True"
                AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                DataKeyOnClientWithCheckBox="True"
                EnhancePager="True" PageSize="15"
                AllowPaging="True" Width="100%"
                OnRowDataBound="grd_RowDataBound"
                DefaultSortDirection="Ascending" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdResource2">
                <EnhancePagerSettings
                    ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="姓名" meta:resourcekey="TemplateFieldResource1" SortExpression="CONTACT_NAME">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text='<%#: Eval("CONTACT_NAME") %>' ID="lbtn" OnClick="lbtn_Click"
                                meta:resourcekey="lbtnResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>             
                    <asp:TemplateField HeaderText="主要聯絡人" meta:resourceKey="TemplateFieldResource6" SortExpression="IS_MAIN_CONTACT">
                        <ItemTemplate>
                            <asp:Label ID="lblIsMainContact" runat="server" Text='<%#: Eval("IS_MAIN_CONTACT") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="sex" HeaderText="性別" meta:resourcekey="BoundFieldResource1" SortExpression="SEX">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DEPARTMENT" HeaderText="單位" meta:resourcekey="BoundFieldResource2" SortExpression="DEPARTMENT">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TITLE" HeaderText="職稱" meta:resourcekey="BoundFieldResource3" SortExpression="TITLE">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="電話" meta:resourcekey="TemplateFieldResource2" SortExpression="TEL" DataField="TEL"/>    
                    <asp:BoundField DataField="EXT_NUM" HeaderText="分機" meta:resourcekey="BoundFieldResource5" SortExpression="EXT_NUM">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="手機" meta:resourcekey="TemplateFieldResource3" SortExpression="MOBILE_PHONE" DataField="MOBILE_PHONE"/>
                    <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" SortExpression="EMAIL"  meta:resourcekey="TemplateFieldResource4">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="外部會員帳號" SortExpression="EBACCOUNT" meta:resourcekey="TemplateFieldResource5" DataField="EBACCOUNT">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
            </Fast:Grid>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" MaximumRowsParameterName="intMaxRows"
                OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetContactDataSetByCustID_Count"
                SelectMethod="GetContactDataSetByCustID" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
                TypeName="Ede.Uof.EIP.Customer.UCO.CUSContactUCO" EnablePaging="True">
                <SelectParameters>
                    <asp:Parameter Name="CustID" Type="String" />
                    <asp:Parameter Name="intStartIndex" Type="Int32" />
                    <asp:Parameter Name="intMaxRows" Type="Int32" />
                    <asp:Parameter Name="strSortExpression" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblhiddenDelete" runat="server" Text="沒有挑選要刪除的項目" Visible="False" meta:resourcekey="lblhiddenDeleteResource1"></asp:Label>
    <asp:Label ID="lblAddContact" runat="server" Text="新增聯絡人" Visible="False" meta:resourcekey="lblAddContactResource1"></asp:Label>
    <asp:Label ID="lblEdit" runat="server" Text="修改聯絡人資料" Visible="False" meta:resourcekey="lblEditResource1"></asp:Label>
    <asp:Label ID="lblContact" runat="server" Text="瀏覽聯絡人資料" Visible="False" meta:resourcekey="lblContactResource1"></asp:Label>
    <asp:Label ID="lblMale" runat="server" Text="男" Visible="False" meta:resourcekey="lblMaleResource1"></asp:Label>
    <asp:Label ID="lblFemale" runat="server" Text="女" Visible="False" meta:resourcekey="lblFemaleResource1"></asp:Label>
    <asp:Label ID="lblhiddenCreate" runat="server" Text="沒有挑選要建立的項目" Visible="False" meta:resourcekey="lblhiddenCreateResource1"></asp:Label>
    <asp:Label ID="lblAlreadyCreate" runat="server" Text="挑選的項目裡已有建立外部會員帳號,請選擇尚未建立帳號的項目" Visible="False" meta:resourcekey="lblAlreadyCreateResource1"></asp:Label>
    <asp:Label ID="lblDelHaveAccountConfirmMsg" runat="server" Text="挑選的項目裡已有建立外部會員帳號，確定要刪除嗎?" Visible="False" meta:resourcekey="lblDelHaveAccountConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="false" meta:resourcekey="lblYesResource1"></asp:Label>
    
    <iframe id="CalltoFrame" name="CalltoFrame" height="0" width="0"></iframe>
</asp:Content>