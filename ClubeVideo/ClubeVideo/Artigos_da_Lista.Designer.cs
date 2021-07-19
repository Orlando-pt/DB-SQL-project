namespace ClubeVideo
{
    partial class Artigos_da_Lista
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
            this.listBoxArtigos = new System.Windows.Forms.ListBox();
            this.textBoxCod_artigo = new System.Windows.Forms.TextBox();
            this.textBoxCod_lista_precos = new System.Windows.Forms.TextBox();
            this.textBoxPreco = new System.Windows.Forms.TextBox();
            this.labelCod_artigo = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.buttonEditar = new System.Windows.Forms.Button();
            this.buttonFiltrar = new System.Windows.Forms.Button();
            this.buttonGuardar = new System.Windows.Forms.Button();
            this.buttonCancelar = new System.Windows.Forms.Button();
            this.buttonProcurar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // listBoxArtigos
            // 
            this.listBoxArtigos.FormattingEnabled = true;
            this.listBoxArtigos.Location = new System.Drawing.Point(0, -1);
            this.listBoxArtigos.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.listBoxArtigos.Name = "listBoxArtigos";
            this.listBoxArtigos.Size = new System.Drawing.Size(268, 368);
            this.listBoxArtigos.TabIndex = 0;
            this.listBoxArtigos.SelectedIndexChanged += new System.EventHandler(this.listBoxFuncionarios_SelectedIndexChanged);
            // 
            // textBoxCod_artigo
            // 
            this.textBoxCod_artigo.Location = new System.Drawing.Point(286, 68);
            this.textBoxCod_artigo.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxCod_artigo.Name = "textBoxCod_artigo";
            this.textBoxCod_artigo.Size = new System.Drawing.Size(76, 20);
            this.textBoxCod_artigo.TabIndex = 1;
            // 
            // textBoxCod_lista_precos
            // 
            this.textBoxCod_lista_precos.Location = new System.Drawing.Point(396, 68);
            this.textBoxCod_lista_precos.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxCod_lista_precos.Name = "textBoxCod_lista_precos";
            this.textBoxCod_lista_precos.Size = new System.Drawing.Size(76, 20);
            this.textBoxCod_lista_precos.TabIndex = 2;
            // 
            // textBoxPreco
            // 
            this.textBoxPreco.Location = new System.Drawing.Point(500, 68);
            this.textBoxPreco.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxPreco.Name = "textBoxPreco";
            this.textBoxPreco.Size = new System.Drawing.Size(76, 20);
            this.textBoxPreco.TabIndex = 3;
            // 
            // labelCod_artigo
            // 
            this.labelCod_artigo.AutoSize = true;
            this.labelCod_artigo.Location = new System.Drawing.Point(290, 49);
            this.labelCod_artigo.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelCod_artigo.Name = "labelCod_artigo";
            this.labelCod_artigo.Size = new System.Drawing.Size(58, 13);
            this.labelCod_artigo.TabIndex = 6;
            this.labelCod_artigo.Text = "Cod_artigo";
            this.labelCod_artigo.Click += new System.EventHandler(this.labelartigo_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(394, 49);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(88, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "Cod_lista_precos";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(520, 49);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(35, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "Preco";
            // 
            // buttonEditar
            // 
            this.buttonEditar.Location = new System.Drawing.Point(286, 337);
            this.buttonEditar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonEditar.Name = "buttonEditar";
            this.buttonEditar.Size = new System.Drawing.Size(56, 19);
            this.buttonEditar.TabIndex = 12;
            this.buttonEditar.Text = "Editar";
            this.buttonEditar.UseVisualStyleBackColor = true;
            this.buttonEditar.Click += new System.EventHandler(this.buttonEditar_Click);
            // 
            // buttonFiltrar
            // 
            this.buttonFiltrar.Location = new System.Drawing.Point(476, 337);
            this.buttonFiltrar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonFiltrar.Name = "buttonFiltrar";
            this.buttonFiltrar.Size = new System.Drawing.Size(56, 19);
            this.buttonFiltrar.TabIndex = 13;
            this.buttonFiltrar.Text = "Filtrar";
            this.buttonFiltrar.UseVisualStyleBackColor = true;
            this.buttonFiltrar.Click += new System.EventHandler(this.buttonFiltrar_Click);
            // 
            // buttonGuardar
            // 
            this.buttonGuardar.Location = new System.Drawing.Point(354, 337);
            this.buttonGuardar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonGuardar.Name = "buttonGuardar";
            this.buttonGuardar.Size = new System.Drawing.Size(56, 19);
            this.buttonGuardar.TabIndex = 14;
            this.buttonGuardar.Text = "Guardar";
            this.buttonGuardar.UseVisualStyleBackColor = true;
            this.buttonGuardar.Click += new System.EventHandler(this.buttonGuardar_Click);
            // 
            // buttonCancelar
            // 
            this.buttonCancelar.Location = new System.Drawing.Point(415, 338);
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
            this.buttonProcurar.Location = new System.Drawing.Point(535, 338);
            this.buttonProcurar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonProcurar.Name = "buttonProcurar";
            this.buttonProcurar.Size = new System.Drawing.Size(56, 19);
            this.buttonProcurar.TabIndex = 19;
            this.buttonProcurar.Text = "Procurar";
            this.buttonProcurar.UseVisualStyleBackColor = true;
            this.buttonProcurar.Click += new System.EventHandler(this.buttonProcurar_Click);
            // 
            // Artigos_da_Lista
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.buttonProcurar);
            this.Controls.Add(this.buttonCancelar);
            this.Controls.Add(this.buttonGuardar);
            this.Controls.Add(this.buttonFiltrar);
            this.Controls.Add(this.buttonEditar);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.labelCod_artigo);
            this.Controls.Add(this.textBoxPreco);
            this.Controls.Add(this.textBoxCod_lista_precos);
            this.Controls.Add(this.textBoxCod_artigo);
            this.Controls.Add(this.listBoxArtigos);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "Artigos_da_Lista";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Artigos_da_Lista";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBoxArtigos;
        private System.Windows.Forms.TextBox textBoxCod_artigo;
        private System.Windows.Forms.TextBox textBoxCod_lista_precos;
        private System.Windows.Forms.TextBox textBoxPreco;
        private System.Windows.Forms.Label labelCod_artigo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button buttonEditar;
        private System.Windows.Forms.Button buttonFiltrar;
        private System.Windows.Forms.Button buttonGuardar;
        private System.Windows.Forms.Button buttonCancelar;
        private System.Windows.Forms.Button buttonProcurar;
    }
}