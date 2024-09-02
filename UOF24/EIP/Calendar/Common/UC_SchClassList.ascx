<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_Common_UC_SchClassList" CodeBehind="UC_SchClassList.ascx.cs" %>
<%--<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>--%>


<script id="script" type="text/javascript">
    function SetListBarVisible_<%=RadTreeView1.ClientID %>(isVisible) {
        var tree = $find('divListBar<%=RadTreeView1.ClientID %>');
        if (tree != null) {
            if (isVisible == 'true') {
                tree.style.display = '';
            }
            else {
                tree.style.display = 'none';
            }
        }
    }   
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
    <ContentTemplate>
        <div id='divTree<%=RadTreeView1.ClientID %>'>
            <div id="Div1" runat="server" class="LeftPaneTitle">
                <asp:Label ID="Label2" runat="server" Text="歸檔類別列表" meta:resourcekey="Label1Resource1"></asp:Label>
            </div>
            <telerik:RadTreeView ID="RadTreeView1" runat="server" OnNodeClick="RadTreeView1_NodeClick" EnableNodeTextHtmlEncoding="true"></telerik:RadTreeView>

        </div>
        <asp:Label ID="lblSysClass" runat="server" Text="系統類別" Visible="false" meta:resourcekey="lblSysClassResource1"></asp:Label>
        <asp:Label ID="lblCustomClass" runat="server" Text="自訂類別" Visible="false" meta:resourcekey="lblCustomClassResource1"></asp:Label>

        <asp:Label ID="lbNoClass" runat="server" Text="未歸檔" Visible="False" meta:resourcekey="lbNoClassResource1"></asp:Label>
        <asp:Label ID="lbAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lbAllResource1"></asp:Label>
        <asp:Label ID="lbComplete" runat="server" Text="已完成" Visible="False" meta:resourcekey="lbCompleteResource1"></asp:Label>
        <asp:Label ID="lbUnComplete" runat="server" Text="未完成" Visible="False" meta:resourcekey="lbUnCompleteResource1"></asp:Label>
        <asp:HiddenField ID="hideClassCount" runat="server" />
        <asp:HiddenField ID="hideScheduleType" runat="server" />
        <asp:HiddenField ID="hideOwnerGUID" runat="server" />
        <asp:HiddenField ID="hideIsPostBack" runat="server" Value="false" />
        <asp:HiddenField ID="hideClassGUID" runat="server" />
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="RadTreeView1" EventName="NodeClick" />
    </Triggers>
</asp:UpdatePanel>
