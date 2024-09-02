<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_MaintainMailTemplate" Title="特定表單郵件維護" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainMailTemplate.aspx.cs" %>
<%@ Register src="~/WKF/Common/UC_VariableList.ascx" tagname="UC_VariableList" tagprefix="uc1" %>
<%@ Register Src="~/WKF/FormManagement/UC_VariableList.ascx" TagPrefix="uc2" TagName="UC_VariableList" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script>
    function CopyFiled(Text ){
        //Add code to handle your event here.

        clipboardData.setData("Text",Text); 
    }
    function CheckContentEmpty(e, args) {
        var editor1 = $find("<%=wheMailContent.ClientID%>");
            var content = editor1.get_content();
            if (content == "") {
                args.IsValid = false;
            }
            else { args.IsValid = true; }
        }
</script>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                            <table width = 100% class = "PopTable" cellspacing =1 cellpadding= 0 >
                    <colgroup class = "PopTableLeftTD" ></colgroup>
                    <colgroup class = "PopTableRightTD"></colgroup>
                    <tr>
                        <td class = "PopTableHeader" colspan = 2 style="text-align:center!important">
                        
                            <asp:Label ID="Label1" runat="server" Text="郵件樣板維護" 
                                meta:resourcekey="Label1Resource1"></asp:Label>
                        
                        </td>    
                    </tr>
                    <tr>
                        <td nowrap=nowrap>
                             <asp:Label ID="Label3" runat="server" Text="型態" 
                                 meta:resourcekey="Label3Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblAlertType" runat="server"></asp:Label>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" 
                                ErrorMessage="該類型郵件已存在" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                        </td>
                    </tr>
                                        <tr>
                        <td nowrap=nowrap>
                        
                            <asp:Label ID="Label2" runat="server" Text="語系" 
                                meta:resourcekey="Label2Resource1"></asp:Label>
                        
                        </td>
                        <td>
                            <asp:Label ID="lblCulture" runat="server" Text=""></asp:Label>
                            <asp:CheckBox ID="cbDefault" runat="server" Text="當系統找不到其他語系時,以此語系發送" 
                                meta:resourcekey="cbDefaultResource1" />
                            <asp:CustomValidator ID="cvDefault" runat="server" Display="Dynamic" 
                                ErrorMessage="該郵件內容未有預設語系,請先設定預設語系" meta:resourcekey="cvDefaultResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td nowrap=nowrap>
                             <asp:Label ID="Label4" runat="server" Text="郵件主旨" 
                                 meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSubjuct" runat="server" Width="1100px" 
                                meta:resourcekey="txtSubjuctResource1"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="郵件主旨不可空白" ControlToValidate="txtSubjuct" Display="Dynamic" 
                                meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td nowrap=nowrap>
                             <asp:Label ID="Label5" runat="server" Text="郵件內容" 
                                 meta:resourcekey="Label5Resource1"></asp:Label>
                            
                        </td>
                        <td style="line-height:normal;">
                            <uc1:UC_HtmlEditor runat="server" id="wheMailContent" ModuleName="WKF" EnableInsertImage="true" EnableInsertFiles="false" Width="1100px" Height="450px" ProxyEnabled="true"/>
                            <asp:CustomValidator runat="server" ErrorMessage="郵件內容不可空白" Display="Dynamic"   meta:resourcekey="RequiredFieldValidator2Resource1" ClientValidationFunction="CheckContentEmpty"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class = "PopTableRightTD" colspan = 2>
                            <div style="text-align:left"> 
                            <asp:Label ID="Label21" runat="server" Text="將「變數名稱」與「欄位代號」複製到郵件內容中，代表郵件內容會依表單當時的資訊顯示所屬內容" CssClass="SizeMemo" meta:resourcekey="Label21Resource1"></asp:Label>
                </div>
                            <table width = 100%>
                                <tr>
                                    <td valign =top style="width :50%; text-align:left">
                                        <uc2:UC_VariableList runat="server" id="UC_VariableList2" />
                                    </td>
                                    <td valign =top >
                                        <asp:Table ID="tbFormFiled" align="right" runat="server" Width = "100%" CellSpacing=1 
                                            CssClass = "PopTable" meta:resourcekey="tbFormFiledResource1">
                                            <asp:TableHeaderRow runat="server" meta:resourcekey="TableHeaderRowResource1">
                                                <asp:TableCell ColumnSpan = 2   CssClass = "PopTableHeader" 
                                                    style="text-align:center!important" runat="server" ><asp:Label 
                                                    ID="Label7" runat="server" Text="可用欄位列表" meta:resourcekey="Label7Resource1"></asp:Label>
                                                </asp:TableCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableHeaderRow runat="server" meta:resourcekey="TableHeaderRowResource2">
                                                <asp:TableCell  CssClass = "PopTableHeader" style="text-align:center!important"
                                                    runat="server" ><asp:Label ID="Label8" 
                                                    runat="server" Text="欄位代號" meta:resourcekey="Label8Resource1"></asp:Label>                                                       
                                                </asp:TableCell>
                                                <asp:TableCell  CssClass = "PopTableHeader" style="text-align:center!important" 
                                                    runat="server" ><asp:Label ID="Label9" 
                                                    runat="server" Text="欄位名稱" meta:resourcekey="Label9Resource1"></asp:Label>
                                                </asp:TableCell>
                                            </asp:TableHeaderRow>
                                        </asp:Table>
                                        <asp:Label ID="Label10" runat="server"  CssClass="SizeMemo"
                                            Text="*點擊欄位代號可複製欄位變數\r\n({@fieldId},@號後面接的是欄位代號,表示要列出欄位資料)" Visible="false"
                                            meta:resourcekey="Label10Resource1" ></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            
                        </td>
                    </tr>

                </table>
        </ContentTemplate>
    </asp:UpdatePanel>
                           
    <asp:Label ID="lblSign" runat="server" Text="簽核通知" Visible =False 
        meta:resourcekey="lblSignResource1"></asp:Label>
    <asp:Label ID="lblAlert" runat="server" Text="表單知會" Visible =False 
        meta:resourcekey="lblAlertResource1"></asp:Label>
    <asp:Label ID="lblFinish" runat="server" Text="表單結案" Visible =False 
        meta:resourcekey="lblFinishResource1"></asp:Label>
    <asp:Label ID="lblCancel" runat="server" Text="表單作廢" Visible =False 
        meta:resourcekey="lblCancelResource1"></asp:Label>
    <asp:Label ID="lblBackSign" runat="server" Text="表單退簽" Visible=False 
        meta:resourcekey="lblBackSignResource1"></asp:Label>
     <asp:Label ID="lblAgree" runat="server" Text="表單核准" Visible=False 
        meta:resourcekey="lblAgreeResource1"></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="表單否決" Visible=False 
        meta:resourcekey="lblRejectResource1"></asp:Label>
                        
    <asp:Label ID="lblFormRetrieve" runat="server" Text="表單取回" Visible="False"
        meta:resourcekey="lblFormRetrieveResource1"></asp:Label>
    <asp:Label ID="lblFormInquiry" runat="server" Text="表單徵詢" Visible="False"
        meta:resourcekey="lblFormInquiryResource1"></asp:Label>
    <asp:Label ID="lblFormUnlock" runat="server" Text="表單解除鎖定" Visible="False"
        meta:resourcekey="lblFormUnlockResource1"></asp:Label>
    <asp:Label ID="lblFormApplyByDelegate" runat="server" Text="表單代填寫" Visible="False"
        meta:resourcekey="lblFormApplyByDelegateResource1"></asp:Label>
    <asp:Label ID="lblReturnSignAlert" runat="server" Text="表單退簽知會" Visible="False"
        meta:resourcekey="lblReturnSignAlertResource1"></asp:Label>
    <asp:Label ID="lblForum" runat="server" Text="表單討論" Visible="false" meta:resourcekey="lblFouumResource1"></asp:Label>
</asp:Content>

