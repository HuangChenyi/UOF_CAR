<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ViewUnRegister" culture="auto" uiculture="auto" Codebehind="ViewUnRegister.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>  
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" >
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "NoticeAgain":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/QUE/Design/ViewWriter.aspx", args.get_item(), "<%=lblNoticeAgain.Text%>", 900, 600, function () { return true; },
                        {
                            "QUS_MASTER_GUID": "<%=Request.QueryString["QUS_MASTER_GUID"].ToString()%>",
                            "DESIGN_MASTER_GUID": "<%=Request.QueryString["DESIGN_MASTER_GUID"].ToString()%>"
                        });
                    break;                
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBarButtonClicking">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="ShowAnsopt" meta:resourcekey="RadToolBarShowAnsoptResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbAnsopt" runat="server" Text="顯示全部答案選項" AutoPostBack="True" 
                            OnCheckedChanged="cbAnsopt_CheckedChanged" meta:resourcekey="cbAnsoptResource1"/>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="再次通知" Value="NoticeAgain"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        meta:resourcekey="RadToolBarNoticeAgainResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" Value="Separator"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <Fast:Grid ID="gridSubmit" runat="server" AutoGenerateColumns="False" 
                DataKeyOnClientWithCheckBox="False"  
                Width="100%" DataKeyNames="TAGET_USER" AllowPaging="True" 
                EnhancePager="True" PageSize="15" HorizontalAlign="Center" AutoGenerateCheckBoxColumn="False"
                AllowSorting="True" OnRowDataBound="gridSubmit_RowDataBound" 
                >
                <EnhancePagerSettings
                    ShowHeaderPager="True"></EnhancePagerSettings>
                <Columns>
                    <asp:TemplateField HeaderText="問卷" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnQue" runat="server" meta:resourcekey="lbtnQueResource1"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                SelectCountMethod="GetQueDetail_Count" SelectMethod="GetQueDetail" SortParameterName="strSortExpression"
                StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusUCO">
                <SelectParameters>
                    <asp:Parameter Name="conditon" />
                    <asp:Parameter Name="intStartIndex" />
                    <asp:Parameter Name="intMaxRows" />
                    <asp:Parameter Name="strSortExpression" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="lblType" runat="server" Text="瀏覽個人填寫問卷" Visible="False" 
                meta:resourcekey="lblTypeResource1"></asp:Label>
            <asp:Label ID="lblQusName" runat="server" Visible="False" 
                meta:resourcekey="lblQusNameResource1"></asp:Label>
            <asp:Label ID="lblViewWrite" runat="server" Text="查看填寫人" Visible="False" 
                meta:resourcekey="lblViewWriteResource1"></asp:Label>
              <asp:Label ID="lblLinkName" runat="server" Text="請點選此處,填寫問卷。" Visible="False" 
                meta:resourcekey="lblLinkNameResource1"></asp:Label>
              <asp:Label ID="lblName" runat="server" Text="回收問卷" Visible="False" 
                meta:resourcekey="lblNameResource1"></asp:Label>
              <asp:Label ID="lblSendSuccess" runat="server" Visible="False" Text="通知已送出" 
                meta:resourcekey="lblSendSuccessResource1"></asp:Label>
            <asp:Label ID="lblNoMail" runat="server" Visible="False" Text="問卷通知功能未啟用或問卷已經不存在" meta:resourcekey="lblNoMailResource1"></asp:Label>
            <asp:Label ID="lblNoticeAgain" runat="server" Visible="False" Text="再次通知" meta:resourcekey="lblNoticeAgainResource1"></asp:Label>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
