using Ede.Uof.Utility.Configuration;
using Ede.Uof.Utility.Page;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CDS_Lab_Auth_Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Setting setting = new Setting();
            //將自訂的setting的item 放到選人元件XML的屬性內

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
       
        Setting setting = new Setting();

        //將選人元件XML的屬性放到自訂的setting的item 內
      

        ScriptManager.RegisterStartupScript(this, GetType(),
            Guid.NewGuid().ToString(), string.Format("alert('{0}');", lblAlert.Text), true);


    }
}