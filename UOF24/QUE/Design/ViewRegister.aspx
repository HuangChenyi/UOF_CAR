<%@ Page Language="C#" Title="回收結果" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ViewRegister" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" Codebehind="ViewRegister.aspx.cs" %>
   
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>            
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>      
                    <telerik:RadToolBarButton runat="server" Value="ShowAnsopt" meta:resourcekey="RadToolBarShowAnsoptResource1">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbAnsopt" Text="顯示全部答案選項" runat="server" OnCheckedChanged="cbAnsopt_CheckedChanged"  meta:resourcekey="cbAnsoptResource1" />
                        </ItemTemplate>
                    </telerik:RadToolBarButton>        
                    <telerik:RadToolBarButton IsSeparator="True" runat="server"></telerik:RadToolBarButton>
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
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" Value="Separator"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <Fast:Grid ID="gridSubmit" runat="server" AutoGenerateColumns="False" 
                DataKeyOnClientWithCheckBox="False"  
                Width="100%" DataKeyNames="TAGET_USER" AllowPaging="True" 
                EnhancePager="True" PageSize="15" HorizontalAlign="Center" AutoGenerateCheckBoxColumn="True"
                OnBeforeExport="gridSubmit_BeforeExport"
                AllowSorting="True" OnRowDataBound="gridSubmit_RowDataBound"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" 
                KeepSelectedRows="False" meta:resourcekey="gridSubmitResource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" >
                <EnhancePagerSettings
                    ShowHeaderPager="True" firstaltimageurl="" firstimageurl="" lastaltimage="" lastimageurl="" nextialtimageurl="" nextimageurl="" pageinfocssclass="" pagenumbercssclass="" pagenumbercurrentcssclass="" pageredirectcssclass="" previousaltimageurl="" previousimageurl=""></EnhancePagerSettings>
                <exportexcelsettings allowexporttoexcel="True" DataSourceType="ObjectDataSource" />
                <Columns>
                    <asp:BoundField HeaderText="人員" DataField="TAGET_USER" Visible="false" meta:resourcekey="BoundFieldResource4" />
                    <asp:TemplateField HeaderText="人員姓名" SortExpression="NAME" meta:resourcekey="BoundFieldResource1" >
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
               <asp:BoundField HeaderText="完成數" DataField="SM"  SortExpression="SM" meta:resourcekey="BoundFieldResource2" />                        
                    <asp:TemplateField HeaderText="最近回收時間" SortExpression="SUBMIT_DATE" meta:resourcekey="BoundFieldResource3">                     
                        <ItemTemplate>
                            <asp:Label ID="lblLatestRecycleTime" runat="server" Text='<%# Bind("SUBMIT_DATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnViewAns" runat="server" Text="查看內容" meta:resourcekey="lbtnViewAnsResource1"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>        

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                SelectCountMethod="GetQueWriter_Count" SelectMethod="GetQueWriter" SortParameterName="strSortExpression"
                StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusUCO">
                <SelectParameters>
                    <asp:Parameter Name="conditon" />
                    <asp:Parameter Name="intStartIndex" />
                    <asp:Parameter Name="intMaxRows" />
                    <asp:Parameter Name="strSortExpression" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="lblType" runat="server" Text="瀏覽個人填寫問卷" Visible="False" meta:resourcekey="lblTypeResource1"></asp:Label>
            <asp:Label ID="lblUN" runat="server" Text="未填寫" Visible="False" meta:resourcekey="lblUNResource1"></asp:Label>
            <asp:Label ID="lblSM" runat="server" Text="已送出" Visible="False" meta:resourcekey="lblSMResource2"></asp:Label>
            <asp:Label ID="lblSA" runat="server" Text="已保存" Visible="False" meta:resourcekey="lblSAResource1" ></asp:Label>                
            <asp:Label ID="lblLinkName" runat="server" Text="請點選此處,填寫問卷。" Visible="False" meta:resourcekey="lblLinkNameResource1"></asp:Label>
            <asp:Label ID="lblSendSuccess" runat="server" Visible="False" Text="發送通知將進入系統排程" meta:resourcekey="lblSendSuccessResource1"></asp:Label>
            <asp:Label ID="lblPersonalQusList" Text ="選擇填寫/觀看問卷" Visible="False" runat="server" meta:resourcekey="lblPersonalQusListResource1"></asp:Label>
            <asp:Label ID="lblViewDetailList" Text ="觀看問卷" Visible="False" runat="server" meta:resourcekey="lblViewDetailListResource1"></asp:Label>
            <asp:Label ID="lblNoMail" runat="server" Visible="False" Text="問卷通知功能未啟用或問卷已經不存在" meta:resourcekey="lblNoMailResource1" ></asp:Label>
            <asp:Label ID="lblCheckEmpty" runat="server" Text="請勾選問卷通知人員" Visible="False" meta:resourcekey="lblCheckEmptyResource1" ></asp:Label>
            <asp:HiddenField ID="hidRcdSort" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
