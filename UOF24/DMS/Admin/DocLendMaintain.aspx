<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_DocLendMaintain" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocLendMaintain.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function DeleteLend(DocId, LendUser) {
            var strConfirmDel = "<%=labConfirmDel.Text %>";

            if (confirm(strConfirmDel) == true) {
                var data = [DocId, LendUser];
                $uof.pageMethod.sync("DeleteLend", data);
                //DMS_Admin_DocLendMaintain.DeleteLend(DocId, LendUser);
            }
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%; height: 100%;" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align: top;" cellpadding="0" cellspacing="0">
                        <table border="1" style="width: 80%; margin: 0 auto;" class="PopTable" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="PopTableLeftTD">
                                    <asp:Label ID="Label2" runat="server" Text="狀態" meta:resourcekey="Label2Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD">
                                    <asp:DropDownList ID="ddlStatus" runat="server">
                                        <asp:ListItem Value="ACCEPT" meta:resourcekey="ACCEPTResource1">允許調閱</asp:ListItem>
                                        <asp:ListItem Value="DENY" meta:resourcekey="DENYResource1">拒絕調閱</asp:ListItem>
                                        <asp:ListItem Value="OVERDUE" meta:resourcekey="OVERDUEResource1">調閱過期</asp:ListItem>
                                        <asp:ListItem Value="CANCEL" meta:resourcekey="labLendCancelesource">調閱取消</asp:ListItem>
                                        <asp:ListItem Value="ALL" meta:resourcekey="ALLResource1">所有狀態</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="PopTableLeftTD">
                                    <asp:Label ID="Label4" runat="server" Text="調閱時間" meta:resourcekey="Label4Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD">
                                    <table border="0">
                                        <tr>
                                            <td>
                                                <telerik:RadDatePicker ID="webDateStart" runat="server"></telerik:RadDatePicker>
                                            </td>
                                            <td>～
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="webDateEnd" runat="server"></telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="PopTableLeftTD">
                                    <asp:Label ID="Label6" runat="server" Text="調閱理由" meta:resourcekey="Label6Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD">
                                    <asp:TextBox ID="txtReason" runat="server"></asp:TextBox>
                                </td>
                                <td class="PopTableLeftTD">
                                    <asp:Label ID="Label5" runat="server" Text="文件名稱" meta:resourcekey="Label5Resource1"></asp:Label>
                                </td>
                                <td class="PopTableRightTD">
                                    <asp:TextBox ID="txtDocKeyWord" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="PopTableLeftTD">
                                    <asp:Label ID="Label3" runat="server" Text="調閱者" meta:resourcekey="Label3Resource1"></asp:Label>
                                </td>
                                <td colspan="3" class="PopTableRightTD">
                                    <div style="overflow: auto; width: 100%; height: 70px">
                                        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="true" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" align="center" bgcolor="#FFFFFF" class="PopTableRightTD" style="height: 30px; text-align: center; vertical-align: middle;">
                                    <telerik:RadButton ID="imgBtnQuery" runat="server" Text="查詢" meta:resourcekey="imgBtnQueryResource1" OnClick="imgBtnQuery_Click1"></telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">
                        <Fast:Grid ID="gridLendMainTain" runat="server" Width="100%" AutoGenerateCheckBoxColumn="False"
                            AllowSorting="True" AutoGenerateColumns="False"
                            DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15"
                            OnRowDataBound="gridLendMainTain_RowDataBound" OnSorting="gridLendMainTain_Sorting"
                            AllowPaging="True" OnPageIndexChanging="gridLendMainTain_PageIndexChanging"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False"  >
                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                                LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                PreviousImageUrl="" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource1">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("DOC_NAME") %>' ID="TextBox2" __designer:wfdid="w8"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <span style="word-break: break-all; width: 210px;">
                                            <asp:Image runat="server" ID="docIcon" ImageUrl="~/DMS/images/icon/unknown.gif" __designer:wfdid="w9"></asp:Image>
                                            <asp:Label runat="server" Text='<%#: Bind("DOC_NAME") %>' ID="Label1" __designer:wfdid="w7"></asp:Label></span>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="false"/>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="版本" DataField="PUBLISH_MANUAL_VERSION" SortExpression="PUBLISH_MANUAL_VERSION"
                                    meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle Width="100px" Wrap="False" />
                                    <ItemStyle Width="100px" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="調閱者" SortExpression="LEND_USER" meta:resourcekey="TemplateFieldResource2">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("LEND_USER") %>' ID="TextBox3"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("LEND_USER") %>' ID="lblLendUser"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="false"/>
                                    <ItemStyle Width="200px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="調閱開始" SortExpression="LEND_START" meta:resourcekey="TemplateFieldResource4">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" __designer:wfdid="w10"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="labStartDate" runat="server"  __designer:wfdid="w9"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="調閱結束" SortExpression="LEND_END" meta:resourcekey="TemplateFieldResource5">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server"  __designer:wfdid="w12"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="labEndDate" runat="server"  __designer:wfdid="w7"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="調閱理由" meta:resourcekey="TemplateFieldResource6">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("LEND_REASON") %>' ID="TextBox7"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <span style="word-break: break-all; width: 210px;">
                                            <asp:Label runat="server" Text='<%#: Bind("LEND_REASON") %>' ID="Label2"></asp:Label>
                                        </span>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="false"/>
                                    <ItemStyle Width="200px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="狀態" SortExpression="APPROVE_STATUS" meta:resourcekey="BoundFieldResource4">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBox4"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblApproveStatus"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" Wrap="false" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblInform" runat="server" meta:resourcekey="lblInformResource1" Text="資訊" ></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="lblDeleteLend" OnClick="lblDeleteLend_Click" runat="server" meta:resourcekey="lblDeleteLendResource1"
                                            Text="取消調閱" ></asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="lblModifyLend" runat="server" meta:resourcekey="lblModifyLendResource1"
                                            OnClick="lblModifyLend_Click" Text="修改" ></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="false"/>
                                    <ItemStyle Width="200px" Wrap="false" HorizontalAlign="Center"/>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="labConfirmDel" runat="server" Text="確定要取消調閱?" Visible="False" meta:resourcekey="labConfirmDelResource1"></asp:Label>
    <asp:Label ID="lblApproving" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovingResource1"></asp:Label>
    <asp:Label ID="lblAccept" runat="server" Text="允許調閱" Visible="False" meta:resourcekey="lblAcceptResource1"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" Text="拒絕調閱" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>
    <asp:Label ID="labLendOverDue" runat="server" meta:resourcekey="labLendOverDueResource" Text="調閱過期" Visible="False"></asp:Label>
    <asp:Label ID="lblCancel" runat="server" Text="調閱取消" Visible="False" meta:resourcekey="labLendCancelesource"></asp:Label>
</asp:Content>

