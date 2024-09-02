using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WSAPI
{
    public partial class UOFWSAPI : Form
    {
        public string m_Token;
        public string Token { get { return m_Token; } }
        public string SiteUrl { get; set; }

        public UOFWSAPI()
        {
            InitializeComponent();
        }

        private void btnSimulationFlow_Click(object sender, EventArgs e)
        {
            SimulationFlow sf = new SimulationFlow(m_Token);
            sf.Show();
        }

        private void btnFile_Click(object sender, EventArgs e)
        {
            FileUpload fu = new FileUpload(m_Token);
            fu.Show();
        }

        private void UOFWSAPI_Load(object sender, EventArgs e)
        {
            //取得登入憑證
            Authentication auth = new Authentication();
            m_Token = auth.GetToken("ERP", "admin", "123456");
        }

        private void btnPunch_Click(object sender, EventArgs e)
        {
            ImportPunch punch = new ImportPunch(m_Token);
            punch.Show();
        }

        private void btnDMS_Click(object sender, EventArgs e)
        {

        }
    }
}
