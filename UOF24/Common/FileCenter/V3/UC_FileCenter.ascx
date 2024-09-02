<%@ Control Language="C#" AutoEventWireup="true" Inherits="Common_FileCenterV3_UC_FileCenter" Codebehind="UC_FileCenter.ascx.cs" %>

<style>    
    .uploaderv3 .enablebg { background: transparent url("<%=ButtonBgImageUrl%>") no-repeat center top; }
    .uploaderv3 .enablebgblue { background: transparent url("<%=ButtonBgBlueImageUrl%>") no-repeat center top; }
    .uploaderv3 .disablebg { background: transparent url("<%=ButtonBgDisableImageUrl%>") no-repeat center top; }
    .noDownload { display:none    }
    <asp:Literal runat="server" ID="litCss"></asp:Literal>
</style>

<asp:Label ID="lblLendSpaceMsg" runat="server" Text="租用空間已達上限，不可上傳檔案" ForeColor="Red" Visible="false" meta:resourcekey="lblLendSpaceMsgResource1"></asp:Label>
<div id="<%=ClientID %>" class="<%=ClientID %>"> 
    <telerik:RadComboBox runat="server" ID="boxGroupUof" Skin="Metro"
                         AutoPostBack="True" Visible="False"
                         OnSelectedIndexChanged="boxGroupUof_SelectedIndexChanged"  meta:resourcekey="boxGroupUofResource1" />

    <div id="fileUploadControl" runat="server" class="uploaderv3">
        <telerik:RadAsyncUpload runat="server" ID="DefaultMasterRadAsyncUpload1"
                                Skin="Metro" Visible="False"
                                EnableInlineProgress="True"
                                MultipleFileSelection="Automatic"
                                ManualUpload="False"
                                DisableChunkUpload="False"                                 
                                OnClientValidationFailed="uploadv3_ClientValidationFailed"
                                OnClientFileUploadFailed="uploadv3_ClientFileUploadFailed" Culture="zh-TW" meta:resourcekey="DefaultMasterRadAsyncUpload1Resource1" />
        <table>
            <tr>
                <td runat="server" id="selectButtonTd">
                    <div class="button enable enablebg" id="uploadv3_select_<%=ClientID %>" style="margin-right: 5px; float: left">
                        <asp:Label ID="lblSelect" runat="server" Text="選擇檔案" meta:resourcekey="lblSelectResource1"></asp:Label>
                    </div>      
                    <div class="button enable enablebgblue" id="uploadv3_scan_<%=ClientID %>" style="margin-right: 5px; display: none; float: left">
                        <asp:Label ID="lblScan" runat="server" Text="掃描文件" meta:resourcekey="lblScanResource1"></asp:Label>                   
                    </div>                                                                              
                </td>
                <td>
                    <div style="margin-left: 5px;">
                        <asp:Label ID="lblTypeDesc" runat="server" Visible="False" meta:resourcekey="lblTypeDescResource1"></asp:Label>
                    </div>                    
                </td>
                <td>
                    <div id="uploadv3_more" runat="server" style="margin-top: 4px; margin-left:1px; margin-right: 5px;  cursor: pointer;">
                        <img src="<%=MoreImageUrl %>" alt="more" title="more"/>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div id="listViewBorder" runat="server">
        <telerik:RadListView ID="RadListView1" runat="server" ItemPlaceholderID="ItemPlaceholderContainer" meta:resourcekey="RadListView1Resource1">
            <LayoutTemplate>
                <div runat="server" id="itemContainer">
                    <asp:PlaceHolder ID="ItemPlaceholderContainer" runat="server"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="uploaderv3item" style="max-width: 99%;" id='<%#Eval("Id") %>'>
                    <div style="float: left; margin-bottom: 9px; margin-right: 3px">
                        <img src='<%#:Eval("IconUrl") %>' alt="" title="" />
                    </div>                                       
                    <div style="overflow:hidden; text-overflow:ellipsis; float: left; margin-bottom: 3px;">
                        <a href='<%#Eval("DownloadUrl") %>' onclick='<%#Eval("TagA_OnClientClick") %>' <%#Eval("Hidden")%> target='_blank'><%#Eval("Name")%></a>
                        <%#Eval("NameForHidden")%>(<%#Eval("FormattedLength")%>)
                    </div>   
                    <div class="uploadernamelink">
                        <%#Eval("UploaderNameLink")%>                        
                    </div> 
                    <div style="float: left; margin-bottom: 9px; margin-left: 3px">
                        <img style="display: none;" class="uploadercopyfilelink" src='<%=LinkImageUrl%>' alt="Show file link" title="Show file link"
                            onclick="popupLink('<%#:Eval("Id") %>')"/>
                        <img style="cursor: pointer; display: none;" src='<%=RemoveImageUrl%>' alt='<%#Eval("RemoveImageAlt") %>' title='<%#Eval("RemoveImageAlt") %>'  
                            onclick="RemoveUploadedFile_<%=ClientID %>('<%#Eval("Id") %>', '<%#Eval("Name2") %>')"/>
                    </div>                                                                                                              
                </div>                                                                   
            </ItemTemplate>
            <ClientSettings>
                <DataBinding>
                    <ItemTemplate>
                    <div class="uploaderv3item" style="max-width: 99%;" id="#= Id #">
                        <div style="float: left; margin-right: 3px; margin-bottom: 5px;">
                            <img src="#= IconUrl #" alt="" title="" />
                        </div>                         
                        <div class='#= (isDownloadable === "True") ? '': 'noDownload' #' style="overflow:hidden; text-overflow:ellipsis; float: left;">
                            <a href='#= DownloadUrl #' onclick='#= tagA_OnClick #' target='_blank' >#= Name #</a>  
                            (#= formatSize #)                        
                        </div>
                        <div class='#= (isDownloadable === "True") ? 'noDownload': '' #' style="overflow:hidden; text-overflow:ellipsis; float: left;">
                            <label style="cursor:text">#= Name #</label>
                            (#= formatSize #)                        
                        </div>
                        <div class="uploadernamelink">
                            #= uploaderNameLink #                                                                                 
                        </div>
                        <div style="float: left; margin-left: 3px; margin-bottom: 5px;">
                            <img style="display: none;" class="uploadercopyfilelink" src="#= linkimg #" onclick="#= func2 #" alt="Show file link" title="Show file link"/>
                            <img style="cursor: pointer;" src="#= removeimg #" onclick="#= func #" alt="#= removeAlt #" title="#= removeAlt #"/>
                        </div>                                          
                    </div>
                    </ItemTemplate>
                </DataBinding>
                <ClientEvents></ClientEvents>
            </ClientSettings>
        </telerik:RadListView>
    </div>
</div>

<telerik:RadNotification ID="notification" runat="server"
                         TitleIcon="~/Common/Images/Icon/icon_m154.gif"
                         Title="Information" 
                         Position="Center"                                 
                         Width="560"
                         Height="120"
                         EnableRoundedCorners="True"
                         EnableShadow="True" AutoCloseDelay="3000" meta:resourcekey="notificationResource1" />

<telerik:RadNotification ID="notifiLink" runat="server"
                         TitleIcon="~/Common/Images/Icon/icon_m154.gif"                             
                         Title="File link" 
                         Position="TopLeft"                                 
                         Width="500"
                         Height="120"
                         EnableRoundedCorners="True"
                         EnableShadow="True"
                         AutoCloseDelay="0" meta:resourcekey="notifiLinkResource1" />

<asp:HiddenField ID="hdnEnabled" runat="server" value="1" />
<asp:HiddenField ID="hdnEditable" runat="server" value="1" />    
<asp:HiddenField ID="hdnExt" runat="server" />
<asp:HiddenField ID="hdnSizeKb" runat="server" />
<asp:HiddenField ID="hdnTotalSizeKb" runat="server" />
<asp:HiddenField ID="hdnMultipleSelection" runat="server" Value="1" />
<asp:HiddenField ID="hdnSubFolder" runat="server" />
<asp:HiddenField ID="hdnModuleName" runat="server" />
<asp:HiddenField ID="hdnType" runat="server" />
<asp:HiddenField ID="hdnFileGroupId" runat="server" />
<asp:HiddenField ID="hdnPermanentFiles" runat="server" Value="[]" />
<asp:HiddenField ID="hdnUploadedFiles" runat="server" Value="[]" />
<asp:HiddenField ID="hdnRemovedFiles" runat="server" Value="[]" />
<asp:HiddenField ID="hdnClientFileUploadedCallback" runat="server" />     
<asp:HiddenField ID="hdnClientFilesUploadedCallback" runat="server" />     
<asp:HiddenField ID="hdnClientRemovedCallback" runat="server" />
<asp:HiddenField ID="hdnPathAppend" runat="server" />
<asp:HiddenField ID="hdnUploaderNameLink" runat="server" />
<asp:HiddenField ID="hdnFileIcons" runat="server" />
<asp:HiddenField ID="hdnFileIconPath" runat="server" />
<asp:HiddenField ID="hdnListType" runat="server" />
<asp:HiddenField ID="hdnAjaxSupported" runat="server" value="0" />
<asp:HiddenField ID="hdnUploadEnabled" runat="server" value="1" />
<asp:HiddenField ID="hdnOnClientUploadedCalledId" runat="server" Value="[]" />
<asp:HiddenField ID="hdnProxyIndex" runat="server" />
<asp:HiddenField ID="hdnDownloadHandler" runat="server" />
<asp:HiddenField ID="hdnReset" runat="server" />
<asp:HiddenField ID="hdnIsMobile" runat="server" Value="0" />
<asp:HiddenField ID="hdnScannerOcrDisabled" runat="server" Value="0" />
<asp:HiddenField ID="hdnScannerDisabled" runat="server" Value="0" />
<asp:HiddenField ID="hdnScannerSupported" runat="server" Value="0" />
<asp:HiddenField ID="hdnScannedJson" runat="server" />
<asp:HiddenField ID="hdnDownloadHandlerString" runat="server" />
<asp:HiddenField ID="hdnFileControlHandlerString" runat="server" />
<asp:HiddenField ID="hdnScannerClicked" runat="server" />
<asp:HiddenField ID="hdnDownloadEnabled" runat="server" value="1" />
<asp:HiddenField ID="hdnFileProcessEnabled" runat="server" value="0" />
<asp:HiddenField ID="hdnFileCheckEnabled" runat="server" value="0" />
<asp:HiddenField ID="hdnIsIndividualFileGroup" runat="server" value="0" />
<asp:HiddenField ID="hdnMaxFileCount" runat="server" value="0" />


<asp:Label ID="lblAllowedTypeDesc" runat="server" Text="允許檔案類型：" Visible="False" meta:resourcekey="lblAllowedTypeDescResource1"></asp:Label>
<asp:Label ID="lblFileInProxyMessage" runat="server" Text="檔案[{1}] 由 proxy[{0}] 同步回UOF中 (開始時間 {2})" Visible="False" meta:resourcekey="lblFileInProxyMessageResource1"></asp:Label>
<asp:Label ID="lblConfirmRemove" runat="server" Text="確認移除檔案 {0}?" Visible="False" meta:resourcekey="lblConfirmRemoveResource1"></asp:Label>
<asp:Label ID="lblLocal" runat="server" Text="本地端" Visible="False" meta:resourcekey="lblLocalResource1" />
<asp:Label ID="lblScannerNotConnected" runat="server" Text="未偵測到掃瞄器，請確認掃瞄器是否開啟或檢查是否已進入省電模式，並確認驅動程式已啟動" Visible="False"/> 


<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        //<![CDATA[
        var fcv3_<%=ClientID %> = fcv3_<%=ClientID %> || {};
        fcv3_<%=ClientID %>._beginRequest = false;
        
        Type.registerNamespace("Ede.Uof.Controls");

        // Constructor
        Ede.Uof.Controls.FileCenter_<%=ClientID%> = function (element) {
            Ede.Uof.Controls.FileCenter_<%=ClientID%>.initializeBase(this, [element]);
        };
        Ede.Uof.Controls.FileCenter_<%=ClientID%>.prototype = {

            // Release resources before control is disposed.
            dispose: function () {
                Ede.Uof.Controls.FileCenter_<%=ClientID%>.callBaseMethod(this, 'dispose');
            },

            initialize: function () {
                Ede.Uof.Controls.FileCenter_<%=ClientID%>.callBaseMethod(this, 'initialize');
            },

            add_uploaded: function (id, name, path, length, type, url, proxy, ext, iw, ih, groupUofId) {
                var files = JSON.parse($('#<%=hdnUploadedFiles.ClientID%>').val());
                name = name.replace(/\'/g, '');
                var downUrlString = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode( DownloadHandlerString ,true)%>")
                var downloadUrl = String.format(downUrlString, url, id, encodeURIComponent(path.replace(/\!/g, '\\')), encodeURIComponent(type), encodeURIComponent(name)); //escape(name)               
                var iconUrl = String.format("{0}/{1}.gif", $("#<%=hdnFileIconPath.ClientID%>").val(), $("#<%=hdnFileIcons.ClientID%>").val().indexOf(ext)!=-1 ? ext : "file");
                files[files.length] = {
                    'Id': id,
                    'Name': name,
                    'Folder': path.replace(/\!/g, '\\'),
                    'Length': length,
                    'Type': type,
                    'formatSize': $uof.tool.formatFileSize(length),
                    'removeimg': '<%=RemoveImageUrl%>',
                    'linkimg': '<%=LinkImageUrl%>',                    
                    'func': String.format("RemoveUploadedFile_<%=ClientID %>('{0}','{1}')", id, name.replace(/\'/g, "")),
                    'func2': String.format("popupLink('{0}')", id, downloadUrl),
                    'tagA_OnClick': '',
                    'DownloadUrl': downloadUrl,
                    'IconUrl': iconUrl,
                    'ImageWidth': iw,
                    'ImageHeight': ih,
                    'uploaderNameLink': $("#<%=hdnUploaderNameLink.ClientID%>").val(),
                    'removeAlt': 'Remove',
                    'GroupUofId': groupUofId,
                    'isDownloadable': '<%=DownloadEnabled%>'
                };
                $('#<%=hdnUploadedFiles.ClientID%>').val(JSON.stringify(files));
                $('#<%=hdnProxyIndex.ClientID%>').val(proxy);
                
                // from permanent
                var permanentFiles = JSON.parse($('#<%=hdnPermanentFiles.ClientID%>').val());
                var list = [];
                list.push.apply(list, permanentFiles);
                list.push.apply(list, files);
                // binding to radlistview
                var listView1 = window.$find("<%= RadListView1.ClientID %>");
                listView1.set_dataSource(list);
                listView1.dataBind();

                resetSelect_<%=ClientID %>();
                resetListItem_<%=ClientID %>();
                $("#<%=ClientID %> .uploaderv3item > div > img[alt='none']").hide();
                if ($.isFunction(eval($("#<%=hdnClientFileUploadedCallback.ClientID %>").val()))) {
                    // postback will reload, saved called id, avoid re-call multi-times
                    var calledIds = JSON.parse($('#<%=hdnOnClientUploadedCalledId.ClientID%>').val());
                    if ($.inArray(id, calledIds) === -1) {
                        eval(String.format("{0}('{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}');", $("#<%=hdnClientFileUploadedCallback.ClientID %>").val(), id, name.replace(/\'/g, ""), path, length, type, downloadUrl, iw, ih));
                    }
                    calledIds[calledIds.length] = id;
                    $('#<%=hdnOnClientUploadedCalledId.ClientID%>').val(JSON.stringify(calledIds));
                }
                
                if ('<%=MoreButtonVisible%>'.toLowerCase() === 'true') {
                    $("#<%=uploadv3_more.ClientID %>").show();
                }
            },

            get_isValidLength: function (length) {
                // check single limit => for Album
                var singleLimit = $("#<%=hdnSizeKb.ClientID%>").val();
                if ($.isNumeric(singleLimit)) {
                    if (length > (singleLimit * 1024)) {return false;}
                }

                // check total limie => for Briefcase
                var totalLimit = $("#<%=hdnTotalSizeKb.ClientID%>").val();
                if (totalLimit === '' || totalLimit === 0) { return true; }
                
                $.each(JSON.parse($('#<%=hdnUploadedFiles.ClientID%>').val()), function(index, value) {
                    length += parseInt(value.Length);
                });

                return length <= (totalLimit * 1024);
            },

            get_clientId:function() { return "<%=ClientID%>"; },

            get_fileGroupId: function() { return $('#<%=hdnFileGroupId.ClientID %>').val(); },

            get_moduleName: function() { return $('#<%=hdnModuleName.ClientID %>').val(); },

            get_subFolder: function () { return $('#<%=hdnSubFolder.ClientID %>').val(); },

            get_fileProcessEnabled: function () { return $('#<%=hdnFileProcessEnabled.ClientID %>').val(); },

            get_fileCheckEnabled: function() { return $('#<%=hdnFileCheckEnabled.ClientID %>').val(); },
            
            get_editable: function() { return $("#<%=hdnEditable.ClientID%>").val() != "0"; },

            set_editable: function (val) { setEditable_<%=ClientID %>(val); },

            get_enabled: function () { return $("#<%=hdnEnabled.ClientID%>").val() != "0"; },

            set_enabled: function (val) { setEnabled_<%=ClientID %>(val); },

            set_onClientUploaded: function (val) { $("#<%=hdnClientFileUploadedCallback.ClientID %>").val(val); },

            set_onClientFilesUploaded: function (val) { $("#<%=hdnClientFilesUploadedCallback.ClientID %>").val(val); },    
            
            set_onClientRemoved: function (val) { $("#<%=hdnClientRemovedCallback.ClientID %>").val(val); },  
            
            set_returnValue: function (val) { $uof.dialog.set_returnValue(val); },

            get_selectedGroupUofId:function() {
                if ('<%=GroupEnabled%>'.toLowerCase() === 'true') {
                    var combo = $find("<%= boxGroupUof.ClientID %>");
                    return combo.get_value();
                }
                return null;
            },

            remove_file: function(id) {
                if ($("#<%=hdnEditable.ClientID%>").val() != "0" && $("#<%=hdnEnabled.ClientID%>").val() != "0")
                    RemoveUploadedFile_<%=ClientID %>(id, '', false);
            },

            select_file: function() {
                if ($("#uploadv3_select_<%=ClientID %>").prop('disabled')) return;
                if ($("#<%=hdnEditable.ClientID%>").val() != "0" && $("#<%=hdnEnabled.ClientID%>").val() != "0") {
                    var ext = $("#<%=hdnExt.ClientID%>").val();
                    if (fcv3_<%=ClientID %>._isDialog) {
                        parent.set_maxFileCount($("#<%=hdnMaxFileCount.ClientID%>").val());
                        parent.select_file($find("<%=ClientID %>"), ext);
                    } else {
                        var upload = $find("<%= DefaultMasterRadAsyncUpload1.ClientID %>");
                        upload.set_allowedFileExtensions(ext);
                        $telerik.$('.ruFileInput').each(function (i, val) {
                            if (val.id.indexOf("<%=ClientID %>") == 0) {
                                val.click(); // dialog select file 
                                return false; // break
                            }
                        });
                    }
                }
            },

            get_uploaded: function() {
                var files = JSON.parse($('#<%=hdnUploadedFiles.ClientID%>').val());
                if (files.length > 0) {
                    $.each(files, function (i, val) {
                        delete files[i].formatSize;
                        delete files[i].removeimg;
                        delete files[i].linkimg;
                        delete files[i].linkCssDisplay;
                        delete files[i].nameWidth;
                        delete files[i].func;
                        delete files[i].func2;
                        delete files[i].handler;
                    });
                }
                return files;
            },

            get_list:function() {
                var files = JSON.parse($('#<%=hdnUploadedFiles.ClientID%>').val());
                var permanentFiles = JSON.parse($('#<%=hdnPermanentFiles.ClientID%>').val());
                var list = [];
                list.push.apply(list, permanentFiles);
                list.push.apply(list, files);
                return list;
            },

            set_list:function(list, clientId) {
                if (clientId !== undefined && clientId !== '') {
                    $.each(list, function(i, val) {
                        val.func = val.func.replace(clientId, '<%=ClientID %>');
                    });
                }
                var listView1 = window.$find("<%= RadListView1.ClientID %>");
                listView1.set_dataSource(list);
                listView1.dataBind();
                resetSelect_<%=ClientID %>();
                resetListItem_<%=ClientID %>();
            },

            get_count: function () {
                var uploadedCnt = 0, permanentCnt = 0;
                try {
                    permanentCnt = JSON.parse($('#<%=hdnPermanentFiles.ClientID%>').val()).length;
                } catch (e) {
                }
                try {
                    uploadedCnt = JSON.parse($('#<%=hdnUploadedFiles.ClientID%>').val()).length;
                } catch (e) {
                }
                return uploadedCnt + permanentCnt;
            },

            get_errorCount:function() {
                if ($uof.dialog.isInRadWindow()) {
                    return parent.get_errorCount();
                }
                return $("#<%= DefaultMasterRadAsyncUpload1.ClientID %>").find(".ruUploadFailure").length;
            },

            on_filesUploaded:function() {
                if ($.isFunction(eval($("#<%=hdnClientFilesUploadedCallback.ClientID %>").val()))) {
                    eval(String.format("{0}('{1}');", $("#<%=hdnClientFilesUploadedCallback.ClientID %>").val(), $('#<%=hdnProxyIndex.ClientID%>').val()));
                }
            },

            reset: function () {
                $("#<%=hdnFileGroupId.ClientID%>").val($uof.tool.getNewGuid());
                $("#<%=hdnPermanentFiles.ClientID%>").val("[]");
                $("#<%=hdnUploadedFiles.ClientID%>").val("[]");
                $("#<%=hdnRemovedFiles.ClientID%>").val("[]");
                if (fcv3_<%=ClientID %>._isDialog) {
                    parent.clear_uploaded("<%=ClientID %>");
                }
                var listView1 = window.$find("<%= RadListView1.ClientID %>");
                listView1.set_dataSource([]);
                listView1.dataBind();
            }
        };
        Ede.Uof.Controls.FileCenter_<%=ClientID%>.registerClass('Ede.Uof.Controls.FileCenter_<%=ClientID%>', Sys.UI.Control);

        // Since this script is not loaded by System.Web.Handlers.ScriptResourceHandler
        // invoke Sys.Application.notifyScriptLoaded to notify ScriptManager 
        // that this is the end of the script.
        if (typeof (Sys) !== 'undefined') {
            Sys.Application.notifyScriptLoaded();
        }

        Sys.Application.add_init(function() {
            $create(Ede.Uof.Controls.FileCenter_<%=ClientID%>, null, null, null, $get('<%= ClientID %>'));
            fcv3_<%=ClientID %>._isDialog = $uof.dialog.isInRadWindow();
        });

        
        fcv3_<%=ClientID %>.OnSelectButtonClientClick = function () {   
            var ext = $("#<%=hdnExt.ClientID%>").val();
            if (fcv3_<%=ClientID %>._isDialog) {
                parent.set_maxFileCount($("#<%=hdnMaxFileCount.ClientID%>").val());
                parent.select_file($find("<%=ClientID %>"), ext);
            } else {
                var upload = $find("<%= DefaultMasterRadAsyncUpload1.ClientID %>");
                upload.set_allowedFileExtensions(ext);
                $telerik.$('.ruFileInput').each(function(i, val) {
                    if (val.id.indexOf("<%=ClientID %>") == 0) {
                        val.click(); // dialog select file 
                        return false; // break
                    }
                });
            }
        };

        fcv3_<%=ClientID %>.OnScanButtonClientClicked = function() {
            DetectPlustekScanner_<%=ClientID %>();
        };

        // ajax
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function (s, a) { fcv3_<%=ClientID %>._beginRequest = true; });
        
        Sys.Application.add_load(function () {
            // if AJAX, re-call $create
            var ajaxSupported = $("#<%=hdnAjaxSupported.ClientID%>").val() === "1";
            if ((ajaxSupported || $("#uploadv3_select_<%=ClientID %>").is(':visible')) && fcv3_<%=ClientID %>._beginRequest === true) {
                $create(Ede.Uof.Controls.FileCenter_<%=ClientID%>, null, null, null, $get('<%= ClientID %>'));                
            }
            fcv3_<%=ClientID %>._beginRequest = false;

            // postback
            if (fcv3_<%=ClientID %>._isDialog) {
                var source = $find("<%=ClientID %>");
                if (source !== null) {
                    parent.add_source(source);
                    if ($("#<%=hdnReset.ClientID%>").val() === "1") {
                        parent.clear_uploaded("<%=ClientID %>");
                    }
                    var files = parent.get_uploaded("<%=ClientID %>");
                    if (files) {
                        $("#<%=hdnUploadedFiles.ClientID%>").val("[]");
                        $(JSON.parse($('#<%=hdnRemovedFiles.ClientID%>').val())).each(function() {
                            var removedId = this;
                            files = $.grep(files, function(value) {return value.FileId !== removedId.toString(); });
                        });
                        $(JSON.parse($('#<%=hdnPermanentFiles.ClientID%>').val())).each(function () {
                            var permanentId = this.Id;
                            files = $.grep(files, function (value) { return value.FileId !== permanentId.toString(); });
                        });
                        $(files).each(function() {
                            source.add_uploaded(this.FileId,
                                                this.FileName,
                                                this.Folder,
                                                this.ContentLength,
                                                this.ContentType,
                                                this.DownloadHandler,
                                                this.ProxyIndex,
                                                this.Ext,
                                                this.ImageWidth,
                                                this.ImageHeight,
                                                this.GroupUofId);
                        });
                    }
                }
            }
            $("#<%=hdnReset.ClientID%>").val("");
            var selectbtn = $("#uploadv3_select_<%=ClientID %>");
            selectbtn.unbind("click");
            if (selectbtn.prop('disabled') !== true) {
                selectbtn.on("click", fcv3_<%=ClientID %>.OnSelectButtonClientClick);
            }

            var scanbtn = $("#uploadv3_scan_<%=ClientID %>");
            scanbtn.unbind("click");
            if (scanbtn.prop('disabled') !== true) {
                scanbtn.on("click", fcv3_<%=ClientID %>.OnScanButtonClientClicked);
            }

            setEditable_<%=ClientID %>($("#<%=hdnEditable.ClientID%>").val() != "0");
            setEnabled_<%=ClientID %>($("#<%=hdnEnabled.ClientID%>").val() != "0");
            resetListItem_<%=ClientID %>();
            
            if ('<%=GroupEnabled%>'.toLowerCase() === 'true') {
                if ($(".uploaderv3").length > 1) {
                    alert('Allowed only one file center v3 when GroupUof enabled');
                    $('#<%=ClientID%>').find(".uploaderv3").hide();
                }
            }            
        });

        function RemoveUploadedFile_<%=ClientID %>(id, name, conf) {
            if (conf !== false) {                
                if (!confirm(String.format("<%=ConfirmRemoveText%>", name))) {
                    return;
                }
            }
            var permanents = JSON.parse($('#<%=hdnPermanentFiles.ClientID%>').val());
            var total = $('#<%=hdnTotalSizeKb.ClientID%>').val();
            if (total != '') {
                $.each(permanents, function (i,val) {                    
                    if (val.Id == id) {                        
                        $('#<%=hdnTotalSizeKb.ClientID%>').val(Math.ceil(total) + Math.ceil(val.Length / 1024));
                    }
                });
            }
            permanents = $.grep(permanents, function (value) { return value.Id != id; });
            var files = $.grep(JSON.parse($('#<%=hdnUploadedFiles.ClientID%>').val()), function(value) { return value.Id != id; });
            $("#<%=hdnPermanentFiles.ClientID%>").val(JSON.stringify(permanents));
            $("#<%=hdnUploadedFiles.ClientID%>").val(JSON.stringify(files));
            var removeds = JSON.parse($('#<%=hdnRemovedFiles.ClientID%>').val());
            removeds[removeds.length] = id.toLowerCase();
            $('#<%=hdnRemovedFiles.ClientID%>').val(JSON.stringify(removeds));
            $("#" + id).remove();
            $("#" + id).remove();
            resetSelect_<%=ClientID %>();
            if ($.isFunction(eval($("#<%=hdnClientRemovedCallback.ClientID %>").val()))) {
                eval(String.format("{0}('{1}');", $("#<%=hdnClientRemovedCallback.ClientID %>").val(), id));
            }
            if ((permanents.length + files.length) === 0) {
                $("#<%=uploadv3_more.ClientID %>").hide();
            }
        }

        function resetSelect_<%=ClientID %>() {
            var selectbtn = $("#uploadv3_select_<%=ClientID %>");                
            if ($("#<%=hdnMultipleSelection.ClientID%>").val() === "0") {
                var permanentFiles = JSON.parse($('#<%=hdnPermanentFiles.ClientID%>').val());
                var files = JSON.parse($('#<%=hdnUploadedFiles.ClientID%>').val());
                var list = [];
                list.push.apply(list, permanentFiles);
                list.push.apply(list, files);
                selectbtn.prop('disabled', list.length > 0);
                selectbtn.unbind("click");
                if (list.length > 0) {
                    selectbtn.removeClass("button enable enablebg").addClass("button disable disablebg");                    
                } else {
                    selectbtn.removeClass("button disable disablebg").addClass("button enable enablebg");
                    selectbtn.on("click", fcv3_<%=ClientID %>.OnSelectButtonClientClick);
                }

                var scanbtn = $("#uploadv3_scan_<%=ClientID %>");                            
                scanbtn.prop('disabled', list.length > 0);
                scanbtn.unbind("click");
                if (list.length > 0) {
                    scanbtn.removeClass("button enable enablebg").addClass("button disable disablebg");                    
                } else {
                    scanbtn.removeClass("button disable disablebg").addClass("button enable enablebg");
                    scanbtn.on("click", fcv3_<%=ClientID %>.OnScanButtonClientClicked);
                }
            }            
        }

        function resetListItem_<%=ClientID %>() {
            if ($("#<%=hdnListType.ClientID%>").val() === "more") {
                $("#<%=ClientID%>").find(".uploadernamelink").show("fast");
            }
            if ('<%=FileLinkEnabled%>'.toLowerCase() === 'true') {
                $("#<%=ClientID%>").find(".uploadercopyfilelink").show("fast");
            }            
        }

        function setEditable_<%=ClientID %>(editable) {
            $("#<%=hdnEditable.ClientID%>").val(editable ? "1" : "0");
            var removeImg = $("#<%=ClientID %> .uploaderv3item > div > img[alt='Remove']");
            var selectBtn = $("#uploadv3_select_<%=ClientID %>");
            var scanbtn = $("#uploadv3_scan_<%=ClientID %>");     
            var $moreIcon = $("#<%=uploadv3_more.ClientID %>");
            if ('<%=MoreButtonVisible%>'.toLowerCase() === 'true') {
                if (Ede.Uof.Controls.FileCenter_<%=ClientID%>.prototype.get_count() == 0) {
                    $moreIcon.hide();
                } else {
                    $moreIcon.show();                    
                }
            }            
            if (editable) {
                $("#<%=lblLendSpaceMsg.ClientID%>").show();
                selectBtn.show();                
                removeImg.show();
            } else {
                $("#<%=lblLendSpaceMsg.ClientID%>").hide();
                selectBtn.hide();
                scanbtn.hide();
                removeImg.hide();
                // if not editable and more icon invisible, set table invisible
                if ('<%=MoreButtonVisible%>'.toLowerCase() !== 'true') {
                    $moreIcon.parent().parent().hide();
                }
            }
            $("#<%=ClientID %> .uploaderv3item > div > img[alt='none']").hide();
        }

        function setEnabled_<%=ClientID %>(enabled) {
            $("#<%=hdnEnabled.ClientID%>").val(enabled ? "1" : "0");
            if (enabled) {
                $("#<%=ClientID %>").unblock();
            } else {
                $("#<%=ClientID %>").block({
                    message: null,
                    overlayCSS: {
                        backgroundColor: '#FFFDFD',
                        opacity: 0.6,
                        cursor: 'default'
                    }
                });
            }
        }

        function popupLink(id) {           
            var $doc = $(document);
            var id_position = $("#" + id).position();
            var radnoti = $find("<%= notifiLink.ClientID %>");            
            var x = id_position.left, y = 36;
            if (($doc.height() - id_position.top - radnoti.get_height() - y) <= 0) {
                y = -126;
            }
            if (($doc.width() - id_position.left - radnoti.get_width()) <= 0) {
                x = $doc.width() - radnoti.get_width() - 25;
            }
            var text = String.format($uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(FileControlHandlerString,true)%>"), id);
            radnoti.set_offsetX(x);
            radnoti.set_offsetY(id_position.top + y);
            radnoti.set_text(text);
            radnoti.show();
        }

        function showProcessing(evt, proxy, name, time) {
            var radnoti = $find("<%= notification.ClientID %>");
            var str = String.format("<%=FileInProxyMessage%>", proxy, name, time);
            radnoti.set_text(str);
            radnoti.show();
            if (window.event) { //for IE
                window.event.cancelBubble = true;
            } else { //for Firefox
                evt.stopPropagation();
            }
            evt.returnValue = false;
            return false;
        }

        $(function() {
            if ($("#<%=hdnMultipleSelection.ClientID%>").val() === "0") {                
                resetSelect_<%=ClientID %>();
            }
        });
        //]]>
    </script>
</telerik:RadScriptBlock>

<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <script type="text/javascript">
        //<![CDATA[                                            
        function fcv3_ClientAdded_<%=ClientID %>(sender, args) {
            var upload1 = $find("<%= DefaultMasterRadAsyncUpload1.ClientID %>");
            // if cancel, remove row
            setTimeout(function() {
                $(".ruButton").on('click', function() {
                    if ($(this).val() === "Cancel") {
                        var index = $(".ruButton").index($(this));
                        $(this).parent().hide(300, function() { upload1.deleteFileInputAt(index); });
                    }
                });
            }, 500);
        }

        function uploadv3_ClientFileSelected_<%=ClientID %>(sender, args) {
            var upload = $find("<%= DefaultMasterRadAsyncUpload1.ClientID %>");
            var length = 0;
            $.each(args.get_fileInputField().files, function(i, val) {
                if (val.name == args.get_fileName()) {
                    length = val.size;
                }
            });
            var source = Ede.Uof.Controls.FileCenter_<%=ClientID%>.prototype;
            var act = source.get_isValidLength(length) ? '' : 'cancel';
            var v3Obj = {
                "fgid": $("#<%=hdnFileGroupId.ClientID%>").val(), 
                "module": $("#<%=hdnModuleName.ClientID%>").val(), 
                "sub": $("#<%=hdnSubFolder.ClientID%>").val(),
                "gid": source.get_selectedGroupUofId(),
                "act": act,
                "fp": source.get_fileProcessEnabled(),
                "fc": source.get_fileCheckEnabled()
            };
            var $row = $(args.get_row());
            var inputName = upload.getAdditionalFieldID("v3paras");
            var inputType = "hidden";
            var input = create_input(inputType, inputName, encodeURIComponent(JSON.stringify(v3Obj)));
            $row.append(input); // append fileGroupId to row
        }

        function uploadv3_ClientFileUploading_<%=ClientID %>(sender, args) {        
            var files = JSON.parse($('#<%=hdnUploadedFiles.ClientID%>').val());
            var maxFileCount = $('#<%=hdnMaxFileCount.ClientID%>').val();
            var $row = $(args.get_row());
            if (maxFileCount != 0 && $row.find("input[type='hidden']").length + files.length > maxFileCount) {
                args.set_cancel(true);

                var $item = $row.find(".ruUploadProgress");
                $item.addClass("ruUploadFailure");
                errorMessage = "Exceeded the maximum number of selected, the maximum number is " + maxFileCount + ".";
                $item.on("click", function() { alert(errorMessage); });
                $item.text("ERROR! " + $item.text());
                return;
            }

            var v3Obj = JSON.parse(decodeURIComponent($row.find("input[type='hidden']:last-child").val()));
            if (v3Obj.act == "cancel") {
                args.set_cancel(true);
                var $item = $row.find(".ruUploadProgress");
                $item.addClass("ruUploadFailure");
                $item.on("click", function () { alert(String.format("This file[{0}] exceeds the maximum allowed size.", args.get_fileName())); });
                $item.text("ERROR! " + $item.text());
                return;
            }
            // set request params
            args.set_queryStringParams({ "fgid": v3Obj.fgid, "module": encodeURIComponent(v3Obj.module), "sub": encodeURIComponent(v3Obj.sub), "gid": v3Obj.gid, "fp": v3Obj.fp, "fc": v3Obj.fc });
        }

        function uploadv3_ClientFileUploaded_<%=ClientID %>(sender, args) {                          
            var finfo = args.get_fileInfo();
            var msg = finfo.ErrorMessage;
            var $row = $(args.get_row());
            if (msg) {
                var $item = $row.find(".ruUploadSuccess");
                $item.removeClass("ruUploadSuccess").addClass("ruUploadFailure");
                $item.on("click", function () { alert(msg); });
                $item.text("ERROR! " + $item.text());
            } else {
                $row.hide(300).remove();
                var data = [finfo.FileId, finfo.FileName, finfo.FolderPath, $("#<%=hdnProxyIndex.ClientID%>").val(), finfo.RadUploadTempPath];
                $uof.pageMethod.asyncUc("Common/FileCenter/V3/UC_FileCenter.ascx", "DeleteFromRadTemp", data, function(response) {});
                var source = Ede.Uof.Controls.FileCenter_<%=ClientID%>.prototype;
                source.add_uploaded(finfo.FileId,
                                    args.get_fileName(),
                                    finfo.FolderPath.replace(/\\/g, '!'),
                                    finfo.ContentLength,
                                    finfo.ContentType,
                                    $("#<%=hdnDownloadHandler.ClientID%>").val(),
                                    $("#<%=hdnProxyIndex.ClientID%>").val(),
                                    finfo.FileNameExtension,
                                    finfo.ImageWidth,
                                    finfo.ImageHeight,
                                    finfo.GroupUofId);
            }
        }

        function uploadv3_ClientFilesUploaded_<%=ClientID %>(sender) {
            var source = Ede.Uof.Controls.FileCenter_<%=ClientID%>.prototype;
            source.on_filesUploaded();
        }

        if (Telerik.Web.UI.RadAsyncUpload && !$uof.dialog.isInRadWindow()) {
            // set custom http handler url
            Telerik.Web.UI.RadAsyncUpload.prototype._initializeUploadModule = function() {
                var $T = Telerik.Web.UI;
                <asp:Literal runat="server" ID="litHandler"></asp:Literal>
                if ($T.RadAsyncUpload.Modules.FileApi.isAvailable()) {
                    this._uploadModule = new $T.RadAsyncUpload.Modules.FileApi(this);
                } else {
                    this._uploadModule = new $T.RadAsyncUpload.Modules.IFrame(this, this._pageGUID);
                }
            };
        }
        //]]>
    </script>
</telerik:RadScriptBlock>

<telerik:RadScriptBlock ID="PlustekScriptBlock" runat="server">
    <script type="text/javascript">
        //<![CDATA[ 
        
        $(function() {
            if ('<%=ScannerSupported%>'.toLowerCase() === "true") {
                ShowScan_<%=ClientID %>();
            }
        });

        function DetectPlustekScanner_<%=ClientID %>() {
            if (typeof(PlustekScannerSdk) === "object") {
                if (PlustekScannerSdk.ScannerId === "") {
                    PlustekScannerSdk.Connecting(PlustekScannerSdk.GetDevicesListCommand, uploadv3_ScannerCallback_<%=ClientID %>);
                } else {
                    OpenScannerPage_<%=ClientID %>();
                }
            }                                                  
        }

        function ShowScan_<%=ClientID %>() {
            if ('<%=GroupEnabled%>'.toLowerCase() === 'true') {
                return; // Group Uof not supported
            }
            var allowedFileType = '<%=AllowedFileType%>'.toLowerCase();
            if (allowedFileType === 'all' || allowedFileType === 'pdf' || allowedFileType === 'image') {
                $("#uploadv3_scan_<%=ClientID %>").show();
            }
        }

        function OpenScannerPage_<%=ClientID %>() {
            var url = String.format('<%=ResolveUrl("~/common/filecenter/scanner.aspx?prd=plustek&func={0}&module={1}&sub={2}&proxy={3}&allowed={4}&scanner={5}&multi={6}&ocrd={7}")%>', 'uploadv3_ScanPageClosedCallback_<%=ClientID %>', $("#<%=hdnModuleName.ClientID%>").val(), $("#<%=hdnSubFolder.ClientID%>").val(), $("#<%=hdnProxyIndex.ClientID%>").val(), '<%=AllowedFileType%>'.toLowerCase(), PlustekScannerSdk.ScannerId, '<%=AllowedMultipleFileSelection%>'.toLowerCase(), '<%=ScannerOcrDisabled%>');
            $uof.window.open(url, 990, 675, false);
        }

        function uploadv3_ScannerCallback_<%=ClientID %>(obj) {
            if (obj.ret === 0) {
                uploadv3_ScannerConnectionSucceed_<%=ClientID %>(obj);
            } else {                
                var radnoti = $find("<%= notification.ClientID %>");
                radnoti.set_text("<%=ScannerNotConnected%>!");
                radnoti.show();
            }
        }

        function uploadv3_ScannerConnectionSucceed_<%=ClientID %>(obj) {
            if (obj.command === PlustekScannerSdk.GetDevicesListCommand) {
                if (PlustekScannerSdk.ScannerId !== "") {
                    OpenScannerPage_<%=ClientID %>();
                }
            }
        }

        function uploadv3_ScanPageClosedCallback_<%=ClientID %>(jsonStr) {   
            $('#<%=hdnScannerClicked.ClientID%>').val("1");
            var scanned = JSON.parse(jsonStr);
            if (scanned.length > 0) {                
                var fileLengthLimit = $('#<%=hdnSizeKb.ClientID%>').val();
                if (fileLengthLimit === '') {
                    fileLengthLimit = 0;
                }
                fileLengthLimit *= 1024;

                var source = Ede.Uof.Controls.FileCenter_<%=ClientID%>.prototype;
                var total = 0;
                var i;
                for (i = 0; i < scanned.length; i++) {
                    var length = parseInt(scanned[i].contentLength);
                    total += length;
                    if ((fileLengthLimit > 0 && length > fileLengthLimit) || !source.get_isValidLength(total)) {
                        alert("File exceeds the maximum allowed size.");
                        return;
                    }
                }
                for (i = 0; i < scanned.length; i++) {
                    var source = Ede.Uof.Controls.FileCenter_<%=ClientID%>.prototype;
                    source.add_uploaded(scanned[i].fileId,
                                        scanned[i].name,
                                        decodeURIComponent(scanned[i].targetPath).replace(/\\/g, '!'),
                                        scanned[i].contentLength,
                                        scanned[i].contentType,
                                        $("#<%=hdnDownloadHandler.ClientID%>").val(),
                                        $("#<%=hdnProxyIndex.ClientID%>").val(),
                                        scanned[i].ext);
                }
            }
        }

        //]]>
    </script>
</telerik:RadScriptBlock>