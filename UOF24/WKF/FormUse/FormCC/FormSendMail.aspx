<%@ Page Title="副本通知" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FormCC_FormSendMail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="FormSendMail.aspx.cs" %>
<%@ Register src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>
<%@ Register Src="~/WKF/FormUse/TaskSiteSignInfo/UC_SignComment.ascx" TagPrefix="uc1" TagName="UC_SignComment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table style="width:100%;" class="PopTable">
        <tr>
            <td>
                <asp:Label ID="lblInfo" runat="server" Text="通知資訊" meta:resourcekey="lblInfoResource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBoxList ID="cbl" runat="server" RepeatDirection="Horizontal" meta:resourcekey="cblResource1">
                    <asp:ListItem Value="0" Text="含欄位附件" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Value="1" Text="含表單附件" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    <asp:ListItem Value="2" Text="含簽核明細" meta:resourcekey="ListItemResource3"></asp:ListItem>
                    <asp:ListItem Value="3" Text="含站點附件" meta:resourcekey="ListItemResource4"></asp:ListItem>
                </asp:CheckBoxList>
                <asp:Label ID="Label1" runat="server" Text="(通知資訊預設會有申請資訊、表單名稱、欄位資訊)" CssClass="SizeMemo" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSendUser" runat="server" meta:resourcekey="lblSendUserResource1"></asp:Label>
            </td>
            <td>
                <table style="width:100%;height:100%">
                    <tr>
                        <td style="width:50%">
                           <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
                        </td>
                        <td style="width:50%">                            
                            <asp:CustomValidator ID="cvCheckMail" runat="server" Display="Dynamic" ErrorMessage="以下人員未設定E-Mail或E-Mail格式錯誤，將不寄送"></asp:CustomValidator>
                            <br /><asp:Label ID="lblUserNoMail" runat="server" CssClass="SizeMemo" meta:resourcekey="lblUserNoMailResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        </table>        
        <asp:Label ID="lblCheckCurrentMail" runat="server" ForeColor="Blue" Text="*未設定自身E-Mail或E-Mail錯誤，將不寄送"></asp:Label>
        <div style="display:none">            
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" OnRowDataBound="GridView1_RowDataBound" Width="80%" meta:resourcekey="GridView1Resource1">
                <Columns>
                   <asp:BoundField DataField="SITE" meta:resourcekey="BoundFieldResource1" >
                        <ItemStyle Width="1%" BorderStyle="Solid" BorderWidth="1px"/>
                        <HeaderStyle BackColor="#B0D1FF" Wrap="False"/>
                    </asp:BoundField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource1" >
                        <ItemTemplate>
                            <asp:Label ID="lblSigner" runat="server" 
                                Text='<%#: Bind("ORIGINAL_SIGNER_NAME") %>' meta:resourcekey="lblSignerResource1" ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" ForeColor="Black" BackColor="#B0D1FF"/>
                        <ItemStyle Width="35%" Wrap="True" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black"/>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblCOMMENTS" runat="server" Text='<%#: Bind("COMMENT") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" ForeColor="Black" BackColor="#B0D1FF"/>
                        <ItemStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Black"/>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblAttach" runat="server" meta:resourcekey="lblAttachResource1" ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" ForeColor="Black" BackColor="#B0D1FF"/>
                        <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="False" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black"/>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblBeginTime" runat="server" Text='<%#: Bind("BEGIN_TIME") %>' meta:resourcekey="lblBeginTimeResource1" ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" ForeColor="Black" BackColor="#B0D1FF"/>
                        <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="False" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black"/>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource5" >
                        <ItemTemplate>
                            <asp:Label ID="lblSignStatus" runat="server" Text='<%#: Bind("SIGN_STATUS") %>' meta:resourcekey="lblSignStatusResource1" ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" ForeColor="Black" BackColor="#B0D1FF"/>
                        <ItemStyle HorizontalAlign="Center" Width="8%" Wrap="False" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black"/>
                    </asp:TemplateField>
                 
                </Columns>
        </asp:GridView>
        </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <uc1:UC_SignComment runat="server" ID="UC_SignComment" Visible="False"/>
    <asp:HiddenField ID="hidTaskId" runat="server" />
    <asp:Label ID="lblCCUser" runat="server" Text="副本人員"  Visible="False" meta:resourcekey="lblCCUserResource1"></asp:Label>
    <asp:Label ID="lblBCCUser" runat="server" Text="密件副本人員"  Visible="False" meta:resourcekey="lblBCCUserResource1"></asp:Label>
</asp:Content>

