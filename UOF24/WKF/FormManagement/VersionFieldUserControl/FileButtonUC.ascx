<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_FileButtonUC" CodeBehind="FileButtonUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/DCS/UC_UimgViewer.ascx" TagPrefix="uc1" TagName="UC_UimgViewer" %>



<script language="javascript">
    function MyImage(Img) {
        var width = 200; //預先設置的所期望的寬的值
        var height = 200; //預先設置的所期望的高的值
        var oWidth = Img.width;
        var oHeight = Img.height;
        if (oWidth > width || oHeight > height) {//現有圖片只有寬或高超了預設值就進行js控制
            w = oWidth / width;
            h = oHeight / height;
            if (w > h) {//比值比較大==>寬比高大
                Img.width = width; //定下寬度為width的寬度
                Img.height = oHeight / w; //以下為計算高度

            } else {//高比寬大
                Img.height = height; //定下寬度為height高度
                Img.width = oWidth / h; //以下為計算高度
            }
        }
    }

    function ClickThumbnail_<%=this.VersionField.FieldID%>() {
        $("#<%=pnlFileCenter.ClientID%> a").each(
            function(i, v){ 
                if(i == 0){
                    $(this)[0].click();
                }
            }
        );
    }

    //檢查是否有上傳檔案
   function ClientValidate_<%=this.VersionField.FieldID%>(source, arguments) {
       
       var fileCenter = $find("<%=UC_FileCenter.ClientID%>");
       if (fileCenter != null)
       {
           if (fileCenter.get_count()  > 0)
           {
               arguments.IsValid = true;
           }
           else
           {
               arguments.IsValid = false;
           }
       }
       else
       {
           var uploadedCnt = 0, permanentCnt = 0;
           try {
               permanentCnt = JSON.parse($('#<%=UC_FileCenter.ClientID%>_hdnPermanentFiles').val()).length;
           } catch (e) {
           }

           try {
               uploadedCnt = JSON.parse($('#<%=UC_FileCenter.ClientID%>_hdnUploadedFiles').val()).length;
           } catch (e) {
           }
           
           if((permanentCnt + uploadedCnt) > 0)
           {
               arguments.IsValid = true;
           }
           else
           {
               arguments.IsValid = false;
           }
       }
       if (!arguments.IsValid) { $("#<%=hyperlinkFocus1.ClientID%>").focus(); }
   }
</script>

<asp:UpdatePanel ID="updatePanel1" runat="server">
    <ContentTemplate>
        <table cellpadding="0" cellspacing="0" width="100%" border="0" id="tbField" runat="server" >
            <tr id="trInvisible" runat="server">
                <td>
                    <asp:Label ID="lblInvisible" runat="server" Text="******"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr id="trField" runat="server">
                            <td style="max-width: 60px" runat="server" id="tdEdit">
                                <asp:LinkButton ID="lnk_Edit" runat="server" CausesValidation="false" OnClick="lnk_Edit_Click" Visible="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
                                <asp:LinkButton ID="lnk_Submit" runat="server" CausesValidation="false" OnClick="lnk_Submit_Click" Visible="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
                            </td>
                            <td style="text-align: left">
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" ForeColor="OliveDrab" OnClick="LinkButton1_Click" meta:resourcekey="LinkButton1Resource1" Text="檔案操作"></asp:LinkButton>
                                <br />
                                <asp:Panel ID="pnlFileCenter" runat="server">
                                    <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" ProxyEnabled="true" />
                                </asp:Panel>
                                <div>
                                    <asp:Label ID="lblFileName" runat="server" Visible="false"></asp:Label>
                                </div>
                                <asp:Panel ID="pnlImg" runat="server" Visible="false">
                                    <asp:Image ID="img" runat="server"/>
                                </asp:Panel>
                                <asp:HyperLink id="hyperlinkFocus1" NavigateUrl="#" runat="server"/>
                            </td>
                        </tr>
                        <tr id="trViewer" runat="server">
                            <td colspan="2">
                                <uc1:UC_UimgViewer runat="server" ID="UC_UimgViewer" DownloadEnabled="false" Visible="false" FileIdOrFileGroupId="" />
                                <asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
                                <asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="至少需選取一項檔案！" ClientValidationFunction="ClientValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <asp:Label ID="lblHasNoAuthority" runat="server" ForeColor="Red" Text="無填寫權限" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
                    <asp:Label ID="lblFileGroupId" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:HiddenField ID="HiddenFieldFileButton" runat="server" />
                    <asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
                    <asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
                    <asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
                    <asp:Label ID="lblViewMsg" runat="server" Text="您沒有安裝EB PDF Viewer！\n\n是否要安裝？" Visible="False" meta:resourcekey="lblViewMsgResource1"></asp:Label>
                    <asp:Label ID="lblSaveTxt" runat="server" Text="下載" Visible="False" meta:resourcekey="lblSaveTxtResource1"></asp:Label>
                    <asp:Label ID="lblNoPDFMsg" runat="server" Text="你的瀏覽器不援PDF Viewer." Visible="False" meta:resourcekey="lblNoPDFMsgResource1"></asp:Label>
                    <asp:HiddenField ID="hiddenFieldFileId" runat="server" />
                    <asp:HiddenField ID="hfFileIdJson" runat="server" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
