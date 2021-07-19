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
    public partial class Funcionarios_da_Loja : Form
    {
        private SqlConnection cn;
        private string loja_atual;
        private int funcionario_atual;
        private int empresa_atual;
        private int Cod_funcionario_atual;

        public Funcionarios_da_Loja(int empresa, string loja, int Cod_funcionario)
        {
            empresa_atual = empresa;
            loja_atual = loja;
            Cod_funcionario_atual = Cod_funcionario;

            InitializeComponent();
            ShowButtons();
            loadFuncionarios();
        }

        private void Form1_Load(object sender, EventArgs e)
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


        private void listBoxFuncionarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxFuncionarios.SelectedIndex >= 0)
            {
                funcionario_atual = listBoxFuncionarios.SelectedIndex;
                ShowContact();
            }
        }


        private void loadFuncionarios()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("EXEC ClubeVideo.pr_Funcionario_load @Cod_loja", cn);
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_loja", loja_atual);

            SqlDataReader reader = cmd.ExecuteReader();
            listBoxFuncionarios.Items.Clear();

            while (reader.Read())
            {
                Funcionario L = new Funcionario();

                L.Cod_Funcionario = reader["Cod_Funcionario"].ToString();
                L.Nome_Funcionario = reader["Nome_Funcionario"].ToString();
                L.Data_Nascimento = reader["Data_Nascimento"].ToString();
                L.Nacionalidade = reader["Nacionalidade"].ToString();
                L.Sexo = reader["Sexo"].ToString();
                L.Estado_Civil = reader["Estado_Civil"].ToString();
                L.Telemovel = reader["Telemovel"].ToString();
                L.E_mail = reader["E_mail"].ToString();
                L.Vencimento = reader["Vencimento"].ToString();
                L.Data_Admissao = reader["Data_Admissao"].ToString();
                L.Cod_endereco = reader["Cod_endereco"].ToString();
                L.Cod_Situacao = reader["Cod_Situacao"].ToString();
                L.Cod_profissao = reader["Cod_profissao"].ToString();
                L.Cod_tipo_pagamento = reader["Cod_tipo_pagamento"].ToString();
                L.NIF = reader["NIF"].ToString();
                L.NIB = reader["NIB"].ToString();
                L.No_doc_identificacao = reader["No_doc_identificacao"].ToString();
                L.Cod_empresa = reader["Cod_empresa"].ToString();

                listBoxFuncionarios.Items.Add(L);
            }

            cn.Close();


            funcionario_atual = 0;
            ShowContact();
        }


        private void UpdateContact(Funcionario L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_UpdateFuncionario @Cod_Funcionario, @Estado_Civil, @Telemovel, @E_mail, @Vencimento, @Cod_endereco, @Cod_Situacao, @Cod_profissao, @Cod_tipo_pagamento, @NIB";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_Funcionario", L.Cod_Funcionario);
            cmd.Parameters.AddWithValue("@Estado_Civil", L.Estado_Civil);
            cmd.Parameters.AddWithValue("@Telemovel", L.Telemovel);
            cmd.Parameters.AddWithValue("@E_mail", L.E_mail);
            cmd.Parameters.AddWithValue("@Vencimento", Convert.ToDecimal(L.Vencimento));
            cmd.Parameters.AddWithValue("@Cod_endereco", L.Cod_endereco);
            cmd.Parameters.AddWithValue("@Cod_Situacao", L.Cod_Situacao);
            cmd.Parameters.AddWithValue("@Cod_profissao", L.Cod_profissao);
            cmd.Parameters.AddWithValue("@Cod_tipo_pagamento", L.Cod_tipo_pagamento);
            cmd.Parameters.AddWithValue("@NIB", L.NIB);

            cmd.Connection = cn;


            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível editar o Funcionário. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                if (rows == 1)
                    MessageBox.Show("Editou");
                else
                    MessageBox.Show("Não Editou");

                cn.Close();
            }
        }

        // Helper routines

        public void LockControls()
        {
            textBoxCod_Funcionario.ReadOnly = true;
            textBoxNome_Funcionario.ReadOnly = true;
            textBoxData_Nascimento.ReadOnly = true;
            textBoxNacionalidade.ReadOnly = true;
            textBoxSexo.ReadOnly = true;
            textBoxEstado_Civil.ReadOnly = true;
            textBoxTelemovel.ReadOnly = true;
            textBoxE_mail.ReadOnly = true;
            textBoxVencimento.ReadOnly = true;
            textBoxData_Admissao.ReadOnly = true;
            textBoxCod_endereco.ReadOnly = true;
            textBoxCod_Situacao.ReadOnly = true;
            textBoxCod_profissao.ReadOnly = true;
            textBoxCod_tipo_pagamento.ReadOnly = true;
            textBoxNIF.ReadOnly = true;
            textBoxNIB.ReadOnly = true;
            textBoxNo_doc_identificacao.ReadOnly = true;
        }

        public void UnlockControls_Editar()
        {
            //textBoxCod_Funcionario.ReadOnly = false;
            //textBoxNome_Funcionario.ReadOnly = false;
            //textBoxData_Nascimento.ReadOnly = false;
            //textBoxNacionalidade.ReadOnly = false;
            //textBoxSexo.ReadOnly = false;
            textBoxEstado_Civil.ReadOnly = false;
            textBoxTelemovel.ReadOnly = false;
            textBoxE_mail.ReadOnly = false;
            textBoxVencimento.ReadOnly = false;
            //textBoxData_Admissao.ReadOnly = false;
            textBoxCod_endereco.ReadOnly = false;
            textBoxCod_Situacao.ReadOnly = false;
            textBoxCod_profissao.ReadOnly = false;
            textBoxCod_tipo_pagamento.ReadOnly = false;
            //textBoxNIF.ReadOnly = false;
            textBoxNIB.ReadOnly = false;
            //textBoxNo_doc_identificacao.ReadOnly = false;
        }


        public void UnlockControls()
        {
            textBoxCod_Funcionario.ReadOnly = false;
            textBoxNome_Funcionario.ReadOnly = false;
            textBoxData_Nascimento.ReadOnly = false;
            textBoxNacionalidade.ReadOnly = false;
            textBoxSexo.ReadOnly = false;
            textBoxEstado_Civil.ReadOnly = false;
            textBoxTelemovel.ReadOnly = false;
            textBoxE_mail.ReadOnly = false;
            textBoxVencimento.ReadOnly = false;
            textBoxData_Admissao.ReadOnly = false;
            textBoxCod_endereco.ReadOnly = false;
            textBoxCod_Situacao.ReadOnly = false;
            textBoxCod_profissao.ReadOnly = false;
            textBoxCod_tipo_pagamento.ReadOnly = false;
            textBoxNIF.ReadOnly = false;
            textBoxNIB.ReadOnly = false;
            textBoxNo_doc_identificacao.ReadOnly = false;
        }

        public void ShowButtons()
        {
            LockControls();
            
            buttonFiltrar.Visible = true;
            buttonGuardar.Visible = false;
            buttonCancelar.Visible = false;
            buttonProcurar.Visible = false;

            if (Cod_funcionario_atual == -1)
            {
                buttonEditar.Visible = true;
            }
            else
            {
                buttonEditar.Visible = false;
            }
        }

        public void ClearFields()
        {
            textBoxCod_Funcionario.Text = "";
            textBoxNome_Funcionario.Text = "";
            textBoxData_Nascimento.Text = "";
            textBoxNacionalidade.Text = "";
            textBoxSexo.Text = "";
            textBoxEstado_Civil.Text = "";
            textBoxTelemovel.Text = "";
            textBoxE_mail.Text = "";
            textBoxVencimento.Text = "";
            textBoxData_Admissao.Text = "";
            textBoxCod_endereco.Text = "";
            textBoxCod_Situacao.Text = "";
            textBoxCod_profissao.Text = "";
            textBoxCod_tipo_pagamento.Text = "";
            textBoxNIF.Text = "";
            textBoxNIB.Text = "";
            textBoxNo_doc_identificacao.Text = "";
        }

        public void ShowContact()
        {
            if (listBoxFuncionarios.Items.Count == 0 | funcionario_atual < 0)
                return;
            Funcionario L = new Funcionario();
            L = (Funcionario)listBoxFuncionarios.Items[funcionario_atual];

            textBoxCod_Funcionario.Text = L.Cod_Funcionario;
            textBoxNome_Funcionario.Text = L.Nome_Funcionario;
            textBoxData_Nascimento.Text = L.Data_Nascimento;
            textBoxNacionalidade.Text = L.Nacionalidade;
            textBoxSexo.Text = L.Sexo;
            textBoxEstado_Civil.Text = L.Estado_Civil;
            textBoxTelemovel.Text = L.Telemovel;
            textBoxE_mail.Text = L.E_mail;
            textBoxVencimento.Text = L.Vencimento;
            textBoxData_Admissao.Text = L.Data_Admissao;
            textBoxCod_endereco.Text = L.Cod_endereco;
            textBoxCod_Situacao.Text = L.Cod_Situacao;
            textBoxCod_profissao.Text = L.Cod_profissao;
            textBoxCod_tipo_pagamento.Text = L.Cod_tipo_pagamento;
            textBoxNIF.Text = L.NIF;
            textBoxNIB.Text = L.NIB;
            textBoxNo_doc_identificacao.Text = L.No_doc_identificacao;
        }

        public void HideButtons()
        {
            buttonEditar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonGuardar.Visible = true;
            buttonCancelar.Visible = true;
            buttonProcurar.Visible = false;
        }


        public bool salvarLoja()
        {
            Funcionario L = new Funcionario();
            try
            {
                L.Cod_Funcionario = textBoxCod_Funcionario.Text;
                L.Nome_Funcionario = textBoxNome_Funcionario.Text;
                L.Data_Nascimento = textBoxData_Nascimento.Text;
                L.Nacionalidade = textBoxNacionalidade.Text;
                L.Sexo = textBoxSexo.Text;
                L.Estado_Civil = textBoxEstado_Civil.Text;
                L.Telemovel = textBoxTelemovel.Text;
                L.E_mail = textBoxE_mail.Text;
                L.Vencimento = textBoxVencimento.Text;
                L.Data_Admissao = textBoxData_Admissao.Text;
                L.Cod_endereco = textBoxCod_endereco.Text;
                L.Cod_Situacao = textBoxCod_Situacao.Text;
                L.Cod_profissao = textBoxCod_profissao.Text;
                L.Cod_tipo_pagamento = textBoxCod_tipo_pagamento.Text;
                L.NIF = textBoxNIF.Text;
                L.NIB = textBoxNIB.Text;
                L.No_doc_identificacao = textBoxNo_doc_identificacao.Text;
                L.Cod_empresa = empresa_atual.ToString();


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }

            UpdateContact(L);
            listBoxFuncionarios.Items[funcionario_atual] = L;
            
            return true;
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxFuncionarios.Enabled = true;
            if (listBoxFuncionarios.Items.Count > 0)
            {
                funcionario_atual = listBoxFuncionarios.SelectedIndex;
                if (funcionario_atual < 0)
                    funcionario_atual = 0;
                ShowContact();
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
            funcionario_atual = listBoxFuncionarios.SelectedIndex;
            if (funcionario_atual < 0)
            {
                MessageBox.Show("Selecione um Funcionário");
                return;
            }
            UnlockControls_Editar();
            HideButtons();
            listBoxFuncionarios.Enabled = false;
        }


        private void buttonGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                bool ret = salvarLoja();
                Console.Write(ret);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            listBoxFuncionarios.Enabled = true;
            int idx = listBoxFuncionarios.FindString(textBoxCod_Funcionario.Text);
            listBoxFuncionarios.SelectedIndex = idx;
            ShowButtons();
        }


        private bool procurarLojas()
        {
            Funcionario L = new Funcionario();
            try
            {
                L.Cod_Funcionario = textBoxCod_Funcionario.Text;
                L.Nome_Funcionario = textBoxNome_Funcionario.Text;
                L.Data_Nascimento = textBoxData_Nascimento.Text;
                L.Nacionalidade = textBoxNacionalidade.Text;
                L.Sexo = textBoxSexo.Text;
                L.Estado_Civil = textBoxEstado_Civil.Text;
                L.Telemovel = textBoxTelemovel.Text;
                L.E_mail = textBoxE_mail.Text;
                L.Vencimento = textBoxVencimento.Text;
                L.Data_Admissao = textBoxData_Admissao.Text;
                L.Cod_endereco = textBoxCod_endereco.Text;
                L.Cod_Situacao = textBoxCod_Situacao.Text;
                L.Cod_profissao = textBoxCod_profissao.Text;
                L.Cod_tipo_pagamento = textBoxCod_tipo_pagamento.Text;
                L.NIF = textBoxNIF.Text;
                L.NIB = textBoxNIB.Text;
                L.No_doc_identificacao = textBoxNo_doc_identificacao.Text;
                L.Cod_empresa = empresa_atual.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }


            if (!verifySGBDConnection())
                return false;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "EXEC ClubeVideo.pr_SearchFuncionarioLoja @Cod_empresa, @Cod_loja, @Cod_Funcionario, @Nome_Funcionario, @Data_Nascimento, @Nacionalidade, @Sexo, @Estado_Civil, @Telemovel, @E_mail, @Vencimento, @Data_Admissao, @Cod_endereco, @Cod_Situacao, @Cod_profissao, @Cod_tipo_pagamento, @NIF, @NIB, @No_doc_identificacao";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_empresa", L.Cod_empresa);
            cmd.Parameters.AddWithValue("@Cod_loja", loja_atual);
            cmd.Parameters.AddWithValue("@Cod_Funcionario", L.Cod_Funcionario.Equals("") ? (object)DBNull.Value : L.Cod_Funcionario);
            cmd.Parameters.AddWithValue("@Nome_Funcionario", L.Nome_Funcionario.Equals("") ? (object)DBNull.Value : L.Nome_Funcionario);
            cmd.Parameters.AddWithValue("@Data_Nascimento", L.Data_Nascimento.Equals("") ? (object)DBNull.Value : DateTime.Parse(L.Data_Nascimento));
            cmd.Parameters.AddWithValue("@Nacionalidade", L.Nacionalidade.Equals("") ? (object)DBNull.Value : L.Nacionalidade);
            cmd.Parameters.AddWithValue("@Sexo", L.Sexo.Equals("") ? (object)DBNull.Value : L.Sexo);
            cmd.Parameters.AddWithValue("@Estado_Civil", L.Estado_Civil.Equals("") ? (object)DBNull.Value : L.Estado_Civil);
            cmd.Parameters.AddWithValue("@Telemovel", L.Telemovel.Equals("") ? (object)DBNull.Value : L.Telemovel);
            cmd.Parameters.AddWithValue("@E_mail", L.E_mail.Equals("") ? (object)DBNull.Value : L.E_mail);
            cmd.Parameters.AddWithValue("@Vencimento", L.Vencimento.Equals("") ? (object)DBNull.Value : Convert.ToDecimal(L.Vencimento));
            cmd.Parameters.AddWithValue("@Data_Admissao", L.Data_Admissao.Equals("") ? (object)DBNull.Value : DateTime.Parse(L.Data_Admissao));
            cmd.Parameters.AddWithValue("@Cod_endereco", L.Cod_endereco.Equals("") ? (object)DBNull.Value : L.Cod_endereco);
            cmd.Parameters.AddWithValue("@Cod_Situacao", L.Cod_Situacao.Equals("") ? (object)DBNull.Value : L.Cod_Situacao);
            cmd.Parameters.AddWithValue("@Cod_profissao", L.Cod_profissao.Equals("") ? (object)DBNull.Value : L.Cod_profissao);
            cmd.Parameters.AddWithValue("@Cod_tipo_pagamento", L.Cod_tipo_pagamento.Equals("") ? (object)DBNull.Value : L.Cod_tipo_pagamento);
            cmd.Parameters.AddWithValue("@NIF", L.NIF.Equals("") ? (object)DBNull.Value : L.NIF);
            cmd.Parameters.AddWithValue("@NIB", L.NIB.Equals("") ? (object)DBNull.Value : L.NIB);
            cmd.Parameters.AddWithValue("@No_doc_identificacao", L.No_doc_identificacao.Equals("") ? (object)DBNull.Value : L.No_doc_identificacao);

            cmd.Connection = cn;


            SqlDataReader reader = cmd.ExecuteReader();
            listBoxFuncionarios.Items.Clear();
            ClearFields();

            while (reader.Read())
            {
                Funcionario LL = new Funcionario();

                LL.Cod_Funcionario = reader["Cod_Funcionario"].ToString();
                LL.Nome_Funcionario = reader["Nome_Funcionario"].ToString();
                LL.Data_Nascimento = reader["Data_Nascimento"].ToString();
                LL.Nacionalidade = reader["Nacionalidade"].ToString();
                LL.Sexo = reader["Sexo"].ToString();
                LL.Estado_Civil = reader["Estado_Civil"].ToString();
                LL.Telemovel = reader["Telemovel"].ToString();
                LL.E_mail = reader["E_mail"].ToString();
                LL.Vencimento = reader["Vencimento"].ToString();
                LL.Data_Admissao = reader["Data_Admissao"].ToString();
                LL.Cod_endereco = reader["Cod_endereco"].ToString();
                LL.Cod_Situacao = reader["Cod_Situacao"].ToString();
                LL.Cod_profissao = reader["Cod_profissao"].ToString();
                LL.Cod_tipo_pagamento = reader["Cod_tipo_pagamento"].ToString();
                LL.NIF = reader["NIF"].ToString();
                LL.NIB = reader["NIB"].ToString();
                LL.No_doc_identificacao = reader["No_doc_identificacao"].ToString();
                LL.Cod_empresa = reader["Cod_empresa"].ToString();

                listBoxFuncionarios.Items.Add(LL);
            }

            cn.Close();

            funcionario_atual = 0;
            ShowContact();

            return true;
        }

        public void HideButtons_Procurar()
        {
            buttonEditar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonGuardar.Visible = false;
            buttonCancelar.Visible = true;
            buttonProcurar.Visible = true;
        }

        private void buttonFiltrar_Click(object sender, EventArgs e)
        {
            ClearFields();
            UnlockControls();
            HideButtons_Procurar();
        }

        private void buttonProcurar_Click(object sender, EventArgs e)
        {
            try
            {
                bool ret = procurarLojas();
                Console.Write(ret);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void labelCod_endereco_Click(object sender, EventArgs e)
        {
            String nEndereco = textBoxCod_endereco.Text;

            if (!nEndereco.Equals(""))
            {
                if (!verifySGBDConnection())
                    return;

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT * FROM ClubeVideo.f_EnderecoCompleto(@nEndereco)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@nEndereco", nEndereco);
                cmd.Connection = cn;

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Endereco LL = new Endereco();

                    LL.nEndereco = reader["nEndereco"].ToString();
                    LL.morada = reader["morada"].ToString();
                    LL.codigoPostal = reader["codigoPostal"].ToString();
                    LL.localidade = reader["localidade"].ToString();
                    LL.distrito = reader["distrito"].ToString();
                    LL.concelho = reader["concelho"].ToString();
                    LL.freguesia = reader["freguesia"].ToString();
                    LL.pais = reader["pais"].ToString();

                    MessageBox.Show(LL.ToStringC());
                }

                cn.Close();
            }
            else
            {
                MessageBox.Show("Escolha um Endereço");
            }
        }


        private void labelCod_Situacao_Click(object sender, EventArgs e)
        {
            String Cod_Situacao = textBoxCod_Situacao.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Situacao @Cod_Situacao";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_Situacao", Cod_Situacao.Equals("") ? (object)DBNull.Value : Cod_Situacao);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";

            while (reader.Read())
            {
                Situacao LL = new Situacao();

                LL.Cod_Situacao = reader["Cod_Situacao"].ToString();
                LL.Descricao = reader["Descricao"].ToString();

                Mensagem += LL.ToStringC() + "\n\n";
                //MessageBox.Show(LL.ToStringC());
            }

            cn.Close();
            MessageBox.Show(Mensagem);
        }


        private void labelCod_profissao_Click(object sender, EventArgs e)
        {
            String Cod_Profissao = textBoxCod_profissao.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Profissao @Cod_Profissao";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_Profissao", Cod_Profissao.Equals("") ? (object)DBNull.Value : Cod_Profissao);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";

            while (reader.Read())
            {
                Profissao LL = new Profissao();

                LL.Cod_Profissao = reader["Cod_profissao"].ToString();
                LL.Descricao = reader["Descricao"].ToString();

                Mensagem += LL.ToStringC() + "\n\n";
                //MessageBox.Show(LL.ToStringC());
            }

            cn.Close();
            MessageBox.Show(Mensagem);
        }


        private void labelCod_tipo_pagamento_Click(object sender, EventArgs e)
        {
            String Cod_Pagamento = textBoxCod_tipo_pagamento.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Pagamento @Cod_Pagamento";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_Pagamento", Cod_Pagamento.Equals("") ? (object)DBNull.Value : Cod_Pagamento);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";
            
            while (reader.Read())
            {
                Pagamento LL = new Pagamento();

                LL.Cod_Pagamento = reader["Cod_Pagamento"].ToString();
                LL.Descricao = reader["Descricao"].ToString();
                
                Mensagem += LL.ToStringC() + "\n\n";
                //MessageBox.Show(LL.ToStringC());
            }
            
            cn.Close();
            MessageBox.Show(Mensagem);
        }


        private void buttonEnderecos_Click(object sender, EventArgs e)
        {
            Visible = false;
            CriarEndereco criarEndereco = new CriarEndereco();

            criarEndereco.FormClosed += new FormClosedEventHandler(Form_closed);
            criarEndereco.Show();
        }


        private void Form_closed(object sender, FormClosedEventArgs e)
        {
            Visible = true;
        }
    }
}
