namespace ClubeVideo
{
    partial class Form1
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
            this.labelNomeEmpresa = new System.Windows.Forms.Label();
            this.buttonArtigos = new System.Windows.Forms.Button();
            this.buttonLojas = new System.Windows.Forms.Button();
            this.buttonFuncionarios = new System.Windows.Forms.Button();
            this.buttonTerceiros = new System.Windows.Forms.Button();
            this.buttonListasDePrecos = new System.Windows.Forms.Button();
            this.buttonEmpresa = new System.Windows.Forms.Button();
            this.labelNomeFunc = new System.Windows.Forms.Label();
            this.buttonEnderecos = new System.Windows.Forms.Button();
            this.buttonLogin = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // labelNomeEmpresa
            // 
            this.labelNomeEmpresa.AutoSize = true;
            this.labelNomeEmpresa.Location = new System.Drawing.Point(264, 25);
            this.labelNomeEmpresa.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.labelNomeEmpresa.Name = "labelNomeEmpresa";
            this.labelNomeEmpresa.Size = new System.Drawing.Size(0, 13);
            this.labelNomeEmpresa.TabIndex = 0;
            // 
            // buttonArtigos
            // 
            this.buttonArtigos.Location = new System.Drawing.Point(114, 154);
            this.buttonArtigos.Margin = new System.Windows.Forms.Padding(2);
            this.buttonArtigos.Name = "buttonArtigos";
            this.buttonArtigos.Size = new System.Drawing.Size(120, 19);
            this.buttonArtigos.TabIndex = 1;
            this.buttonArtigos.Text = "Artigos";
            this.buttonArtigos.UseVisualStyleBackColor = true;
            this.buttonArtigos.Click += new System.EventHandler(this.buttonArtigos_Click);
            // 
            // buttonLojas
            // 
            this.buttonLojas.Location = new System.Drawing.Point(114, 223);
            this.buttonLojas.Margin = new System.Windows.Forms.Padding(2);
            this.buttonLojas.Name = "buttonLojas";
            this.buttonLojas.Size = new System.Drawing.Size(120, 19);
            this.buttonLojas.TabIndex = 2;
            this.buttonLojas.Text = "Lojas";
            this.buttonLojas.UseVisualStyleBackColor = true;
            this.buttonLojas.Click += new System.EventHandler(this.buttonLojas_Click);
            // 
            // buttonFuncionarios
            // 
            this.buttonFuncionarios.Location = new System.Drawing.Point(114, 288);
            this.buttonFuncionarios.Margin = new System.Windows.Forms.Padding(2);
            this.buttonFuncionarios.Name = "buttonFuncionarios";
            this.buttonFuncionarios.Size = new System.Drawing.Size(120, 19);
            this.buttonFuncionarios.TabIndex = 3;
            this.buttonFuncionarios.Text = "Funcionários";
            this.buttonFuncionarios.UseVisualStyleBackColor = true;
            this.buttonFuncionarios.Click += new System.EventHandler(this.buttonFuncionarios_Click);
            // 
            // buttonTerceiros
            // 
            this.buttonTerceiros.Location = new System.Drawing.Point(414, 154);
            this.buttonTerceiros.Margin = new System.Windows.Forms.Padding(2);
            this.buttonTerceiros.Name = "buttonTerceiros";
            this.buttonTerceiros.Size = new System.Drawing.Size(120, 19);
            this.buttonTerceiros.TabIndex = 4;
            this.buttonTerceiros.Text = "Terceiros";
            this.buttonTerceiros.UseVisualStyleBackColor = true;
            this.buttonTerceiros.Click += new System.EventHandler(this.buttonTerceiro_Click);
            // 
            // buttonListasDePrecos
            // 
            this.buttonListasDePrecos.Location = new System.Drawing.Point(414, 223);
            this.buttonListasDePrecos.Margin = new System.Windows.Forms.Padding(2);
            this.buttonListasDePrecos.Name = "buttonListasDePrecos";
            this.buttonListasDePrecos.Size = new System.Drawing.Size(120, 19);
            this.buttonListasDePrecos.TabIndex = 5;
            this.buttonListasDePrecos.Text = "Lista de preços";
            this.buttonListasDePrecos.UseVisualStyleBackColor = true;
            this.buttonListasDePrecos.Click += new System.EventHandler(this.buttonListaPrecos_Click);
            // 
            // buttonEmpresa
            // 
            this.buttonEmpresa.Location = new System.Drawing.Point(266, 96);
            this.buttonEmpresa.Margin = new System.Windows.Forms.Padding(2);
            this.buttonEmpresa.Name = "buttonEmpresa";
            this.buttonEmpresa.Size = new System.Drawing.Size(120, 19);
            this.buttonEmpresa.TabIndex = 7;
            this.buttonEmpresa.Text = "Empresa";
            this.buttonEmpresa.UseVisualStyleBackColor = true;
            this.buttonEmpresa.Click += new System.EventHandler(this.buttonEmpresa_Click);
            // 
            // labelNomeFunc
            // 
            this.labelNomeFunc.AutoSize = true;
            this.labelNomeFunc.Location = new System.Drawing.Point(99, 48);
            this.labelNomeFunc.Name = "labelNomeFunc";
            this.labelNomeFunc.Size = new System.Drawing.Size(0, 13);
            this.labelNomeFunc.TabIndex = 8;
            // 
            // buttonEnderecos
            // 
            this.buttonEnderecos.Location = new System.Drawing.Point(414, 288);
            this.buttonEnderecos.Margin = new System.Windows.Forms.Padding(2);
            this.buttonEnderecos.Name = "buttonEnderecos";
            this.buttonEnderecos.Size = new System.Drawing.Size(120, 19);
            this.buttonEnderecos.TabIndex = 9;
            this.buttonEnderecos.Text = "Endereços";
            this.buttonEnderecos.UseVisualStyleBackColor = true;
            this.buttonEnderecos.Click += new System.EventHandler(this.buttonEnderecos_Click);
            // 
            // buttonLogin
            // 
            this.buttonLogin.Location = new System.Drawing.Point(266, 318);
            this.buttonLogin.Name = "buttonLogin";
            this.buttonLogin.Size = new System.Drawing.Size(120, 23);
            this.buttonLogin.TabIndex = 10;
            this.buttonLogin.Text = "Criar Login";
            this.buttonLogin.UseVisualStyleBackColor = true;
            this.buttonLogin.Click += new System.EventHandler(this.buttonLogin_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.buttonLogin);
            this.Controls.Add(this.buttonEnderecos);
            this.Controls.Add(this.labelNomeFunc);
            this.Controls.Add(this.buttonEmpresa);
            this.Controls.Add(this.buttonListasDePrecos);
            this.Controls.Add(this.buttonTerceiros);
            this.Controls.Add(this.buttonFuncionarios);
            this.Controls.Add(this.buttonLojas);
            this.Controls.Add(this.buttonArtigos);
            this.Controls.Add(this.labelNomeEmpresa);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelNomeEmpresa;
        private System.Windows.Forms.Button buttonArtigos;
        private System.Windows.Forms.Button buttonLojas;
        private System.Windows.Forms.Button buttonFuncionarios;
        private System.Windows.Forms.Button buttonTerceiros;
        private System.Windows.Forms.Button buttonListasDePrecos;
        private System.Windows.Forms.Button buttonEmpresa;
        private System.Windows.Forms.Label labelNomeFunc;
        private System.Windows.Forms.Button buttonEnderecos;
        private System.Windows.Forms.Button buttonLogin;
    }
}

