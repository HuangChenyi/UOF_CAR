using Ede.Uof.Utility.Page;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Training.UCO;

public partial class CDS_Grid_Default2 : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DemoUCO uco = new DemoUCO();
            grid.DataSource = uco.GetUserData();
            grid.DataBind();
        }
    }
}