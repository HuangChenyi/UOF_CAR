<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_FormAdmin" Title="表單管理" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="FormAdmin.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style type="text/css">
        /*解決網址無法折行造成過長問題*/
        .GridItemAlternating > td {
            word-break: break-all;
        }

        .GridItem > td {
            word-break: break-all;
        }

        .wrap {
            float: left;
            position: relative;
            left: 50%;
        }
    </style>

    <script id="FormAdminjs" type="text/javascript">

    function RemoveLockFailAlert() {
        alert('<%=lblRemoveLockFail.Text %>');
    }
    function CancelFormFailAlert() {
        alert('<%=lblRemoveLockFail.Text %>');
    }
</script>

<script type="text/javascript" id="telerikClientEvents1">
    function RadToolBar1_ButtonClicking(sender, args) {
        var int = 0;
        var checkbox = $('#' + '<%=DGFormList.ClientID%>' + ' input[type=checkbox][purpose=autocheck]')
            .each(function () {
                if ($(this).prop("checked")) { int++; }
            });
        if (int == 0) {
            alert("<%=lblPleaseSelectFrom.Text%>");
            args.set_cancel(true);
        }
        else {
            if (args.get_item().get_value() == "Delete") {
                if (confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>') == false) {
                    args.set_cancel(true);
                }
            }
        }
    }

</script>
<asp:UpdatePanel runat="server">
        <ContentTemplate>
<table width="100%">
   <tr>
      <td align="center" style="height: 76px">
          <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking">
              <Items>
                  <telerik:RadToolBarButton runat="server" Text="強制刪除" meta:resourcekey="TBarButtonResource1"
                      ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                      HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                      DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                      CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                      Value="Delete">
                  </telerik:RadToolBarButton>
                  <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                  </telerik:RadToolBarButton>
                  <telerik:RadToolBarButton Value="rtbDeleteTip">
                      <ItemTemplate>
                          <asp:Label ID="lblDeleteTip1" Text="" runat="server" ForeColor="Blue" meta:resourcekey="lblDeleteTip1Resource1"></asp:Label>
                          <asp:Label ID="lblDeleteTip2" Text="" runat="server" ForeColor="Blue" Visible="false" meta:resourcekey="lblDeleteTip2Resource1"></asp:Label>
                      </ItemTemplate>
                  </telerik:RadToolBarButton>
              </Items>
          </telerik:RadToolBar>
          <br />
         <table>
             <tr>
                <td style="width:800px" align="center">
                    <table  class="PopTable" cellspacing="1" style="text-align :left ">
                        <tr>
                            <td colspan="8" class="PopTableHeader"  style="height: 25px; text-align:center">
                            <center>
                              <asp:Label ID="lblBasicQuery" runat="server" Text="基本查詢" meta:resourcekey="lblBasicQueryResource1"></asp:Label>
                              </center>
                              </td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="height: 25px;width:100px" nowrap="nowrap">
                              <asp:Label ID="lblFormName" runat="server" Text="表單名稱" meta:resourcekey="lblFormNameResource1"></asp:Label></td>
                            <td class="PopTableRightTD" style="height: 25px;width:300px">
                               <asp:DropDownList ID="ddlFormName" runat="server" meta:resourcekey="ddlFormNameResource1">
                                  <asp:ListItem Value="all" meta:resourcekey="ListItemResource5" Text="所有表單"></asp:ListItem>
                              </asp:DropDownList></td>
                            <td class="PopTableLeftTD" style="height: 25px" nowrap="nowrap">
                              <asp:Label ID="lblFormStatus" runat="server" Text="表單狀態" meta:resourcekey="lblFormStatusResource1"></asp:Label></td>
                            <td id="status" runat="server" colspan="1" class="PopTableRightTD" style="height: 25px">
                                <asp:DropDownList ID="ddlFormStatus" runat="server" OnSelectedIndexChanged="ddlFormStatus_SelectedIndexChanged"
                                    AutoPostBack="true" meta:resourcekey="ddlFormStatusResource1">
                                  <asp:ListItem Value="all" meta:resourcekey="ListItemResource1" Text="所有狀態"></asp:ListItem>
                                  <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="處理中"></asp:ListItem>
                                  <asp:ListItem Value="4" meta:resourcekey="ListItemResource10" Text="退回申請者"></asp:ListItem>                                 
                                  <asp:ListItem Value="2" meta:resourcekey="ListItemResource3" Text="已結案" Selected="True"></asp:ListItem> 
                                  <asp:ListItem Value="3" meta:resourcekey="ListItemResource4" Text="異常"></asp:ListItem>               
                              </asp:DropDownList></td>
                            <td id="formResult" runat="server" class="PopTableLeftTD" style="height: 25px" nowrap="nowrap">
                               <asp:Label ID="lblFormResult" runat="server" Text="表單結果" meta:resourcekey="lblFormResultResource1"></asp:Label></td>
                            <td id="result" colspan="1" runat="server" class="PopTableRightTD" style="height: 25px">
                               <asp:DropDownList ID="ddlFormResult" runat="server" meta:resourcekey="ddlFormResultResource1" >
                                   <asp:ListItem  Text="所有結果" Value="all" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                   <asp:ListItem  Text="通過" Value="0" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                   <asp:ListItem  Text="否決" Value="1" meta:resourcekey="ListItemResource8"></asp:ListItem>
                                   <asp:ListItem  Text="作廢" Value="2" meta:resourcekey="ListItemResource9"></asp:ListItem>
                               </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td class="PopTableLeftTD" style="height: 25px" nowrap="nowrap">
                              <asp:Label ID="lblDate" runat="server" Text="日期" meta:resourcekey="lblDateResource1"></asp:Label></td>
                            <td class="PopTableRightTD" style="height: 25px" colspan="7">
                             <table>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="rblDate" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text="申請日期" Value="ApplyDate" meta:resourcekey="ApplyDateResource1"></asp:ListItem>
                                            <asp:ListItem Text="結案日期" Value="EndDate" Selected="True" meta:resourcekey="EndDateResource1"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                   <td>
                                       <telerik:RadDatePicker ID="rdpStartDate" runat="server">
                                       </telerik:RadDatePicker>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ForeColor="Red"
                                           ErrorMessage="請輸入日期(起)" ControlToValidate="rdpStartDate" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
                                   <td style="padding-left:3px; padding-right:3px;">~</td>
                                   <td>
                                       <telerik:RadDatePicker ID="rdpEndDate" runat="server"></telerik:RadDatePicker>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ForeColor="Red"
                                           ErrorMessage="請輸入日期(迄)" ControlToValidate="rdpEndDate" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator></td>
                        </tr>
                             </table>
                                <asp:UpdatePanel id="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                    <contenttemplate>
                                         <asp:CustomValidator runat="server" ErrorMessage="結束時間需晚於開始時間" ID="CustomValidator1" Display="Dynamic" ForeColor="Red"
                                             meta:resourceKey="CustomValidator1Resource1" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                    </contenttemplate>
                                    <triggers>
                                         <asp:AsyncPostBackTrigger ControlID="wibQuery" EventName="Click"></asp:AsyncPostBackTrigger>
                                    </triggers>
                                </asp:UpdatePanel></td>
                        </tr>
                        <tr>

                            <td class="PopTableLeftTD" style="height: 25px" nowrap="nowrap">
                              <asp:Label ID="lblDocNumbers" runat="server" Text="表單編號起訖" meta:resourcekey="lblDocNumbersResource1"></asp:Label></td>
                            <td class="PopTableRightTD" style="height: 25px" colspan="7">
                             <table>
                                <tr>
                                   <td>
                                       <asp:TextBox ID="tbNumberStart" runat="server" Width="120px" meta:resourcekey="tbNumberStartResource1"></asp:TextBox></td>
                                   <td style="padding-left:3px; padding-right:3px;">~</td>
                                   <td>
                                       <asp:TextBox ID="tbNumberEnd" runat="server" Width="120px" meta:resourcekey="tbNumberEndResource1"></asp:TextBox></td>
                                </tr>
                             </table>
                              <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請輸入表單編號(起)" OnServerValidate="CustomValidator2_ServerValidate" ForeColor="Red" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                              <asp:CustomValidator ID="CustomValidator3" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="請輸入表單編號(迄)" OnServerValidate="CustomValidator3_ServerValidate" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator></td>
                        </tr>
                        <tr>
                            <td colspan="8" style="text-align: center; height: 25px;" class="PopTableLeftTD">
                                 <div class="wrap" >       
                                     <telerik:RadButton ID="wibQuery" runat="server" Text="查詢" meta:resourcekey="wibQueryResource1" OnClick="wibQuery_Click1"></telerik:RadButton>
                                     </div>      
                            </td>
                        </tr>
                    </table>
                </td>
             </tr>
       </table>
          <br />
          <table width="100%" class="PopTable" cellspacing="1">
              <tr>
                  <td class="PopTableHeader" style="text-align: center">
                      <center>
          <asp:Label ID="lblFormList" runat="server" Text="表單列表" meta:resourcekey="lblFormListResource1"></asp:Label>
          </center>
                  </td>
              </tr>
          </table>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
              <ContentTemplate>
                  <Fast:Grid runat="server" EnhancePager="True" Width="100%" DataKeyOnClientWithCheckBox="False" AllowSorting="True" PageSize="15" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" ID="DGFormList" AllowPaging="True" DataKeyNames="TASK_ID" __designer:wfdid="w1" OnSorting="DGFormList_Sorting" OnRowCommand="DGFormList_RowCommand" OnPageIndexChanging="DGFormList_PageIndexChanging" OnRowDataBound="DGFormList_RowDataBound">
                      <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                      <Columns>
                          <asp:BoundField DataField="DOC_NBR" SortExpression="DOC_NBR" HeaderText="表單編號" meta:resourceKey="BoundFieldResource1">
                              <HeaderStyle Wrap="False"></HeaderStyle>
                              <ItemStyle Width="120px" HorizontalAlign="Left" />
                          </asp:BoundField>
                          <asp:TemplateField HeaderText="表單名稱" meta:resourceKey="TemplateFieldResource1">
                              <HeaderStyle Wrap="False"></HeaderStyle>
                              <ItemStyle HorizontalAlign="Left" />
                              <ItemTemplate>
                                  <asp:Label runat="server" ID="lblFormname" meta:resourceKey="lblFormnameResource2" __designer:wfdid="w13"></asp:Label>
                              </ItemTemplate>
                              <ItemStyle Width="180px" HorizontalAlign="Left" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="標題" meta:resourceKey="TemplateFieldResource6">
                              <ItemTemplate>
                                  <asp:Label ID="lblTitle" runat="server" meta:resourceKey="lblTitleResource1"></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Left" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="表單狀態" meta:resourceKey="TemplateFieldResource2">
                              <ItemStyle HorizontalAlign="Center" Width="65px" Wrap="False"></ItemStyle>
                              <HeaderStyle Wrap="False"></HeaderStyle>
                              <ItemTemplate>
                                  <asp:Label runat="server" ID="lblStatus" meta:resourceKey="lblStatusResource1" __designer:wfdid="w1"></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="50px" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="結果" meta:resourceKey="TemplateFieldResource5">
                              <ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
                              <HeaderStyle Wrap="False"></HeaderStyle>
                              <ItemTemplate>
                                  <asp:Label runat="server" ID="lblResult" meta:resourceKey="lblResultResource1" __designer:wfdid="w1"></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="50px" />
                          </asp:TemplateField>
                                <asp:TemplateField HeaderText="申請日期"  SortExpression="BEGIN_TIME" meta:resourceKey="BoundFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBeginTime" runat="server" ></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="130px"></ItemStyle>
                              <HeaderStyle Wrap="False"></HeaderStyle>
                                </asp:TemplateField>
                                <asp:TemplateField  HeaderText="結案時間"  SortExpression="END_TIME" meta:resourceKey="BoundFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEndTime" runat="server" ></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="130px"></ItemStyle>
                              <HeaderStyle Wrap="False"></HeaderStyle>
                                </asp:TemplateField>
                          <asp:TemplateField HeaderText="申請人" meta:resourceKey="TemplateFieldResource3">
                              <HeaderStyle Wrap="False"></HeaderStyle>
                              <ItemStyle HorizontalAlign="Left" Width="220px" />
                              <ItemTemplate>
                                  <asp:Label runat="server" ID="lblUser" meta:resourceKey="lblUserResource1" __designer:wfdid="w2"></asp:Label>

                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Left" Width="140px" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="操作" meta:resourceKey="TemplateFieldResource4">
                              <EditItemTemplate>
                                  &nbsp; 
                              </EditItemTemplate>
                              <ItemStyle Wrap="False" HorizontalAlign="Center" Width="220px"></ItemStyle>
                              <HeaderStyle Wrap="False"></HeaderStyle>
                              <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="lbtnSetNextSite" Text="送下一站" meta:resourceKey="lbtnSetNextSiteResource1" __designer:wfdid="w14"></asp:LinkButton>
                                  <asp:LinkButton runat="server" ID="lbtnAgentSet" Text="指定簽核" meta:resourceKey="lbtnAgentSetResource1" __designer:wfdid="w15"></asp:LinkButton>
                                  <asp:LinkButton runat="server" ID="lbtnRemoveLock" Text="解除鎖定" CommandName="RemoveLock" meta:resourceKey="lbtnRemoveLockResource1" __designer:wfdid="w16"></asp:LinkButton>
                                  <asp:LinkButton runat="server" ID="lbtnCancel" Text="作廢" CommandName="CancelForm" meta:resourceKey="lbtnCancelResource1" __designer:wfdid="w17"></asp:LinkButton>
                                  <asp:LinkButton runat="server" ID="lbtnTaskFlow" Text="流程" CommandName="TaskFlow" meta:resourceKey="lbtnTaskFlowResource1" __designer:wfdid="w18"></asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                      <PagerStyle HorizontalAlign="Left"></PagerStyle>
                  </Fast:Grid>
              </ContentTemplate>
              <Triggers>
                  <asp:AsyncPostBackTrigger ControlID="wibQuery" EventName="Click"></asp:AsyncPostBackTrigger>
                  <asp:AsyncPostBackTrigger ControlID="DGFormList" EventName="DataBound"></asp:AsyncPostBackTrigger>
                  <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
              </Triggers>
          </asp:UpdatePanel>
      </td>
   </tr>
</table>
        </ContentTemplate>
</asp:UpdatePanel>
    <asp:Label ID="lblReturnApplicant" runat="server" Text="退回申請者" Visible="False" meta:resourcekey="lblReturnApplicantResource1"></asp:Label>
    <asp:Label ID="lblStart" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblStartResource1"></asp:Label>
    <asp:Label ID="lblClose" runat="server" Text="已結案" Visible="False" meta:resourcekey="lblCloseResource1"></asp:Label>
    <asp:Label ID="lblUnusual" runat="server" Text="異常" Visible="False" meta:resourcekey="lblUnusualResource1"></asp:Label>
    <asp:Label ID="lblConfirmCancel" runat="server" Text="確定要作廢?" Visible="False" meta:resourcekey="lblConfirmCancelResource1"></asp:Label>
    <asp:Label ID="lblConfirmUnlock" runat="server" Text="確定要解除鎖定?" Visible="False" meta:resourcekey="lblConfirmUnlockResource1"></asp:Label>
    <asp:Label ID="lblQuery" runat="server" Text="查詢" Visible="False" meta:resourcekey="lblQueryResource1"></asp:Label>
    <asp:Label ID="lblPass" runat="server" Text="通過" Visible="False" meta:resourcekey="lblPassResource1"></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
    <asp:Label ID="lblInvalid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblInvalidResource1"></asp:Label>
    <asp:Label ID="lblRemoveLockFail" runat="server" Text="解除鎖定失敗，可能同時間有人異動表單狀態" Visible="False" meta:resourcekey="lblRemoveLockFailResource1" ></asp:Label>
    <asp:Label ID="lblCancelFormFail" runat="server" Text="表單已結案，無法作廢" Visible="False" meta:resourcekey="lblCancelFormFailResource1" ></asp:Label>
    <asp:Label ID="lblPleaseSelectFrom" runat="server" Text="請選擇表單" Visible="False" meta:resourcekey="lbllblPleaseSelectFromResource1"></asp:Label>
</asp:Content>

