namespace ClubeVideo
{
    partial class ListasDePrecos
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
            this.listBoxListas = new System.Windows.Forms.ListBox();
            this.textBoxnCod_lista_precos = new System.Windows.Forms.TextBox();
            this.textBoxDescricao = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.labelDescricao = new System.Windows.Forms.Label();
            this.buttonCriar = new System.Windows.Forms.Button();
            this.buttonFiltrar = new System.Windows.Forms.Button();
            this.buttonCancelar = new System.Windows.Forms.Button();
            this.buttonProcurar = new System.Windows.Forms.Button();
            this.buttonGuardar = new System.Windows.Forms.Button();
            this.buttonArtigos = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // listBoxListas
            // 
            this.listBoxListas.FormattingEnabled = true;
            this.listBoxListas.Location = new System.Drawing.Point(0, -1);
            this.listBoxListas.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.listBoxListas.Name = "listBoxListas";
            this.listBoxListas.Size = new System.Drawing.Size(268, 368);
            this.listBoxListas.TabIndex = 0;
            this.listBoxListas.SelectedIndexChanged += new System.EventHandler(this.listBoxLojas_SelectedIndexChanged);
            // 
            // textBoxnCod_lista_precos
            // 
            this.textBoxnCod_lista_precos.Location = new System.Drawing.Point(346, 130);
            this.textBoxnCod_lista_precos.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxnCod_lista_precos.Name = "textBoxnCod_lista_precos";
            this.textBoxnCod_lista_precos.Size = new System.Drawing.Size(76, 20);
            this.textBoxnCod_lista_precos.TabIndex = 1;
            // 
            // textBoxDescricao
            // 
            this.textBoxDescricao.Location = new System.Drawing.Point(454, 130);
            this.textBoxDescricao.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxDescricao.Name = "textBoxDescricao";
            this.textBoxDescricao.Size = new System.Drawing.Size(76, 20);
            this.textBoxDescricao.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(344, 110);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "Cod_lista_precos";
            // 
            // labelDescricao
            // 
            this.labelDescricao.AutoSize = true;
            this.labelDescricao.Location = new System.Drawing.Point(464, 110);
            this.labelDescricao.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelDescricao.Name = "labelDescricao";
            this.labelDescricao.Size = new System.Drawing.Size(55, 13);
            this.labelDescricao.TabIndex = 7;
            this.labelDescricao.Text = "Descricao";
            // 
            // buttonCriar
            // 
            this.buttonCriar.Location = new System.Drawing.Point(344, 291);
            this.buttonCriar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonCriar.Name = "buttonCriar";
            this.buttonCriar.Size = new System.Drawing.Size(56, 19);
            this.buttonCriar.TabIndex = 11;
            this.buttonCriar.Text = "Criar";
            this.buttonCriar.UseVisualStyleBackColor = true;
            this.buttonCriar.Click += new System.EventHandler(this.buttonCriar_Click);
            // 
            // buttonFiltrar
            // 
            this.buttonFiltrar.Location = new System.Drawing.Point(490, 291);
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
            this.buttonProcurar.Location = new System.Drawing.Point(490, 338);
            this.buttonProcurar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonProcurar.Name = "buttonProcurar";
            this.buttonProcurar.Size = new System.Drawing.Size(56, 19);
            this.buttonProcurar.TabIndex = 19;
            this.buttonProcurar.Text = "Procurar";
            this.buttonProcurar.UseVisualStyleBackColor = true;
            this.buttonProcurar.Click += new System.EventHandler(this.buttonProcurar_Click);
            // 
            // buttonGuardar
            // 
            this.buttonGuardar.Location = new System.Drawing.Point(344, 314);
            this.buttonGuardar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonGuardar.Name = "buttonGuardar";
            this.buttonGuardar.Size = new System.Drawing.Size(56, 19);
            this.buttonGuardar.TabIndex = 14;
            this.buttonGuardar.Text = "Guardar";
            this.buttonGuardar.UseVisualStyleBackColor = true;
            this.buttonGuardar.Click += new System.EventHandler(this.buttonGuardar_Click);
            // 
            // buttonArtigos
            // 
            this.buttonArtigos.Location = new System.Drawing.Point(415, 291);
            this.buttonArtigos.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonArtigos.Name = "buttonArtigos";
            this.buttonArtigos.Size = new System.Drawing.Size(56, 19);
            this.buttonArtigos.TabIndex = 41;
            this.buttonArtigos.Text = "Artigos";
            this.buttonArtigos.UseVisualStyleBackColor = true;
            this.buttonArtigos.Click += new System.EventHandler(this.buttonArtigos_Click);
            // 
            // ListasDePrecos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.buttonArtigos);
            this.Controls.Add(this.buttonProcurar);
            this.Controls.Add(this.buttonCancelar);
            this.Controls.Add(this.buttonGuardar);
            this.Controls.Add(this.buttonFiltrar);
            this.Controls.Add(this.buttonCriar);
            this.Controls.Add(this.labelDescricao);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBoxDescricao);
            this.Controls.Add(this.textBoxnCod_lista_precos);
            this.Controls.Add(this.listBoxListas);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "ListasDePrecos";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ListasDePrecos";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBoxListas;
        private System.Windows.Forms.TextBox textBoxnCod_lista_precos;
        private System.Windows.Forms.TextBox textBoxDescricao;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label labelDescricao;
        private System.Windows.Forms.Button buttonCriar;
        private System.Windows.Forms.Button buttonFiltrar;
        private System.Windows.Forms.Button buttonCancelar;
        private System.Windows.Forms.Button buttonProcurar;
        private System.Windows.Forms.Button buttonGuardar;
        private System.Windows.Forms.Button buttonArtigos;
    }
}