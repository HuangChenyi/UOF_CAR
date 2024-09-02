<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_ProjectManager_ProjectDialog" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ProjectDialog.aspx.cs" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc3" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagPrefix="uc1" TagName="UC_BtnChoiceOnce" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function checkLeader(e, args) {
            var v = document.getElementById('<%=lblLeader.ClientID%>').innerHTML;            
            if (v.length == 0) {                
                args.IsValid = false;
            }
            else {                
                args.IsValid = true;;
            }
        }
    </script>
    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="lblNumberCheck" runat="server" ForeColor="Red" Text="*" meta:resourcekey="lblNumberCheckResource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="專案編號" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtNumber" runat="server" meta:resourcekey="txtNumberResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNumber" ForeColor="Red" ErrorMessage="專案編號不能為空" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvNumberCheck" runat="server" ControlToValidate="ddlStatus" ErrorMessage="專案編號有重複" ForeColor="Red" meta:resourcekey="rfvNumberCheckResource1"></asp:RequiredFieldValidator>
                <asp:Label ID="lblNumber" runat="server" Visible="False" meta:resourcekey="lblNumberResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblNameCheck" runat="server" ForeColor="Red" Text="*" meta:resourcekey="lblNameCheckResource1"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="專案名稱" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ForeColor="Red" ErrorMessage="專案名稱不能為空" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="專案負責人" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td>
                <uc1:UC_BtnChoiceOnce runat="server" ID="UC_Leader" />
                <asp:Label ID="lblLeader" runat="server" meta:resourcekey="lblLeaderResource1"></asp:Label>
                
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="專案代理人" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <uc3:UC_BtnChoiceOnce ID="UC_Agents" runat="server" />
                <asp:Label ID="lblAgent" runat="server" meta:resourcekey="lblAgentResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="狀態" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDropDownList ID="ddlStatus" runat="server" SelectedText="草稿" SelectedValue="0" meta:resourcekey="ddlStatusResource1">
                    <Items>
                        <telerik:DropDownListItem runat="server" Selected="True" Text="草稿" Value="0" meta:resourcekey="DropDownListItemResource1" />
                        <telerik:DropDownListItem runat="server" Text="審核中" Value="1" meta:resourcekey="DropDownListItemResource2" />
                        <telerik:DropDownListItem runat="server" Text="尚未開始" Value="2" meta:resourcekey="DropDownListItemResource3" />
                        <telerik:DropDownListItem runat="server" Text="進行中" Value="3" meta:resourcekey="DropDownListItemResource4" />
                        <telerik:DropDownListItem runat="server" Text="已中止" Value="4" meta:resourcekey="DropDownListItemResource5" />
                        <telerik:DropDownListItem runat="server" Text="已結案" Value="5" meta:resourcekey="DropDownListItemResource6" />
                    </Items>
                </telerik:RadDropDownList>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblCheckNumber" runat="server" Text="專案編號重復，請確認後再新增" Visible="False" meta:resourcekey="lblCheckNumberResource1"></asp:Label>
    <asp:Label ID="lbGuid" runat="server" Visible="False" meta:resourcekey="lbGuidResource1"></asp:Label>
    <br />
    <asp:Label ID="lblLeaderGUID" runat="server" Visible="False" meta:resourcekey="lblLeaderGUIDResource1"></asp:Label>
    <br />
    <asp:Label ID="lblAgentGUID" runat="server" Visible="False" meta:resourcekey="lblAgentGUIDResource1"></asp:Label>
    <br />
    <asp:Label ID="lblLeaderChoice" runat="server" Visible="False" meta:resourcekey="lblLeaderChoiceResource1"></asp:Label>
    <br />
    <asp:Label ID="lblAgentChoice" runat="server" Visible="False" meta:resourcekey="lblAgentChoiceResource1"></asp:Label>

    <asp:Label ID="lblBtnSelectPerson" runat="server" Text="選取人員" Visible="False" meta:resourcekey="lblBtnSelectPersonResource1"></asp:Label>    
</asp:Content>

