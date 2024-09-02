<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FreeTask_OtherSite" Title="填寫表單" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" EnableEventValidation="false"  Codebehind="OtherSite.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%">
   <tr>       
      <td>

      <telerik:RadToolBar ID="webToolBar" runat="server" OnClientButtonClicking="OnBarMainClick"
                                            OnButtonClick="webToolBar_ButtonClick" Width="100%">
                                            <Items>
                                                 <telerik:RadToolBarButton runat="server"  
                    meta:resourceKey="TBarButtonResource1"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m02.gif" Text="儲存" Value="SaveFormDraft" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sSaveFormDraft" >
                    </telerik:RadToolBarButton>
                     <telerik:RadToolBarButton runat="server"  
                    meta:resourceKey="TBarButtonResource2"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif" 
                        HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m02.gif" Text="送出" Value="SendFormDraft" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="SendFormDraft" >
                    </telerik:RadToolBarButton>
                    </Items>
                    </telerik:RadToolBar>
        

      </td>
   </tr>
</table>
<table width="100%">
   <tr>
       <td style="width:30%" valign="top">
           <table width="100%" class="PopTable" cellspacing="1">
               <tr>
                   <td class="PopTableHeader"
                       align="center" height="20">
                       <asp:Label ID="lblComment" runat="server" Text="申請資訊" meta:resourcekey="lblCommentResource1"></asp:Label></td>
               </tr>
               <tr>
                   <td style="background-color: White;">
                       <table width="100%" cellpadding="0" cellspacing="0" height=58>
                           <tr>
                               <td>
                                   <asp:Label ID="Label9" runat="server" Text="緊急程度：" meta:resourcekey="Label9Resource1"></asp:Label>
                                   </td>
                               <td>
                                   <asp:Label ID="Label15" runat="server" Text="申請人：" meta:resourcekey="Label15Resource1"></asp:Label>
                                   </td>
                           </tr>
                           <tr>
                               <td nowrap valign=top>
                                   <asp:Label ID="Label17" runat="server" Text="部門：" meta:resourcekey="Label17Resource1"></asp:Label>
                                   </td>
                           </tr>
                       </table>
                   </td>
               </tr>
                          <tr>
                             <td class="PopTableHeader"  align="center">
                                <asp:Label ID="lblFileUpload" runat="server" Text="相關附件(表單)" meta:resourcekey="lblFileUploadResource1"></asp:Label></td>
                          </tr>
                          <tr>
                             <td style="background-color:White; height: 56px;" valign="top">
                                 <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="WKF" ProxyEnabled="true"/>
                             </td>
                          </tr>
           </table>
       </td>
       <td style="width:30%" valign="top"  height="100%">
           <table width="100%" class="PopTable" cellspacing="1"   height="100%">
               <tr>
                   <td class="PopTableHeader" 
                       align="center" height=20>
                       <asp:Label ID="Label16" runat="server" Text="簽核" meta:resourcekey="Label16Resource1"></asp:Label></td>
               </tr>
                   <tr>
                       <td valign=top  style="background-color: White;">
                           <table width=100% cellpadding=0 cellspacing=0 border=0 height=58>
                               <tr>
                                   <td style="background-color: White;" >
                                       <asp:Label ID="Label8" runat="server" Text="簽核批可：" meta:resourcekey="Label8Resource1"></asp:Label></td>
                                   <td style="background-color: White;" align="left" width="79%">
                                       <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" meta:resourcekey="RadioButtonList1Resource1">
                                           <asp:ListItem Selected="True" meta:resourcekey="ListItemResource1">同意</asp:ListItem>
                                           <asp:ListItem meta:resourcekey="ListItemResource2">否決</asp:ListItem>
                                           <asp:ListItem meta:resourcekey="ListItemResource3">沒意見</asp:ListItem>
                                       </asp:RadioButtonList></td>
                               </tr>
                               <tr>
                                   <td style="background-color: White;" valign="top">
                                       <asp:Label ID="Label13" runat="server" Text="結案狀態：" meta:resourcekey="Label13Resource1"></asp:Label></td>
                                   <td style="background-color: White;" valign="top"  align="left" width="79%">
                                       <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" meta:resourcekey="RadioButtonList2Resource1">
                                           <asp:ListItem Selected="True" meta:resourcekey="ListItemResource4">結案</asp:ListItem>
                                           <asp:ListItem meta:resourcekey="ListItemResource5">往下一站點</asp:ListItem>
                                       </asp:RadioButtonList></td>
                               </tr>
                           </table>
                       </td>
                   </tr>
               <tr>
                   <td class="PopTableHeader" 
                       align="center">
                       <asp:Label ID="lblOtherInfo" runat="server" Text="意見" meta:resourcekey="lblOtherInfoResource1"></asp:Label></td>
               </tr>
               <tr>
                   <td style="background-color: White;" valign="top" height=100%>
                       <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Width="100%" Height="90%" meta:resourcekey="txtCommentResource1"></asp:TextBox></td>
               </tr>
           </table>
       </td>       
       <td style="width:40%" valign="top" height=100%>
          <table width="100%" class="PopTable" cellspacing="1" height=100%>
              <tr>
                 <td class="PopTableHeader"  align="center" height=20>
                    <asp:Label ID="Label1" runat="server" Text="下一站點資訊(實際)" meta:resourcekey="Label1Resource1"></asp:Label></td>
              </tr>
              <tr>
                 <td style="background-color:White;" valign="top">
                    <asp:Label ID="Label3" runat="server" Text="站點型態：" meta:resourcekey="Label3Resource1"></asp:Label><br />
                    <br />
                    <br />
                    <br />
                     &nbsp;</td>
              </tr>
          </table>
       </td>
   </tr>
</table>
<table width="100%">
   <tr>
      <td style="width: 25%" align="center" valign="top">
          123</td>
      <td valign="top">
          456</td>
   </tr>
</table>
</asp:Content>

