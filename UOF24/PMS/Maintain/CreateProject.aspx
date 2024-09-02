<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Maintain_CreateProject" Title="新增專案" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateProject.aspx.cs" %>

<%@ Register Src="../Common/UC_ProjectStatusDDL.ascx" TagName="UC_ProjectStatusDDL" TagPrefix="uc4" %>
<%@ Register Src="../Common/UC_SearchProject.ascx" TagName="UC_SearchProject" TagPrefix="uc1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc3" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        CreateSourceChange();
   function CreateSourceChange()
   {
       var rbtCreateSource_new = $('#<%=rbtCreateSource.ClientID %>').find("input[value='New']");
      
       var rbtCreateSource_excel = $('#<%=rbtCreateSource.ClientID %>').find("input[value='Excel']");
       var rbtCreateSource_copy = $('#<%=rbtCreateSource.ClientID %>').find("input[value='Copy']");
       var panImport = $("div#CreateSource_panImport");
       var panCopy = $("div#CreateSource_panCopy");
       if(rbtCreateSource_new != null && rbtCreateSource_new.is(":checked"))
       {
           panImport.hide();
           panCopy.hide();
       }
       else if(rbtCreateSource_excel != null && rbtCreateSource_excel.is(":checked"))
       {
           panImport.show();
           panCopy.hide();
       }
       else if(rbtCreateSource_copy != null && rbtCreateSource_copy.is(":checked"))
       {
           panImport.hide();
           panCopy.show();
       }

   } 
</script>
<asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" meta:resourcekey="cvMessageResource1" ></asp:CustomValidator>
<table class="PopTable" cellspacing="1">
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label1" runat="server" Text="資料來源" meta:resourcekey="Label1Resource1"></asp:Label> 
            </td>
            <td>
                <asp:RadioButtonList ID="rbtCreateSource" runat="server" onClick="CreateSourceChange()" meta:resourcekey="rbtCreateSourceResource1">
                    <asp:ListItem Value="New" Selected="True" meta:resourcekey="ListItemResource1">空白專案</asp:ListItem>
                    <asp:ListItem Value="Excel" meta:resourcekey="ListItemResource2">Excel匯入</asp:ListItem>
                    <asp:ListItem Value="Copy" meta:resourcekey="ListItemResource3">從其它專案複製</asp:ListItem>
                </asp:RadioButtonList>
                <div id="CreateSource_panImport" style="display:block;padding-left:10px">                    
                    <uc3:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" />
                    <br />
                    <asp:HyperLink ID="hlDownLoadDemo" runat="server" Text="下載Excel範例" NavigateUrl="~/PMS/Common/ImportProject.xls" meta:resourcekey="hlDownLoadDemoResource1"></asp:HyperLink> 
                </div> 
                <div id="CreateSource_panCopy" style="display:block; padding-left:10px; padding-bottom:5px" >
                    <asp:CheckBox ID="cboxCopyUser" runat="server" Text="保留所有負責人的設定" meta:resourcekey="cboxCopyUserResource1"/> <br />
                        <asp:Label ID="Label2" runat="server" Text="選擇來源專案:" meta:resourcekey="Label2Resource1"></asp:Label>
                        <table>
                            <tr>
                                <td>
                                    <table class="PopTable" cellspacing="1" width="0">
                            <tr>
                                <td style="white-space:nowrap">
                                <asp:Label ID="Label3" runat="server" Text="專案狀態" meta:resourcekey="Label3Resource1"></asp:Label></td>
                                <td>
                                    <uc4:UC_ProjectStatusDDL ID="UC_ProjectStatusDDL1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                <asp:Label ID="Label4" runat="server" Text="專案名稱" meta:resourcekey="Label4Resource1"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txtProjName" runat="server" meta:resourcekey="txtProjNameResource1"></asp:TextBox></td></tr>
                            <tr>
                                <td colspan="2" style="text-align:center">
                                    <telerik:RadButton ID="RadButton1" runat="server" Text="查詢"  OnClick="RadButton1_Click" meta:resourcekey="RadButton1Resource1"></telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="vertical-align:top">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <uc1:UC_SearchProject id="UC_SearchProject1" runat="server" Visible="false">
                                </uc1:UC_SearchProject>
                                
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="UC_ProjectStatusDDL1" EventName="OnSelectChanged" />
                                <asp:AsyncPostBackTrigger ControlID="RadButton1" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
    <asp:Label ID="lblNextMsg" runat="server" Text="下一步" Visible="False" meta:resourcekey="lblNextMsgResource1"></asp:Label>
    <asp:Label ID="lblProjGUID" runat="server" Visible ="False" meta:resourcekey="lblProjGUIDResource1"></asp:Label> 
    
    <asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有新增專案的權限" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label> 
    <asp:Label ID="lblProjGUIDEmptyMsg" runat="server" Text="請選擇現有專案 " Visible="False" meta:resourcekey="lblProjGUIDEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelFilesEmptyMsg" runat="server" Text="請選上傳EXCEL文件 " Visible="False" meta:resourcekey="lblExcelFilesEmptyMsgResource1"></asp:Label>
    
    <asp:Label ID="lblFileNotFoundMsg" runat="server" Text="文件無法加載！" Visible="False" meta:resourcekey="lblFileNotFoundMsgResource1"></asp:Label>
    <asp:Label ID="lblFileOpenErrorMsg" runat="server" Text="文件無法打開！" Visible="False" meta:resourcekey="lblFileOpenErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelMsg1" runat="server" Text="文件中第" Visible="False" meta:resourcekey="lblExcelMsg1Resource1"></asp:Label>
    <asp:Label ID="lblExcelMsg2" runat="server" Text="行:" Visible="False" meta:resourcekey="lblExcelMsg2Resource1"></asp:Label>
    <asp:Label ID="lblExcelProjNameEmptyMsg" runat="server" Text="“專案名稱”為空" Visible="False" meta:resourcekey="lblExcelProjNameEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelProjNameisOver" runat="server" Text="“專案名稱”超過長度限制50" Visible="False" meta:resourcekey="lblExcelProjNameisOverResource1"></asp:Label>
    <asp:Label ID="lblExcelStartDateErrMsg" runat="server" Text="“起案日”格式不正確，請修改文件" Visible="False" meta:resourcekey="lblExcelStartDateErrMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelEndDateErrMsg" runat="server" Text="“結案日”格式不正確，請修改文件" Visible="False" meta:resourcekey="lblExcelEndDateErrMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelDateErrMsg" runat="server" Text="“結案日”早於“起案日”，請修改文件" Visible="False" meta:resourcekey="lblExcelDateErrMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelPMGUIDEmptyMsg" runat="server" Text="“專案負責人員帳號”為空" Visible="False" meta:resourcekey="lblExcelPMGUIDEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelSeriesOrTaskMsg" runat="server" Text="“是否為階段”内容不正確，應該為“Y”或“N”，請修改文件" Visible="False" meta:resourcekey="lblExcelSeriesOrTaskMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelXhEmptyMsg" runat="server" Text="“階層編號”為空" Visible="False" meta:resourcekey="lblExcelXhEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelNameEmptyMsg" runat="server" Text="“階段/任務名稱”為空" Visible="False" meta:resourcekey="lblExcelNameEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelExpStartDateEmptyMsg" runat="server" Text="“預計開始日”為空" Visible="False" meta:resourcekey="lblExcelExpStartDateEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelExpEndDateEmptyMsg" runat="server" Text="“預計完成日”為空" Visible="False" meta:resourcekey="lblExcelExpEndDateEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelExpStartDateErrMsg" runat="server" Text="“預計開始日”格式不正確，請修改文件" Visible="False" meta:resourcekey="lblExcelExpStartDateErrMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelExpEndDateErrMsg" runat="server" Text="“預計完成日”格式不正確，請修改文件" Visible="False" meta:resourcekey="lblExcelExpEndDateErrMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelExpDateErrMsg" runat="server" Text="“預計完成日”早於“預計開始日”，請修改文件" Visible="False" meta:resourcekey="lblExcelExpDateErrMsgResource1"></asp:Label>
    <asp:Label ID="lblExcelDirectorEmptyMsg" runat="server" Text="“負責人帳號”為空" Visible="False" meta:resourcekey="lblExcelDirectorEmptyMsgResource1"></asp:Label>
    
    <asp:Label ID="lblExcelFormatErrMsg" runat="server" Text="日期超出元件範圍" Visible="False" meta:resourcekey="lblExcelFormatErrMsgResource1"></asp:Label>

    <asp:Label ID="lblAuditorGUIDEmptyMsg" runat="server" Text="專案審核人員帳號不正確" Visible="False" meta:resourcekey="lblAuditorGUIDEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblPMGUIDEmptyMsg" runat="server" Text="專案負責人員帳號不正確" Visible="False" meta:resourcekey="lblPMGUIDEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblDirectorEmptyMsg" runat="server" Text="階段或任務人員帳號不正確" Visible="False" meta:resourcekey="lblDirectorEmptyMsgResource1"></asp:Label>
    <asp:Label ID="lblPMGUIDNotOuterMsg" runat="server" Text="專案負責人不能為外部會員" Visible="False" 
                        meta:resourcekey="lblPMGUIDNotOuterMsgResource1" ></asp:Label>
    <asp:Label ID="lblDirectorNotOuterMsg" runat="server" Text="階段或任務人員不能為外部會員" Visible="False" 
                        meta:resourcekey="lblDirectorNotOuterMsgResource1" ></asp:Label>
    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidMode" runat="server" />
    <asp:HiddenField ID="hidCopyUser" runat="server" />
    <asp:HiddenField ID="hidFileGroupId" runat="server" />
    <asp:Label ID="lblDomainError" runat="server" Text="網域名稱不存在" Visible="false" meta:resourcekey="lblDomainErrorResource1" ></asp:Label>
                </div> 
                
            </td>
        </tr>
    </table>
    <asp:Label ID="lblMSG" runat="server" Font-Size="Small" class="SizeMemo" ForeColor="Blue" Text="說明：外部會員不能為專案成員" Height="20px" meta:resourcekey="lblMSGResource1" ></asp:Label>
    <br />
    <asp:TextBox ID="txtErrorMsg" runat="server" Visible="false" TextMode="MultiLine" Height="120px" Width="100%"></asp:TextBox>
    <asp:Label ID="lblFileNotParse" runat="server" Visible="False" Text="匯入的檔案無法解析" meta:resourcekey="lblFileNotParseResource1"></asp:Label>

</asp:Content>

