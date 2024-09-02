<%@ Page Title="設定平行流程" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupParallelFlow" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetupParallelFlow.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register src="../Browse/UC_SubFlowLayOut/UC_ParallelSite.ascx" tagname="UC_ParallelSite" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <script type="text/javascript" id="telerikClientEvents1">
        function RadToolBar1_Clicking(sender, args) {
            var value = args.get_item().get_value();

            if (value=="Insert" ||  value=="Modify")
            {	
                var flowID = $("#<%=hfFlowID.ClientID %>").val();
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FlowManagement/SetupParallelFlowSite.aspx", args.get_item(), "<%=lblSubFlow.Text%>", 800, 600, openDialogResult, {"FlowID":flowID});
            }
    
            if(value=="Delete")
            {
                if(!confirm('<%=lblDelete.Text %>'))
                {
                    args.set_cancel(true);
                }
            }                
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>

<div style="text-align:center;">
  
        <table class="PopTable" cellspacing="0" border="0" cellpadding="1">
            <tr>
                <td colspan='4' align="center" class="PopTableHeader">
                <center>
                    <asp:Label ID="lbTitle1" runat="server" Text="平行流程資訊" 
                        meta:resourcekey="lbTitle1Resource1" ></asp:Label></center>
                </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" align="right">
                    <asp:Label ID="lbFlowName" runat="server" Text="流程名稱" 
                        meta:resourcekey="lbFlowNameResource1" ></asp:Label>
                </td>
                <td class="PopTableRightTD" style="text-align:left">
                    <asp:TextBox ID="tbxFlowName" runat="server"  Width="200px" 
                        meta:resourcekey="tbxFlowNameResource1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxFlowName"
                        Display="Dynamic" ErrorMessage="請輸入流程名稱" 
                        meta:resourcekey="RequiredFieldValidator1Resource1" ></asp:RequiredFieldValidator>
                </td>
                <td class="PopTableLeftTD">
                    <telerik:RadButton ID="BtnSaveInfo" runat="server" Text="儲存資訊"
                        meta:resourcekey="BtnSaveSubFlowInfoResource1" OnClick="BtnSaveInfo_Click"></telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td colspan='3' align="center" class="PopTableHeader"><center>
                    <asp:Label ID="lbTitle2" runat="server" Text="站點管理" 
                        meta:resourcekey="lbTitle2Resource1" ></asp:Label></center></td>
            </tr>
            <tr>
                <td style ="padding:0" colspan='3'  >
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_Clicking" 
                        OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                        <Items>
                            <telerik:RadToolBarButton runat="server" 
                                DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif" 
                                HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif" 
                                ImageUrl="~/Common/Images/Icon/icon_m02.gif" 
                                Value="Insert" 
                                CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif" 
                                Text="新增"
                                meta:resourceKey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl ="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" 
                                DisabledImageUrl="~/Common/Images/Icon/icon_m88.gif" 
                                HoveredImageUrl="~/Common/Images/Icon/icon_m88.gif" 
                                ImageUrl="~/Common/Images/Icon/icon_m88.gif" 
                                Value="Modify" 
                                CheckedImageUrl="~/Common/Images/Icon/icon_m88.gif" 
                                Text="修改"
                                meta:resourceKey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl ="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" 
                                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                ImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                Value="Delete" 
                                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                Text="刪除"
                                meta:resourceKey="TBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl ="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                        </Items>

                    </telerik:RadToolBar>

                </td>
            </tr>
            <tr>
                <td colspan='3' style="height: 90px; background-color: #ffffff; text-align:center">
                    <asp:Panel ID="Panel1" runat="server" Height="540px" ScrollBars="Auto" 
                        Width="100%" meta:resourcekey="Panel1Resource1" >
                        <asp:Label ID="lbMsg" runat="server" ForeColor="Red" 
                            Text="請先輸入流程名稱並按下〔儲存資訊〕，以進行設定站點的動作" meta:resourcekey="lbMsgResource1"></asp:Label>
                         <table width="100%">
                            <tr>
                                <td style=" text-align:center; vertical-align:top;" norwap>
                                <center>
                                    <uc1:UC_ParallelSite ID="UC_ParallelSite1" runat="server" />
                                    </center>
                                </td>
                            </tr>
                        </table>
                     </asp:Panel>
                </td>
            </tr>
        </table>
   </div>
    <asp:Label ID="lblSaveInfo" runat="server" Text="儲存資訊"  Visible="False" 
        meta:resourcekey="lblSaveInfoResource1"></asp:Label>
    <asp:Label ID="lblSubFlow" runat="server" Text="副流程設計"  Visible="False" 
        meta:resourcekey="lblSubFlowResource1"></asp:Label>
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除?"  Visible="False" 
        meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:HiddenField ID="hiddenCatagoryID" runat="server" />
    <asp:HiddenField ID="hfFlowID" runat="server" />
    <asp:HiddenField ID="hfMode" runat="server" />
</asp:Content>

