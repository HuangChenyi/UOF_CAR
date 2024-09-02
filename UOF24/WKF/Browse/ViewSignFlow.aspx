<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Browse_ViewSignFlow" Title="實際簽核流程" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ViewSignFlow.aspx.cs" %>

<%@ Register src="TaskRecord/UC_TaskSiteRecord.ascx" tagname="UC_TaskSiteRecord" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <style>
            .SubFlowTD {vertical-align:top; background-attachment: fixed; background-image: url("<%=themePath %>/images/wkf/line1.gif"); background-repeat: repeat-y;}
            .EmptyTable {padding:0px;border:0px;margin:0px;text-align:center}
            .SignerTD {color:blue;text-align:left}
            .SiteLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left.gif"); background-repeat: repeat-y;}
            .SiteMiddleTD {background-image: url("<%=themePath %>/images/wkf/app_con.gif"); background-repeat: repeat-y;}
            .SiteRightTD {width:8px;background-image: url("<%=themePath %>/images/wkf/site_right.gif"); background-repeat: repeat-y;}
            .CondTextTD {text-align:center;font-weight:bold;}
            .CondLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left_big.gif"); background-repeat: repeat-y;}
            .CondMiddleTD { background-image: url("<%=themePath %>/images/wkf/cond_con.gif");background-repeat: repeat-y;text-align:center}
            .CondRightTD {background-image: url("<%=themePath %>/images/wkf/site_rig_big.gif"); background-repeat: repeat-y;}
            td_{text-align:center;vertical-align:top;font-size:12px;width:120;}
            table_{text-align:center;border:0px}
            .hiddenNotify {display:none}
            .bigT 
            {
                color:#ffffff;	font-size:25px; font-weight: bolder; 
            }
        </style>
        
    <div align="center"><uc1:UC_TaskSiteRecord ID="UC_TaskSiteRecord1" runat="server" /></div>
</asp:Content>

