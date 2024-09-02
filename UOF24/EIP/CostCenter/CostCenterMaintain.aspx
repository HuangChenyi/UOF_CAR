<%@ Page Title="新增/維護成本中心" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_CostCenter_CostCenterMaintain" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CostCenterMaintain.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="PopTable">
    <tr>
        <td style="white-space:nowrap;">
            <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" 
                meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:Label ID="lblCostCenter" runat="server" Text="代碼" 
                meta:resourcekey="lblCostCenterResource1"></asp:Label>
            
        </td>
        <td>
            <asp:TextBox ID="txtCostCenter" runat="server" 
                meta:resourcekey="txtCostCenterResource1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="請輸入代碼" Display="Dynamic" ControlToValidate="txtCostCenter" 
                meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="cvRepect" runat="server" ErrorMessage="代碼重覆" 
                ControlToValidate="txtCostCenter" Display="Dynamic" 
                onservervalidate="cvRepect_ServerValidate" 
                meta:resourcekey="cvRepectResource1"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" 
                meta:resourcekey="Label1Resource1"></asp:Label><asp:Label ID="lblName" 
                runat="server" Text="名稱" meta:resourcekey="lblNameResource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="請輸入名稱" Display="Dynamic" ControlToValidate="txtName" 
                meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>

        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" 
                meta:resourcekey="Label3Resource1"></asp:Label><asp:Label ID="lblActive" 
                runat="server" Text="啟用" meta:resourcekey="lblActiveResource1"></asp:Label>
        </td>
        <td>
            <asp:RadioButtonList ID="rblActive" runat="server" Height="16px" 
                RepeatDirection="Horizontal" Width="95px" 
                meta:resourcekey="rblActiveResource1">
                <asp:ListItem Value="Yes" Selected="True" Text="是" 
                    meta:resourcekey="ListItemResource1"></asp:ListItem>
                <asp:ListItem Value="No" Text="否" meta:resourcekey="ListItemResource2"></asp:ListItem>
            </asp:RadioButtonList>
    </tr>
  </table>
    
    <asp:HiddenField ID="hidOldCost" runat="server" />
    
</asp:Content>

