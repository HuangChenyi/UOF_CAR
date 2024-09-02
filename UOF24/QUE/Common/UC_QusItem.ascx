<%@ Control Language="C#" AutoEventWireup="true" Inherits="QUE_Common_UC_QusItem" Codebehind="UC_QusItem.ascx.cs" %>


<style>
    .grid-container span {
        display: grid;
        grid-template-columns: 17px calc(100% - 17px);
        align-items: baseline;
    }

    .grid-container input {
        grid-column-start: 1;
    }

    .grid-container label {
        grid-column-start: 2;
        word-break: break-all;
    }
</style>
   
<script type="text/javascript" language="javascript" >
    function cbChoice_OnClick(obj)
    {
        var txtCreate = $('#' + obj.id.replace('cbChoice','txtCreate'));
        var txtCreate_M = $('#' + obj.id.replace('cbChoice', 'txtCreate_M'));
        var hiddenCreate = $('#' + obj.id.replace("cbChoice", "hiddenCreateTextBox"));
        var hiddenOther = $('#' + obj.id.replace("cbChoice","hiddenIsOther"));
        var lblCreate = $('#' + obj.id.replace('cbChoice','lblCreate'));
        var isMobile = "<%= isMobile %>"
        
        if(hiddenCreate.val() == "Y" || hiddenOther.val() == "Y")
        {
            if (obj.checked) {
                if (isMobile == "True") {
                    txtCreate_M.prop("disabled", false);
                }
                else {
                    txtCreate.css("display", "block");
                    txtCreate.css("height", "20px");
                    txtCreate.css("width", "100%");
                    lblCreate.css("display", "none");
                }

            }
            else {
                if (isMobile == "True") {
                    txtCreate_M.prop("disabled", true);
                    txtCreate_M.val("");
                }
                else {
                    txtCreate.css("display", "none");

                    lblCreate.css("display", "block");
                    lblCreate.css("height", "20px");
                    
                    txtCreate.val("");
                    lblCreate.textContent = "";
                    lblCreate[0].textContent = "";
                }
            }
        }
    }
    function SetText(obj)
    {
        var isMobile = "<%= isMobile %>";
        if (isMobile == "True") {
            var hiddenObj = $('#' + obj.id.replace('txtCreate_M', 'hiddenCreateTextBoxText'));
            var lblCreate = $('#' + obj.id.replace('txtCreate_M', 'lblCreate_M'));
            hiddenObj.val(obj.value);

        }
        else {
            var hiddenObj = $('#' + obj.id.replace('txtCreate', 'hiddenCreateTextBoxText'));
            var lblCreate = $('#' + obj.id.replace('txtCreate', 'lblCreate'));
            hiddenObj.val(obj.value);

        }
    }
    
    function rbChoice_OnClick(obj)
    {
        var objId = obj.id;
        var txtCreate = $('#' + obj.id.replace('rbChoice', 'txtCreate'));
        var txtCreate_M = $('#' + obj.id.replace('rbChoice', 'txtCreate_M'));
        var hiddenCreate = $('#' + obj.id.replace("rbChoice", "hiddenCreateTextBox"));
        var hiddenOther = $('#' + obj.id.replace("rbChoice", "hiddenIsOther"));
        var lblCreate = $('#' + obj.id.replace('rbChoice', 'lblCreate'));
        var hiddenSCAnsOpt = $('#' + objId.replace(objId.split('_')[objId.split('_').length - 3] + '_' + objId.split('_')[objId.split('_').length - 2] + '_' + objId.split('_')[objId.split('_').length - 1], '') + "hiddenSCAnsOpt");
        var hiddenChoiceAnswerOptionGuid = $('#' + obj.id.replace('rbChoice', 'hiddenChoiceAnswerOptionGuid'));
        var isMobile = "<%= isMobile %>"
        hiddenSCAnsOpt.val(hiddenChoiceAnswerOptionGuid.val());
        if (hiddenCreate.val() == "Y" || hiddenOther.val() == "Y") {
            if (isMobile == "True") {
                txtCreate_M.prop("disabled", false);
            }
            else {
                txtCreate.css("display", "block");
                txtCreate.css("height", "20px");
                txtCreate.css("width", "100%");
                lblCreate.css("display", "none");
              
            }
        }
        
        var i=0;
        var ctlId = objId.replace(objId.split('_')[objId.split('_').length - 2] + '_' + objId.split('_')[objId.split('_').length - 1],'') + "ctl00_rbChoice";
        while($('#' + ctlId).length > 0)
        {
            if (ctlId != objId) {
                $('#' + ctlId).prop("checked", false);
                hiddenCreate = $('#' + ctlId.replace("rbChoice", "hiddenCreateTextBox"));
                hiddenOther = $('#' + ctlId.replace("rbChoice", "hiddenIsOther"));

                if (hiddenCreate.val() == "Y" || hiddenOther.val() == "Y") {
                    txtCreate = $('#' + ctlId.replace('rbChoice', 'txtCreate'));
                    txtCreate_M = $('#' + ctlId.replace('rbChoice', 'txtCreate_M'));

                    if (isMobile == "True") {
                        txtCreate_M.prop("disabled", true);
                        txtCreate_M.val("");
                    }
                    else {
                        lblCreate = $('#' + ctlId.replace('rbChoice', 'lblCreate'))
                        txtCreate.css("display", "none");
                        lblCreate.css("display", "block");
                        lblCreate.css("height", "20px");
                        if (lblCreate.val().length > 0)
                            lblCreate.css("width", "auto");
                        else
                            lblCreate.css("width", "185px");
                        txtCreate.val("");
                        lblCreate.textContent = "";
                        lblCreate[0].textContent = "";
                    }
                }
            }
            //else {
            //    break;
            //}
                i++;
                var seq = '0'+i;
                if(i>=10)
                {
                    seq = i+'';
                }
                ctlId = objId.replace(objId.split('_')[objId.split('_').length - 2] + '_' + objId.split('_')[objId.split('_').length - 1],'') + "ctl" + seq + "_rbChoice";
        } 
    }
</script>
<table style="width: 100%;-webkit-text-size-adjust: 100%;" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td style="background-color: #e6ebf1; width:100%;">
            <asp:Label ID="lblSeq" runat="server" ForeColor="Blue" meta:resourcekey="lblSeqResource1"></asp:Label>
            <asp:LinkButton ID="lbtnItemName" runat="server" OnClick="lbtnItemName_Click" meta:resourcekey="lbtnItemNameResource1"></asp:LinkButton>
            <asp:Label ID="lblItemName" runat="server" meta:resourcekey="lblItemNameResource1"></asp:Label>
            <asp:Label ID="lblMaxAnsCount" ForeColor="Blue" Style="margin-left: 10px;" runat="server" meta:resourcekey="lblMaxAnsCountResource1"></asp:Label>
            <asp:Label ID="lblRequired" ForeColor="Red" runat="server" Text="*" meta:resourcekey="lblRequiredResource1"></asp:Label>
            <asp:Label ID="lblMessage" runat="server" Text="(此題沒有選項)" Font-Bold="True" ForeColor="Red" Visible  ="False" meta:resourcekey="lblMessageResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlChoice" runat="server" meta:resourcekey="pnlChoiceResource1">
                        <asp:DataList ID="dsAnswerOption" runat="server" OnItemDataBound="dsAnswerOption_ItemDataBound"
                            meta:resourcekey="dsAnswerOptionResource1">
                            <ItemStyle VerticalAlign="Bottom" />
                            <ItemTemplate>
                                <table cellspacing="0" cellpadding="0" style="width:100%; border:0; vertical-align:top;" runat="server">
                                    <tr style="vertical-align: top;" >
                                        <td class="grid-container">
                                            <asp:RadioButton ID="rbChoice" runat="server"
                                                meta:resourcekey="rbChoiceResource1" />
                                            <asp:CheckBox ID="cbChoice" runat="server" meta:resourcekey="cbChoiceResource1" />
                                        </td>
                                        <td id="uofCreate" runat="server">
                                            <asp:TextBox ID="txtCreate" style="display:block; height:20px;" oninput="javascript:SetText(this);"  onpropertychange="javascript:SetText(this);"
                                                runat="server" meta:resourcekey="txtCreateResource1" Width="100%"></asp:TextBox>
                                        </td>
                                        <td style="padding-top:1px;" id="uofCreateDisabled"  runat="server">
                                            <asp:Label ID="lblCreate" BackColor="White" style="display:block;"
                                                BorderWidth="2px" BorderColor="White" Text=" "
                                                runat="server" BorderStyle="Inset" meta:resourcekey="lblCreateResource1"></asp:Label>
                                            
                                        </td>
                                        <td id="uofPhoto"  runat="server">
                                            <asp:HyperLink ID="hylinkThumbnail" runat="server" Target="_blank"></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                                <table cellspacing="0" cellpadding="0" style=" border:0; vertical-align:top;" runat="server" id="mobileCreate" visible="false">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtCreate_M" runat="server" Width="95%" style="margin-left:15px"  oninput="javascript:SetText(this);"  onpropertychange="javascript:SetText(this);"></asp:TextBox>        
                                        </td>
                                    </tr>
                                    <tr id="mobilePhoto" runat="server">
                                        <td>
                                            <div  style="margin-left:25px"">
                                                <asp:HyperLink ID="hylinkThumbnail_M" runat="server" Target="_blank" isMNext="true"></asp:HyperLink>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="hiddenChoiceAnswerOptionGuid" runat="server" />
                                <asp:HiddenField ID="hiddenChoiceScore" runat="server" />
                                <asp:HiddenField ID="hiddenIsOther" runat="server" />
                                <asp:HiddenField ID="hiddenCreateTextBox" runat="server" />
                                <asp:HiddenField ID="hiddenCreateTextBoxText" runat="server" />
                            </ItemTemplate>
                        </asp:DataList>
                    </asp:Panel>
                    <asp:Panel ID="pnlText" runat="server" Style="overflow-x: hidden; text-align:left;" meta:resourcekey="pnlTextResource1">
                        <asp:TextBox ID="txtAnswer" runat="server" meta:resourcekey="txtAnswerResource1" Width="98%"></asp:TextBox>
                        <asp:Label ID="lblAnswer" BackColor="White"
                            BorderWidth="2px" BorderColor="White" BorderStyle="Inset" runat="server" 
                            meta:resourcekey="lblAnswerResource1"></asp:Label>
                        <telerik:RadDatePicker ID="rdp_Answer" Runat="server" EnableTheming="True"></telerik:RadDatePicker>
                    </asp:Panel>
                    <asp:HiddenField ID="hiddenAllowModify" Value="true" runat="server" />
                    <asp:HiddenField ID="hiddenItemGuid" runat="server" />
                    <asp:HiddenField ID="hiddenItemType" runat="server" />
                    <asp:HiddenField ID="hiddenIsRequired" runat="server" />
                    <asp:HiddenField ID="hiddenTextAnswerOptionGuid" runat="server" />
                    <asp:HiddenField ID="hiddenTextScore" runat="server" />
                    <asp:HiddenField ID="hiddenAllowFill" Value="false" runat="server" />
                    <asp:HiddenField ID="hiddenMaxAnsCount" Value="0" runat="server" />
                    <asp:HiddenField ID="hidIsMobile" runat="server" />
                    <asp:HiddenField ID="hiddenSCAnsOpt" runat="server" />
                    <asp:HiddenField ID="hiddenAllowQueryItemDetail" Value="false" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
    <tr id="memoTR" runat="server">
        <td style="white-space:nowrap;">
            <asp:Label ID="lblDescriptionTitle" runat="server" Style="vertical-align: top;" Text="備註:" meta:resourcekey="lblDescriptionTitleResource1"></asp:Label>&nbsp;&nbsp;
            <asp:Label ID="lblDescription" runat="server" Style="word-wrap: break-word; white-space:normal; vertical-align: top;" meta:resourcekey="lblDescriptionResource1"></asp:Label>
        </td>
    </tr>
</table>
<asp:Label ID="lblMaxAnsCountText" Style="display: none;" runat="server" Text="最多可勾選的數量為:" meta:resourcekey="lblMaxAnsCountTextResource1"></asp:Label>
<asp:Label ID="lblType" runat="server" Text="修改題目" Visible="False" meta:resourcekey="lblTypeResource1"></asp:Label>
