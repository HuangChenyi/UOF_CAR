<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ViewSubmit" Title="未命名頁面" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ViewSubmit.aspx.cs" %>
   
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <table style="width: 100%" cellspacing="1" class="PopTable">
        <tr>
            <td style="width: 130px">
                <asp:CheckBox ID="chkAnsopt" runat="server" Text="顯示全部答案選項" AutoPostBack="True" 
                    oncheckedchanged="chkAnsopt_CheckedChanged" 
                    meta:resourcekey="chkAnsoptResource1" />
            </td>
            <td style="width: 60px">
                <asp:Label ID="Label2" runat="server" Text="人員姓名" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td style="width: 50px">
                <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
            </td>
            <td>
                <telerik:RadButton ID="btnQuery" runat="server" Text="查詢" OnClick="btnQuery_Click" meta:resourcekey="btnQueryResource1"></telerik:RadButton>
            </td>
        </tr>
    </table>
    <Fast:Grid ID="gridSubmit" runat="server" AutoGenerateColumns="False" 
        DataKeyOnClientWithCheckBox="False"  
        Width="100%" DataKeyNames="TAGET_USER" AllowPaging="True" 
        EnhancePager="True" PageSize="15" HorizontalAlign="Center" AutoGenerateCheckBoxColumn="False"
        AllowSorting="True" onrowdatabound="gridSubmit_RowDataBound" 
                >
        <EnhancePagerSettings
            ShowHeaderPager="True"></EnhancePagerSettings>
        <Columns>
            <asp:TemplateField HeaderText="人員姓名" SortExpression="TAGET_USER" 
                meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnName" runat="server" Text='<%#: Eval("NAME") %>' 
                        meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="填寫" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="已填寫" 
                        meta:resourcekey="Label1Resource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="回收時間"
                SortExpression="TB_QUE_DETAIL.MODIFY_DATE" 
                meta:resourcekey="BoundFieldResource1">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblModifyDate" Text=""></asp:Label>
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
    <asp:Label ID="lblType" runat="server" Text="瀏覽個人填寫問卷" Visible = "False" 
                meta:resourcekey="lblTypeResource1"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
