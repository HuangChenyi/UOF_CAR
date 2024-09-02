<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Polling_Poll" Title="投票" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Poll.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" BackColor="Red" ForeColor="White" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ErrorMessage="無投票權限" 
        ForeColor="Gray" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="None" ErrorMessage="不允許重複投票"
        ForeColor="Gray" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="None" ErrorMessage="請挑選投票項目"
        ForeColor="Gray" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator><br />
    <center>
    <table width="80%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="15px" style=" height:100%; background-image: url('<%=themePath %>/images/tab21.gif'); background-size:100% 100%; background-repeat: no-repeat ;background-position:100% 100%; ">
            </td>
            <td valign="baseline"  class="e" style="height:100%; background-image: url('<%=themePath %>/images/tab22.gif'); background-size:100% 100%; background-repeat: no-repeat; background-position:100% 100%; " >
                <asp:Label ID="Label1" runat="server" Text="投票議題" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td width="15px" style="height:100%; background-image: url('<%=themePath %>/images/tab23.gif'); background-size:100% 100%; background-repeat: no-repeat; background-position:100% 100%; "></td>
        </tr>
        <tr>
            <td valign="top" style="height:9px; background-image: url('<%=themePath %>/images/tab24.gif'); background-size:100% 9px; background-repeat: no-repeat; background-position:100% 100%; " ><asp:Label ID="Label2" runat="server" Text="" Visible="false" ></asp:Label></td>
            <td style="height:9px; background-image: url('<%=themePath %>/images/tab25.gif'); background-size:100% 9px; background-repeat: no-repeat; background-position:100% 100%; " >
            </td>
            <td style="height:9px; background-image: url('<%=themePath %>/images/tab26.gif'); background-size:100% 9px; background-repeat: no-repeat; background-position:100% 100%; "></td>
        </tr>
        <tr>
            <td valign="top" style="background-color:white; background-image:url('<%=themePath %>/images/tab27.gif'); ">
                
            </td>
            <td  style="background-color:white;" align="center">
                <table >
                    <tr>
                        <td align="left">
                            <asp:Label ID="lbTopic" runat="server" meta:resourcekey="lbTopicResource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" meta:resourcekey="RadioButtonList1Resource1">
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td align="left">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="SizeMemo">
                            <asp:Label ID="lbReg" runat="server" Text="此為記名投票" Visible="False"  meta:resourcekey="lbRegResource1"></asp:Label><asp:Label
                                ID="lbUnReg" runat="server" Text="此為不記名投票" Visible="False"  meta:resourcekey="lbUnRegResource1"></asp:Label><br />
                            <asp:Label ID="lbTo" runat="server" Text="至" meta:resourcekey="lbToResource1"></asp:Label><asp:Label ID="lbPollEndTime" runat="server"
                                ForeColor="Red" meta:resourcekey="lbPollEndTimeResource1"></asp:Label><asp:Label ID="lbEnd" runat="server" Text="投票截止" meta:resourcekey="lbEndResource1"></asp:Label></td>
                    </tr>
                </table>
            </td>
            <td valign="top" style="background-image:url('<%=themePath %>/images/tab28.gif');" >
            </td>
        </tr>
        <tr>
            <td style="background-image:url('<%=themePath %>/images/tab29.gif');background-size:100% 18px; background-repeat: no-repeat;" >
                &nbsp;<td style="background-image:url('<%=themePath %>/images/tab30.gif');background-size:100% 18px; background-repeat: no-repeat;" >
                &nbsp;</td>
            <td style="background-image:url('<%=themePath %>/images/tab31.gif');background-size:100% 18px; background-repeat: no-repeat;" >
                &nbsp;</tr>
    </table>
    </center>
    <asp:Label ID="lbTopicId" runat="server" Visible="False" meta:resourcekey="lbTopicIdResource1"></asp:Label>
    <asp:Label ID="lbBtn2" runat="server" Text="瀏覽結果" Visible="False" meta:resourcekey="lbBtn2Resource1"></asp:Label>
    <asp:Label ID="lbBtn1" runat="server" Text="送出投票" Visible="False" meta:resourcekey="lbBtn1Resource1"></asp:Label>
</asp:Content>
