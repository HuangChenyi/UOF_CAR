using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Ede.Uof.Utility.Page.Common;
using Training.UCO;

public partial class CDS_WebPage_TwoColumn : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((Master_TwoColumn)this.Master).LeftTitle = lblTitle.Text;

        DepartmentTree1.NodeOnClick += DepartmentTree1_NodeOnClick;

    }

    void DepartmentTree1_NodeOnClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
    {

        DemoUCO demoUCO = new DemoUCO();

        lblTreeValue.Text = DepartmentTree1.SelectedDepartmentName;

        Grid1.DataSource = demoUCO.GetUserData(DepartmentTree1.SelectedDepartment);
        Grid1.DataBind();
        UpdatePanel1.Update();
    }

}