namespace ClubeVideo
{
    partial class ProdutosLinha
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
            this.listBoxProdutosDisp = new System.Windows.Forms.ListBox();
            this.buttonCriar = new System.Windows.Forms.Button();
            this.buttonEliminar = new System.Windows.Forms.Button();
            this.listBoxProdutosEsc = new System.Windows.Forms.ListBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxdataDevolucao = new System.Windows.Forms.TextBox();
            this.labeldataDevolucao = new System.Windows.Forms.Label();
            this.buttonTerminar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // listBoxProdutosDisp
            // 
            this.listBoxProdutosDisp.FormattingEnabled = true;
            this.listBoxProdutosDisp.Location = new System.Drawing.Point(0, 38);
            this.listBoxProdutosDisp.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.listBoxProdutosDisp.Name = "listBoxProdutosDisp";
            this.listBoxProdutosDisp.Size = new System.Drawing.Size(228, 329);
            this.listBoxProdutosDisp.TabIndex = 0;
            this.listBoxProdutosDisp.SelectedIndexChanged += new System.EventHandler(this.listBoxProdutosDisp_SelectedIndexChanged);
            // 
            // buttonCriar
            // 
            this.buttonCriar.Location = new System.Drawing.Point(272, 232);
            this.buttonCriar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonCriar.Name = "buttonCriar";
            this.buttonCriar.Size = new System.Drawing.Size(56, 19);
            this.buttonCriar.TabIndex = 11;
            this.buttonCriar.Text = "Adicionar";
            this.buttonCriar.UseVisualStyleBackColor = true;
            this.buttonCriar.Click += new System.EventHandler(this.buttonCriar_Click);
            // 
            // buttonEliminar
            // 
            this.buttonEliminar.Location = new System.Drawing.Point(272, 271);
            this.buttonEliminar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonEliminar.Name = "buttonEliminar";
            this.buttonEliminar.Size = new System.Drawing.Size(56, 19);
            this.buttonEliminar.TabIndex = 36;
            this.buttonEliminar.Text = "Retirar";
            this.buttonEliminar.UseVisualStyleBackColor = true;
            this.buttonEliminar.Click += new System.EventHandler(this.buttonEliminar_Click);
            // 
            // listBoxProdutosEsc
            // 
            this.listBoxProdutosEsc.FormattingEnabled = true;
            this.listBoxProdutosEsc.Location = new System.Drawing.Point(372, 38);
            this.listBoxProdutosEsc.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.listBoxProdutosEsc.Name = "listBoxProdutosEsc";
            this.listBoxProdutosEsc.Size = new System.Drawing.Size(228, 329);
            this.listBoxProdutosEsc.TabIndex = 37;
            this.listBoxProdutosEsc.SelectedIndexChanged += new System.EventHandler(this.listBoxProdutosEsc_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(49, 19);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(108, 13);
            this.label1.TabIndex = 38;
            this.label1.Text = "Produtos Disponíveis";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(440, 19);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(93, 13);
            this.label2.TabIndex = 39;
            this.label2.Text = "Produtos na Linha";
            // 
            // textBoxdataDevolucao
            // 
            this.textBoxdataDevolucao.Location = new System.Drawing.Point(262, 153);
            this.textBoxdataDevolucao.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxdataDevolucao.Name = "textBoxdataDevolucao";
            this.textBoxdataDevolucao.Size = new System.Drawing.Size(76, 20);
            this.textBoxdataDevolucao.TabIndex = 43;
            // 
            // labeldataDevolucao
            // 
            this.labeldataDevolucao.AutoSize = true;
            this.labeldataDevolucao.Location = new System.Drawing.Point(260, 133);
            this.labeldataDevolucao.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labeldataDevolucao.Name = "labeldataDevolucao";
            this.labeldataDevolucao.Size = new System.Drawing.Size(80, 13);
            this.labeldataDevolucao.TabIndex = 42;
            this.labeldataDevolucao.Text = "dataDevolucao";
            // 
            // buttonTerminar
            // 
            this.buttonTerminar.Location = new System.Drawing.Point(272, 310);
            this.buttonTerminar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonTerminar.Name = "buttonTerminar";
            this.buttonTerminar.Size = new System.Drawing.Size(56, 19);
            this.buttonTerminar.TabIndex = 44;
            this.buttonTerminar.Text = "Terminar";
            this.buttonTerminar.UseVisualStyleBackColor = true;
            this.buttonTerminar.Click += new System.EventHandler(this.buttonTerminar_Click);
            // 
            // ProdutosLinha
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.buttonTerminar);
            this.Controls.Add(this.textBoxdataDevolucao);
            this.Controls.Add(this.labeldataDevolucao);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.listBoxProdutosEsc);
            this.Controls.Add(this.buttonEliminar);
            this.Controls.Add(this.buttonCriar);
            this.Controls.Add(this.listBoxProdutosDisp);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "ProdutosLinha";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ProdutosLinha";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBoxProdutosDisp;
        private System.Windows.Forms.Button buttonCriar;
        private System.Windows.Forms.Button buttonEliminar;
        private System.Windows.Forms.ListBox listBoxProdutosEsc;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxdataDevolucao;
        private System.Windows.Forms.Label labeldataDevolucao;
        private System.Windows.Forms.Button buttonTerminar;
    }
}