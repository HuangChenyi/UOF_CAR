using Ede.Uof.EIP.Organization.Util;
using Ede.Uof.EIP.SystemInfo;
using Ede.Uof.Utility.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CDS_WebPart_UC_WebPart : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if(!IsPostBack)
        {

            Setting setting = new Setting();

            if (!string.IsNullOrEmpty(setting["DemoWebPartAuth"]))
            {
                UserSet userSet = new UserSet();
                userSet.SetXML(setting["DemoWebPartAuth"]);
                if (!userSet.Contains(Current.UserGUID))
                {
                    lblAlert.Visible = true;
                    return;
                }

            }

            var resquet = WebRequest.CreateHttp
                ("https://rate.bot.com.tw/xrt/flcsv/0/day");

            WebResponse r = resquet.GetResponse();
            var stream = r.GetResponseStream();
            StreamReader sr = new StreamReader(stream);
            string str = sr.ReadToEnd();

            DataTable dt = new DataTable();

            string[] rowData = str.Split(new string[] { "\n" }, StringSplitOptions.None);

            for (int i = 0; i < rowData.Length; i++)
            {
                string[] colData;
                if (i == 0)
                {
                    colData = rowData[0].Split(new string[] { "," }, StringSplitOptions.None);

                    for (int j = 0; j < colData.Length; j++)
                    {
                        try
                        {
                            dt.Columns.Add(colData[j]);
                        }
                        catch
                        {
                            dt.Columns.Add(colData[j] + "_");
                        }
                    }

                    continue;
                }

                colData = rowData[i].Split(new string[] { "," }, StringSplitOptions.None);
                DataRow dr = dt.NewRow();
                for (int j = 0; j < colData.Length; j++)
                {
                    if (colData[j] == "\r")
                        continue;
                    dr[j] = colData[j];
                }

                dt.Rows.Add(dr);

            }

            Grid1.DataSource = dt;
            Grid1.DataBind();
        }
    }
}