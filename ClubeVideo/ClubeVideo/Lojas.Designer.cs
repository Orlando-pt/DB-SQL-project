namespace ClubeVideo
{
    partial class Lojas
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
            this.listBoxLojas = new System.Windows.Forms.ListBox();
            this.textBoxCod_loja = new System.Windows.Forms.TextBox();
            this.textBoxNome_loja = new System.Windows.Forms.TextBox();
            this.textBoxE_mail = new System.Windows.Forms.TextBox();
            this.textBoxTelefone = new System.Windows.Forms.TextBox();
            this.textBoxCod_endereco = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.labelCod_endereco = new System.Windows.Forms.Label();
            this.buttonCriar = new System.Windows.Forms.Button();
            this.buttonEditar = new System.Windows.Forms.Button();
            this.buttonFiltrar = new System.Windows.Forms.Button();
            this.buttonGuardar = new System.Windows.Forms.Button();
            this.buttonFuncionarios = new System.Windows.Forms.Button();
            this.buttonProdutos = new System.Windows.Forms.Button();
            this.buttonCancelar = new System.Windows.Forms.Button();
            this.buttonProcurar = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.textBoxativa = new System.Windows.Forms.TextBox();
            this.buttonEnderecos = new System.Windows.Forms.Button();
            this.buttonDocumentos = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // listBoxLojas
            // 
            this.listBoxLojas.FormattingEnabled = true;
            this.listBoxLojas.Location = new System.Drawing.Point(0, -1);
            this.listBoxLojas.Margin = new System.Windows.Forms.Padding(2);
            this.listBoxLojas.Name = "listBoxLojas";
            this.listBoxLojas.Size = new System.Drawing.Size(268, 368);
            this.listBoxLojas.TabIndex = 0;
            this.listBoxLojas.SelectedIndexChanged += new System.EventHandler(this.listBoxLojas_SelectedIndexChanged);
            // 
            // textBoxCod_loja
            // 
            this.textBoxCod_loja.Location = new System.Drawing.Point(295, 123);
            this.textBoxCod_loja.Margin = new System.Windows.Forms.Padding(2);
            this.textBoxCod_loja.Name = "textBoxCod_loja";
            this.textBoxCod_loja.Size = new System.Drawing.Size(76, 20);
            this.textBoxCod_loja.TabIndex = 1;
            // 
            // textBoxNome_loja
            // 
            this.textBoxNome_loja.Location = new System.Drawing.Point(402, 123);
            this.textBoxNome_loja.Margin = new System.Windows.Forms.Padding(2);
            this.textBoxNome_loja.Name = "textBoxNome_loja";
            this.textBoxNome_loja.Size = new System.Drawing.Size(76, 20);
            this.textBoxNome_loja.TabIndex = 2;
            // 
            // textBoxE_mail
            // 
            this.textBoxE_mail.Location = new System.Drawing.Point(512, 123);
            this.textBoxE_mail.Margin = new System.Windows.Forms.Padding(2);
            this.textBoxE_mail.Name = "textBoxE_mail";
            this.textBoxE_mail.Size = new System.Drawing.Size(76, 20);
            this.textBoxE_mail.TabIndex = 3;
            // 
            // textBoxTelefone
            // 
            this.textBoxTelefone.Location = new System.Drawing.Point(292, 187);
            this.textBoxTelefone.Margin = new System.Windows.Forms.Padding(2);
            this.textBoxTelefone.Name = "textBoxTelefone";
            this.textBoxTelefone.Size = new System.Drawing.Size(76, 20);
            this.textBoxTelefone.TabIndex = 4;
            // 
            // textBoxCod_endereco
            // 
            this.textBoxCod_endereco.Location = new System.Drawing.Point(401, 187);
            this.textBoxCod_endereco.Margin = new System.Windows.Forms.Padding(2);
            this.textBoxCod_endereco.Name = "textBoxCod_endereco";
            this.textBoxCod_endereco.Size = new System.Drawing.Size(76, 20);
            this.textBoxCod_endereco.TabIndex = 5;
            this.textBoxCod_endereco.TextChanged += new System.EventHandler(this.textBoxCod_endereco_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(308, 103);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "Cod_loja";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(412, 103);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "Nome_loja";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(533, 106);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(38, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "E_mail";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(308, 167);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(49, 13);
            this.label4.TabIndex = 9;
            this.label4.Text = "Telefone";
            // 
            // labelCod_endereco
            // 
            this.labelCod_endereco.AutoSize = true;
            this.labelCod_endereco.Location = new System.Drawing.Point(401, 167);
            this.labelCod_endereco.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelCod_endereco.Name = "labelCod_endereco";
            this.labelCod_endereco.Size = new System.Drawing.Size(77, 13);
            this.labelCod_endereco.TabIndex = 10;
            this.labelCod_endereco.Text = "Cod_endereco";
            this.labelCod_endereco.Click += new System.EventHandler(this.labelCod_endereco_Click);
            // 
            // buttonCriar
            // 
            this.buttonCriar.Location = new System.Drawing.Point(344, 270);
            this.buttonCriar.Margin = new System.Windows.Forms.Padding(2);
            this.buttonCriar.Name = "buttonCriar";
            this.buttonCriar.Size = new System.Drawing.Size(56, 19);
            this.buttonCriar.TabIndex = 11;
            this.buttonCriar.Text = "Criar";
            this.buttonCriar.UseVisualStyleBackColor = true;
            this.buttonCriar.Click += new System.EventHandler(this.buttonCriar_Click);
            // 
            // buttonEditar
            // 
            this.buttonEditar.Location = new System.Drawing.Point(415, 270);
            this.buttonEditar.Margin = new System.Windows.Forms.Padding(2);
            this.buttonEditar.Name = "buttonEditar";
            this.buttonEditar.Size = new System.Drawing.Size(56, 19);
            this.buttonEditar.TabIndex = 12;
            this.buttonEditar.Text = "Editar";
            this.buttonEditar.UseVisualStyleBackColor = true;
            this.buttonEditar.Click += new System.EventHandler(this.buttonEditar_Click);
            // 
            // buttonFiltrar
            // 
            this.buttonFiltrar.Location = new System.Drawing.Point(490, 270);
            this.buttonFiltrar.Margin = new System.Windows.Forms.Padding(2);
            this.buttonFiltrar.Name = "buttonFiltrar";
            this.buttonFiltrar.Size = new System.Drawing.Size(56, 19);
            this.buttonFiltrar.TabIndex = 13;
            this.buttonFiltrar.Text = "Filtrar";
            this.buttonFiltrar.UseVisualStyleBackColor = true;
            this.buttonFiltrar.Click += new System.EventHandler(this.buttonFiltrar_Click);
            // 
            // buttonGuardar
            // 
            this.buttonGuardar.Location = new System.Drawing.Point(344, 306);
            this.buttonGuardar.Margin = new System.Windows.Forms.Padding(2);
            this.buttonGuardar.Name = "buttonGuardar";
            this.buttonGuardar.Size = new System.Drawing.Size(56, 19);
            this.buttonGuardar.TabIndex = 14;
            this.buttonGuardar.Text = "Guardar";
            this.buttonGuardar.UseVisualStyleBackColor = true;
            this.buttonGuardar.Click += new System.EventHandler(this.buttonGuardar_Click);
            // 
            // buttonFuncionarios
            // 
            this.buttonFuncionarios.Location = new System.Drawing.Point(490, 337);
            this.buttonFuncionarios.Margin = new System.Windows.Forms.Padding(2);
            this.buttonFuncionarios.Name = "buttonFuncionarios";
            this.buttonFuncionarios.Size = new System.Drawing.Size(69, 19);
            this.buttonFuncionarios.TabIndex = 15;
            this.buttonFuncionarios.Text = "Funcionário";
            this.buttonFuncionarios.UseVisualStyleBackColor = true;
            this.buttonFuncionarios.Click += new System.EventHandler(this.buttonFuncionarios_Click);
            // 
            // buttonProdutos
            // 
            this.buttonProdutos.Location = new System.Drawing.Point(415, 337);
            this.buttonProdutos.Margin = new System.Windows.Forms.Padding(2);
            this.buttonProdutos.Name = "buttonProdutos";
            this.buttonProdutos.Size = new System.Drawing.Size(56, 19);
            this.buttonProdutos.TabIndex = 16;
            this.buttonProdutos.Text = "Produtos";
            this.buttonProdutos.UseVisualStyleBackColor = true;
            this.buttonProdutos.Click += new System.EventHandler(this.buttonProdutos_Click);
            // 
            // buttonCancelar
            // 
            this.buttonCancelar.Location = new System.Drawing.Point(415, 306);
            this.buttonCancelar.Margin = new System.Windows.Forms.Padding(2);
            this.buttonCancelar.Name = "buttonCancelar";
            this.buttonCancelar.Size = new System.Drawing.Size(56, 19);
            this.buttonCancelar.TabIndex = 17;
            this.buttonCancelar.Text = "Cancelar";
            this.buttonCancelar.UseVisualStyleBackColor = true;
            this.buttonCancelar.Click += new System.EventHandler(this.buttonCancelar_Click);
            // 
            // buttonProcurar
            // 
            this.buttonProcurar.Location = new System.Drawing.Point(490, 306);
            this.buttonProcurar.Margin = new System.Windows.Forms.Padding(2);
            this.buttonProcurar.Name = "buttonProcurar";
            this.buttonProcurar.Size = new System.Drawing.Size(56, 19);
            this.buttonProcurar.TabIndex = 19;
            this.buttonProcurar.Text = "Procurar";
            this.buttonProcurar.UseVisualStyleBackColor = true;
            this.buttonProcurar.Click += new System.EventHandler(this.buttonProcurar_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(535, 167);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(30, 13);
            this.label6.TabIndex = 21;
            this.label6.Text = "ativa";
            // 
            // textBoxativa
            // 
            this.textBoxativa.Location = new System.Drawing.Point(512, 187);
            this.textBoxativa.Margin = new System.Windows.Forms.Padding(2);
            this.textBoxativa.Name = "textBoxativa";
            this.textBoxativa.Size = new System.Drawing.Size(76, 20);
            this.textBoxativa.TabIndex = 20;
            // 
            // buttonEnderecos
            // 
            this.buttonEnderecos.Location = new System.Drawing.Point(503, 32);
            this.buttonEnderecos.Margin = new System.Windows.Forms.Padding(2);
            this.buttonEnderecos.Name = "buttonEnderecos";
            this.buttonEnderecos.Size = new System.Drawing.Size(68, 19);
            this.buttonEnderecos.TabIndex = 22;
            this.buttonEnderecos.Text = "Endereços";
            this.buttonEnderecos.UseVisualStyleBackColor = true;
            this.buttonEnderecos.Click += new System.EventHandler(this.buttonEnderecos_Click);
            // 
            // buttonDocumentos
            // 
            this.buttonDocumentos.Location = new System.Drawing.Point(333, 337);
            this.buttonDocumentos.Margin = new System.Windows.Forms.Padding(2);
            this.buttonDocumentos.Name = "buttonDocumentos";
            this.buttonDocumentos.Size = new System.Drawing.Size(68, 19);
            this.buttonDocumentos.TabIndex = 23;
            this.buttonDocumentos.Text = "Documentos";
            this.buttonDocumentos.UseVisualStyleBackColor = true;
            this.buttonDocumentos.Click += new System.EventHandler(this.buttonDocumentos_Click);
            // 
            // Lojas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.buttonDocumentos);
            this.Controls.Add(this.buttonEnderecos);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.textBoxativa);
            this.Controls.Add(this.buttonProcurar);
            this.Controls.Add(this.buttonCancelar);
            this.Controls.Add(this.buttonProdutos);
            this.Controls.Add(this.buttonFuncionarios);
            this.Controls.Add(this.buttonGuardar);
            this.Controls.Add(this.buttonFiltrar);
            this.Controls.Add(this.buttonEditar);
            this.Controls.Add(this.buttonCriar);
            this.Controls.Add(this.labelCod_endereco);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBoxCod_endereco);
            this.Controls.Add(this.textBoxTelefone);
            this.Controls.Add(this.textBoxE_mail);
            this.Controls.Add(this.textBoxNome_loja);
            this.Controls.Add(this.textBoxCod_loja);
            this.Controls.Add(this.listBoxLojas);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "Lojas";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Lojas";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBoxLojas;
        private System.Windows.Forms.TextBox textBoxCod_loja;
        private System.Windows.Forms.TextBox textBoxNome_loja;
        private System.Windows.Forms.TextBox textBoxE_mail;
        private System.Windows.Forms.TextBox textBoxTelefone;
        private System.Windows.Forms.TextBox textBoxCod_endereco;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label labelCod_endereco;
        private System.Windows.Forms.Button buttonCriar;
        private System.Windows.Forms.Button buttonEditar;
        private System.Windows.Forms.Button buttonFiltrar;
        private System.Windows.Forms.Button buttonGuardar;
        private System.Windows.Forms.Button buttonFuncionarios;
        private System.Windows.Forms.Button buttonProdutos;
        private System.Windows.Forms.Button buttonCancelar;
        private System.Windows.Forms.Button buttonProcurar;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox textBoxativa;
        private System.Windows.Forms.Button buttonEnderecos;
        private System.Windows.Forms.Button buttonDocumentos;
    }
}