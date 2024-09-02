<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Polling_Result" Title="投票結果" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Result.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script id="chartjs" type="text/javascript">
<!--
    function UltraChart1_ClientOnMouseClick(row) {
    //row:議題項目
    if (row == 0) {            
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem0_Guid.Text%>' });
        return false;
    }
    else if (row == 1) {
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem1_Guid.Text%>' });
        return false;
    }
    else if (row == 2) {
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem2_Guid.Text%>' });
        return false;
    }
    else if (row == 3) {
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem3_Guid.Text%>' });
        return false;
    }
    else if (row == 4) {
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem4_Guid.Text%>' });
        return false;
    }
    else if (row == 5) {
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem5_Guid.Text%>' });
        return false;
    }
    else if (row == 6) {
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem6_Guid.Text%>' });
        return false;
    }
    else if (row == 7) {
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem7_Guid.Text%>' });
        return false;
    }
    else if (row == 8) {
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem8_Guid.Text%>' });
        return false;
    }
    else if (row == 9) {
        $uof.dialog.open2("~/EIP/Polling/RegisteredPollingUser.aspx", "", "", 300, 440, "", { "topicGuid": '<%=lbTopicGuid.Text%>', "itemGuid": '<%=lbDialogItem9_Guid.Text%>' });
        return false;
    }
}// -->
    </script>
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="lbLeftTopic" runat="server" Text="議題內容" meta:resourcekey="lbLeftTopicResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lbTopic" runat="server" meta:resourcekey="lbTopicResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbLeftIsReg" runat="server" Text="記名投票" meta:resourcekey="lbLeftIsRegResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lbReg" runat="server" ForeColor="Transparent" Text="記名" Visible="False" meta:resourcekey="lbRegResource1"></asp:Label><asp:Label
                    ID="lbUnReg" runat="server" ForeColor="Transparent" Text="不記名" Visible="False" meta:resourcekey="lbUnRegResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbLeftResult" runat="server" Text="投票結果" meta:resourcekey="lbLeftResultResource1"></asp:Label></td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <telerik:RadChart ID="rcResult" Width="550px" runat="server"
                            SeriesOrientation="Horizontal"
                            meta:resourcekey="rcResultResource1" OnClick="rcResult_Click1">
                            <Series>
                                <telerik:ChartSeries DataYColumn="POLLED_USER_COUNT" ActiveRegionToolTip="#Y" Visible="true">
                                    <Appearance>
                                        <LabelAppearance Visible="False">
                                        </LabelAppearance>
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </Legend>
                            <PlotArea Appearance-Dimensions-Margins="50px,10px ,50px ,200px">
                                <Appearance></Appearance>
                                <XAxis DataLabelsColumn="CONTEXT" LayoutMode="Between">
                                    <AxisLabel Visible="true">
                                        <Appearance RotationAngle="360" Position-AlignedPosition="TopLeft">
                                        </Appearance>
                                    </AxisLabel>
                                    <Appearance MajorTick-Visible="False">
                                    </Appearance>
                                </XAxis>
                                <YAxis AutoScale="false" MinValue="0" Step="1">
                                    <AxisLabel Visible="true">
                                        <Appearance RotationAngle="0" Position-AlignedPosition="BottomRight">
                                        </Appearance>
                                    </AxisLabel>
                                    <Appearance MajorTick-Visible="False" MinorTick-Visible="False">
                                        <MinorGridLines Visible="False"></MinorGridLines>
                                    </Appearance>
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </td>
        </tr>
        <tr>
            <td style="height: 26px">
                <asp:Label ID="lbLeftObjCount" runat="server" Text="應投票數" meta:resourcekey="lbLeftObjCountResource1"></asp:Label></td>
            <td style="height: 26px">
                <asp:Label ID="lbObjCount" runat="server" meta:resourcekey="lbObjCountResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbLeftUnPollCount" runat="server" Text="未投票數" meta:resourcekey="lbLeftUnPollCountResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lbUnPollCount" runat="server" meta:resourcekey="lbUnPollCountResource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbLeftPollCount" runat="server" Text="已投票數" meta:resourcekey="lbLeftPollCountResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lbPollCount" runat="server" meta:resourcekey="lbPollCountResource1"></asp:Label></td>
        </tr>
    </table>
    <asp:Label ID="lbBackPoll" runat="server" Text="返回投票頁面" Visible="False" meta:resourcekey="lbBackPollResource1"></asp:Label>
    <asp:Label ID="lbTopicGuid" runat="server" Visible="False" meta:resourcekey="lbTopicGuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem0_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem0_GuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem1_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem1_GuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem2_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem2_GuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem3_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem3_GuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem4_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem4_GuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem5_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem5_GuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem6_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem6_GuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem7_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem7_GuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem8_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem8_GuidResource1"></asp:Label>
    <asp:Label ID="lbDialogItem9_Guid" runat="server" Visible="False" meta:resourcekey="lbDialogItem9_GuidResource1"></asp:Label>
    <asp:Label ID="lbExportExcel" runat="server" Text="匯出EXCEL" Visible="False" meta:resourcekey="lbExportExcelResource1"></asp:Label><br />
    <asp:Label ID="msgNomanpolling" runat="server" Text="目前尚無人員進行投票" Visible="False" meta:resourcekey="msgNomanpollingResource1"></asp:Label>
    <asp:Label ID="msgPollingitem" runat="server" Text="議題項目" Visible="False" meta:resourcekey="msgPollingitemResource1"></asp:Label>
    <asp:Label ID="msgPollingman" runat="server" Text="投票人數" Visible="False" meta:resourcekey="msgPollingmanResource1"></asp:Label>
</asp:Content>

