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
    public partial class Login : Form
    {
        private SqlConnection cn;
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String cod = textBoxCodFuncionario.Text;
            String pass1 = textBoxPassword1.Text;
            String pass2 = textBoxPassword2.Text;

            if (!cod.Equals("") && !pass1.Equals(""))
            {
                if (pass1.Equals(pass2))
                {
                    submeter_login(cod, pass1);
                } else
                {
                    MessageBox.Show("As palavras-passe não correspondem.");
                    erase_text();
                    textBoxCodFuncionario.Text = cod;
                }
            } else
            {
                erase_text();
                MessageBox.Show("Introduza primeiro os parâmetros.");
            }
        }

        private void erase_text()
        {
            textBoxCodFuncionario.Text = "";
            textBoxPassword1.Text = "";
            textBoxPassword2.Text = "";
        }

        private void Login_Load(object sender, EventArgs e)
        {
            cn = Connection.getSGBDConnection();
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = Connection.getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void submeter_login(String cod_funcionario, String password)
        {
            String output = String.Empty;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_ADICIONAR_LOGIN", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_funcionario", cod_funcionario);
            cmd.Parameters.AddWithValue("@Passe", password);
            


            cmd.Parameters.Add("@Msg_resposta", SqlDbType.NVarChar, 250);
            cmd.Parameters["@Msg_resposta"].Direction = ParameterDirection.Output;

            try
            {
                _ = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Erro a submeter empresa. \n Mensagem erro: \n" + ex.Message);
            }

            output = (string)cmd.Parameters["@Msg_resposta"].Value;

            cn.Close();
            
            if (!output.Equals("ok"))
            {
                MessageBox.Show(output, "ERROR!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                tentar_novamente();
            } else
            {
                MessageBox.Show("Operação efetuada com sucesso.");
                close_or_continue();
            }            
        }

        private void tentar_novamente()
        {
            DialogResult res = MessageBox.Show("Quer tentar novamente?", "Login", MessageBoxButtons.YesNo);
            if (res == DialogResult.Yes)
            {
                erase_text();
            }
            else
            {
                Close();
            }
        }

        private void close_or_continue()
        {
            DialogResult res = MessageBox.Show("Quer continuar a adicionar login's?", "Login", MessageBoxButtons.YesNo);
            if (res == DialogResult.Yes)
            {
                erase_text();
            } else
            {
                Close();
            }
        }
    }
}
