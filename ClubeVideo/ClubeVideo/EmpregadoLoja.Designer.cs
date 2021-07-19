namespace ClubeVideo
{
    partial class EmpregadoLoja
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
            this.buttonTerceiros = new System.Windows.Forms.Button();
            this.buttonLojas = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // buttonTerceiros
            // 
            this.buttonTerceiros.Location = new System.Drawing.Point(500, 212);
            this.buttonTerceiros.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonTerceiros.Name = "buttonTerceiros";
            this.buttonTerceiros.Size = new System.Drawing.Size(65, 19);
            this.buttonTerceiros.TabIndex = 6;
            this.buttonTerceiros.Text = "Terceiros";
            this.buttonTerceiros.UseVisualStyleBackColor = true;
            this.buttonTerceiros.Click += new System.EventHandler(this.buttonTerceiro_Click);
            // 
            // buttonLojas
            // 
            this.buttonLojas.Location = new System.Drawing.Point(236, 212);
            this.buttonLojas.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonLojas.Name = "buttonLojas";
            this.buttonLojas.Size = new System.Drawing.Size(56, 19);
            this.buttonLojas.TabIndex = 5;
            this.buttonLojas.Text = "Lojas";
            this.buttonLojas.UseVisualStyleBackColor = true;
            this.buttonLojas.Click += new System.EventHandler(this.buttonLojas_Click);
            // 
            // EmpregadoLoja
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.buttonTerceiros);
            this.Controls.Add(this.buttonLojas);
            this.Name = "EmpregadoLoja";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "EmpregadoLoja";
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button buttonTerceiros;
        private System.Windows.Forms.Button buttonLojas;
    }
}