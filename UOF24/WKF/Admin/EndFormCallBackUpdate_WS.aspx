<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_EndFormCallBackUpdate_WS" Title="修改網址" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EndFormCallBackUpdate_WS.aspx.cs" %>


<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
    


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        function cbCheck_CheckedChanged()
        {
            if ($('#<%=cbCheck.ClientID%>').prop("checked") == false) {
                $('#<%=Panel1.ClientID  %>').hide();

            }
            else {
                $('#<%=Panel1.ClientID  %>').show();
            }
        }
    </script>



    

            
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                        <table width=100% class = "PopTable" cellspacing="1">
                <tr>
                    <td class = "PopTableHeader" colspan = "2" style="text-align: center">
                    <center>
                        <asp:Label ID="Label1" runat="server" Text="修改網址" meta:resourcekey="Label1Resource1"></asp:Label>
                        </center>
                        </td>
                </tr>
                <tr>
                    <td class = "PopTableLeftTD" nowrap="noWrap" style="height: 26px">
                        <asp:Label ID="Label2" runat="server" Text="名稱" meta:resourcekey="Label2Resource1"></asp:Label></td>
                    <td class = "PopTableRightTD" style="height: 26px">
                        <asp:TextBox ID="txtWsName" runat="server" Width="450px" meta:resourcekey="txtWsNameResource1"></asp:TextBox></td>
                </tr>
                            <tr>
                    <td class = "PopTableLeftTD" style="height: 26px" nowrap="noWrap" >
                        <asp:Label ID="Label7" runat="server" Text="網址" meta:resourcekey="Label7Resource1"></asp:Label></td>
                    <td class = "PopTableRightTD" style="height: 26px">
                        <asp:TextBox ID="txtUrl" runat="server" Width="450px" meta:resourcekey="txtUrlResource1"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class = "PopTableLeftTD" style="height: 26px" nowrap="noWrap">
                        <asp:Label ID="Label3" runat="server" Text="呼叫的方法" meta:resourcekey="Label3Resource1"></asp:Label></td>
                    <td class = "PopTableRightTD" style="height: 26px">
                        <asp:TextBox ID="txtWsMethod" runat="server" Width="450px" meta:resourcekey="txtWsMethodResource1"></asp:TextBox></td>
            </table>
            <table width = 100%>
                <tr>
                    <td>

                        <asp:CheckBox ID="cbCheck" runat="server" Text="是否需要Windows驗證"  onclick="cbCheck_CheckedChanged();" meta:resourcekey="cbCheckResource1" Checked="True" />
                   </td>
               
                </tr>
                  
            </table>
             <asp:Panel ID="Panel1" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
            <table width = 100% class ="PopTable" cellspacing="1">   
                <tr>
                    <td class = "PopTableLeftTD" nowrap="noWrap" style="height: 26px" >       
                        <asp:Label ID="Label5" runat="server" Text="帳號" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                    <td class = "PopTableRightTD" style="height: 26px">
                        <asp:TextBox ID="txtWsUid" runat="server" Width="450px" meta:resourcekey="txtWsUidResource1"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
                    
                    <td class = "PopTableLeftTD" style="height: 21px" nowrap="noWrap">             
                        <asp:Label ID="Label6" runat="server" Text="密碼" meta:resourcekey="Label6Resource1"></asp:Label>
                    </td>
                    <td class = "PopTableRightTD" style="height: 21px">
                        <asp:TextBox ID="txtPwd" runat="server" Width="450px" TextMode="Password" autocomplete="off" meta:resourcekey="txtPwdResource1"></asp:TextBox>
                    </td>
                    
                </tr>  
   
            </table>
            </asp:Panel>
        <telerik:RadButton ID="ibtnConnectionTest" runat="server" Text="連線測試" meta:resourcekey="ibtnConnectionTestResource1" OnClick="ibtnConnectionTest_Click1"></telerik:RadButton>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ibtnConnectionTest" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblMethod" runat="server" Text="呼叫方法不能空白" Visible="False" meta:resourcekey="lblMethodResource1"></asp:Label>
    <asp:Label ID="lblUrl" runat="server" Text="網址不能空白" Visible="False" meta:resourcekey="lblUrlResource1"></asp:Label>
    <asp:Label ID="lblConnect" runat="server" Text="請先通過連線測試" Visible="False" meta:resourcekey="lblConnectResource1"></asp:Label>
    <asp:Label ID="lblSucess" runat="server" Text="連線成功" Visible="False" meta:resourcekey="lblSucessResource1"></asp:Label>
    <asp:Label ID="lblFail" runat="server" Text="連線失敗" Visible="False" meta:resourcekey="lblFailResource1"></asp:Label>
    <asp:Label ID="lblCheck" runat="server" Text="False" Visible="False" meta:resourcekey="lblCheckResource1"></asp:Label>
    <asp:Label ID="lblName" runat="server" Text="名稱不能空白" Visible="False" meta:resourcekey="lblNameResource1"></asp:Label>
    <asp:Label ID="lblUid" runat="server" Text="帳號不能空白" Visible="False" meta:resourcekey="lblUidResource1"></asp:Label>
    <asp:Label ID="lblWsId" runat="server" Visible="False" meta:resourcekey="lblWsIdResource1"></asp:Label>
    <asp:Label ID="lblNameLength" runat="server" Text="名稱輸入過長(限制200字元內)" Visible="False" meta:resourcekey="lblNameLengthResource1"></asp:Label>
    <asp:Label ID="lblUrlLength" runat="server" Text="網址輸入過長(限制200字元內)" Visible="False" meta:resourcekey="lblUrlLengthResource1"></asp:Label>
    <asp:Label ID="lblMethodLength" runat="server" Text="呼叫方法輸入過長(限制100字元內)" Visible="False" meta:resourcekey="lblMethodLengthResource1"></asp:Label>
    <asp:Label ID="lblAccountLength" runat="server" Text="帳號輸入過長(限制50字元內)" Visible="False" meta:resourcekey="lblAccountLengthResource1"></asp:Label>
    <asp:Label ID="lblPasswordLength" runat="server" Text="密碼輸入過長(限制50字元內)" Visible="False" meta:resourcekey="lblPasswordLengthResource1"></asp:Label>    
    
</asp:Content>

