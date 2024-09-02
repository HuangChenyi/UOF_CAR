<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ViewWriter" culture="auto" uiculture="auto" Codebehind="ViewWriter.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>  
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" >
                <Items>                          
                    <telerik:RadToolBarButton runat="server" Value="Name" meta:resourcekey="RadToolBarNameResource1">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text="人員姓名" meta:resourcekey="Label2Resource1" ></asp:Label>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>   
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.png"
                        ImageUrl="~/Common/Images/Icon/icon_m39.png"
                        meta:resourcekey="RadToolBarQueryResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Receiver" meta:resourcekey="RadToolBarReceiverResource1">
                        <ItemTemplate>
                            <asp:RadioButtonList ID="rblReceiver" RepeatDirection="Horizontal" runat="server" meta:resourcekey="rblReceiverResource1">
                                <asp:ListItem Text="尚未填寫人員" Value="UnSend" Selected="True" meta:resourcekey="UnSendListItemResource1"></asp:ListItem>
                                <asp:ListItem Text="所有人員" Value="All" meta:resourcekey="AllListItemResource1"></asp:ListItem>
                                <asp:ListItem Text="勾選人員" Value="ByGrid" meta:resourcekey="ByGridListItemResource1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="發送通知" Value="Send"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m216.gif"
                        meta:resourcekey="RadToolBarSendResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
         <div style="padding-left:3px;padding-top :3px;width:99%">
            <Fast:Grid ID="gridSubmit" runat="server" AutoGenerateColumns="False" 
                DataKeyOnClientWithCheckBox="False"  
                Width="100%" DataKeyNames="TAGET_USER" AllowPaging="True" 
                EnhancePager="True" PageSize="15" HorizontalAlign="Center" AutoGenerateCheckBoxColumn="True"
                AllowSorting="True" OnRowDataBound="gridSubmit_RowDataBound">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                <Columns>
                    <asp:BoundField HeaderText="人員" DataField="TAGET_USER" Visible="false" meta:resourcekey="BoundFieldResource4" />
                    <asp:TemplateField HeaderText="人員姓名" SortExpression="NAME" meta:resourcekey="BoundFieldResource1" >
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="完成數" SortExpression="SM"  DataField="SM" />
                </Columns>
            </Fast:Grid>
            </div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                SelectCountMethod="GetQueWriter_Count" SelectMethod="GetQueWriter" SortParameterName="strSortExpression"
                StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusUCO" 
                OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:Parameter Name="conditon"  />
                    <asp:Parameter Name="intStartIndex" Type="Int32" />
                    <asp:Parameter Name="intMaxRows" Type="Int32" />
                    <asp:Parameter Name="strSortExpression" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="lblQusName" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblMasterID" runat="server" Visible="False" 
                meta:resourcekey="lblMasterIDResource1"></asp:Label>
            <asp:Label ID="lblDesignID" runat="server" Visible="False" 
                meta:resourcekey="lblDesignIDResource1"></asp:Label>
            <asp:Label ID="lblUN" runat="server" Text="未填寫" Visible="False" 
                meta:resourcekey="lblUNResource1"></asp:Label>
            <asp:Label ID="lblSM" runat="server" Text="已填寫" Visible="False" 
                meta:resourcekey="lblSMResource1"></asp:Label>
            <asp:Label ID="lblLinkName" runat="server" Text="請點選此處,填寫問卷。" Visible="False" meta:resourcekey="lblLinkNameResource1"></asp:Label>
            <asp:Label ID="lblSendSuccess" runat="server" Visible="False" Text="發送通知將進入系統排程" meta:resourcekey="lblSendSuccessResource1"></asp:Label>
            <asp:Label ID="lblNoMail" runat="server" Visible="False" Text="問卷通知功能未啟用或問卷已經不存在" meta:resourcekey="lblNoMailResource1" ></asp:Label>
            <asp:Label ID="lblCheckEmpty" runat="server" Text="請勾選問卷通知人員" Visible="False" meta:resourcekey="lblCheckEmptyResource1" ></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
