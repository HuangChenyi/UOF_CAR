<%@ Page Title="新增/修改系統收藏目錄" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Collection_ModifySysCollection" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ModifySysCollection.aspx.cs" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript">
        function ImportDMSReader(sender, args) {
            var folder = $("#<%=this.hfFolderID.ClientID %>").val();

            if(folder!='')
                sender.set_autoPostBack(confirm('<%=lblConfirmMsg.Text %>'));
        }
    </script>
    <asp:ValidationSummary ID="VSErrorMsg" runat="server" meta:resourcekey="VSErrorMsgResource1" />
    <table class="PopTable" >
        <colgroup class="PopTableLeftTD" ></colgroup>
        <colgroup class="PopTableRightTD" ></colgroup>
        <colgroup class="PopTableLeftTD" ></colgroup>
        <tr>
            <td style="width:25%">
                <asp:Label ID="Label1" runat="server" Text="文管目錄" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="width:75%">
                <telerik:RadButton ID="rdbtnSelect" runat="server" Text="選擇文管目錄"  CausesValidation="False" meta:resourcekey="ibtnSelectResource1" OnClick="rdbtnSelect_Click"></telerik:RadButton>
                <asp:Label ID="lblDmsFolder" runat="server" meta:resourcekey="lblDmsFolderResource1"></asp:Label>
                <asp:HiddenField ID="hfFolderID" runat="server" />
                <asp:CustomValidator ID="cvFolderIDError" runat="server" ErrorMessage="請選擇文管目錄" Visible="False" meta:resourcekey="cvFolderIDErrorResource1"></asp:CustomValidator> 
                <asp:CustomValidator ID="cvRepeatFolderError" runat="server" ErrorMessage="此文管目錄已被強制收藏" Visible="False" meta:resourcekey="cvRepeatFolderErrorResource1"></asp:CustomValidator>
                <asp:CustomValidator ID="cvNoSelectDMS" runat="server" ErrorMessage="請先選擇文管目錄" Visible="False" meta:resourcekey="cvNoSelectDMSResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="width:25%">
                <asp:Label ID="Label2" runat="server" Text="收藏人員" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td style="width:75%">
                <table style="border: 1px;">
                    <tr>
                        <td>
                            <telerik:RadButton ID="rdbtnImportDMSReader" runat="server" Text="帶入文管目錄讀者" CausesValidation="False" OnClientClicked="ImportDMSReader"
                                 OnClick="rdbtnImportDMSReader_Click" meta:resourcekey="ibtnImportDMSReaderResource1"></telerik:RadButton>                    
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ChioceType="All" ExpandToUser="False" ShowMember="False"/>
                            <asp:CustomValidator ID="cvChoiceError" runat="server" ErrorMessage="請選擇收藏人員" Visible="False" meta:resourcekey="cvChoiceErrorResource1"></asp:CustomValidator>       
                            <asp:CustomValidator ID="cvNoDMSReaderError" runat="server" ErrorMessage="此目錄無設定讀者" Visible="False" meta:resourcekey="cvNoDMSReaderErrorResource1"></asp:CustomValidator>             
                            <asp:CustomValidator ID="cvNotDMSReaderError" runat="server" ErrorMessage="" Visible="False" meta:resourcekey="cvNotDMSReaderErrorResource1"></asp:CustomValidator>
                            <asp:Label ID="lblNotDMSReader" runat="server" Text="非目錄設定讀者。" meta:resourcekey="lblNotDMSReaderResource1" Visible="false"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblSelectFolderTitle" runat="server" Text="選擇文管目錄" Visible="False" meta:resourcekey="lblSelectFolderTitleResource1"></asp:Label>
     <asp:Label ID="lblConfirmMsg" runat="server" Text="帶入文管目錄讀者，將會清除目前已選取的人員" Visible="False" meta:resourcekey="lblConfirmMsgResource1"></asp:Label>
    <asp:Label ID="lblErrorMsg" runat="server" Text="無權限使用" Visible="False" meta:resourcekey="lblErrorMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfMode" runat="server" />
</asp:Content>

