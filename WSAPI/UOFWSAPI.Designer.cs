namespace WSAPI
{
    partial class UOFWSAPI
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnSimulationFlow = new System.Windows.Forms.Button();
            this.btnFile = new System.Windows.Forms.Button();
            this.btnPunch = new System.Windows.Forms.Button();
            this.btnDMS = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnSimulationFlow
            // 
            this.btnSimulationFlow.Location = new System.Drawing.Point(28, 25);
            this.btnSimulationFlow.Name = "btnSimulationFlow";
            this.btnSimulationFlow.Size = new System.Drawing.Size(132, 78);
            this.btnSimulationFlow.TabIndex = 0;
            this.btnSimulationFlow.Text = "模擬流程";
            this.btnSimulationFlow.UseVisualStyleBackColor = true;
            this.btnSimulationFlow.Click += new System.EventHandler(this.btnSimulationFlow_Click);
            // 
            // btnFile
            // 
            this.btnFile.Location = new System.Drawing.Point(28, 125);
            this.btnFile.Name = "btnFile";
            this.btnFile.Size = new System.Drawing.Size(132, 78);
            this.btnFile.TabIndex = 1;
            this.btnFile.Text = "檔案上傳";
            this.btnFile.UseVisualStyleBackColor = true;
            this.btnFile.Click += new System.EventHandler(this.btnFile_Click);
            // 
            // btnPunch
            // 
            this.btnPunch.Location = new System.Drawing.Point(219, 25);
            this.btnPunch.Name = "btnPunch";
            this.btnPunch.Size = new System.Drawing.Size(132, 78);
            this.btnPunch.TabIndex = 2;
            this.btnPunch.Text = "刷卡匯入";
            this.btnPunch.UseVisualStyleBackColor = true;
            this.btnPunch.Click += new System.EventHandler(this.btnPunch_Click);
            // 
            // btnDMS
            // 
            this.btnDMS.Location = new System.Drawing.Point(219, 125);
            this.btnDMS.Name = "btnDMS";
            this.btnDMS.Size = new System.Drawing.Size(132, 78);
            this.btnDMS.TabIndex = 3;
            this.btnDMS.Text = "新增文件(DMS)";
            this.btnDMS.UseVisualStyleBackColor = true;
            this.btnDMS.Click += new System.EventHandler(this.btnDMS_Click);
            // 
            // UOFWSAPI
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(396, 250);
            this.Controls.Add(this.btnDMS);
            this.Controls.Add(this.btnPunch);
            this.Controls.Add(this.btnFile);
            this.Controls.Add(this.btnSimulationFlow);
            this.Name = "UOFWSAPI";
            this.Text = "UOFWSAPI";
            this.Load += new System.EventHandler(this.UOFWSAPI_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnSimulationFlow;
        private System.Windows.Forms.Button btnFile;
        private System.Windows.Forms.Button btnPunch;
        private System.Windows.Forms.Button btnDMS;
    }
}