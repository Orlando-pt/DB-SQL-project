namespace ClubeVideo
{
    partial class FormInicial
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
            this.textBoxCodFuncionario = new System.Windows.Forms.TextBox();
            this.buttonSubmeter = new System.Windows.Forms.Button();
            this.labelCodFunc = new System.Windows.Forms.Label();
            this.labelPassword = new System.Windows.Forms.Label();
            this.textBoxPassword = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // textBoxCodFuncionario
            // 
            this.textBoxCodFuncionario.Location = new System.Drawing.Point(237, 110);
            this.textBoxCodFuncionario.Name = "textBoxCodFuncionario";
            this.textBoxCodFuncionario.Size = new System.Drawing.Size(100, 20);
            this.textBoxCodFuncionario.TabIndex = 1;
            // 
            // buttonSubmeter
            // 
            this.buttonSubmeter.Location = new System.Drawing.Point(253, 191);
            this.buttonSubmeter.Name = "buttonSubmeter";
            this.buttonSubmeter.Size = new System.Drawing.Size(75, 23);
            this.buttonSubmeter.TabIndex = 3;
            this.buttonSubmeter.Text = "Submeter";
            this.buttonSubmeter.UseVisualStyleBackColor = true;
            this.buttonSubmeter.Click += new System.EventHandler(this.buttonSubmeter_Click);
            // 
            // labelCodFunc
            // 
            this.labelCodFunc.AutoSize = true;
            this.labelCodFunc.Location = new System.Drawing.Point(237, 91);
            this.labelCodFunc.Name = "labelCodFunc";
            this.labelCodFunc.Size = new System.Drawing.Size(116, 13);
            this.labelCodFunc.TabIndex = 4;
            this.labelCodFunc.Text = "Código de Funcionário:";
            // 
            // labelPassword
            // 
            this.labelPassword.AutoSize = true;
            this.labelPassword.Location = new System.Drawing.Point(237, 149);
            this.labelPassword.Name = "labelPassword";
            this.labelPassword.Size = new System.Drawing.Size(56, 13);
            this.labelPassword.TabIndex = 5;
            this.labelPassword.Text = "Password:";
            // 
            // textBoxPassword
            // 
            this.textBoxPassword.Location = new System.Drawing.Point(237, 165);
            this.textBoxPassword.Name = "textBoxPassword";
            this.textBoxPassword.PasswordChar = '*';
            this.textBoxPassword.Size = new System.Drawing.Size(100, 20);
            this.textBoxPassword.TabIndex = 2;
            // 
            // FormInicial
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(600, 366);
            this.Controls.Add(this.textBoxPassword);
            this.Controls.Add(this.labelPassword);
            this.Controls.Add(this.labelCodFunc);
            this.Controls.Add(this.buttonSubmeter);
            this.Controls.Add(this.textBoxCodFuncionario);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "FormInicial";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormInicial";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.TextBox textBoxCodFuncionario;
        private System.Windows.Forms.Button buttonSubmeter;
        private System.Windows.Forms.Label labelCodFunc;
        private System.Windows.Forms.Label labelPassword;
        private System.Windows.Forms.TextBox textBoxPassword;
    }
}