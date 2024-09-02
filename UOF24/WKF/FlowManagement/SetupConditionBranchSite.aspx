<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupConditionBranchSite"
    Title="設定條件式站點" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupConditionBranchSite.aspx.cs" %>
<%@ Register Src="UC_SelectSubFlow.ascx" TagName="UC_SelectSubFlow" TagPrefix="uc1" %>
<%@ Register Src="UC_SelectFlow.ascx" TagName="UC_SelectFlow" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
      Sys.Application.add_load(function () {
          if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
              resizeAllTree($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());
      });

      function resizeAllTree(X, Y) {
          
          var treeLeft = $find("<%=treeBranchSiteNode.ClientID %>");
          var treeMid = $find("<%=treeCondition.ClientID %>");
          var treeRight = $find("<%=UC_SelectFlow1.subFlowTree.ClientID%>");
          
          treeLeft.get_element().style.height = Y - 40 + "px";
          treeLeft.get_element().style.width = X / 3 - 25+ "px";

          treeMid.get_element().style.height = Y - 40 + "px";
          treeMid.get_element().style.width = X / 3 - 25 + "px";

          treeRight.get_element().style.height = Y - 40 + "px";
          treeRight.get_element().style.width = X / 3 - 25 + "px";

            $("#<%=hiddenX.ClientID%>").val(X);
            $("#<%=hiddenY.ClientID%>").val(Y);

        }
  </script>
    <table width="100%">
        <tr>
            <td style="vertical-align: top;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table  border: 1;" cellspacing="0" cellpadding="0"
                            class="PopTable">
                            <tbody>
                                <tr>
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD" align="center" height="20px">
                                        <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="條件式站點"
                                            __designer:wfdid="w37"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorBranchLess" runat="server" meta:resourcekey="CustomValidatorBranchLessResource1"
                                            ErrorMessage="分岔站點至少需兩個節點" Display="Dynamic" __designer:wfdid="w38">
                                        </asp:CustomValidator>
                                        <asp:CustomValidator ID="CustomValidatorBranchRemove" runat="server" meta:resourcekey="CustomValidatorBranchRemoveResource1"
                                            ErrorMessage="請選擇欲移除之判斷條件" Display="Dynamic" __designer:wfdid="w39">
                                        </asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top; text-align:left" class="PopTableRightTD">
                                        <asp:Panel ID="Panel3" runat="server" meta:resourcekey="Panel3Resource1" ScrollBars="Auto" __designer:wfdid="w40">
                                            <telerik:RadTreeView ID="treeBranchSiteNode" Runat="server" Width="400px"  Height="250px"
                                                OnNodeDrop="treeBranchSiteNode_NodeDrop" EnableDragAndDrop="true">
                                            </telerik:RadTreeView>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
                        <asp:AsyncPostBackTrigger ControlID="btnRemove" EventName="Click"></asp:AsyncPostBackTrigger>
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td style="width: 50px;vertical-align:middle">
                <telerik:RadButton ID="btnAdd" runat="server" CausesValidation="False" 
                    meta:resourcekey="btnAddResource1" Text="<--" OnClick="btnAdd_Click1">
                </telerik:RadButton>
                &nbsp;
                <br />
                <br />
                <telerik:RadButton ID="btnRemove" runat="server" meta:resourcekey="btnRemoveResource1"
                    Text="-->" OnClick="btnRemove_Click1">
                </telerik:RadButton>
            </td>
            <td style="vertical-align: top">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table cellspacing="0" cellpadding="0" border="1" runat="server" id="tbRight"
                            class="PopTable">
                            <tbody>
                                <tr>
                                    <td style="width: 50%; text-align: center;height:20px" class="PopTableLeftTD" align="center">
                                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="判斷條件"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorCondition" runat="server" meta:resourcekey="CustomValidatorConditionResource1"
                                            Erro0rMessage="請選擇判斷條件" Display="Dynamic">
                                        </asp:CustomValidator>
                                    </td>
                                    <td class="PopTableLeftTD" style="width: 50%; text-align: center" align="center">
                                        <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="副流程"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorSubFlow" runat="server" meta:resourcekey="CustomValidatorSubFlowResource1"
                                            ErrorMessage="請選擇副流程" Display="Dynamic" __designer:wfdid="w61">
                                        </asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PopTableRightTD" style="vertical-align: top;text-align:left;">
                                        <asp:Panel ID="Panel11" runat="server" meta:resourcekey="Panel11Resource1" ScrollBars="Auto">
                                            <telerik:RadTreeView ID="treeCondition" Runat="server" Width="400px" Height="250px"></telerik:RadTreeView>
                                        </asp:Panel>
                                    </td>
                                    <td class="PopTableRightTD" style="vertical-align: top;width:400px;height: 250px;">
                                        <uc2:UC_SelectFlow ID="UC_SelectFlow1" runat="server" isViewVisable="false" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
                        <asp:AsyncPostBackTrigger ControlID="btnRemove" EventName="Click"></asp:AsyncPostBackTrigger>
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hiddenSourceNodeId" runat="server" />
    <asp:HiddenField ID="hiddenX" runat="server" />
    <asp:HiddenField ID="hiddenY" runat="server" />
</asp:Content>
