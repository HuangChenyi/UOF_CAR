using Ede.Uof.Utility.Configuration;
using Ede.Uof.Utility.Page;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CDS_Auth_Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Setting setting = new Setting();
            
            UC_ChoiceList.XML = setting["DemoWebPartAuth"];
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string value="";
        Setting setting = new Setting();
        
        setting["DemoWebPartAuth"] = UC_ChoiceList.XML;

        ScriptManager.RegisterStartupScript(this, GetType(),
            Guid.NewGuid().ToString(), string.Format("alert('{0}');", lblAlert.Text),true);


    }
}