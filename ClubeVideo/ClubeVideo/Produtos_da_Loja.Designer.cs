namespace ClubeVideo
{
    partial class Produtos_da_Loja
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
            this.listBoxProdutos = new System.Windows.Forms.ListBox();
            this.textBoxnProduto = new System.Windows.Forms.TextBox();
            this.textBoxartigo = new System.Windows.Forms.TextBox();
            this.textBoxloja = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.labelartigo = new System.Windows.Forms.Label();
            this.labelloja = new System.Windows.Forms.Label();
            this.labeldisponibilidade = new System.Windows.Forms.Label();
            this.buttonFiltrar = new System.Windows.Forms.Button();
            this.buttonCancelar = new System.Windows.Forms.Button();
            this.buttonProcurar = new System.Windows.Forms.Button();
            this.textBoxdisponibilidade = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // listBoxProdutos
            // 
            this.listBoxProdutos.FormattingEnabled = true;
            this.listBoxProdutos.Location = new System.Drawing.Point(0, -1);
            this.listBoxProdutos.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.listBoxProdutos.Name = "listBoxProdutos";
            this.listBoxProdutos.Size = new System.Drawing.Size(268, 368);
            this.listBoxProdutos.TabIndex = 0;
            this.listBoxProdutos.SelectedIndexChanged += new System.EventHandler(this.listBoxFuncionarios_SelectedIndexChanged);
            // 
            // textBoxnProduto
            // 
            this.textBoxnProduto.Location = new System.Drawing.Point(350, 153);
            this.textBoxnProduto.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxnProduto.Name = "textBoxnProduto";
            this.textBoxnProduto.Size = new System.Drawing.Size(76, 20);
            this.textBoxnProduto.TabIndex = 1;
            // 
            // textBoxartigo
            // 
            this.textBoxartigo.Location = new System.Drawing.Point(457, 153);
            this.textBoxartigo.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxartigo.Name = "textBoxartigo";
            this.textBoxartigo.Size = new System.Drawing.Size(76, 20);
            this.textBoxartigo.TabIndex = 2;
            // 
            // textBoxloja
            // 
            this.textBoxloja.Location = new System.Drawing.Point(350, 203);
            this.textBoxloja.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxloja.Name = "textBoxloja";
            this.textBoxloja.Size = new System.Drawing.Size(76, 20);
            this.textBoxloja.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(362, 133);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(50, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "nProduto";
            // 
            // labelartigo
            // 
            this.labelartigo.AutoSize = true;
            this.labelartigo.Location = new System.Drawing.Point(473, 133);
            this.labelartigo.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelartigo.Name = "labelartigo";
            this.labelartigo.Size = new System.Drawing.Size(33, 13);
            this.labelartigo.TabIndex = 7;
            this.labelartigo.Text = "artigo";
            this.labelartigo.Click += new System.EventHandler(this.labelartigo_Click);
            // 
            // labelloja
            // 
            this.labelloja.AutoSize = true;
            this.labelloja.Location = new System.Drawing.Point(371, 184);
            this.labelloja.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelloja.Name = "labelloja";
            this.labelloja.Size = new System.Drawing.Size(23, 13);
            this.labelloja.TabIndex = 8;
            this.labelloja.Text = "loja";
            this.labelloja.Click += new System.EventHandler(this.labelloja_Click);
            // 
            // labeldisponibilidade
            // 
            this.labeldisponibilidade.AutoSize = true;
            this.labeldisponibilidade.Location = new System.Drawing.Point(454, 184);
            this.labeldisponibilidade.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labeldisponibilidade.Name = "labeldisponibilidade";
            this.labeldisponibilidade.Size = new System.Drawing.Size(76, 13);
            this.labeldisponibilidade.TabIndex = 9;
            this.labeldisponibilidade.Text = "disponibilidade";
            this.labeldisponibilidade.Click += new System.EventHandler(this.labeldisponibilidade_Click);
            // 
            // buttonFiltrar
            // 
            this.buttonFiltrar.Location = new System.Drawing.Point(424, 338);
            this.buttonFiltrar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonFiltrar.Name = "buttonFiltrar";
            this.buttonFiltrar.Size = new System.Drawing.Size(56, 19);
            this.buttonFiltrar.TabIndex = 13;
            this.buttonFiltrar.Text = "Filtrar";
            this.buttonFiltrar.UseVisualStyleBackColor = true;
            this.buttonFiltrar.Click += new System.EventHandler(this.buttonFiltrar_Click);
            // 
            // buttonCancelar
            // 
            this.buttonCancelar.Location = new System.Drawing.Point(350, 338);
            this.buttonCancelar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonCancelar.Name = "buttonCancelar";
            this.buttonCancelar.Size = new System.Drawing.Size(56, 19);
            this.buttonCancelar.TabIndex = 17;
            this.buttonCancelar.Text = "Cancelar";
            this.buttonCancelar.UseVisualStyleBackColor = true;
            this.buttonCancelar.Click += new System.EventHandler(this.buttonCancelar_Click);
            // 
            // buttonProcurar
            // 
            this.buttonProcurar.Location = new System.Drawing.Point(502, 338);
            this.buttonProcurar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonProcurar.Name = "buttonProcurar";
            this.buttonProcurar.Size = new System.Drawing.Size(56, 19);
            this.buttonProcurar.TabIndex = 19;
            this.buttonProcurar.Text = "Procurar";
            this.buttonProcurar.UseVisualStyleBackColor = true;
            this.buttonProcurar.Click += new System.EventHandler(this.buttonProcurar_Click);
            // 
            // textBoxdisponibilidade
            // 
            this.textBoxdisponibilidade.Location = new System.Drawing.Point(457, 203);
            this.textBoxdisponibilidade.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxdisponibilidade.Name = "textBoxdisponibilidade";
            this.textBoxdisponibilidade.Size = new System.Drawing.Size(76, 20);
            this.textBoxdisponibilidade.TabIndex = 4;
            // 
            // Produtos_da_Loja
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.buttonProcurar);
            this.Controls.Add(this.buttonCancelar);
            this.Controls.Add(this.buttonFiltrar);
            this.Controls.Add(this.labeldisponibilidade);
            this.Controls.Add(this.labelloja);
            this.Controls.Add(this.labelartigo);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBoxdisponibilidade);
            this.Controls.Add(this.textBoxloja);
            this.Controls.Add(this.textBoxartigo);
            this.Controls.Add(this.textBoxnProduto);
            this.Controls.Add(this.listBoxProdutos);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "Produtos_da_Loja";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Produtos_da_Loja";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBoxProdutos;
        private System.Windows.Forms.TextBox textBoxnProduto;
        private System.Windows.Forms.TextBox textBoxartigo;
        private System.Windows.Forms.TextBox textBoxloja;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label labelartigo;
        private System.Windows.Forms.Label labelloja;
        private System.Windows.Forms.Label labeldisponibilidade;
        private System.Windows.Forms.Button buttonFiltrar;
        private System.Windows.Forms.Button buttonCancelar;
        private System.Windows.Forms.Button buttonProcurar;
        private System.Windows.Forms.TextBox textBoxdisponibilidade;
    }
}