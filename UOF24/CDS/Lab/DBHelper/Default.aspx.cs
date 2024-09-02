using Ede.Uof.Utility.Page;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab.Lib.UCO;

public partial class CDS_Lab_DBHelper_Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        LabUCO uco = new LabUCO();
        GridView1.DataSource = uco.GetProductList();
        GridView1.DataBind();
    }
}