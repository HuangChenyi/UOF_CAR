<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ChooseOrgDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.SendDoc.ChooseOrgDialog" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .cssHidden {
            display: none;
        }
    </style>

    <script type="text/javascript">

        // 點擊右側tree node
        function rtvOrg_ClientNodeClicked(sender, args) {
            var node = args.get_node();

            var selectedTreeView = $find("<%= rtvSelectedOrg.ClientID %>");

            // 要檢查的array
            var checkAry = JSON.parse($('#<%= hfCheckListStr.ClientID %>').val());

            // brian 2021/08/03 因可重複選擇相同機關，故不再驗證是否選到相同機關
            // 清空訊息
            $('#<%=lblMsg.ClientID%>').text('');

            // 將點選的node加入
            selectedTreeView.trackChanges();
            var newNode = new Telerik.Web.UI.RadTreeNode();
            newNode.set_text(node.get_text());
            newNode.set_value(node.get_value());
            newNode.set_imageUrl(node.get_imageUrl());



            newNode.get_attributes().setAttribute('orgId', node.get_attributes().getAttribute('orgId'));
            newNode.get_attributes().setAttribute('orgName', node.get_attributes().getAttribute('orgName'));
            newNode.get_attributes().setAttribute('sendType', node.get_attributes().getAttribute('sendType'));
            selectedTreeView.get_nodes().add(newNode);
            selectedTreeView.commitChanges();



            // 更新選取的筆數
            $('#<%=lblSelectedCount.ClientID%>').text(selectedTreeView.get_nodes().get_count());
        }

        // 受文機關已被選擇的訊息顯示
        function ShowAlreadyChooseOrgMsg(nowToType, checkToType) {

            if (nowToType === 'ORIGINAL_COPY' && checkToType === 'COPY') {              // ORIGINAL_COPY - COPY
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblOriginalInDuplicate.ClientID%>').text());
            }
            else if (nowToType === 'COPY' && checkToType === 'ORIGINAL_COPY') {         // COPY - ORIGINAL_COPY
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblDuplicateInOriginal.ClientID%>').text());
            }
            else if (nowToType === 'COPY' && checkToType === 'CHAIR_MAN') {             // COPY - CHAIR_MAN
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblDuplicateInChairman.ClientID%>').text());
            }
            else if (nowToType === 'COPY' && checkToType === 'ATTENDEE') {              // COPY - ATTENDEE
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblDuplicateInAttendee.ClientID%>').text());
            }
            else if (nowToType === 'COPY' && checkToType === 'PRESENT') {               // COPY - PRESENT
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblDuplicateInPresent.ClientID%>').text());
            }
            else if (nowToType === 'CHAIR_MAN' && checkToType === 'COPY') {             // CHAIR_MAN - COPY
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblChairmanInDuplicate.ClientID%>').text());
            }
            else if (nowToType === 'CHAIR_MAN' && checkToType === 'ATTENDEE') {         // CHAIR_MAN - ATTENDEE
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblChairmanInAttendee.ClientID%>').text());
            }
            else if (nowToType === 'CHAIR_MAN' && checkToType === 'PRESENT') {          // CHAIR_MAN - PRESENT 
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblChairmanInPresent.ClientID%>').text());
            }
            else if (nowToType === 'ATTENDEE' && checkToType === 'COPY') {              // ATTENDEE - COPY
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblAttendeeInDuplicate.ClientID%>').text());
            }
            else if (nowToType === 'ATTENDEE' && checkToType === 'CHAIR_MAN') {         // ATTENDEE - CHAIR_MAN
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblAttendeeInChairman.ClientID%>').text());
            }
            else if (nowToType === 'ATTENDEE' && checkToType === 'PRESENT') {           // ATTENDEE - PRESENT
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblAttendeeInPresent.ClientID%>').text());
            }
            else if (nowToType === 'PRESENT' && checkToType === 'COPY') {               // PRESENT - COPY
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblPresentInDuplicate.ClientID%>').text());
            }
            else if (nowToType === 'PRESENT' && checkToType === 'CHAIR_MAN') {          // PRESENT - CHAIR_MAN
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblPresentInChairman.ClientID%>').text());
            }
            else if (nowToType === 'PRESENT' && checkToType === 'ATTENDEE') {           // PRESENT - ATTENDEE
                $('#<%=lblMsg.ClientID%>').text($('#<%=lblPresentInAttendee.ClientID%>').text());
            }
        }

        // 點擊左側tree node
        function rtvSelectedOrg_ClientNodeClicked(sender, args) {
            var node = args.get_node();
            var selectedTreeView = $find("<%= rtvSelectedOrg.ClientID %>");

            // 刪除點選的node
            selectedTreeView.trackChanges();
            selectedTreeView.get_nodes().remove(node)
            selectedTreeView.commitChanges();

            // 更新選取的筆數
            $('#<%=lblSelectedCount.ClientID%>').text(selectedTreeView.get_nodes().get_count());
        }

        // 點擊清除全部按鈕
        function btnClearSelected_ClientClicking(sender, args) {

            // 清除全部node
            var selectedTreeView = $find("<%= rtvSelectedOrg.ClientID %>");
            selectedTreeView.trackChanges();
            selectedTreeView.get_nodes().clear();
            selectedTreeView.commitChanges();

            // 更新選取的筆數
            $('#<%=lblSelectedCount.ClientID%>').text(selectedTreeView.get_nodes().get_count());

            // 不執行pageLoad
            args.set_cancel(true);
        }

        // node drop and drag
        function rtvSelectedOrg_ClientNodeDropping(sender, args) {
            var sourceNode = args.get_sourceNode();

            /*
                1. 判斷拖拉的destination是否為node
                2. 判斷拖拉的destination是否為本身的tree
            */
            if (args.get_destNode() != null && $find("<%= rtvSelectedOrg.ClientID %>")._element == args.get_destNode()._control._element) {
                var destNodeIdx = args.get_destNode().get_index();

                var selectedTreeView = $find("<%= rtvSelectedOrg.ClientID %>");

                selectedTreeView.trackChanges();
                selectedTreeView.get_nodes().remove(sourceNode);
                selectedTreeView.get_nodes().insert(destNodeIdx, sourceNode);
                selectedTreeView.commitChanges();
            }
        }

        // 沒有選擇機關時給 confirm
        function CheckNoChooseOrg() {

            var selectedTreeView = $find("<%= rtvSelectedOrg.ClientID %>");

            // 沒有選擇機關時給 confirm
            if (selectedTreeView.get_nodes().get_count() == 0) {
                return confirm($('#<%=lblNoChoose.ClientID%>').text());
            }
            else {

                if (selectedTreeView.get_nodes().get_count() > 1) {
                    //循環比對選擇的機關中，是否有相同機關
                    for (var i = 0; i < selectedTreeView.get_allNodes().length; i++) {
                        var orgId = selectedTreeView.get_nodes().getNode(i).get_value();
                        var sum = 0;

                        for (var j = 0; j < selectedTreeView.get_allNodes().length; j++) {
                            if (orgId === selectedTreeView.get_nodes().getNode(j).get_value()) {
                                sum++;
                            }
                        }
                        if (sum > 1) {
                            return confirm($('#<%=lblSameChoose.ClientID%>').text());
                        }
                    }
                }

                //循環比對選擇的機關中，是否有相同機關
                for (var i = 0; i < selectedTreeView.get_allNodes().length; i++) {
                    var orgId = selectedTreeView.get_nodes().getNode(i).get_value();
                    var sum = 0;

                    // 檢查array字串中是否有相同的機關代瑪
                    var checkAry = JSON.parse($('#<%= hfCheckListStr.ClientID %>').val());
                    if (checkAry.indexOf(orgId) >= 0)
                        sum++

                    if (sum > 0) {
                        return confirm($('#<%=lblSameChoose.ClientID%>').text());
                    }
                }
            }

            return true;
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadSplitter ID="RadSplitter1" runat="server" Orientation="Vertical"
                Width="100%" Height="100%" LiveResize="True" FullScreenMode="True">

                <telerik:RadPane ID="rpLeft" Width="50%" runat="server">
                    <asp:Label ID="Label2" runat="server" Text="已選擇的受文機關"></asp:Label>
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Font-Size="Medium" Font-Bold="true" Style="float: right; display: none"></asp:Label>
                    <br />
                    <div style="padding-top: 0.5em; padding-bottom: 0.5em;">
                        <telerik:RadButton ID="btnClearSelected" runat="server" Text="清除全部" OnClientClicking="btnClearSelected_ClientClicking"></telerik:RadButton>
                        <asp:Label ID="Label6" runat="server" Text="長按機關名稱可拖曳移動排序" ForeColor="Blue"></asp:Label>
                    </div>
                    <asp:Label ID="Label4" runat="server" Text="筆數:"></asp:Label>
                    <asp:Label ID="lblSelectedCount" runat="server" Text="0" ForeColor="blue"></asp:Label>
                    <telerik:RadTreeView ID="rtvSelectedOrg" OnClientNodeClicked="rtvSelectedOrg_ClientNodeClicked" OnClientNodeDropping="rtvSelectedOrg_ClientNodeDropping" EnableNodeTextHtmlEncoding="true" EnableDragAndDrop="true" runat="server"></telerik:RadTreeView>
                </telerik:RadPane>

                <telerik:RadPane ID="rpRight" Width="50%" runat="server">
                    <asp:Label ID="Label5" runat="server" Text="機關名稱："></asp:Label>
                    <asp:TextBox ID="txtOrgName" Width="300" runat="server"></asp:TextBox>
                    <telerik:RadButton ID="btnSearch" runat="server" Text="搜尋" OnClick="btnSearch_Click"></telerik:RadButton>
                    <br />
                    <asp:Panel ID="pnlPageInfo" runat="server" Style="padding-top: 0.5em;">
                        <asp:Label ID="Label1" runat="server" Text="頁次:"></asp:Label>
                        <asp:Label ID="lblPage" runat="server" Text="0/0" ForeColor="Blue"></asp:Label>
                        <asp:LinkButton ID="lbtnLastPage" runat="server" Text="上一頁" OnClick="lbtnLastPage_Click" Enabled="false"></asp:LinkButton>
                        <asp:LinkButton ID="lbtnNextPage" runat="server" Text="下一頁" OnClick="lbtnNextPage_Click" Enabled="false"></asp:LinkButton>
                        <asp:Label ID="Label3" runat="server" Text="筆數:"></asp:Label>
                        <asp:Label ID="lblCount" runat="server" Text="0" ForeColor="Blue"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="pnlQueryText" runat="server">
                        <asp:Label ID="Label7" runat="server" Text="*請輸入關鍵字來搜尋要發送的受文機關" ForeColor="blue" Style="margin-left: 5em;"></asp:Label>
                    </asp:Panel>
                    <telerik:RadTreeView ID="rtvOrg" OnClientNodeClicked="rtvOrg_ClientNodeClicked" EnableNodeTextHtmlEncoding="true" runat="server"></telerik:RadTreeView>
                </telerik:RadPane>
            </telerik:RadSplitter>

            <asp:HiddenField ID="hfTotalPage" runat="server" />
            <asp:HiddenField ID="hfNowPage" runat="server" Value="1" />
            <asp:HiddenField ID="hfNowToType" runat="server" />
            <asp:HiddenField ID="hfCheckToType" runat="server" />
            <asp:HiddenField ID="hfSendDocId" runat="server" />
            <asp:HiddenField ID="hfExistValue" runat="server" />
            <asp:HiddenField ID="hfFromUnitId" runat="server" />

            <asp:HiddenField ID="hfCheckListStr" runat="server" />
            <asp:HiddenField ID="hfToTypeListStr" runat="server" />

            <asp:Label ID="lblNoChoose" runat="server" Text="您沒有選擇任何項目，確定要關閉嗎?" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblSameChoose" runat="server" Text="您有選取到相同的受文機關，確定要繼續嗎?" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblSearch" runat="server" Text="請輸入關鍵字來搜尋要發送的受文機關" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblAlreadyExist" runat="server" Text="已加入" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblOriginalInDuplicate" runat="server" Text="已被選擇為副本發送對象，無法加入正本" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblDuplicateInOriginal" runat="server" Text="已被選擇為正本發送對象，無法加入副本" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblDuplicateInChairman" runat="server" Text="已被選擇為主持人發送對象，無法加入副本" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblDuplicateInAttendee" runat="server" Text="已被選擇為出席者發送對象，無法加入副本" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblDuplicateInPresent" runat="server" Text="已被選擇為列席者發送對象，無法加入副本" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblChairmanInDuplicate" runat="server" Text="已被選擇為副本發送對象，無法加入主持人" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblChairmanInAttendee" runat="server" Text="已被選擇為出席者發送對象，無法加入主持人" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblChairmanInPresent" runat="server" Text="已被選擇為列席者發送對象，無法加入主持人" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblAttendeeInDuplicate" runat="server" Text="已被選擇為副本發送對象，無法加入出席者" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblAttendeeInChairman" runat="server" Text="已被選擇為主持人發送對象，無法加入出席者" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblAttendeeInPresent" runat="server" Text="已被選擇為列席者發送對象，無法加入出席者" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblPresentInDuplicate" runat="server" Text="已被選擇為副本發送對象，無法加入列席者" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblPresentInChairman" runat="server" Text="已被選擇為主持人發送對象，無法加入列席者" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblPresentInAttendee" runat="server" Text="已被選擇為出席者發送對象，無法加入列席者" CssClass="cssHidden"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
