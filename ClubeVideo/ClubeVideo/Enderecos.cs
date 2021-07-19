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
    public partial class Enderecos : Form
    {
        private SqlConnection cn;
        private int endereco_atual;
        private bool criar;
        public Enderecos()
        {
            InitializeComponent();
            loadEnderecos();
            LockControls();
            ShowButtons();
        }

        private void Enderecos_Load(object sender, EventArgs e)
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

        private void loadEnderecos()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("EXEC ClubeVideo.pr_TodosEnderecos", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBoxEnderecos.Items.Clear();

            while (reader.Read())
            {
                Endereco E = new Endereco();
                E.nEndereco = reader["nEndereco"].ToString();
                E.morada = reader["morada"].ToString();
                E.codigoPostal = reader["CodigoPostal"].ToString();
                E.localidade = reader["localidade"].ToString();
                E.distrito = reader["distrito"].ToString();
                E.concelho = reader["concelho"].ToString();
                E.freguesia = reader["freguesia"].ToString();
                E.pais = reader["pais"].ToString();

                listBoxEnderecos.Items.Add(E);
            }

            cn.Close();


            endereco_atual = 0;
            Mostrar_endereco();
        }

        public void Mostrar_endereco()
        {
            if (listBoxEnderecos.Items.Count == 0 | endereco_atual < 0)
                return;
            Endereco endereco = new Endereco();

            endereco = (Endereco)listBoxEnderecos.Items[endereco_atual];

            textBoxNrEndereco.Text = endereco.nEndereco;
            textBoxMorada.Text = endereco.morada;
            textBoxCodPostal.Text = endereco.codigoPostal;
            textBoxLocalidade.Text = endereco.localidade;
            textBoxDistrito.Text = endereco.distrito;
            textBoxConcelho.Text = endereco.concelho;
            textBoxFreguesia.Text = endereco.freguesia;
            textBoxPais.Text = endereco.pais;
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

        public void HideButtons()
        {
            UnlockControls();
            buttonEditar.Visible = false;
            buttonCriar.Visible = false;
            buttonRemover.Visible = false;
            buttonSalvar.Visible = true;
            buttonCancelar.Visible = true;
        }

        public void ShowButtons()
        {
            LockControls();
            buttonEditar.Visible = true;
            buttonRemover.Visible = true;
            buttonCriar.Visible = true;
            buttonSalvar.Visible = false;
            buttonCancelar.Visible = false;
        }

        public void LockControls()
        {
            textBoxNrEndereco.ReadOnly = true;
            textBoxMorada.ReadOnly = true;
            textBoxCodPostal.ReadOnly = true;
            textBoxDistrito.ReadOnly = true;
            textBoxLocalidade.ReadOnly = true;
            textBoxConcelho.ReadOnly = true;
            textBoxFreguesia.ReadOnly = true;
            textBoxPais.ReadOnly = true;
        }

        public void UnlockControls()
        {
            textBoxNrEndereco.ReadOnly = false;
            textBoxMorada.ReadOnly = false;
            textBoxCodPostal.ReadOnly = false;
            textBoxLocalidade.ReadOnly = false;
            textBoxDistrito.ReadOnly = false;
            textBoxConcelho.ReadOnly = false;
            textBoxFreguesia.ReadOnly = false;
            textBoxPais.ReadOnly = false;
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
                throw new Exception("Erro a submeter endereço. \n Mensagem erro: \n" + ex.Message);
            }

            output = (string)cmd.Parameters["@Msg_resposta"].Value;

            cn.Close();

            if (!output.Equals("ok"))
            {
                MessageBox.Show(output, "ERROR!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            listBoxEnderecos.Items.Add(e);
            MessageBox.Show("Operação efetuada com sucesso.");
        }

        private bool salvarEndereco()
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
            if (criar) {
                submeter_endereco(endereco);
            } else
            {
                atualizar_endereco(endereco);
            }
            

            return true;
        }

        private void atualizar_endereco(Endereco e)
        {
            String output = String.Empty;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_UpdateEndereco", cn);
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
                throw new Exception("Failed to update product in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                output = (string)cmd.Parameters["@Msg_resposta"].Value;
                if (output.Equals("ok"))
                {
                    listBoxEnderecos.Items[endereco_atual] = e;
                    MessageBox.Show("Update OK");
                }
                    
                else
                    MessageBox.Show(output, "ERROR!", MessageBoxButtons.OK, MessageBoxIcon.Error);

                cn.Close();
            }
        }

        private void listBoxEnderecos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxEnderecos.SelectedIndex >= 0)
            {
                endereco_atual = listBoxEnderecos.SelectedIndex;
                Mostrar_endereco();
            }
        }

        private void buttonCriar_Click(object sender, EventArgs e)
        {
            criar = true;
            ClearFields();
            HideButtons();
            listBoxEnderecos.Enabled = false;
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
            listBoxEnderecos.Enabled = true;
            int idx = listBoxEnderecos.FindString(textBoxMorada.Text);
            listBoxEnderecos.SelectedIndex = idx;
            ShowButtons();
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxEnderecos.Enabled = true;
            if (listBoxEnderecos.Items.Count > 0)
            {
                endereco_atual = listBoxEnderecos.SelectedIndex;
                if (endereco_atual < 0)
                    endereco_atual = 0;
                Mostrar_endereco();
            }
            else
            {
                ClearFields();
                LockControls();
            }
            ShowButtons();
        }

        private void buttonEditar_Click(object sender, EventArgs e)
        {
            endereco_atual = listBoxEnderecos.SelectedIndex;
            criar = false;

            if (endereco_atual < 0)
            {
                MessageBox.Show("Please select a product to edit");
                return;
            }
            HideButtons();
            listBoxEnderecos.Enabled = false;
        }

        private void remover_endereco(String nrEndereco)
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_RemoverEndereco", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nrEndereco", nrEndereco);

            try
            {
                _ = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Falha a remover endereço. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        private void buttonRemover_Click(object sender, EventArgs e)
        {
            if (listBoxEnderecos.SelectedIndex > -1)
            {
                try
                {
                    remover_endereco(((Endereco)listBoxEnderecos.SelectedItem).nEndereco);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }
                listBoxEnderecos.Items.RemoveAt(listBoxEnderecos.SelectedIndex);
                if (endereco_atual == listBoxEnderecos.Items.Count)
                    endereco_atual = listBoxEnderecos.Items.Count - 1;
                if (endereco_atual == -1)
                {
                    ClearFields();
                    MessageBox.Show("There are no more products");
                }
                else
                {
                    Mostrar_endereco();
                }
            }
            else
            {
                MessageBox.Show("Selecione um endereço.");
                return;
            }
        }
    }
}
