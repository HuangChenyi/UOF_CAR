using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ede.Uof.Utility.Page.Common;
using Ede.Uof.Utility.Configuration;

public partial class CDS_Utility_UOFDownload : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

  

  //  

     protected void btnDownload_Click(object sender, EventArgs e)
    {
         //取得一般組態設定資訊
         Setting setting = new Setting();


        ScriptManager.RegisterStartupScript(Page, GetType(), 
            "download",
           string.Format("$uof.download('{0}/Common/FileCenter/DownloadFile.ashx?id={1}');", setting["SiteUrl"], txtFileGroupID.Text), true);

    }
}