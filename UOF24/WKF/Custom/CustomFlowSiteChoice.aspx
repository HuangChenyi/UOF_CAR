<%@ Page Title="站點類型選擇" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Custom_CustomFlowSiteChoice" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CustomFlowSiteChoice.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

    function rbClick(i)
    {
        var o = $('#<%=Label2.ClientID%>');
         var target;

        if (i == 1)
        {
            target = $('#<%=lblSignSiteMsg.ClientID%>');    
            o.text(target.text());
 
        }
       
        if (i == 8)
        {
            target = $('#<%=lblAlertSiteMsg.ClientID%>');
            o.text(target.text());
        }
    }

    function ChoicePopDialog()
    {
            //簽核式
        if ($('#ctl00_ContentPlaceHolder1_rbAssignableSite').prop("checked") == true) {
            $uof.dialog.open2("<%=signableSiteUrl%>", this, "<%=lblAddMsg_Sign.Text%>", 900, 550, openDialogResult);
            return false;
        }
  
           
             //知會站點
        if ($('#ctl00_ContentPlaceHolder1_rbAlertSite').prop("checked") == true) {
            $uof.dialog.open2("<%=alertSiteUrl%>", this, "<%=lblAddMsg_Alert.Text%>", 760, 580, openDialogResult);
            return false;
        }
  }  
        function openDialogResult(returnValue) {
            //判斷是否PostBack
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
                return true;
        }
    </script>
    <div style="text-align: center">
        <br />
        <br />
        <table border="0" cellpadding="0" cellspacing="0" style="height: 160px;margin: 0px auto; " width="80%">
            <colgroup class="PopTableRightTD">
            </colgroup>
            <tr>
                <td style="height: 30px" align="center" class="PopTableLeftTD">
                    <div align="center">
                        <asp:Label ID="Label1" runat="server" Text="請選擇站點類型" meta:resourcekey="Label1Resource1"></asp:Label></div>
                </td>
            </tr>
            <tr>
                <td align="center" class="PopTableRightTD" style="height: 20px">
                </td>
            </tr>
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td align="left" class="PopTableRightTD" height="30">
                                <asp:RadioButton ID="rbAssignableSite" runat="server" Checked="True" GroupName="MasterFlowSite"
                                    Text="簽核站點" meta:resourcekey="rbAssignableSiteResource1" onclick="rbClick(1)" />
                            </td>
                            <td>
                                &nbsp;&nbsp; &nbsp;&nbsp;
                            </td>
                            <td align="left">
                            </td>
                        </tr>                      
                        <tr>
                            <td align="left" class="PopTableRightTD" height="30">
                                <asp:RadioButton ID="rbAlertSite" runat="server" Text="知會站點" onclick="rbClick(8)"
                                    GroupName="MasterFlowSite" meta:resourcekey="rbAlertSiteResource1" />
                            </td>
                            <td>
                                &nbsp;&nbsp; &nbsp;&nbsp;
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left" class="PopTableRightTD" height="20">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="left" class="PopTableRightTD" height="30">
                    <asp:Label ID="Label2" runat="server" ForeColor="#0033CC" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" class="PopTableRightTD">
                    <asp:RadioButton ID="rbBranchSite_condition" runat="server" GroupName="MasterFlowSite"
                        Text="分岔式站點 ( 條件 )" Visible="False" meta:resourcekey="rbBranchSite_conditionResource1" />
                    <asp:RadioButton ID="rbBranchSite_assign" runat="server" GroupName="MasterFlowSite"
                        Text="分岔式站點 ( 指定 )" Visible="False" meta:resourcekey="rbBranchSite_assignResource1" />
                </td>
            </tr>
        </table>
    </div>
    <asp:Label ID="lblAddMsg_Sign" runat="server" Text="新增簽核式站點" Visible="False" meta:resourcekey="lblAddMsg_SignResource1"></asp:Label>
    <asp:Label ID="lblAddMsg_Flow" runat="server" Text="新增流程站點" Visible="False" meta:resourcekey="lblAddMsg_FlowResource1"></asp:Label>
    <asp:Label ID="lblAddMsg_Cond" runat="server" Text="新增條件式站點" Visible="False" meta:resourcekey="lblAddMsg_CondResource1"></asp:Label>
    <asp:Label ID="lblAddMsg_CustGroup" runat="server" Text="新增自選流程站點" Visible="False"
        meta:resourcekey="lblAddMsg_CustGroupResource1"></asp:Label>
    <asp:Label ID="lblAddMsg_Field" runat="server" Text="新增組織欄位站點" Visible="False" meta:resourcekey="lblAddMsg_FieldResource1"></asp:Label>
    <asp:Label ID="lblAddMsg_External" runat="server" Text="新增應用程式站點" Visible="False"
        meta:resourcekey="lblAddMsg_ExternalResource1"></asp:Label>
    <asp:Label ID="lblAddMsg_Alert" runat="server" Text="新增知會站點" Visible="false" meta:resourcekey="lblAddMsg_AlertResource1"></asp:Label>
    <asp:Label ID="lblSignSiteMsg" runat="server" Text="單一站點設定，可直接設定特殊人員或是挑選一般簽核人員" Style="display: none"
        meta:resourcekey="lblSignSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblFlowSiteMsg" runat="server" Text="副流程站點設定，在副流程列表挑選要使用的副流程" Style="display: none"
        meta:resourcekey="lblFlowSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblCondSiteMsg" runat="server" Text="判斷條件設定，因為是條件設定所以要先選擇要判斷的條件，選好後，再選擇判斷條件所要跑的副流程，一個判斷條件只能搭配一個副流程"
        Style="display: none" meta:resourcekey="lblCondSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblCustGroupSiteMsg" runat="server" Text="由使用者在表單進行時，自行設定簽核流程" Style="display: none"
        meta:resourcekey="lblCustGroupSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblFieldSiteMsg" runat="server" Text="選擇表單組織人員型態的欄位，簽核時由欄位選擇的內容進行簽核"
        Style="display: none" meta:resourcekey="lblFieldSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblGroupSiteMsg" runat="server" Text="由表單設計者設定好副流程，再由使用者自行選擇一個以上的副流程來作為簽核流程"
        Style="display: none" meta:resourcekey="lblGroupSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblExternalSiteMsg" runat="server" Text="提供接口，可設定呼叫外部應用程式(DLL)，由DLL決定站點流程"
        Style="display: none" meta:resourcekey="lblExternalSiteMsgResource1"></asp:Label>
    <asp:Label ID="lblAlertSiteMsg" runat="server" Text="僅提供知會，不需設定簽核人員"
        Style="display: none" meta:resourcekey="lblAlertSiteMsgResource1"></asp:Label>
</asp:Content>

