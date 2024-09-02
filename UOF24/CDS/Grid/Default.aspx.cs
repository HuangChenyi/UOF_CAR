using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Training.UCO;
using System.Data;
using Ede.Uof.Utility.Page;


public partial class CDS_Grid_Default : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        DemoUCO uco = new DemoUCO();
        DataTable dt = uco.GetUserData();

        if (ViewState["sort_self"] == null)
        {
            ViewState["sort_self"] = "ACCOUNT";
        }

        dt.DefaultView.Sort = (string)ViewState["sort_self"];
        grid.DataSource = dt;
        grid.DataBind();
    }
    protected void btnGetSelect_Click(object sender, EventArgs e)
    {
        txtContent.Text = "";

        string[] strs = grid.GetSelectedRowGUIDs();

        foreach (string str in strs)
        {
            txtContent.Text += str+"\r\n" ;
        
        }


    }
    protected void btnGetSelectKey_Click(object sender, EventArgs e)
    {
        txtContent.Text = "";

        int[] indexs = grid.GetSelectedRowIndexs();

        foreach (int i in indexs)
        {
            txtContent.Text += i.ToString() +"\r\n";

        }
    }
    protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindGrid();
    }
    protected void grid_BeforeExport(object sender, Ede.Uof.Utility.Component.BeforeExportEventArgs e)
    {

        DemoUCO uco = new DemoUCO();
        DataTable dt = uco.GetUserData();

        dt.Columns[0].Caption = "帳號";
        dt.Columns[1].Caption = "姓名";

        dt.Columns.RemoveAt(2);
        e.Datasource = dt;
    }
    protected void grid_AfterExport()
    {
         DemoUCO uco = new DemoUCO();
         DataTable dt = uco.GetUserData();
         grid.DataSource = dt;
         grid.DataBind();
    }
    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sort = Convert.ToString(ViewState["sort_self"]);
        string newSort = string.Empty;
        if (sort.StartsWith(e.SortExpression))
        {
            newSort = (sort == e.SortExpression + " ASC") ? e.SortExpression + " DESC" : e.SortExpression + " ASC";
        }
        else
        {
            newSort = e.SortExpression + " ASC";
        }
        ViewState["sort_self"] = newSort;

        BindGrid();

    }
}