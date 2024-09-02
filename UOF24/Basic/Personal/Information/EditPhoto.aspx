<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_Information_EditPhoto" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="EditPhoto.aspx.cs" %>

<%@ Register Src="~/Common/ImageEditor/UC_ImageEditor.ascx" TagName="UC_ImageEditor" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .my-tour-overlay {
            display: none;
            background: #666;
            opacity: 0;
            z-index: 9997;
            min-height: 100%;
            height: 100%;
            position: fixed;
            width: 100%;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
        }

        .my-tour-highlight {
            border-color: rgba(255,0,0,0.5);
            border-width: 3px;
            border-style: solid;
            position: relative;
            border-radius: 4px;
            z-index: 9998;
        }

        .help_desk {
            position:absolute;
            top: 0px;
            right: 18px;
            border-radius: 3px;
            background: rgba(51, 51, 51, 0.8);
            color: #DDD;
            -webkit-box-shadow: rgba(0,0,0,0.2) 0 2px 4px 0;
            -moz-box-shadow: rgba(0,0,0,0.2) 0 2px 4px 0;
            box-shadow: rgba(0,0,0,0.2) 0 2px 4px 0;
            text-align: center;
            padding: 2px;
        }

            .help_desk a {
                color: #DDD;
            }
    </style>
    <link href="../../../Common/Style/jquery-tourbus.min.css" rel="stylesheet" />
    <script src="../../../Common/javascript/jQuery/plugin/jquery-tourbus.js"></script>
    <script src="../../../Common/javascript/jQuery/plugin/jquery.draggable.min.js"></script>
    
    <script type="text/javascript">


        function SaveImage(isCut) {
            var editor = $find("<%=UC_ImageEditor1.ClientID  %>");
            if(isCut === "true")
                editor.saveimage();
            else
                editor.saveorginalimage();

            if (Page_IsValid) {
                setTimeout(function () {
                    $uof.dialog.set_returnValue("<%=UC_ImageEditor1.CutImgFileGroupID  %>");
                    $uof.dialog.close();
                }, 700);
            }

            return false;
        }

        function ClientValidate(source, arguments) {
            var editor = $find("<%=UC_ImageEditor1.ClientID  %>");
                var isupload = editor.CheckUpload();
                if (isupload === "true") {
                    arguments.IsValid = true;
                } else {
                    arguments.IsValid = false;
                }
        }


            $(function () {
                

                var tour = $('#my-tour-id').tourbus({
                    leg: {
                        
                    },
                    onDepart: function(tourbus) {
                       
                    },
                    onStop: function(tourbus) {

                        $("#openTour").show();
                    },
                    onLegStart: function(leg, tourbus) {
                        if (leg.index!=0) {
                            leg.$target.addClass('my-tour-highlight');
                            $('.my-tour-overlay').show();
                        }
                    },
                    // called before switching _from_ a leg
                    onLegEnd: function(leg, tourbus) {
                        if (leg.index!=0) {
                            leg.$target.removeClass('my-tour-highlight');
                            $('.my-tour-overlay').hide();
                        }
                    }
                });



                $("#openTour").on("click", function() {
                    tour.trigger('depart.tourbus');
                    $(this).hide();
                });

                $(".help_desk").draggable({
                    axis: 'y'
                });
              
                
            });
      
    </script>

    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請上傳照片" Display="Dynamic" ClientValidationFunction="ClientValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <table>
        <tr>
            <td style="vertical-align: middle; align-content: center;">
                <uc1:UC_ImageEditor ID="UC_ImageEditor1" runat="server" Width="640" Height="480" ModuleName="PERSONAL" />

            </td>
        </tr>
    </table>
    <div class="help_desk" >
    <a href="#" id="openTour"> <img src="../../../Common/Images/Stickers/100.png" style="width: 48px;" /><br/>
            <asp:Literal ID="Literal4" runat="server" meta:resourcekey="Literal4Resource1" Text="需要幫忙嗎?"></asp:Literal></a>
    </div>
    
    <ol class='tourbus-legs' id='my-tour-id'>

        <li data-orientation='centered' data-width='500' >
            <h3>
                <asp:Literal ID="Literal1" runat="server" meta:resourcekey="Literal1Resource1"></asp:Literal></h3>
            <img src="../../../Common/Images/Stickers/100.png" style="float: left" />
            <p>
                <asp:Literal ID="Literal2" runat="server" meta:resourcekey="Literal2Resource1" Text="圖片裁剪功能可以讓您上傳的圖片等比例栽剪不變形,需要說明操作步驟嗎?"></asp:Literal>
            </p>
            <div style="clear: both">
                <a href='javascript:void(0);' style='float: right;' class='tourbus-next'>
                    <asp:Literal ID="Literal3" runat="server" meta:resourcekey="Literal3Resource1" Text="好的,我需要說明"></asp:Literal><span>&raquo;</span></a>
                <a href='javascript:void(0);' class='tourbus-stop'><span>&times;</span><asp:Literal ID="Literal22" runat="server" meta:resourcekey="Literal22Resource1" Text="不用了,我已瞭解"></asp:Literal></a>
            </div>
        </li>

        <li data-el='.rieToolBar .rtbItem:nth-child(4)' data-orientation='bottom' data-width='300' data-arrow="18px" >

            <img src="../../../Common/Images/Stickers/100.png" style="float: left" />
            <p>
                <asp:Literal ID="Literal16" runat="server" meta:resourcekey="Literal16Resource1" Text="點選這裡可以上傳檔案"></asp:Literal>
            </p>
            <div style="clear: both">
                <a href='javascript:void(0);' style='float: right;' class='tourbus-next'>
                    <asp:Literal ID="Literal10" runat="server" meta:resourcekey="Literal10Resource1" Text="下一步"></asp:Literal><span>&raquo;</span></a>
                <a href='javascript:void(0);' class='tourbus-stop'><span>&times;</span><asp:Literal ID="Literal5" runat="server" meta:resourcekey="Literal5Resource1" Text="結束"></asp:Literal></a>
            </div>
        </li>

        <li data-el='.rieToolBar .rtbItem:nth-child(3)' data-orientation='bottom' data-width='300' data-arrow="18px" >
            <img src="../../../Common/Images/Stickers/100.png" style="float: left" />
            <p>
                <asp:Literal ID="Literal17" runat="server" meta:resourcekey="Literal17Resource1" Text="點選這裡可以把圖片向左旋轉90度"></asp:Literal>
            </p>
            <div style="clear: both">
                <a href='javascript:void(0);' style='float: right;' class='tourbus-next'>
                    <asp:Literal ID="Literal12" runat="server" meta:resourcekey="Literal12Resource1" Text="下一步"></asp:Literal><span>&raquo;</span></a>
                <a href='javascript:void(0);' class='tourbus-stop'><span>&times;</span><asp:Literal ID="Literal11" runat="server" meta:resourcekey="Literal11Resource1" Text="結束"></asp:Literal></a>
            </div>
        </li>
        <li data-el='.rieToolBar .rtbItem:nth-child(2)' data-orientation='bottom' data-width='300' data-arrow="18px" >
            <img src="../../../Common/Images/Stickers/100.png" style="float: left" />
            <p>
                <asp:Literal ID="Literal18" runat="server" meta:resourcekey="Literal18Resource1" Text="點選這裡可以把圖片向右旋轉90度"></asp:Literal>
            </p>
            <div style="clear: both">
                <a href='javascript:void(0);' style='float: right;' class='tourbus-next'>
                    <asp:Literal ID="Literal13" runat="server" meta:resourcekey="Literal13Resource1" Text="下一步"></asp:Literal><span>&raquo;</span></a>
                <a href='javascript:void(0);' class='tourbus-stop'><span>&times;</span><asp:Literal ID="Literal6" runat="server" meta:resourcekey="Literal6Resource1" Text="結束"></asp:Literal></a>
            </div>
        </li>
        <li data-el='.rieToolBar .rtbItem:nth-child(1)' data-orientation='bottom' data-width='300' data-arrow="18px" >
            <img src="../../../Common/Images/Stickers/100.png" style="float: left" />
            <p>
                <asp:Literal ID="Literal19" runat="server" meta:resourcekey="Literal19Resource1" Text="點選這裡可以把圖片放大或縮小"></asp:Literal>
            </p>
            <div style="clear: both">
                <a href='javascript:void(0);' style='float: right;' class='tourbus-next'>
                    <asp:Literal ID="Literal14" runat="server" meta:resourcekey="Literal14Resource1" Text="下一步"></asp:Literal><span>&raquo;</span></a>
                <a href='javascript:void(0);' class='tourbus-stop'><span>&times;</span><asp:Literal ID="Literal7" runat="server" meta:resourcekey="Literal7Resource1" Text="結束"></asp:Literal></a>
            </div>
        </li>
       
        <li data-el='#ctl00_MasterPageRadButton1' data-orientation='top'  data-arrow="18px" data-width='300'>
            <img src="../../../Common/Images/Stickers/100.png" style="float: left" />
            <p>
                <asp:Literal ID="Literal21" runat="server" meta:resourcekey="Literal21Resource1" Text="按下確定就可以儲存"></asp:Literal>
            </p>
            <div style="clear: both">
                <a href='javascript:void(0);' style='float: right;' class='tourbus-next'>
                    <asp:Literal ID="Literal9" runat="server" meta:resourcekey="Literal14Resource1" Text="下一步"></asp:Literal><span>&raquo;</span></a>
                <a href='javascript:void(0);' class='tourbus-stop'><span>&times;</span><asp:Literal ID="Literal20" runat="server" meta:resourcekey="Literal7Resource1" Text="結束"></asp:Literal></a>
            </div>
        </li>
        <li data-el='#ctl00_MasterPageRadButton2' data-orientation='top'  data-arrow="18px" data-width='300'>
            <img src="../../../Common/Images/Stickers/100.png" style="float: left" />
            <p>
                <asp:Literal ID="Literal8" runat="server" Text="按下原圖上傳會直接將整張圖上傳不進行裁切"></asp:Literal>
            </p>
            <div style="clear: both">
                <a href='javascript:void(0);' class='tourbus-stop'><span>&times;</span><asp:Literal ID="Literal15" runat="server" meta:resourcekey="Literal9Resource1" Text="完成"></asp:Literal></a>

            </div>
        </li>
    </ol>
    <div class="my-tour-overlay"></div>
    <asp:Label ID="lblUpload" runat="server" Text="原圖上傳" Visible="false" meta:resourcekey="lblUploadResource1"></asp:Label>
</asp:Content>

