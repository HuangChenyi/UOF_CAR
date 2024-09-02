<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_TaskInfo" Title="內容" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="TaskInfo.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../FormManagement/UC_FormFileCenter.ascx" TagName="UC_FormFileCenter" TagPrefix="uc2" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagName="VersionFieldCollectionUsingUC" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <table width="100%">
   <tr>
      <td valign="top" style="height: 377px">
         <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
               <td style="width: 19px; height: 19px;"></td>
               <td style="height: 19px">&nbsp;</td>
               <td width="18" style="height: 19px"></td>
            </tr>
            <tr>
               <td style="width: 19px">&nbsp;</td>
               <td valign="top">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                     <tr>
                        <td>
                           <table width="100%" border="0" cellspacing="0" cellpadding="0">                              
                              <tr>
                                 <td>
                                    <table width="100%">
                                                                              
                                    <tr>                                       
                                       <td>
                    <asp:Label ID="Label1" runat="server" Text="申請人：" meta:resourcekey="Label1Resource1"></asp:Label><asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label></td>
                                    </tr>
                                    </table>
        <uc1:versionfieldcollectionusinguc id="VersionFieldCollectionUsingUC1" runat="server"></uc1:versionfieldcollectionusinguc>
                                 </td>
                              </tr>
                              <tr><td style="height: 19px"></td></tr>
                              <tr>
                                 <td style="height: 19px">
                                    <asp:Panel ID="pnlSignInfo" runat="server" Width="600px" meta:resourcekey="pnlSignInfoResource1">
                    <asp:Label ID="lblSignInfo" runat="server" Font-Bold="True" Text="簽核資訊" meta:resourcekey="lblSignInfoResource1"></asp:Label>
                                        <asp:Label ID="lblTaskResult" runat="server" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblTaskResultResource3"></asp:Label>
                    <Fast:Grid ID="DGSignCommentList" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"    Width="700px" EnableTheming="True" OnRowDataBound="DGSignCommentList_RowDataBound"  DataKeyOnClientWithCheckBox="False"  EnhancePager="True" PageSize="15">
                        <EnhancePagerSettings
                            ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" 
                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" 
                            PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" 
                            PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        <Columns>
                            <asp:BoundField DataField="SITE" HeaderText="站點" 
                                meta:resourceKey="BoundFieldResource1">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ORIGINAL_SIGNER_NAME" HeaderText="應簽核者" 
                                meta:resourceKey="BoundFieldResource2">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ACTUAL_SIGNER_NAME" HeaderText="簽核者" 
                                meta:resourceKey="BoundFieldResource3">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="結果" meta:resourceKey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblSignStatus" runat="server" 
                                        meta:resourceKey="lblSignStatusResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="COMMENT" HeaderText="簽核意見" 
                                meta:resourceKey="BoundFieldResource4">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                    </Fast:Grid>
                                     </asp:Panel>
                                 </td>
                              </tr>
                              <tr><td style="height: 19px"></td></tr>
                           </table>
                       
                    <asp:Panel ID="pnlSubSignInfo" runat="server" Height="100%" Width="100%" meta:resourcekey="pnlSubSignInfoResource1">
                      
                        <asp:Table ID="Table1" runat="server" Width="100%" meta:resourcekey="Table1Resource1">
                        </asp:Table>
                            <table><tr><td valign="bottom"><asp:Label runat="server" ID="lblFile" meta:resourceKey="lblFileResource1" Text="相關附件(表單)："></asp:Label></td>
                            <td><uc2:UC_FormFileCenter ID="UC_FormFileCenter1" runat="server" /></td></tr>
                            </table>
                        </asp:Panel>
                            
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>
      
       <asp:Label ID="lblapplication" runat="server" Text="申請" Visible="False" meta:resourcekey="lblapplicationResource1"></asp:Label> 
    <asp:Label ID="lblAgree" runat="server" Text="核准" Visible="False" meta:resourcekey="lblAgreeResource1"></asp:Label>
    <asp:Label ID="lblDisagree" runat="server" Text="不同意" Visible="False" meta:resourcekey="lblDisagreeResource1"></asp:Label>
    <asp:Label ID="lblBack" runat="server" Text="退簽" Visible="False" meta:resourcekey="lblBackResource1"></asp:Label>
    <asp:Label ID="lblNoComment" runat="server" Text="沒意見" Visible="False" meta:resourcekey="lblNoCommentResource1"></asp:Label>
    <asp:Label ID="lblNull" runat="server" Text="未簽核" Visible="False" meta:resourcekey="lblNullResource1"></asp:Label>
     <asp:Label ID="lblSite" runat="server" Text="站點" Visible="False" meta:resourcekey="lblSiteResource1"></asp:Label>
     <asp:Label ID="lblOSName" runat="server" Text="應簽核者" Visible="False" meta:resourcekey="lblOSNameResource1"></asp:Label>
     <asp:Label ID="lblASName" runat="server" Text="簽核者" Visible="False" meta:resourcekey="lblASNameResource1"></asp:Label>
      <asp:Label ID="lblSSStatus" runat="server" Text="簽核狀態" Visible="False" meta:resourcekey="lblSSStatusResource1"></asp:Label>
       <asp:Label ID="lblComment" runat="server" Text="簽核意見" Visible="False" meta:resourcekey="lblCommentResource1"></asp:Label>
       <asp:Label ID="lblSubFlow" runat="server" Text="副流程：" Visible="False" meta:resourcekey="lblSubFlowResource1"></asp:Label>
       <asp:Label ID="lblSubSignInfo0" runat="server" Text="的簽核資訊" Visible="False" meta:resourcekey="lblSubSignInfo0Resource1"></asp:Label>
        <asp:Label ID="lblPrint" runat="server" Text="列印" Visible='False' meta:resourcekey="lblPrintResource1"></asp:Label>
        <asp:Label ID="lblCanelForm" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCanelFormResource3"></asp:Label>
        <asp:Label ID="lblApplicantResult" runat="server" Text="申請結果：" Visible="False" meta:resourcekey="lblApplicantResultResource1"></asp:Label>


</asp:Content>

