<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Query_LandHistory" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="LandHistory.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid runat="server" ID="gridLendHistory"
                AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                AutoGenerateColumns="False"
                DataKeyOnClientWithCheckBox="True" EnhancePager="True" PageSize="15"
                OnRowDataBound="gridPersonLendApprove_RowDataBound" Width="100%"
                OnSorting="gridPersonLendApprove_Sorting" AllowPaging="True"
                OnPageIndexChanging="gridPersonLendApprove_PageIndexChanging"
                meta:resourcekey="gridLendHistoryResource1">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <Columns>
                    <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL"
                        meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="TextBox2" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <span style="width: 80px;">
                                <asp:Label runat="server" Text='<%#: Bind("DOC_SERIAL") %>' ID="Label1" meta:resourcekey="Label1Resource1"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="false" />
                        <ItemStyle Width="100px" Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME"
                        meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("DOC_NAME") %>' ID="TextBox4" meta:resourcekey="TextBox4Resource1"></asp:TextBox>


                        </EditItemTemplate>
                        <ItemTemplate>
                            <span style="word-break: break-all; width: 400px;">
                                <asp:Image runat="server" ID="docIcon2" ImageUrl="~/DMS/images/icon/unknown.gif"
                                    meta:resourcekey="docIcon2Resource1"></asp:Image>
                                &nbsp;
                                <asp:Label runat="server" Text='<%#: Bind("DOC_NAME") %>' ID="lblDocName2"
                                    meta:resourcekey="lblDocName2Resource1"></asp:Label></span>

                        </ItemTemplate>
                        <HeaderStyle Wrap="false" />
                        <ItemStyle  Wrap="false" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本"
                        SortExpression="MANUAL_VERSION" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Width="100px" Wrap="false" />
                        <ItemStyle Width="100px" HorizontalAlign="Center" Wrap="false" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="狀態" SortExpression="APPROVE_STATUS"
                        meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="TextBox1" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="labStatus" meta:resourcekey="labStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="false" />
                        <ItemStyle ForeColor="#FF8000" HorizontalAlign="Center" Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="申請時間" SortExpression="ADD_TIME" meta:resourcekey="BoundFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblAddTime" runat="server" Text=""></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="150px" Wrap="false" />
                        <ItemStyle Width="150px" Wrap="false" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="調閱開始時間" SortExpression="LEND_START" meta:resourcekey="BoundFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblLendStart" runat="server" Text=""></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="150px" Wrap="false" />
                        <ItemStyle Width="150px" Wrap="false" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="調閱結束時間" SortExpression="LEND_END" meta:resourcekey="BoundFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblLendEnd" runat="server" Text="Label"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="150px" Wrap="false" />
                        <ItemStyle Width="150px" Wrap="false" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnInfo2" Text="資訊" meta:resourcekey="lbtnInfo2Resource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="false" />
                        <ItemStyle Width="100px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle Height="30px" />
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblApproving" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovingResource1"></asp:Label>
    <asp:Label ID="lblAccept" runat="server" Text="允許調閱" Visible="False" meta:resourcekey="lblAcceptResource1"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" Text="拒絕調閱" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>
    <asp:Label ID="lblCancel" runat="server" Text="調閱取消" Visible="False" meta:resourcekey="labLendCancelesource"></asp:Label>
</asp:Content>