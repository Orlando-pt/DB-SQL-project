namespace ClubeVideo
{
    partial class LinhasDocumento
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
            this.listBoxLinhas = new System.Windows.Forms.ListBox();
            this.textBoxnLinha = new System.Windows.Forms.TextBox();
            this.textBoxdocumento = new System.Windows.Forms.TextBox();
            this.textBoxtipoDoc = new System.Windows.Forms.TextBox();
            this.textBoxartigo = new System.Windows.Forms.TextBox();
            this.textBoxquantidade = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.labeltipoDoc = new System.Windows.Forms.Label();
            this.labelartigo = new System.Windows.Forms.Label();
            this.label = new System.Windows.Forms.Label();
            this.buttonCriar = new System.Windows.Forms.Button();
            this.buttonFiltrar = new System.Windows.Forms.Button();
            this.buttonGuardar = new System.Windows.Forms.Button();
            this.buttonCancelar = new System.Windows.Forms.Button();
            this.buttonProcurar = new System.Windows.Forms.Button();
            this.label6 = new System.Windows.Forms.Label();
            this.textBoxprecoUnit = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBoxdesconto = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.labeltaxaIVA = new System.Windows.Forms.Label();
            this.textBoxvalorTotalIVA = new System.Windows.Forms.TextBox();
            this.textBoxvalorIVA = new System.Windows.Forms.TextBox();
            this.textBoxvalorMov = new System.Windows.Forms.TextBox();
            this.textBoxdataEntrega = new System.Windows.Forms.TextBox();
            this.textBoxtaxaIVA = new System.Windows.Forms.TextBox();
            this.buttonEliminar = new System.Windows.Forms.Button();
            this.label9 = new System.Windows.Forms.Label();
            this.textBoxestado = new System.Windows.Forms.TextBox();
            this.buttonProdutos = new System.Windows.Forms.Button();
            this.buttonTerminar = new System.Windows.Forms.Button();
            this.buttonAtualizar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // listBoxLinhas
            // 
            this.listBoxLinhas.FormattingEnabled = true;
            this.listBoxLinhas.Location = new System.Drawing.Point(0, -1);
            this.listBoxLinhas.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.listBoxLinhas.Name = "listBoxLinhas";
            this.listBoxLinhas.Size = new System.Drawing.Size(268, 368);
            this.listBoxLinhas.TabIndex = 0;
            this.listBoxLinhas.SelectedIndexChanged += new System.EventHandler(this.listBoxLojas_SelectedIndexChanged);
            // 
            // textBoxnLinha
            // 
            this.textBoxnLinha.Location = new System.Drawing.Point(297, 40);
            this.textBoxnLinha.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxnLinha.Name = "textBoxnLinha";
            this.textBoxnLinha.Size = new System.Drawing.Size(76, 20);
            this.textBoxnLinha.TabIndex = 1;
            // 
            // textBoxdocumento
            // 
            this.textBoxdocumento.Location = new System.Drawing.Point(404, 40);
            this.textBoxdocumento.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxdocumento.Name = "textBoxdocumento";
            this.textBoxdocumento.Size = new System.Drawing.Size(76, 20);
            this.textBoxdocumento.TabIndex = 2;
            // 
            // textBoxtipoDoc
            // 
            this.textBoxtipoDoc.Location = new System.Drawing.Point(514, 40);
            this.textBoxtipoDoc.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxtipoDoc.Name = "textBoxtipoDoc";
            this.textBoxtipoDoc.Size = new System.Drawing.Size(76, 20);
            this.textBoxtipoDoc.TabIndex = 3;
            this.textBoxtipoDoc.Click += new System.EventHandler(this.labeltipoDoc_Click);
            // 
            // textBoxartigo
            // 
            this.textBoxartigo.Location = new System.Drawing.Point(296, 89);
            this.textBoxartigo.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxartigo.Name = "textBoxartigo";
            this.textBoxartigo.Size = new System.Drawing.Size(76, 20);
            this.textBoxartigo.TabIndex = 4;
            // 
            // textBoxquantidade
            // 
            this.textBoxquantidade.Location = new System.Drawing.Point(404, 89);
            this.textBoxquantidade.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxquantidade.Name = "textBoxquantidade";
            this.textBoxquantidade.Size = new System.Drawing.Size(76, 20);
            this.textBoxquantidade.TabIndex = 5;
            this.textBoxquantidade.TextChanged += new System.EventHandler(this.textBoxCod_endereco_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(310, 20);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(39, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "nLinha";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(415, 20);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(60, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "documento";
            // 
            // labeltipoDoc
            // 
            this.labeltipoDoc.AutoSize = true;
            this.labeltipoDoc.Location = new System.Drawing.Point(536, 24);
            this.labeltipoDoc.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labeltipoDoc.Name = "labeltipoDoc";
            this.labeltipoDoc.Size = new System.Drawing.Size(44, 13);
            this.labeltipoDoc.TabIndex = 8;
            this.labeltipoDoc.Text = "tipoDoc";
            this.labeltipoDoc.Click += new System.EventHandler(this.labeltipoDoc_Click);
            // 
            // labelartigo
            // 
            this.labelartigo.AutoSize = true;
            this.labelartigo.Location = new System.Drawing.Point(310, 70);
            this.labelartigo.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelartigo.Name = "labelartigo";
            this.labelartigo.Size = new System.Drawing.Size(33, 13);
            this.labelartigo.TabIndex = 9;
            this.labelartigo.Text = "artigo";
            this.labelartigo.Click += new System.EventHandler(this.labelartigo_Click);
            // 
            // label
            // 
            this.label.AutoSize = true;
            this.label.Location = new System.Drawing.Point(412, 70);
            this.label.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label.Name = "label";
            this.label.Size = new System.Drawing.Size(60, 13);
            this.label.TabIndex = 10;
            this.label.Text = "quantidade";
            // 
            // buttonCriar
            // 
            this.buttonCriar.Location = new System.Drawing.Point(344, 270);
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
            this.buttonFiltrar.Location = new System.Drawing.Point(490, 270);
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
            this.buttonGuardar.Location = new System.Drawing.Point(344, 306);
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
            this.label6.Location = new System.Drawing.Point(526, 70);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(53, 13);
            this.label6.TabIndex = 21;
            this.label6.Text = "precoUnit";
            // 
            // textBoxprecoUnit
            // 
            this.textBoxprecoUnit.Location = new System.Drawing.Point(515, 89);
            this.textBoxprecoUnit.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxprecoUnit.Name = "textBoxprecoUnit";
            this.textBoxprecoUnit.Size = new System.Drawing.Size(76, 20);
            this.textBoxprecoUnit.TabIndex = 20;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(536, 165);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 13);
            this.label3.TabIndex = 35;
            this.label3.Text = "desconto";
            // 
            // textBoxdesconto
            // 
            this.textBoxdesconto.Location = new System.Drawing.Point(514, 184);
            this.textBoxdesconto.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxdesconto.Name = "textBoxdesconto";
            this.textBoxdesconto.Size = new System.Drawing.Size(76, 20);
            this.textBoxdesconto.TabIndex = 34;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(403, 165);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(71, 13);
            this.label4.TabIndex = 33;
            this.label4.Text = "valorTotalIVA";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(309, 165);
            this.label5.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(47, 13);
            this.label5.TabIndex = 32;
            this.label5.Text = "valorIVA";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(534, 119);
            this.label7.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(51, 13);
            this.label7.TabIndex = 31;
            this.label7.Text = "valorMov";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(413, 115);
            this.label8.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(65, 13);
            this.label8.TabIndex = 30;
            this.label8.Text = "dataEntrega";
            // 
            // labeltaxaIVA
            // 
            this.labeltaxaIVA.AutoSize = true;
            this.labeltaxaIVA.Location = new System.Drawing.Point(308, 115);
            this.labeltaxaIVA.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labeltaxaIVA.Name = "labeltaxaIVA";
            this.labeltaxaIVA.Size = new System.Drawing.Size(44, 13);
            this.labeltaxaIVA.TabIndex = 29;
            this.labeltaxaIVA.Text = "taxaIVA";
            // 
            // textBoxvalorTotalIVA
            // 
            this.textBoxvalorTotalIVA.Location = new System.Drawing.Point(403, 184);
            this.textBoxvalorTotalIVA.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxvalorTotalIVA.Name = "textBoxvalorTotalIVA";
            this.textBoxvalorTotalIVA.Size = new System.Drawing.Size(76, 20);
            this.textBoxvalorTotalIVA.TabIndex = 28;
            // 
            // textBoxvalorIVA
            // 
            this.textBoxvalorIVA.Location = new System.Drawing.Point(294, 184);
            this.textBoxvalorIVA.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxvalorIVA.Name = "textBoxvalorIVA";
            this.textBoxvalorIVA.Size = new System.Drawing.Size(76, 20);
            this.textBoxvalorIVA.TabIndex = 27;
            // 
            // textBoxvalorMov
            // 
            this.textBoxvalorMov.Location = new System.Drawing.Point(513, 135);
            this.textBoxvalorMov.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxvalorMov.Name = "textBoxvalorMov";
            this.textBoxvalorMov.Size = new System.Drawing.Size(76, 20);
            this.textBoxvalorMov.TabIndex = 26;
            // 
            // textBoxdataEntrega
            // 
            this.textBoxdataEntrega.Location = new System.Drawing.Point(403, 135);
            this.textBoxdataEntrega.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxdataEntrega.Name = "textBoxdataEntrega";
            this.textBoxdataEntrega.Size = new System.Drawing.Size(76, 20);
            this.textBoxdataEntrega.TabIndex = 25;
            // 
            // textBoxtaxaIVA
            // 
            this.textBoxtaxaIVA.Location = new System.Drawing.Point(296, 135);
            this.textBoxtaxaIVA.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxtaxaIVA.Name = "textBoxtaxaIVA";
            this.textBoxtaxaIVA.Size = new System.Drawing.Size(76, 20);
            this.textBoxtaxaIVA.TabIndex = 24;
            // 
            // buttonEliminar
            // 
            this.buttonEliminar.Location = new System.Drawing.Point(344, 337);
            this.buttonEliminar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonEliminar.Name = "buttonEliminar";
            this.buttonEliminar.Size = new System.Drawing.Size(56, 19);
            this.buttonEliminar.TabIndex = 36;
            this.buttonEliminar.Text = "Eliminar";
            this.buttonEliminar.UseVisualStyleBackColor = true;
            this.buttonEliminar.Click += new System.EventHandler(this.buttonEliminar_Click);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(423, 213);
            this.label9.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(39, 13);
            this.label9.TabIndex = 38;
            this.label9.Text = "estado";
            // 
            // textBoxestado
            // 
            this.textBoxestado.Location = new System.Drawing.Point(405, 232);
            this.textBoxestado.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.textBoxestado.Name = "textBoxestado";
            this.textBoxestado.Size = new System.Drawing.Size(76, 20);
            this.textBoxestado.TabIndex = 37;
            // 
            // buttonProdutos
            // 
            this.buttonProdutos.Location = new System.Drawing.Point(417, 306);
            this.buttonProdutos.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonProdutos.Name = "buttonProdutos";
            this.buttonProdutos.Size = new System.Drawing.Size(56, 19);
            this.buttonProdutos.TabIndex = 39;
            this.buttonProdutos.Text = "Produtos";
            this.buttonProdutos.UseVisualStyleBackColor = true;
            this.buttonProdutos.Click += new System.EventHandler(this.buttonProdutos_Click);
            // 
            // buttonTerminar
            // 
            this.buttonTerminar.Location = new System.Drawing.Point(490, 306);
            this.buttonTerminar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonTerminar.Name = "buttonTerminar";
            this.buttonTerminar.Size = new System.Drawing.Size(56, 19);
            this.buttonTerminar.TabIndex = 40;
            this.buttonTerminar.Text = "Terminar";
            this.buttonTerminar.UseVisualStyleBackColor = true;
            this.buttonTerminar.Click += new System.EventHandler(this.buttonTerminar_Click);
            // 
            // buttonAtualizar
            // 
            this.buttonAtualizar.Location = new System.Drawing.Point(415, 270);
            this.buttonAtualizar.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.buttonAtualizar.Name = "buttonAtualizar";
            this.buttonAtualizar.Size = new System.Drawing.Size(56, 19);
            this.buttonAtualizar.TabIndex = 44;
            this.buttonAtualizar.Text = "Atualizar";
            this.buttonAtualizar.UseVisualStyleBackColor = true;
            this.buttonAtualizar.Click += new System.EventHandler(this.buttonAtualizar_Click);
            // 
            // LinhasDocumento
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.buttonAtualizar);
            this.Controls.Add(this.buttonTerminar);
            this.Controls.Add(this.buttonProdutos);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.textBoxestado);
            this.Controls.Add(this.buttonEliminar);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBoxdesconto);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.labeltaxaIVA);
            this.Controls.Add(this.textBoxvalorTotalIVA);
            this.Controls.Add(this.textBoxvalorIVA);
            this.Controls.Add(this.textBoxvalorMov);
            this.Controls.Add(this.textBoxdataEntrega);
            this.Controls.Add(this.textBoxtaxaIVA);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.textBoxprecoUnit);
            this.Controls.Add(this.buttonProcurar);
            this.Controls.Add(this.buttonCancelar);
            this.Controls.Add(this.buttonGuardar);
            this.Controls.Add(this.buttonFiltrar);
            this.Controls.Add(this.buttonCriar);
            this.Controls.Add(this.label);
            this.Controls.Add(this.labelartigo);
            this.Controls.Add(this.labeltipoDoc);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBoxquantidade);
            this.Controls.Add(this.textBoxartigo);
            this.Controls.Add(this.textBoxtipoDoc);
            this.Controls.Add(this.textBoxdocumento);
            this.Controls.Add(this.textBoxnLinha);
            this.Controls.Add(this.listBoxLinhas);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "LinhasDocumento";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "LinhasDocumento";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox listBoxLinhas;
        private System.Windows.Forms.TextBox textBoxnLinha;
        private System.Windows.Forms.TextBox textBoxdocumento;
        private System.Windows.Forms.TextBox textBoxtipoDoc;
        private System.Windows.Forms.TextBox textBoxartigo;
        private System.Windows.Forms.TextBox textBoxquantidade;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label labeltipoDoc;
        private System.Windows.Forms.Label labelartigo;
        private System.Windows.Forms.Label label;
        private System.Windows.Forms.Button buttonCriar;
        private System.Windows.Forms.Button buttonFiltrar;
        private System.Windows.Forms.Button buttonGuardar;
        private System.Windows.Forms.Button buttonCancelar;
        private System.Windows.Forms.Button buttonProcurar;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox textBoxprecoUnit;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBoxdesconto;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label labeltaxaIVA;
        private System.Windows.Forms.TextBox textBoxvalorTotalIVA;
        private System.Windows.Forms.TextBox textBoxvalorIVA;
        private System.Windows.Forms.TextBox textBoxvalorMov;
        private System.Windows.Forms.TextBox textBoxdataEntrega;
        private System.Windows.Forms.TextBox textBoxtaxaIVA;
        private System.Windows.Forms.Button buttonEliminar;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox textBoxestado;
        private System.Windows.Forms.Button buttonProdutos;
        private System.Windows.Forms.Button buttonTerminar;
        private System.Windows.Forms.Button buttonAtualizar;
    }
}