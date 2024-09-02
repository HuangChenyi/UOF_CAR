<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Forum_UC_SubjectDetail" Codebehind="UC_SubjectDetail.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/FileCenter/V3/UC_FileCenter.ascx" TagName="uc_FileCenter" TagPrefix="uc3" %>
<style type="text/css">
div.JustAddBorder table tr td {
    border-width:1px;
    border-style:solid;
}

</style>  
   <script id="Forum_UC_SubjectDetail" type="text/javascript">
       var scrollTop = -1;
       Sys.WebForms.PageRequestManager.getInstance().add_endRequest(ForumEndRequestHandler);
       
       function ForumEndRequestHandler(sender, args) {
           if (scrollTop != -1) {
               if (!$('html,body').scrollTop)
                   $('html,body').animate({ scrollTop: scrollTop }, 'slow');
               else
                   $('html,body').animate({ scrollTop: scrollTop }, 'slow');
                   
                scrollTop = -1;  
            } 
        } 

        function SetScrollLocation(location)
        {
            scrollTop = location; 
        }
         
        function SetSubjectChanged()
       {
            $("#<% =hideSubjectChanged.ClientID %>").val("1");
       }
         
        function GetSubjectDetailBoardID()
       {
            var boardID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideBoardId.Value,true)%>');
            return boardID;
       }
       function GetSubjectDetailBoardName()
       {
           var boardName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideBoardName.Value,true)%>');
            return boardName;
       }  
        function AddForumBoardSiteMapNode()
       {
            var boardID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideBoardId.Value,true)%>');
            var boardName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideBoardName.Value,true)%>'); 
            AddSiteMapNodeWithLink(boardName, 'AllSubjectList.aspx?boardid=' + boardID + "&boardname=" + escape(boardName) );
       }
    
       function GetGridKey()
      {
           var gridKey ='<%=Grid1.ClientID%>';
           return gridKey;
      }


function ConfirmAddFavorites(topicGUID,userNAME)
{
    if (window.confirm('<%=lblConfirmAdd.Text %>')) 
    {
        var data = [topicGUID, userNAME];
        var result = $uof.pageMethod.syncUc("EIP/Forum/UC_SubjectDetail.ascx", "AddFavorites", data);
        if (result == "true")
        {
            alert('<%= lblSuccessAdd.Text %>');
        }
    }
}
   </script> 
    <table width="100%" cellspacing="0" cellpadding="0" border="0" class="table2">
        <tr>
            <td colspan="2">
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="沒有上一主題" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1" ForeColor="Red"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="沒有下一主題" Display="Dynamic" meta:resourcekey="CustomValidator2Resource1" ForeColor="Red"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="沒有權限訂閱" Display="Dynamic" meta:resourcekey="CustomValidator3Resource1" ForeColor="Red"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="沒有權限取消訂閱" Display="Dynamic" meta:resourcekey="CustomValidator4Resource1" ForeColor="Red" ></asp:CustomValidator>
                <asp:CustomValidator ID="cvReadAuthority" runat="server" ErrorMessage="沒有權限閱讀" meta:resourcekey="cvReadAuthorityResource1" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="你已經推薦過" meta:resourcekey="CustomValidator5Resource1" ForeColor="Red"></asp:CustomValidator>              
            </td>
        </tr>
        <tr>
            <td colspan="2" width="80%">
                <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" PageSize="10"
                    AutoGenerateColumns="False"   Width="100%"
                    OnRowCommand="Grid1_RowCommand" OnRowDataBound="Grid1_RowDataBound" DataKeyNames="ARTICLE_GUID"
                    OnRowDeleted="Grid1_RowDeleted" OnRowDeleting="Grid1_RowDeleting" AllowPaging="True"
                     OnPageIndexChanging="Grid1_PageIndexChanging"
                    SkinID="ForumStyle" OnRowUpdating="Grid1_RowUpdating" DataKeyOnClientWithCheckBox="False"  >
<EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>
<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:TemplateField meta:resourcekey="TemplateFieldResource1" >
                            <headertemplate>
                                <table class="table2" cellspacing="0" cellpadding="0" width="100%" border="0" style="background-image: url(<%=themePath %>/images/headerbg.gif)">
                                    <tbody>
                                        <tr>
                                            <td class="td2" width="250px" style="text-align:left;">
                                                <asp:Label runat="server" Text="作者" class="j" ID="Label7"  meta:resourcekey="Label7Resource1" ></asp:Label>
                                            </td>
                                            <td class="td2" >
                                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td style="text-align:left">
                                                                <asp:Label runat="server" Text="標題:" class="j" ID="label29" meta:resourcekey="label29Resource1" ></asp:Label>
                                                                <asp:Label runat="server" class="j" ID="lblSubject" meta:resourcekey="lblSubjectResource1" Visible="false"></asp:Label>
                                                                <asp:HyperLink ID="hyperlinkSubject" runat="server" CssClass="j"></asp:HyperLink>

                                                            </td>
                                                            <td>
                                                                <div align="right">
                                                                    <asp:LinkButton runat="server" ID="linkbtnPrevious" CommandName="Previous" OnClientClick="SetSubjectChanged()" meta:resourcekey="linkbtnPreviousResource1" Text="上一主題"></asp:LinkButton>
                                                                    │
                                                                    <asp:LinkButton runat="server" ID="linkbtnNext" CommandName="Next" OnClientClick="SetSubjectChanged()" meta:resourcekey="linkbtnNextResource1" Text="下一主題"></asp:LinkButton>
                                                                    │
                                                                    <asp:LinkButton runat="server" ID="linkbtnUnSubscribe" CommandName="UnSubscribe" meta:resourcekey="linkbtnUnSubscribeResource1" OnClick="linkbtnUnSubscribe_Click" Text="取消訂閱"></asp:LinkButton>
                                                                    <asp:LinkButton runat="server" ID="linkbtnSubscribe" CommandName="Subscribe" meta:resourcekey="linkbtnSubscribeResource1" OnClick="linkbtnSubscribe_Click" Text="訂閱"></asp:LinkButton>
                                                                    │
                                                                    <asp:LinkButton runat="server" ID="lbtnFavorites" meta:resourcekey="lbtnFavoritesResource1" Text="加入收藏"></asp:LinkButton>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </headertemplate>
                            <itemtemplate>
                                <table cellspacing="0" cellpadding="0" style=" width:100%; border:0; color:#000000;">
                                    <tbody>
                                        <tr>
                                            <td class="td2" style="text-align:left; vertical-align :top; background-color:#f6f6f6;  width:250px;">
                                                <table style="width:250px;">
                                                    <tr>
                                                        <td style="vertical-align:top;  text-align:left; width:95%;">
                                                            <asp:Image runat="server" Width="100px" Height="100px" ID="Image1" meta:resourcekey="Image1Resource1"></asp:Image>                
                                                        </td>
                                                        <td style="vertical-align:top;  text-align:right; width:5%;"><asp:Label runat="server"  ForeColor="#663333" Text='<%# Eval("FLOOR") %>' ID="lblFloor"></asp:Label>
                                                        </td>
                                                    </tr>      
                                                    <tr>
                                                        <td>
                                                            <asp:Label runat="server" Text="張貼者：" ID="Label2" meta:resourcekey="Label2Resource1"></asp:Label>
                                                            <asp:Label runat="server" ID="lblAnnounce" meta:resourcekey="lblAnnounceResource1"></asp:Label> 
                                                            <br /><asp:Label runat="server" Text="張貼時間：" ID="Label5" meta:resourcekey="Label5Resource1"></asp:Label>
                                                            <asp:Label runat="server" Text='<%#: Eval("CREATE_DATE") %>' ID="lblPosttime" meta:resourcekey="lblPosttimeResource1"></asp:Label> 
                                                            <br /><asp:Label runat="server" Text="張貼次數：" ID="Label3" meta:resourcekey="Label3Resource1"></asp:Label>
                                                            <asp:Label runat="server" Text='<%#: Eval("USER_POST_TIMES") %>' ID="lblTimes" meta:resourcekey="lblTimesResource1"></asp:Label>
                                                            <br /><asp:Label runat="server" Text="積分：" ID="Label4" meta:resourcekey="Label4Resource1"></asp:Label>  
                                                            <asp:Label runat="server" Text='<%#: Eval("USER_RECO_SCORE") %>' ID="lblRecommend" meta:resourcekey="lblRecommendResource1"></asp:Label> 
                                                        </td>
                                                    </tr> 
                                                </table>
                                            </td> 
                                            <td class="td2" style="  vertical-align:top;  text-align:right; width:100%;">
                                                <table cellSpacing=0 cellPadding=0  style="width:100%; border:0;">
                                                    <tbody>
                                                        <tr>
                                                            <td align=left>
                                                                <asp:Image runat="server" BorderWidth="0px" Width="16px" Height="16px" ID="imgscore" ImageUrl="~/Common/Images/Icon/icon_s06.png" __designer:wfdid="w85" meta:resourcekey="imgscoreResource1"></asp:Image>
                                                                <asp:Label runat="server" Text="*" ID="lblStar" meta:resourcekey="lblStarResource1"></asp:Label>
                                                                <asp:Label runat="server" Text='<%#: Eval("ARTICLE_SCORE") %>' ForeColor="Red" ID="lblScore" meta:resourcekey="lblScoreResource1"></asp:Label>
                                                            </td>
                                                            <td align=right>
                                                                <asp:LinkButton runat="server" ID="linkLock" OnClick="linkLock_Click" >
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s01.png"/>
                                                                    <asp:Label runat="server" Text="鎖定" ID="msgLock" meta:resourcekey="msgLockResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkUnlock" OnClick="linkUnlock_Click">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s08.png"/>
                                                                    <asp:Label runat="server" Text="取消鎖定" ID="msgUnlock" meta:resourcekey="msgUnlockResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkRely" OnClick="linkRely_Click">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s02.png"/>
                                                                    <asp:Label runat="server" Text="回覆" ID="msgRely" meta:resourcekey="msgRelyResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkRely2" OnClick="linkRely2_Click">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s03.png"/>
                                                                    <asp:Label runat="server" Text="引言回覆" ID="msgRely2" meta:resourcekey="msgRely2Resource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkModify" OnClick="linkModify_Click">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s04.png"/>
                                                                    <asp:Label runat="server" Text="修改" ID="msgModify" meta:resourcekey="msgModifyResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkDelete" CommandName="Delete" >
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s05.png"/>
                                                                    <asp:Label runat="server" Text="刪除" ID="msgDelete" meta:resourcekey="msgDeleteResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkRecommend" CommandName="Update" OnClick="linkRecommend_Click">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s06.png"/>
                                                                    <asp:Label runat="server" Text="推薦" ID="msgRecommand" meta:resourcekey="msgRecommandResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkEssence" OnClick="linkEssence_Click">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s09.png"/>
                                                                    <asp:Label runat="server" Text="精華" ID="msgEssence" meta:resourcekey="msgEssenceResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkTop" OnClick="linkTop_Click">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s07.png"/>
                                                                    <asp:Label runat="server" Text="置頂" ID="msgTop" meta:resourcekey="msgTopResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkUnTop" OnClick="linkUnTop_Click">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_s07.png"/>
                                                                    <asp:Label runat="server" Text="取消置頂" ID="msgUntop" meta:resourcekey="msgUntopResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkMoveBoard" OnClick="linkMoveBoard_Click">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_m26.png" />
                                                                    <asp:Label runat="server" Text="文章搬移" ID="msgMoveBoard" meta:resourcekey="msgMoveBoardResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="linkBack" OnCommand="linkBack_Command">
                                                                    <img border="0" height="16" width="16" src="../../Common/images/icon/icon_m62.png" />
                                                                    <asp:Label runat="server" Text="返回" ID="msgBack" meta:resourcekey="msgBackResource1"></asp:Label>
                                                                </asp:LinkButton>
                                                                <input runat="server" ID="hideDeleteStatus" type="hidden"></input>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <br /><div runat="server" class="editorcontentstyle JustAddBorder" ID="div1" align="left"><asp:Label runat="server" ID="lblContext" ></asp:Label></div>
                                                <br />
                                                <div style=" text-align:left;  vertical-align:bottom;">
                                                    <asp:Label runat="server" Text="最後修改：" ID="lblModifytimeText"  meta:resourcekey="lblModifytimeTextResource1"></asp:Label>
                                                    <asp:Label runat="server" ID="lblModifyuser" meta:resourcekey="lblModifyuserResource1"></asp:Label>
                                                    <asp:Label runat="server" Text='<%#: Eval("MODIFY_DATE") %>' ID="lblModifytime"  meta:resourcekey="lblModifytimeResource1"></asp:Label>
                                                </div>
                                                <br />
                                                <div style=" text-align:left; ">
                                                    <asp:Label runat="server" Text="附件：" ID="lblAttachText" meta:resourcekey="lblAttachTextResource1"></asp:Label>
                                                    &nbsp; <uc3:uc_FileCenter runat="server" ID="Uc_FileCenter1" Editable="false" ModuleName="FORUM" __designer:wfdid="w104"></uc3:uc_FileCenter>
                                                </div>
                                                <br />
                                                    <table cellspacing="0" cellpadding="0" style=" text-align:left;border:0;" >
                                                        <tobdy>
                                                            <tr>
                                                                <td>
                                                                    <img src="<%=themePath %>/images/pen.gif" border="0" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 500px; word-wrap:break-word">
                                                                    <pre><asp:Label runat="server" ID="lblSign" __designer:wfdid="w105" meta:resourcekey="lblSignResource1"></asp:Label>
                                                                    </pre>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </itemtemplate>
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
    </table>

    <input id="hideBoardId" runat="server" type="hidden" /> 
    <input id="hideBoardName" runat="server" type="hidden" /> 
    <input id="hideTopicid" runat="server" type="hidden" />
    <input id="hideSubject" runat="server" type="hidden" />
    <input id="hideEssenceFolderID" runat="server" type="hidden" />
    <input id="hideSubjectType" runat="server" type="hidden" value="Default" />
    <input id="hideBoardChanged" runat="server" type="hidden" value="0" />
    <input id="hideSubjectChanged" runat="server" type="hidden" value="0" />
    <asp:HiddenField id="hidReadTimes" runat="server" ></asp:HiddenField>
    <br />
<input id="hideUserGUID" type="hidden" runat="Server" /> 
<input id="hideSort" type="hidden" runat="Server" /> 
<input id="hideOrderColumn" type="hidden" runat="Server" /> 
<input id="hideOrderDirection" type="hidden" runat="Server" /> 
<asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1" ></asp:Label>
<asp:Label ID="msgLockconfirm" runat="server" Text="確定要鎖定?" Visible="False" meta:resourcekey="msgLockconfirmResource1" ></asp:Label>
<asp:Label ID="msgContentdeleted" runat="server" Text="內容已被作者或版主刪除" Visible="False" meta:resourcekey="msgContentdeletedResource1"></asp:Label> 
<asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False" meta:resourcekey="msgAnonymousResource1"></asp:Label>
<asp:HiddenField ID="hidRcdLock" runat="server" />
<asp:HiddenField ID="hidGoToLastArticle" runat="server" />
<asp:HiddenField ID="hidShowPage" runat="server" />
<asp:Label ID="lblSuccessAdd" runat="server" Text="已成功加入我的收藏。" Visible="false" meta:resourcekey="lblSuccessAddResource1"></asp:Label>
<asp:Label ID="lblConfirmAdd" runat="server" Text="確定要加入收藏嗎?" Visible="false" meta:resourcekey="lblConfirmAddResource1"></asp:Label>
<asp:HiddenField ID="hidUserName" runat="server" />

