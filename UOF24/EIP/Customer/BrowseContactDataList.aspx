<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_BrowseContactDataList" Title="聯絡人清單" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="BrowseContactDataList.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="grd" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False"  DataKeyNames="CONTACT_ID"
                DataKeyOnClientWithCheckBox="False"  EnhancePager="True"
                OnRowDataBound="grd_RowDataBound" PageSize="15"  
                Width="100%"
                DefaultSortDirection="Ascending">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="姓名" meta:resourcekey="TemplateFieldResource1">
                        <itemtemplate>
                            <asp:LinkButton runat="server" Text='<%#: Eval("CONTACT_NAME") %>' ID="lbtn" OnClick="lbtn_Click" meta:resourcekey="lbtnResource1">
                            </asp:LinkButton>
                        </itemtemplate>
                        <headerstyle wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="主要聯絡人" meta:resourceKey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblIsMainContact" runat="server" Text='<%#: Eval("IS_MAIN_CONTACT") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="sex" HeaderText="性別" meta:resourcekey="BoundFieldResource1" >
                        <headerstyle wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DEPARTMENT" HeaderText="單位" meta:resourcekey="BoundFieldResource2" >
                        <headerstyle wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TITLE" HeaderText="職級" meta:resourcekey="BoundFieldResource3" >
                        <headerstyle wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TEL" HeaderText="電話" meta:resourcekey="BoundFieldResource4" >
                        <headerstyle wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EXT_NUM" HeaderText="分機" meta:resourcekey="BoundFieldResource5" >
                        <headerstyle wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOBILE_PHONE" HeaderText="手機" meta:resourcekey="BoundFieldResource6" >
                        <headerstyle wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" 
                        meta:resourcekey="BoundFieldResource7" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EBACCOUNT" HeaderText="外部會員帳號" meta:resourcekey="BoundFieldResource8">       
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
            </Fast:Grid>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetContactDataSetByCustID_Count"
                SelectMethod="GetContactDataSetByCustID" SortParameterName="strSortExpression"
                StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.Customer.UCO.CUSContactUCO">
                <SelectParameters>
                    <asp:Parameter Name="CustID" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="intStartIndex" Type="Int32" />
                    <asp:Parameter Name="intMaxRows" Type="Int32" />
                    <asp:Parameter Name="strSortExpression" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblAddContact" runat="server" Text="新增聯絡人" Visible="False" meta:resourcekey="lblAddContactResource1"></asp:Label><asp:Label
        ID="lblEdit" runat="server" Text="修改聯絡人資料" Visible="False" meta:resourcekey="lblEditResource1"></asp:Label><asp:Label
            ID="lblContact" runat="server" Text="瀏覽聯絡人資料" Visible="False" meta:resourcekey="lblContactResource1"></asp:Label>
    <asp:Label ID="lblMale" runat="server" Text="男" Visible="False" meta:resourcekey="lblMaleResource1"></asp:Label>
    <asp:Label ID="lblFemale" runat="server" Text="女" Visible="False" meta:resourcekey="lblFemaleResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="false" meta:resourcekey="lblYesResource1"></asp:Label>

</asp:Content>

