<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ViewSend" Title="" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ViewSend.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           <table style="width: 100%" cellspacing="1" class="PopTable">
                <tr>
                  <%--  <td style="width: 60px">
                        <asp:Label ID="Label2" runat="server" Text="問卷填寫" 
                            meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td style="width: 50px">
                        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" 
                            OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" 
                            meta:resourcekey="ddlStatusResource1">
                            <asp:ListItem Value="ALL" Text="全部" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Value="SM" Text="已填寫" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Value="UN" Text="未填寫" meta:resourcekey="ListItemResource3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>--%>
                    <td align="left">
                        <telerik:RadButton ID="ibtnSend" runat="server" Text="再次通知未填寫者" OnClick="ibtnSend_Click" meta:resourcekey="ibtnSendResource1"></telerik:RadButton>
                    </td>
                </tr>
            </table>
            <div style="padding-left:3px;padding-top:3px;width:99%">
            <Fast:Grid ID="gridSubmit" runat="server" AutoGenerateColumns="False" 
                DataKeyOnClientWithCheckBox="False"  
                Width="100%" DataKeyNames="QUS_DETAIL_GUID" AllowPaging="True" 
                EnhancePager="True" PageSize="15" HorizontalAlign="Center" AutoGenerateCheckBoxColumn="False"
                AllowSorting="True" OnRowDataBound="gridSubmit_RowDataBound" 
                >
                <EnhancePagerSettings
                    ShowHeaderPager="True"></EnhancePagerSettings>
                <Columns>
                    <asp:BoundField HeaderText="人員姓名" DataField="NAME" 
                        meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField HeaderText="填寫" meta:resourcekey="BoundFieldResource2" />
                </Columns>
            </Fast:Grid>
            </div>
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
            <asp:Label ID="lblMasterID" runat="server" Visible="False" 
                meta:resourcekey="lblMasterIDResource1"></asp:Label>
            <asp:Label ID="lblDesignID" runat="server" Visible="False" 
                meta:resourcekey="lblDesignIDResource1"></asp:Label>
            <asp:Label ID="lblUN" runat="server" Text="未填寫" Visible="False" 
                meta:resourcekey="lblUNResource1"></asp:Label>
            <asp:Label ID="lblSM" runat="server" Text="已填寫" Visible="False" 
                meta:resourcekey="lblSMResource1"></asp:Label>
            <asp:Label ID="lblLinkName" runat="server" Text="請點選此處,填寫問卷。" Visible="False" 
                meta:resourcekey="lblLinkNameResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    
      <asp:Label ID="lblSendSuccess" runat="server" Visible="False" Text="通知已送出"></asp:Label>
      <asp:Label ID="lblNoMail" runat="server" Visible="False" Text="問卷通知功能未啟用或問卷已經不存在" ></asp:Label>
                 
</asp:Content>
