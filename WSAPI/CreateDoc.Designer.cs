namespace WSAPI
{
    partial class CreateDoc
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnAddDoc = new System.Windows.Forms.Button();
            this.btnUpload = new System.Windows.Forms.Button();
            this.btnDMSFolder = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.treeDMSFolder = new System.Windows.Forms.TreeView();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.txtFolderId = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtDOCID = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtFileName = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtFileGroupId = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnAddDoc);
            this.groupBox1.Controls.Add(this.btnUpload);
            this.groupBox1.Controls.Add(this.btnDMSFolder);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(864, 100);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            // 
            // btnAddDoc
            // 
            this.btnAddDoc.Location = new System.Drawing.Point(353, 31);
            this.btnAddDoc.Name = "btnAddDoc";
            this.btnAddDoc.Size = new System.Drawing.Size(101, 39);
            this.btnAddDoc.TabIndex = 12;
            this.btnAddDoc.Text = "3.新增文件";
            this.btnAddDoc.UseVisualStyleBackColor = true;
            this.btnAddDoc.Click += new System.EventHandler(this.btnAddDoc_Click);
            // 
            // btnUpload
            // 
            this.btnUpload.Location = new System.Drawing.Point(219, 31);
            this.btnUpload.Name = "btnUpload";
            this.btnUpload.Size = new System.Drawing.Size(75, 39);
            this.btnUpload.TabIndex = 11;
            this.btnUpload.Text = "2.上傳附件";
            this.btnUpload.UseVisualStyleBackColor = true;
            this.btnUpload.Click += new System.EventHandler(this.btnUpload_Click);
            // 
            // btnDMSFolder
            // 
            this.btnDMSFolder.Location = new System.Drawing.Point(50, 31);
            this.btnDMSFolder.Name = "btnDMSFolder";
            this.btnDMSFolder.Size = new System.Drawing.Size(101, 39);
            this.btnDMSFolder.TabIndex = 10;
            this.btnDMSFolder.Text = "1.取得目錄架構";
            this.btnDMSFolder.UseVisualStyleBackColor = true;
            this.btnDMSFolder.Click += new System.EventHandler(this.btnDMSFolder_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.treeDMSFolder);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Left;
            this.groupBox2.Location = new System.Drawing.Point(0, 100);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(242, 412);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "目錄結構";
            // 
            // treeDMSFolder
            // 
            this.treeDMSFolder.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeDMSFolder.Location = new System.Drawing.Point(3, 18);
            this.treeDMSFolder.Name = "treeDMSFolder";
            this.treeDMSFolder.Size = new System.Drawing.Size(236, 391);
            this.treeDMSFolder.TabIndex = 3;
            this.treeDMSFolder.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeDMSFolder_AfterSelect);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.txtFolderId);
            this.groupBox3.Controls.Add(this.label7);
            this.groupBox3.Controls.Add(this.txtDOCID);
            this.groupBox3.Controls.Add(this.label6);
            this.groupBox3.Controls.Add(this.txtFileName);
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Controls.Add(this.txtFileGroupId);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox3.Location = new System.Drawing.Point(242, 100);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(622, 412);
            this.groupBox3.TabIndex = 2;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "上傳資訊";
            // 
            // txtFolderId
            // 
            this.txtFolderId.Location = new System.Drawing.Point(128, 136);
            this.txtFolderId.Name = "txtFolderId";
            this.txtFolderId.Size = new System.Drawing.Size(402, 22);
            this.txtFolderId.TabIndex = 17;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(20, 188);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(41, 12);
            this.label7.TabIndex = 16;
            this.label7.Text = "文件ID";
            // 
            // txtDOCID
            // 
            this.txtDOCID.Location = new System.Drawing.Point(128, 183);
            this.txtDOCID.Name = "txtDOCID";
            this.txtDOCID.Size = new System.Drawing.Size(402, 22);
            this.txtDOCID.TabIndex = 15;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(20, 141);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(41, 12);
            this.label6.TabIndex = 14;
            this.label6.Text = "目錄ID";
            // 
            // txtFileName
            // 
            this.txtFileName.Location = new System.Drawing.Point(128, 84);
            this.txtFileName.Name = "txtFileName";
            this.txtFileName.Size = new System.Drawing.Size(402, 22);
            this.txtFileName.TabIndex = 13;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(20, 89);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(80, 12);
            this.label5.TabIndex = 12;
            this.label5.Text = "檔案/文件名稱";
            // 
            // txtFileGroupId
            // 
            this.txtFileGroupId.Location = new System.Drawing.Point(128, 34);
            this.txtFileGroupId.Name = "txtFileGroupId";
            this.txtFileGroupId.Size = new System.Drawing.Size(402, 22);
            this.txtFileGroupId.TabIndex = 11;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(20, 39);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(65, 12);
            this.label4.TabIndex = 10;
            this.label4.Text = "檔案群組ID";
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // CreateDoc
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(864, 512);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "CreateDoc";
            this.Text = "CreateDoc";
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnAddDoc;
        private System.Windows.Forms.Button btnUpload;
        private System.Windows.Forms.Button btnDMSFolder;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TreeView treeDMSFolder;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.TextBox txtFolderId;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtDOCID;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtFileName;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtFileGroupId;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
    }
}