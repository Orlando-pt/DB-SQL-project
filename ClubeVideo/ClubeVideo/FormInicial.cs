using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClubeVideo
{
    public partial class FormInicial : Form
    {
        private SqlConnection cn;
        public FormInicial()
        {
            InitializeComponent();
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = Connection.getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }
        
        private void buttonSubmeter_Click(object sender, EventArgs e)
        {
            String output = String.Empty;
            
            if (!verifySGBDConnection())
                return;

//            cmd.CommandText = "EXEC ClubeVideo.VERIFICAR_LOGIN @Cod_funcionario = @Cod_funcionario_, @Passe = @Passe_, @Msg_resposta = ;";
            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_VERIFICAR_LOGIN", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_funcionario", textBoxCodFuncionario.Text);
            cmd.Parameters.AddWithValue("@Passe", textBoxPassword.Text);
            cmd.Parameters.Add("@Msg_resposta", SqlDbType.NVarChar, 250);
            cmd.Parameters["@Msg_resposta"].Direction = ParameterDirection.Output;

            try
            {
                _ = cmd.ExecuteNonQuery();
            } catch (Exception ex)
            {
                throw new Exception("Erro a verificar login na base de dados. \n Mensagem erro: \n" + ex.Message);
            }

            output = (string)cmd.Parameters["@Msg_resposta"].Value;

            cn.Close();

            if (output.Equals("Login efetuado"))
            {
                // criar um método que abre o form respetivo ao login efetuado
                verificar_Empresa_Loja(textBoxCodFuncionario.Text);
            } else if (output.Equals("Password Incorreta"))
            {
                MessageBox.Show("Verifique novamente a sua palavra-passe.");
                textBoxPassword.Clear();
            } else if (output.Equals("Login invalido"))
            {
                MessageBox.Show("Campos de Login inválidos.");
                textBoxCodFuncionario.Clear();
                textBoxPassword.Clear();
            } else
            {
                MessageBox.Show("Valor de retorno da base de dados não esperado. \"" + output + "\"");
            }

            textBoxCodFuncionario.Clear();
            textBoxPassword.Clear();
        }

        private void verificar_Empresa_Loja(String cod)
        {
            int output;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_EMPRESAOULOJA", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_funcionario", cod);
            cmd.Parameters.Add("@outputt", SqlDbType.Int);
            cmd.Parameters["@outputt"].Direction = ParameterDirection.Output;

            try
            {
                _ = cmd.ExecuteNonQuery();
            } catch (Exception ex)
            {
                throw new Exception("Erro a verificar ocupação de funcionário. \nMensagem erro: " + ex.Message + "\n");
            }

            output = (int)cmd.Parameters["@outputt"].Value;
            cn.Close();

            if (output == 1)
            {
                // Abrir um formulário para funcionário de empresa
                Visible = false;
                Form1 form1 = new Form1(int.Parse(textBoxCodFuncionario.Text));

                form1.FormClosed += new FormClosedEventHandler(Form_closed);
                form1.Show();
            } else if (output == 2)
            {
                // Abrir formulário para funcionário de loja
                Visible = false;
                EmpregadoLoja empLoja = new EmpregadoLoja(int.Parse(textBoxCodFuncionario.Text));

                empLoja.FormClosed += new FormClosedEventHandler(Form_closed);
                empLoja.Show();
            } else if (output == 3)
            {
                MessageBox.Show("De momento não tem permissão para executar nenhuma operação.");
            } else
            {
                MessageBox.Show("Ocorreu um erro. O funcionário não está registado na base de dados.");
            }
        }

        private void Form_closed(object sender, FormClosedEventArgs e)
        {
            Visible = true;
        }
        
    }
}
