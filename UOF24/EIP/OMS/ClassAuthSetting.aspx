<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_OMS_ClassAuthSetting" Title="類別權限設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ClassAuthSetting.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <script type="text/javascript">
        function CheckWithParentClass() {                        
            var withChildReader = $("#<%=cbApplyToChildrenUser.ClientID%>").is(":checked");            
            var withChildClass = $("#<%=cbApplyToChildrenManager.ClientID%>").is(":checked");            

            if (withChildClass || withChildReader) {
                if (confirm('<%=lblMsgException.Text %>') == false)
                    return false;
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div style="display:none">
                <telerik:RadTreeView ID="classTree" runat="server" Height="440px" Width="100%">
                </telerik:RadTreeView>
                <asp:Label ID="msgMovieClass" runat="server" Text="影音類別" Visible="False" meta:resourcekey="msgMovieClass1Resource1"></asp:Label>
            </div>
    <table style="width:100%" class="PopTable">
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblClassTitle" runat="server" Text="類別" meta:resourcekey="lblClassTitleResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblClassPath" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblMovieClassManager" runat="server" Text="類別管理員" meta:resourcekey="lblMovieClassManagerResource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbApplyToChildrenManager" runat="server" Text="同步修改到子類別"
                        meta:resourcekey="cbApplyToChildrenManagerResource1" /><br />
                <uc1:UC_ChoiceList ID="UC_ChoiceListClassManager" runat="server" TreeHeight="120px" ExpandToUser="False" ShowMember="false" />
                <asp:Label ID="lblClassManagerRemark" runat="server" Text="註：具有類別管理員權限的人員，可同時維護該類別與子類別的設定。" ForeColor="Blue" meta:resourcekey="lblClassManagerRemarkResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblMovieUser" runat="server" Text="可觀看人員" meta:resourcekey="lblMovieUserResource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbApplyToChildrenUser" runat="server" Text="同步修改到子類別"
                    meta:resourcekey="cbApplyToChildrenUserResource1" /><br />
                <uc1:UC_ChoiceList ID="UC_ChoiceListMovieUser" runat="server" TreeHeight="120px" ExpandToUser="False" />
            </td>
        </tr>
    </table>

            <asp:Label ID="lblMsgException" runat="server" Text="注意:此動作將會同步修改子類別下的設定" Visible="false"
                            meta:resourcekey="lblMsgExceptionResource1"></asp:Label>
        </ContentTemplate>        
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
