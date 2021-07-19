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
    public partial class CriarEndereco : Form
    {
        private SqlConnection cn;
        public CriarEndereco()
        {
            InitializeComponent();
        }

        private void CriarEndereco_Load(object sender, EventArgs e)
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

        private void buttonSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                _ = salvarEndereco();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public bool salvarEndereco()
        {
            Endereco endereco = new Endereco();
            try
            {
                endereco.nEndereco = textBoxNrEndereco.Text;
                endereco.morada = textBoxMorada.Text;
                endereco.codigoPostal = textBoxCodPostal.Text;
                endereco.localidade = textBoxLocalidade.Text;
                endereco.distrito = textBoxDistrito.Text;
                endereco.concelho = textBoxConcelho.Text;
                endereco.freguesia = textBoxFreguesia.Text;
                endereco.pais = textBoxPais.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
            
            submeter_endereco(endereco);          
                
            return true;
        }

        private void submeter_endereco(Endereco e)
        {
            String output = String.Empty;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_CriarEndereco", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nEndereco", e.nEndereco);
            cmd.Parameters.AddWithValue("@morada", e.morada);
            cmd.Parameters.AddWithValue("@codigoPostal", e.codigoPostal);
            cmd.Parameters.AddWithValue("@localidade", e.localidade);
            cmd.Parameters.AddWithValue("@distrito", e.distrito);
            cmd.Parameters.AddWithValue("@concelho", e.concelho);
            cmd.Parameters.AddWithValue("@freguesia", e.freguesia);
            cmd.Parameters.AddWithValue("@pais", e.pais);

            cmd.Parameters.Add("@Msg_resposta", SqlDbType.NVarChar, 250);
            cmd.Parameters["@Msg_resposta"].Direction = ParameterDirection.Output;

            try
            {
                _ = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Erro a verificar login na base de dados. \n Mensagem erro: \n" + ex.Message);
            }

            output = (string)cmd.Parameters["@Msg_resposta"].Value;

            cn.Close();

            if (!output.Equals("ok"))
            {
                MessageBox.Show(output, "ERROR!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                MessageBox.Show("Preencha novamente os campos");
                ClearFields();
                return;
            }
            MessageBox.Show("Operação efetuada com sucesso.");
            this.Close();
        }
        public void ClearFields()
        {
            textBoxLocalidade.Text = "";
            textBoxNrEndereco.Text = "";
            textBoxMorada.Text = "";
            textBoxCodPostal.Text = "";
            textBoxDistrito.Text = "";
            textBoxConcelho.Text = "";
            textBoxFreguesia.Text = "";
            textBoxPais.Text = "";
        }
    }
}
