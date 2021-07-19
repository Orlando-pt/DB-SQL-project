namespace ClubeVideo
{
    partial class Documentos
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
            this.listBoxDocumentos = new System.Windows.Forms.ListBox();
            this.textBoxnDocumento = new System.Windows.Forms.TextBox();
            this.textBoxtipoDoc = new System.Windows.Forms.TextBox();
            this.textBoxterceiro = new System.Windows.Forms.TextBox();
            this.textBoxloja = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.labeltipoDoc = new System.Windows.Forms.Label();
            this.labelterceiro = new System.Windows.Forms.Label();
            this.labelloja = new System.Windows.Forms.Label();
            this.buttonCriar = new System.Windows.Forms.Button();
            this.buttonFiltrar = new System.Windows.Forms.Button();
            this.buttonCancelar = new System.Windows.Forms.Button();
            this.buttonProcurar = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.textBoxdataEmissao = new System.Windows.Forms.TextBox();
            this.buttonEnderecos = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxdataVencimento = new System.Windows.Forms.TextBox();
            this.labelnVendedor = new System.Windows.Forms.Label();
            this.labeldataEntrega = new System.Windows.Forms.Label();
            this.textBoxnVendedor = new System.Windows.Forms.TextBox();
            this.textBoxdataEntrega = new System.Windows.Forms.TextBox();
            this.labelendFaturacao = new System.Windows.Forms.Label();
            this.textBoxendFaturacao = new System.Windows.Forms.TextBox();
            this.labelendEntrega = new System.Windows.Forms.Label();
            this.labelfExpedicao = new System.Windows.Forms.Label();
            this.textBoxendEntrega = new System.Windows.Forms.TextBox();
            this.textBoxfExpedicao = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.textBoxvalorTotalIVA = new System.Windows.Forms.TextBox();
            this.textBoxvalorTotal = new System.Windows.Forms.TextBox();
            this.buttonGuardar = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.textBoxestado = new System.Windows.Forms.TextBox();
            this.buttonLinhas = new System.Windows.Forms.Button();
            this.buttonEliminar = new System.Windows.Forms.Button();
            this.buttonAtualizar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // listBoxDocumentos
            // 
            this.listBoxDocumentos.FormattingEnabled = true;
            this.listBoxDocumentos.Location = new System.Drawing.Point(0, -1);
            this.listBoxDocumentos.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.listBoxDocumentos.Name = "listBoxDocumentos";
            this.listBoxDocumentos.Size = new System.Drawing.Size(268, 368);
            this.listBoxDocumentos.TabIndex = 0;
            this.listBoxDocumentos.SelectedIndexChanged += new System.EventHandler(this.listBoxLojas_SelectedIndexChanged);
            // 
            // textBoxnDocumento
            // 
            this.textBoxnDocumento.Location = new System.Drawing.Point(286, 56);
            this.textBoxnDocumento.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxnDocumento.Name = "textBoxnDocumento";
            this.textBoxnDocumento.Size = new System.Drawing.Size(76, 20);
            this.textBoxnDocumento.TabIndex = 1;
            // 
            // textBoxtipoDoc
            // 
            this.textBoxtipoDoc.Location = new System.Drawing.Point(393, 56);
            this.textBoxtipoDoc.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxtipoDoc.Name = "textBoxtipoDoc";
            this.textBoxtipoDoc.Size = new System.Drawing.Size(76, 20);
            this.textBoxtipoDoc.TabIndex = 2;
            // 
            // textBoxterceiro
            // 
            this.textBoxterceiro.Location = new System.Drawing.Point(506, 56);
            this.textBoxterceiro.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxterceiro.Name = "textBoxterceiro";
            this.textBoxterceiro.Size = new System.Drawing.Size(76, 20);
            this.textBoxterceiro.TabIndex = 4;
            // 
            // textBoxloja
            // 
            this.textBoxloja.Location = new System.Drawing.Point(285, 100);
            this.textBoxloja.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxloja.Name = "textBoxloja";
            this.textBoxloja.Size = new System.Drawing.Size(76, 20);
            this.textBoxloja.TabIndex = 5;
            this.textBoxloja.TextChanged += new System.EventHandler(this.textBoxCod_endereco_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(298, 37);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(68, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "nDocumento";
            // 
            // labeltipoDoc
            // 
            this.labeltipoDoc.AutoSize = true;
            this.labeltipoDoc.Location = new System.Drawing.Point(404, 37);
            this.labeltipoDoc.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labeltipoDoc.Name = "labeltipoDoc";
            this.labeltipoDoc.Size = new System.Drawing.Size(44, 13);
            this.labeltipoDoc.TabIndex = 7;
            this.labeltipoDoc.Text = "tipoDoc";
            this.labeltipoDoc.Click += new System.EventHandler(this.labeltipoDoc_Click);
            // 
            // labelterceiro
            // 
            this.labelterceiro.AutoSize = true;
            this.labelterceiro.Location = new System.Drawing.Point(521, 37);
            this.labelterceiro.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelterceiro.Name = "labelterceiro";
            this.labelterceiro.Size = new System.Drawing.Size(42, 13);
            this.labelterceiro.TabIndex = 9;
            this.labelterceiro.Text = "terceiro";
            this.labelterceiro.Click += new System.EventHandler(this.labelterceiro_Click);
            // 
            // labelloja
            // 
            this.labelloja.AutoSize = true;
            this.labelloja.Location = new System.Drawing.Point(316, 80);
            this.labelloja.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelloja.Name = "labelloja";
            this.labelloja.Size = new System.Drawing.Size(23, 13);
            this.labelloja.TabIndex = 10;
            this.labelloja.Text = "loja";
            this.labelloja.Click += new System.EventHandler(this.labelloja_Click);
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
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(404, 80);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(67, 13);
            this.label6.TabIndex = 21;
            this.label6.Text = "dataEmissao";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // textBoxdataEmissao
            // 
            this.textBoxdataEmissao.Location = new System.Drawing.Point(396, 100);
            this.textBoxdataEmissao.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxdataEmissao.Name = "textBoxdataEmissao";
            this.textBoxdataEmissao.Size = new System.Drawing.Size(76, 20);
            this.textBoxdataEmissao.TabIndex = 20;
            // 
            // buttonEnderecos
            // 
            this.buttonEnderecos.Location = new System.Drawing.Point(524, 10);
            this.buttonEnderecos.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonEnderecos.Name = "buttonEnderecos";
            this.buttonEnderecos.Size = new System.Drawing.Size(68, 19);
            this.buttonEnderecos.TabIndex = 22;
            this.buttonEnderecos.Text = "Endereços";
            this.buttonEnderecos.UseVisualStyleBackColor = true;
            this.buttonEnderecos.Click += new System.EventHandler(this.buttonEnderecos_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(394, 132);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(84, 13);
            this.label2.TabIndex = 28;
            this.label2.Text = "dataVencimento";
            // 
            // textBoxdataVencimento
            // 
            this.textBoxdataVencimento.Location = new System.Drawing.Point(396, 152);
            this.textBoxdataVencimento.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxdataVencimento.Name = "textBoxdataVencimento";
            this.textBoxdataVencimento.Size = new System.Drawing.Size(76, 20);
            this.textBoxdataVencimento.TabIndex = 27;
            // 
            // labelnVendedor
            // 
            this.labelnVendedor.AutoSize = true;
            this.labelnVendedor.Location = new System.Drawing.Point(296, 132);
            this.labelnVendedor.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelnVendedor.Name = "labelnVendedor";
            this.labelnVendedor.Size = new System.Drawing.Size(59, 13);
            this.labelnVendedor.TabIndex = 26;
            this.labelnVendedor.Text = "nVendedor";
            this.labelnVendedor.Click += new System.EventHandler(this.labelnVendedor_Click);
            // 
            // labeldataEntrega
            // 
            this.labeldataEntrega.AutoSize = true;
            this.labeldataEntrega.Location = new System.Drawing.Point(511, 80);
            this.labeldataEntrega.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labeldataEntrega.Name = "labeldataEntrega";
            this.labeldataEntrega.Size = new System.Drawing.Size(65, 13);
            this.labeldataEntrega.TabIndex = 25;
            this.labeldataEntrega.Text = "dataEntrega";
            // 
            // textBoxnVendedor
            // 
            this.textBoxnVendedor.Location = new System.Drawing.Point(285, 152);
            this.textBoxnVendedor.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxnVendedor.Name = "textBoxnVendedor";
            this.textBoxnVendedor.Size = new System.Drawing.Size(76, 20);
            this.textBoxnVendedor.TabIndex = 24;
            // 
            // textBoxdataEntrega
            // 
            this.textBoxdataEntrega.Location = new System.Drawing.Point(505, 100);
            this.textBoxdataEntrega.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxdataEntrega.Name = "textBoxdataEntrega";
            this.textBoxdataEntrega.Size = new System.Drawing.Size(76, 20);
            this.textBoxdataEntrega.TabIndex = 23;
            // 
            // labelendFaturacao
            // 
            this.labelendFaturacao.AutoSize = true;
            this.labelendFaturacao.Location = new System.Drawing.Point(394, 180);
            this.labelendFaturacao.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelendFaturacao.Name = "labelendFaturacao";
            this.labelendFaturacao.Size = new System.Drawing.Size(73, 13);
            this.labelendFaturacao.TabIndex = 34;
            this.labelendFaturacao.Text = "endFaturacao";
            this.labelendFaturacao.Click += new System.EventHandler(this.labelendFaturacao_Click);
            // 
            // textBoxendFaturacao
            // 
            this.textBoxendFaturacao.Location = new System.Drawing.Point(396, 200);
            this.textBoxendFaturacao.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxendFaturacao.Name = "textBoxendFaturacao";
            this.textBoxendFaturacao.Size = new System.Drawing.Size(76, 20);
            this.textBoxendFaturacao.TabIndex = 33;
            // 
            // labelendEntrega
            // 
            this.labelendEntrega.AutoSize = true;
            this.labelendEntrega.Location = new System.Drawing.Point(295, 180);
            this.labelendEntrega.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelendEntrega.Name = "labelendEntrega";
            this.labelendEntrega.Size = new System.Drawing.Size(62, 13);
            this.labelendEntrega.TabIndex = 32;
            this.labelendEntrega.Text = "endEntrega";
            this.labelendEntrega.Click += new System.EventHandler(this.labelendEntrega_Click);
            // 
            // labelfExpedicao
            // 
            this.labelfExpedicao.AutoSize = true;
            this.labelfExpedicao.Location = new System.Drawing.Point(518, 132);
            this.labelfExpedicao.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelfExpedicao.Name = "labelfExpedicao";
            this.labelfExpedicao.Size = new System.Drawing.Size(60, 13);
            this.labelfExpedicao.TabIndex = 31;
            this.labelfExpedicao.Text = "fExpedicao";
            this.labelfExpedicao.Click += new System.EventHandler(this.labelfExpedicao_Click);
            // 
            // textBoxendEntrega
            // 
            this.textBoxendEntrega.Location = new System.Drawing.Point(286, 200);
            this.textBoxendEntrega.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxendEntrega.Name = "textBoxendEntrega";
            this.textBoxendEntrega.Size = new System.Drawing.Size(76, 20);
            this.textBoxendEntrega.TabIndex = 30;
            // 
            // textBoxfExpedicao
            // 
            this.textBoxfExpedicao.Location = new System.Drawing.Point(505, 152);
            this.textBoxfExpedicao.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxfExpedicao.Name = "textBoxfExpedicao";
            this.textBoxfExpedicao.Size = new System.Drawing.Size(76, 20);
            this.textBoxfExpedicao.TabIndex = 29;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(344, 230);
            this.label10.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(71, 13);
            this.label10.TabIndex = 38;
            this.label10.Text = "valorTotalIVA";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(514, 180);
            this.label11.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(54, 13);
            this.label11.TabIndex = 37;
            this.label11.Text = "valorTotal";
            // 
            // textBoxvalorTotalIVA
            // 
            this.textBoxvalorTotalIVA.Location = new System.Drawing.Point(344, 249);
            this.textBoxvalorTotalIVA.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxvalorTotalIVA.Name = "textBoxvalorTotalIVA";
            this.textBoxvalorTotalIVA.Size = new System.Drawing.Size(76, 20);
            this.textBoxvalorTotalIVA.TabIndex = 36;
            // 
            // textBoxvalorTotal
            // 
            this.textBoxvalorTotal.Location = new System.Drawing.Point(506, 200);
            this.textBoxvalorTotal.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxvalorTotal.Name = "textBoxvalorTotal";
            this.textBoxvalorTotal.Size = new System.Drawing.Size(76, 20);
            this.textBoxvalorTotal.TabIndex = 35;
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
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(468, 230);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(39, 13);
            this.label3.TabIndex = 40;
            this.label3.Text = "estado";
            // 
            // textBoxestado
            // 
            this.textBoxestado.Location = new System.Drawing.Point(452, 249);
            this.textBoxestado.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxestado.Name = "textBoxestado";
            this.textBoxestado.Size = new System.Drawing.Size(76, 20);
            this.textBoxestado.TabIndex = 39;
            // 
            // buttonLinhas
            // 
            this.buttonLinhas.Location = new System.Drawing.Point(415, 291);
            this.buttonLinhas.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonLinhas.Name = "buttonLinhas";
            this.buttonLinhas.Size = new System.Drawing.Size(56, 19);
            this.buttonLinhas.TabIndex = 41;
            this.buttonLinhas.Text = "Linhas";
            this.buttonLinhas.UseVisualStyleBackColor = true;
            this.buttonLinhas.Click += new System.EventHandler(this.buttonLinhas_Click);
            // 
            // buttonEliminar
            // 
            this.buttonEliminar.Location = new System.Drawing.Point(344, 338);
            this.buttonEliminar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonEliminar.Name = "buttonEliminar";
            this.buttonEliminar.Size = new System.Drawing.Size(56, 19);
            this.buttonEliminar.TabIndex = 42;
            this.buttonEliminar.Text = "Eliminar";
            this.buttonEliminar.UseVisualStyleBackColor = true;
            this.buttonEliminar.Click += new System.EventHandler(this.buttonEliminar_Click);
            // 
            // buttonAtualizar
            // 
            this.buttonAtualizar.Location = new System.Drawing.Point(415, 314);
            this.buttonAtualizar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonAtualizar.Name = "buttonAtualizar";
            this.buttonAtualizar.Size = new System.Drawing.Size(56, 19);
            this.buttonAtualizar.TabIndex = 43;
            this.buttonAtualizar.Text = "Atualizar";
            this.buttonAtualizar.UseVisualStyleBackColor = true;
            this.buttonAtualizar.Click += new System.EventHandler(this.buttonAtualizar_Click);
            // 
            // Documentos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.buttonAtualizar);
            this.Controls.Add(this.buttonEliminar);
            this.Controls.Add(this.buttonLinhas);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBoxestado);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.textBoxvalorTotalIVA);
            this.Controls.Add(this.textBoxvalorTotal);
            this.Controls.Add(this.labelendFaturacao);
            this.Controls.Add(this.textBoxendFaturacao);
            this.Controls.Add(this.labelendEntrega);
            this.Controls.Add(this.labelfExpedicao);
            this.Controls.Add(this.textBoxendEntrega);
            this.Controls.Add(this.textBoxfExpedicao);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBoxdataVencimento);
            this.Controls.Add(this.labelnVendedor);
            this.Controls.Add(this.labeldataEntrega);
            this.Controls.Add(this.textBoxnVendedor);
            this.Controls.Add(this.textBoxdataEntrega);
            this.Controls.Add(this.buttonEnderecos);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.textBoxdataEmissao);
            this.Controls.Add(this.buttonProcurar);
            this.Controls.Add(this.buttonCancelar);
            this.Controls.Add(this.buttonGuardar);
            this.Controls.Add(this.buttonFiltrar);
            this.Controls.Add(this.buttonCriar);
            this.Controls.Add(this.labelloja);
            this.Controls.Add(this.labelterceiro);
            this.Controls.Add(this.labeltipoDoc);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBoxloja);
            this.Controls.Add(this.textBoxterceiro);
            this.Controls.Add(this.textBoxtipoDoc);
            this.Controls.Add(this.textBoxnDocumento);
            this.Controls.Add(this.listBoxDocumentos);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "Documentos";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Documentos";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBoxDocumentos;
        private System.Windows.Forms.TextBox textBoxnDocumento;
        private System.Windows.Forms.TextBox textBoxtipoDoc;
        private System.Windows.Forms.TextBox textBoxterceiro;
        private System.Windows.Forms.TextBox textBoxloja;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label labeltipoDoc;
        private System.Windows.Forms.Label labelterceiro;
        private System.Windows.Forms.Label labelloja;
        private System.Windows.Forms.Button buttonCriar;
        private System.Windows.Forms.Button buttonFiltrar;
        private System.Windows.Forms.Button buttonCancelar;
        private System.Windows.Forms.Button buttonProcurar;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox textBoxdataEmissao;
        private System.Windows.Forms.Button buttonEnderecos;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxdataVencimento;
        private System.Windows.Forms.Label labelnVendedor;
        private System.Windows.Forms.Label labeldataEntrega;
        private System.Windows.Forms.TextBox textBoxnVendedor;
        private System.Windows.Forms.TextBox textBoxdataEntrega;
        private System.Windows.Forms.Label labelendFaturacao;
        private System.Windows.Forms.TextBox textBoxendFaturacao;
        private System.Windows.Forms.Label labelendEntrega;
        private System.Windows.Forms.Label labelfExpedicao;
        private System.Windows.Forms.TextBox textBoxendEntrega;
        private System.Windows.Forms.TextBox textBoxfExpedicao;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox textBoxvalorTotalIVA;
        private System.Windows.Forms.TextBox textBoxvalorTotal;
        private System.Windows.Forms.Button buttonGuardar;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBoxestado;
        private System.Windows.Forms.Button buttonLinhas;
        private System.Windows.Forms.Button buttonEliminar;
        private System.Windows.Forms.Button buttonAtualizar;
    }
}