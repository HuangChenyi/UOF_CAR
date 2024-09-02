<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Plant_ChoicePlant" Title="挑選設備" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChoicePlant.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../Calendar/Common/UC_MonthList.ascx" TagName="UC_MonthList" TagPrefix="uc4" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/EIP/Plant/UC_EquipList.ascx" TagPrefix="uc1" TagName="UC_EquipList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script id="treejs" type="text/javascript">
        <!--
        function treePlant_NodeClicking(sender, args)
        { }
        function UltraWebTree1_NodeClick(treeId, nodeId, button) {
            var node=igtree_getNodeById(nodeId) ;
            var tree=igtree_getTreeById(treeId);
    
            if(node.getLevel()==0)
            {
                node.setSelected(false);
                tree.CancelPostBack=true;
            }
        }
        function Window_OnClick()
        {
        }
        // -->
    </script>
    <table width="100%">
        <tr>  
            <td valign="top" align="left" >
                 <asp:Panel ID="Panel1" runat="server" Visible="false" meta:resourcekey="Panel1Resource1">
                     <table width="100%">
                        <tr>
                            <td class="g">
                                <asp:Label ID="lbLeftPlantList" runat="server" Text="場地設備列表" meta:resourcekey="lbLeftPlantListResource1"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTreeView ID="treePlant" runat="server" SkinID="PlanttypeTree" Indentation="20"  EnableNodeTextHtmlEncoding="true"
                                    WebTreeTarget="HierarchicalTree" Width="100%" OnNodeClick="treePlant_NodeClick" OnClientNodeClicking="treePlant_NodeClicking" meta:resourcekey="treePlantResource2"></telerik:RadTreeView>
                            </td>
                        </tr>                    
                    </table>
                 </asp:Panel>
                
            </td>     
            <td valign="top">
                <telerik:RadTabStrip ID="rts1" MultiPageID="rmp1" runat="server" SelectedIndex="0" meta:resourcekey="rts1Resource1">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="目前借用記錄" PageViewID="rpvRecord" meta:resourcekey="RadTabResource1" Selected="True">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="基本資料" PageViewID="rpvBasicData" meta:resourcekey="RadTabResource2">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="rmp1" runat="server" SelectedIndex="0" BackColor="White" meta:resourcekey="rmp1Resource1" Selected="True">
                    <telerik:RadPageView ID="rpvRecord" runat="server" meta:resourcekey="rpvRecordResource1">
                         <uc4:UC_MonthList ID="UC_MonthList1" runat="server" />
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="rpvBasicData" runat="server" meta:resourcekey="rpvBasicDataResource1" >
                        <table cellspacing="1" class="PopTable">
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="lbLeftSerialNo" runat="server" Text="編號" meta:resourcekey="lbLeftSerialNoResource1"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lbSerialNo" runat="server" meta:resourcekey="lbSerialNoResource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="lbLeftName" runat="server" Text="名稱" meta:resourcekey="lbLeftNameResource1"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lbName" runat="server" meta:resourcekey="lbNameResource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="lbLeftCustodian" runat="server" Text="保管人" meta:resourcekey="lbLeftCustodianResource1"></asp:Label></td>
                                <td>
                                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" IsAllowEdit="False" />
                                    </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="lbLeftUseDate" runat="server" Text="借用限制天數" meta:resourcekey="lbLeftUseDateResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblUseDate" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="lbLeftDesc" runat="server" Text="說明" meta:resourcekey="lbLeftDescResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbDesc" runat="server" meta:resourcekey="lbDescResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr id="_1" runat="server">
                                <td style="width: 100px;white-space:nowrap">
                                    <asp:Label ID="lblMeetingLocation" runat="server" Text="地點" meta:resourcekey="lblMeetingLocationResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblMeetingLocationValue" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="_2" runat="server">
                                <td style="width: 100px;white-space:nowrap">
                                    <asp:Label ID="lblAccomodate" runat="server" Text="可容納人數" meta:resourcekey="lblAccomodateResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblAccomodateValue" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="_3" runat="server">
                                <td style="width: 100px;white-space:nowrap">
                                    <asp:Label ID="lblEquipments" runat="server" Text="配備" meta:resourcekey="lblEquipmentResource1"></asp:Label>
                                </td>
                                <td>
                                    <uc1:UC_EquipList runat="server" ID="UC_EquipList" />
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="lbLeftPict" runat="server" Text="圖片" meta:resourcekey="lbLeftPictResource1"></asp:Label></td>
                                <td>
                                    <asp:Image ID="imgBigPicture" runat="server" />
                                    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" AllowedFileType="Image" Visible="false" />
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </td>  
        </tr>
    </table>
    <asp:Label ID="lblNotLimit" runat="server" Text="不限定" Visible="False"  meta:resourcekey="lblNotLimitResource1"></asp:Label>
    <asp:Label ID="lblDay" runat="server" Text="天" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
</asp:Content>

