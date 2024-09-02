using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json;

namespace WSAPI
{
    public partial class ImportPunch : Form
    {
        string m_Token;

        public ImportPunch(string token)
        {
            m_Token = token;
            InitializeComponent();

   
        }

        private void btnSend_Click(object sender, EventArgs e)
        {
            PunchData pData = new PunchData();

            for (int i = 0; i < dataGridView1.Rows.Count - 2; i++)
            {

                PunchDataItem item = new PunchDataItem();
                item.Seq = (i + 1).ToString();
                item.CardNo = dataGridView1.Rows[i].Cells["ColumnCardNo"].Value.ToString();
                item.PunchTime = dataGridView1.Rows[i].Cells["ColumnPunchTime"].Value.ToString();
                item.Type = dataGridView1.Rows[i].Cells["ColumnType"].Value.ToString();
                item.IpAddress = "";
                item.ClockCode = "";

                pData.Items.Add(item);
            }


            txtSerialize.Text  = JsonConvert.SerializeObject(pData);

                  
        
        }



    }
}
