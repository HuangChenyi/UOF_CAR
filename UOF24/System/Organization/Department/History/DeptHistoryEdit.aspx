<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DeptHistoryEdit.aspx.cs" Inherits="System_Organization_Department_HistoryDeptHistoryEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" class="PopTable" style="width: 100%">
        <tr>
            <td white-space: nowrap ;text-align:right" class="PopTableLeftTD">
                <asp:Label ID="lblActionTitle" runat="server" Text="動作" meta:resourcekey="lblActionTitleResource1" />
            </td>
            <td>
                <asp:Label ID="lblAction" runat="server" meta:resourcekey="lblActionResource1" />
            </td>
        </tr>
        <tr>
            <td white-space: nowrap ;text-align:right" class="PopTableLeftTD">
                <asp:Label ID="lblOldHistoryTitle" runat="server" Text="異動前資料" meta:resourcekey="lblOldHistoryTitleResource1" />
            </td>
            <td white-space: nowrap ;>
                <asp:Label ID="lblOldHistory" runat="server" meta:resourcekey="lblOldHistoryResource1" />
            </td>
        </tr>
        <tr>
            <td white-space: nowrap ;text-align:right" class="PopTableLeftTD">
                <asp:Label ID="lblNewHistoryTitle" runat="server" Text="異動後資料" meta:resourcekey="lblNewHistoryTitleResource1" />
            </td>
            <td white-space: nowrap ;>
                <asp:Label ID="lblNewHistory" runat="server" meta:resourcekey="lblNewHistoryResource1" />
            </td>
        </tr>
        <tr>
            <td white-space: nowrap ;text-align:right" class="PopTableLeftTD">
                <asp:Label ID="lblCreateTimeTitle" runat="server" Text="異動日期" meta:resourcekey="lblCreateTimeTitleResource1" />
            </td>
            <td white-space: nowrap ;>
                <asp:Label ID="lblCreateTime" runat="server" meta:resourcekey="lblCreateTimeResource1" />
            </td>
        </tr>
        <tr>
            <td white-space: nowrap ;text-align:right" class="PopTableLeftTD"  rowspan="3"> 
                <asp:Label ID="lblremarkTitle" runat="server" Text="備註" meta:resourcekey="lblremarkTitleResource1" />
            </td>
            <td white-space: nowrap ;  style="height: 70px" >               
                <asp:TextBox ID="txtRemark" runat="server" Width="350px" TextMode="MultiLine" Height="70px" meta:resourcekey="txtRemarkResource1"/>
                <asp:Label ID="lblRemark" runat="server" Visible="False" meta:resourcekey="lblRemarkResource1"/>
            </td>
        </tr>
    </table> 
    <asp:Label ID="lblinsert" runat="server" Text="新增" Visible="False" meta:resourcekey="lblinsertResource1"></asp:Label>
    <asp:Label ID="lblrename" runat="server" Text="更名" Visible="False" meta:resourcekey="lblrenameResource1"></asp:Label>
    <asp:Label ID="lblmoving" runat="server" Text="搬移" Visible="False" meta:resourcekey="lblmovingResource1"></asp:Label>
    <asp:Label ID="lbldisable" runat="server" Text="停用" Visible="False" meta:resourcekey="lbldisableResource1"></asp:Label> 
    <asp:Label ID="lblenable" runat="server" Text="啟用" Visible="False" meta:resourcekey="lblenableResource1"></asp:Label>
    <asp:Label ID="lbldelete" runat="server" Text="刪除" Visible="False" meta:resourcekey="lbldeleteResource1"></asp:Label>
    <asp:Label ID="lblTask" runat="server" Text="排程" Visible="false" meta:resourcekey="lblTaskResource1"></asp:Label>
     <asp:HiddenField ID="hfCurrentUser" runat="server" />
     <asp:HiddenField ID="hfHistoryGuid" runat="server" />
</asp:Content>
