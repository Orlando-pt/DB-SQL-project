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
    public partial class Empresas : Form
    {
        private SqlConnection cn;
        private int empresa_atual;

        public Empresas()
        {
            InitializeComponent();
            LockControls();
            ShowButtons();
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = Connection.getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void Empresas_Load(object sender, EventArgs e)
        {
            cn = Connection.getSGBDConnection();
            load_empresas();
        }

        private void load_empresas()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("EXEC ClubeVideo.pr_todasEmpresas", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBoxEmpresas.Items.Clear();

            while (reader.Read())
            {
                Empresa E = new Empresa();
                E.nEmpresa = reader["nEmpresa"].ToString();
                E.sigla = reader["sigla"].ToString();
                E.descricao = reader["descricao"].ToString();
                E.capitalSocial = reader["capialSocial"].ToString();
                E.NIF = reader["NIF"].ToString();
                E.telefone = reader["telefone"].ToString();
                E.endEletronico = reader["endEletronico"].ToString();
                E.ano = reader["ano"].ToString();
                E.CAE = reader["CAE"].ToString();
                E.codEndereco = reader["Cod_endereco"].ToString();

                listBoxEmpresas.Items.Add(E);
            }

            cn.Close();


            empresa_atual = 0;
            Mostrar_empresa();
        }

        private void Mostrar_empresa()
        {
            if (listBoxEmpresas.Items.Count == 0 | empresa_atual < 0)
                return;
            Empresa empresa = new Empresa();

            empresa = (Empresa)listBoxEmpresas.Items[empresa_atual];

            textBoxNEmpresa.Text = empresa.nEmpresa;
            textBoxSigla.Text = empresa.sigla;
            textBoxDescricao.Text = empresa.descricao;
            textBoxCapitalSocial.Text = empresa.capitalSocial;
            textBoxNIF.Text = empresa.NIF;
            textBoxTelefone.Text = empresa.telefone;
            textBoxEndEletronico.Text = empresa.endEletronico;
            textBoxAno.Text = empresa.ano;
            textBoxCAE.Text = empresa.CAE;
            textBoxCodEndereco.Text = empresa.codEndereco;
        }

        public void ClearFields()
        {
            textBoxNEmpresa.Text = "";
            textBoxSigla.Text = "";
            textBoxDescricao.Text = "";
            textBoxCapitalSocial.Text = "";
            textBoxNIF.Text = "";
            textBoxTelefone.Text = "";
            textBoxEndEletronico.Text = "";
            textBoxAno.Text = "";
            textBoxCAE.Text = "";
            textBoxCodEndereco.Text = "";
        }

        public void HideButtons()
        {
            UnlockControls();
            buttonEditar.Visible = false;
            buttonEscolher.Visible = false;
            buttonSalvar.Visible = true;
            buttonCancelar.Visible = true;
        }

        public void ShowButtons()
        {
            LockControls();
            buttonEditar.Visible = true;
            buttonEscolher.Visible = true;
            buttonSalvar.Visible = false;
            buttonCancelar.Visible = false;
        }

        public void LockControls()
        {
            textBoxNEmpresa.ReadOnly = true;
            textBoxSigla.ReadOnly = true;
            textBoxDescricao.ReadOnly = true;
            textBoxCapitalSocial.ReadOnly = true;
            textBoxNIF.ReadOnly = true;
            textBoxTelefone.ReadOnly = true;
            textBoxEndEletronico.ReadOnly = true;
            textBoxAno.ReadOnly = true;
            textBoxCAE.ReadOnly = true;
            textBoxCodEndereco.ReadOnly = true;
        }

        public void UnlockControls()
        {
            textBoxNEmpresa.ReadOnly = false;
            textBoxSigla.ReadOnly = false;
            textBoxDescricao.ReadOnly = false;
            textBoxCapitalSocial.ReadOnly = false;
            textBoxNIF.ReadOnly = false;
            textBoxTelefone.ReadOnly = false;
            textBoxEndEletronico.ReadOnly = false;
            textBoxAno.ReadOnly = false;
            textBoxCAE.ReadOnly = false;
            textBoxCodEndereco.ReadOnly = false;
        }

        /* Não permitir adicionar empresa
        private void submeter_empresa(Empresa e)
        {
            String output = String.Empty;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_criarEmpresa", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nEmpresa", e.nEmpresa);
            cmd.Parameters.AddWithValue("@sigla", e.sigla);
            cmd.Parameters.AddWithValue("@descricao", e.descricao);
            cmd.Parameters.AddWithValue("@capitalSocial", e.capitalSocial);
            cmd.Parameters.AddWithValue("@NIF", e.NIF);
            cmd.Parameters.AddWithValue("@telefone", e.telefone);
            cmd.Parameters.AddWithValue("@endEletronico", e.endEletronico);
            cmd.Parameters.AddWithValue("@ano", e.ano);
            cmd.Parameters.AddWithValue("@CAE", e.CAE);
            if (!e.codEndereco.Equals(""))
            {
                cmd.Parameters.AddWithValue("@codEndereco", e.codEndereco);
            }
                

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
                return;
            }
            listBoxEmpresas.Items.Add(e);
            MessageBox.Show("Operação efetuada com sucesso.");
        }*/

        private bool salvar_empresa()
        {
            Empresa empresa = new Empresa();
            try
            {
                empresa.nEmpresa = textBoxNEmpresa.Text;
                empresa.sigla = textBoxSigla.Text;
                empresa.descricao = textBoxDescricao.Text;
                empresa.capitalSocial = textBoxCapitalSocial.Text;
                empresa.NIF = textBoxNIF.Text;
                empresa.telefone = textBoxTelefone.Text;
                empresa.endEletronico = textBoxEndEletronico.Text;
                empresa.ano = textBoxAno.Text;
                empresa.CAE = textBoxCAE.Text;
                empresa.codEndereco = textBoxCodEndereco.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
            atualizar_empresa(empresa);
            listBoxEmpresas.Items[empresa_atual] = empresa;

            return true;
        }

        private void atualizar_empresa(Empresa e)
        {
            String output = String.Empty;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_atualizarEmpresa", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nEmpresa", e.nEmpresa);
            cmd.Parameters.AddWithValue("@sigla", e.sigla);
            cmd.Parameters.AddWithValue("@descricao", e.descricao);
            cmd.Parameters.AddWithValue("@capitalSocial", e.capitalSocial);
            cmd.Parameters.AddWithValue("@telefone", e.telefone);
            cmd.Parameters.AddWithValue("@endEletronico", e.endEletronico);
            cmd.Parameters.AddWithValue("@CAE", e.CAE);
            if (!e.codEndereco.Equals(""))
            {
                cmd.Parameters.AddWithValue("@codEndereco", e.codEndereco);
            }

            cmd.Parameters.Add("@Msg_resposta", SqlDbType.NVarChar, 250);
            cmd.Parameters["@Msg_resposta"].Direction = ParameterDirection.Output;

            try
            {
                _ = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to update Company in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                output = (string)cmd.Parameters["@Msg_resposta"].Value;
                if (output.Equals("ok"))
                    MessageBox.Show("Update OK");
                else
                    MessageBox.Show(output, "ERROR!", MessageBoxButtons.OK, MessageBoxIcon.Error);

                cn.Close();
            }
        }

        private void buttonSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                _ = salvar_empresa();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            listBoxEmpresas.Enabled = true;
            int idx = listBoxEmpresas.FindString(textBoxNEmpresa.Text);
            listBoxEmpresas.SelectedIndex = idx;
            ShowButtons();
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxEmpresas.Enabled = true;
            if (listBoxEmpresas.Items.Count > 0)
            {
                empresa_atual = listBoxEmpresas.SelectedIndex;
                if (empresa_atual < 0)
                    empresa_atual = 0;
                Mostrar_empresa();
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
            empresa_atual = listBoxEmpresas.SelectedIndex;
            if (empresa_atual < 0)
            {
                MessageBox.Show("Please select a company to edit");
                return;
            }
            HideButtons();
            listBoxEmpresas.Enabled = false;
        }

        private void listBoxEmpresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxEmpresas.SelectedIndex >= 0)
            {
                empresa_atual = listBoxEmpresas.SelectedIndex;
                Mostrar_empresa();
            }
        }

        private void buttonEscolher_Click(object sender, EventArgs e)
        {
            if (listBoxEmpresas.SelectedIndex >= 0)
            {
                try
                {
                    Form1.empresa_atual = int.Parse(textBoxNEmpresa.Text);
                } catch (Exception er)
                {
                    MessageBox.Show("Não conseguiu fazer o parse do número da empresa.\nErro: " + er.Message);
                }
                
            } else
            {
                MessageBox.Show("Por favor selecione uma empresa.");
            }
        }
    }
}
