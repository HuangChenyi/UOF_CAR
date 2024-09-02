<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupSupbFlow" Title="設定副流程" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupSupFlow.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc3" %>
<%@ Register Src="UC_SignableSite_Sub.ascx" TagName="UC_SignableSite_Sub" TagPrefix="uc2" %>
<%@ Register Src="UC_SubFlow.ascx" TagName="UC_SubFlow" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script id="SetupSupFlowjs" type="text/javascript">

        function saveScrollPosition() 
        {
            $('#<%=HiddenField1.ClientID%>').val($('#<%=Panel1.ClientID%>').scrollTop());
                  
        }

        $(function () {
            $('#<%=Panel1.ClientID%>').scrollTop($('#<%=HiddenField1.ClientID%>').val())
            

        });

    function WebImageButton_InsertFirstSite_Click(oButton, oEvent)
    {
        if(confirm('')==false)
        {	        
            oEvent.cancel=true;
        }
    }
    </script>    
        <table class="PopTable" cellspacing="1" border="0" cellpadding="1" width="100%">
            <tr>
                <td colspan='3' style=" text-align:center;" class="PopTableHeader">
                <center>
                    <asp:Label ID="lbTitle1" runat="server" Text="副流程資訊" meta:resourcekey="lbTitle1Resource1"></asp:Label>
                    </center>
                    </td>
            </tr>
            <tr>
                <td class="PopTableLeftTD" style="text-align:right;width:20%">
                    <asp:Label ID="lbFlowName" runat="server" Text="流程名稱" meta:resourcekey="lbFlowNameResource1"></asp:Label></td>
                <td class="PopTableRightTD" style="width:65%">
                    <asp:TextBox ID="tbxFlowName" runat="server" meta:resourcekey="TbFlowNameResource1"
                        Width="400px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxFlowName"
                        Display="Dynamic" ErrorMessage="請輸入流程名稱" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
                <td rowspan='1' class="PopTableLeftTD" style="width:15%">&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align:right" class="PopTableLeftTD">
                    <asp:Label ID="lblTitleFlowStartRef" runat="server" Text="起始依據" meta:resourcekey="lblTitleFlowStartRefResource1"></asp:Label></td>
                <td class="PopTableRightTD" style="vertical-align:top ; text-align:left; ">

              
                    <asp:RadioButton ID="rbFlowStartRefSelf" runat="server" Text="申請者" Checked="True"
                        GroupName="flowStartRef" meta:resourcekey="rbFlowStartRefSelfResource1" />
                    <br />
                    <asp:RadioButton ID="rbFlowStartRefPrevSite" runat="server" Text="上一站點簽核者部門及職級" GroupName="flowStartRef" meta:resourcekey="rbFlowStartRefPrevSiteResource1" />
                    <br />
                    <asp:RadioButton ID="rbFlowStartRefSetting" runat="server" Text="依照下列設定" GroupName="flowStartRef"
                        meta:resourcekey="rbFlowStartRefSettingResource1" />&nbsp;
                    <asp:Label ID="lblStartGroup" runat="server" ForeColor="Blue" meta:resourcekey="lblStartGroupResource1"></asp:Label>&nbsp;
                    <uc3:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce_StartGroup" runat="server" ShowSubDept="false" ButtonText="部門選擇" />
                    &nbsp; &nbsp;&nbsp;
                    <asp:Label ID="lblJobTitle" runat="server" ForeColor="Blue" meta:resourcekey="lblJobTitleResource1"></asp:Label>
                    &nbsp;
                    <uc3:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce_JobTitle" runat="server" ButtonText="職級選擇" />
                    &nbsp;
                    <asp:CustomValidator ID="CustomValidatorFlowStartRef" runat="server" meta:resourcekey="CustomValidatorFlowStartRefResource1"></asp:CustomValidator>
                   
                    </td>
                <td align="center" class="PopTableLeftTD" rowspan="1" valign="bottom">
                    <telerik:RadButton ID="BtnSaveSubFlowInfo" runat="server" Text="儲存資訊"
                        meta:resourcekey="BtnSaveSubFlowInfoResource1" OnClick="BtnSaveSubFlowInfo_Click1"></telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td colspan='3' align="center" class="PopTableHeader">
                <center>
                    <asp:Label ID="lbTitle2" runat="server" Text="站點管理" meta:resourcekey="lbTitle2Resource1"></asp:Label>
                    </center>

                    </td>
            </tr>
            <tr>
                <td colspan='3' style=" width:100%; text-align:center;height: 90px; background-color: #ffffff;" >
                    <asp:Panel ID="Panel1" runat="server"  ScrollBars="Auto" Width="100%"
                        meta:resourcekey="Panel1Resource1">
                        <asp:Label ID="lbMsg" runat="server" ForeColor="Red" Text="請先輸入流程名稱並按下〔儲存資訊〕，以進行設定站點的動作"
                            meta:resourcekey="lbMsgResource1"></asp:Label>
                        &nbsp;
                    <center style="width:100%">
                        <uc1:UC_SubFlow ID="UC_SubFlow1" runat="server" />
                       </center>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    
    <asp:Label ID="lblErrorMsgGroup" runat="server" Text="請選擇部門" Visible="False" meta:resourcekey="lblErrorMsgGroupResource1"></asp:Label>
    <asp:Label ID="lblErrorMsgJobTitle" runat="server" Text="請選擇職級" Visible="False" meta:resourcekey="lblErrorMsgJobTitleResource1"></asp:Label>
    <asp:Label ID="lblSaveInfo" runat="server" Text="儲存資訊" meta:resourcekey="lblSaveInfoResource1"
        Visible="False"></asp:Label>
    <asp:Label ID="lblDepSelect" runat="server" meta:resourcekey="lblDepSelectResource1"
        Text="部門選擇" Visible="False"></asp:Label>
    <asp:Label ID="lblRankSelect" runat="server" meta:resourcekey="lblRankSelectResource1"
        Text="職級選擇" Visible="False"></asp:Label>
    <asp:HiddenField ID="HiddenFieldGroupId" runat="server" />
    <asp:HiddenField ID="HiddenFieldJobTitleId" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
    <asp:HiddenField ID="hiddenDialogReturnValue" runat="server" />
</asp:Content>
