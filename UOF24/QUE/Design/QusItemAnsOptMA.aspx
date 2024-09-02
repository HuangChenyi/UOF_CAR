<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_QusItemAnsOptMA" culture="auto" uiculture="auto" Codebehind="QusItemAnsOptMA.aspx.cs" %>
<%@ Register assembly="System.Web.Extensions" namespace="System.Web.UI" tagprefix="asp" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function ntbScore_OnValueChanging(sender, args)
        {
            if (args.get_newValue() == null || isNaN(args.get_newValue()))
            {
                args.set_newValue(0);
            }    
        }
    </script>
        <asp:CustomValidator ID="cvMessage" runat="server" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
            <table style="width: 100%" cellspacing="1" class="PopTable">
                <tr>
                    <td style=" white-space:nowrap;">
                        <font color="red">*</font><asp:Label ID="lblDescriptionLeft" runat="server" 
                            Text="內容" meta:resourcekey="lblDescriptionLeftResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDescription" runat="server" MaxLength="255" 
                            meta:resourcekey="txtDescriptionResource1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblScoreLeft" runat="server" Text="分數" 
                            meta:resourcekey="lblScoreLeftResource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="ntbScore" runat="server" DataType="System.Int32" Value="0">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                            <ClientEvents OnValueChanging="ntbScore_OnValueChanging" />
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblFileLeft" runat="server" Text="附件" 
                            meta:resourcekey="lblFileLeftResource1"></asp:Label>
                    </td>
                    <td>                        
                        <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" AllowedFileType="Image" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="left" style="text-align:left; white-space:nowrap;">
                        <asp:CheckBox ID="cbCreateText" runat="server" Text="選項中增加空白欄位，供使用者輸入" meta:resourcekey="cbCreateTextResource1" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblNameIsNull" runat="server" Text="內容不能為空" Visible ="False" meta:resourcekey="lblNameIsNullResource1"></asp:Label>
            <asp:Label ID="lblScore" runat="server" Text="分數範圍-999~999" Visible ="False" meta:resourcekey="lblScoreResource1"></asp:Label>
</asp:Content>

