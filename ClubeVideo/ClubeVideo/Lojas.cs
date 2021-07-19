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


using System.Web;

namespace ClubeVideo
{
    public partial class Lojas : Form
    {
        private SqlConnection cn;
        private int loja_atual;
        private int empresa_atual;
        private int Cod_funcionario_atual;
        private bool criar;

        public Lojas(int empresa, int Cod_funcionario)
        {
            empresa_atual = 1;
            Cod_funcionario_atual = Cod_funcionario;

            InitializeComponent();
            ShowButtons();
            loadLojas();
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


        private void listBoxLojas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxLojas.SelectedIndex >= 0)
            {
                loja_atual = listBoxLojas.SelectedIndex;
                ShowContact();
            }
        }


        private void loadLojas()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Lojas @Cod_empresa, @Cod_funcionario";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_empresa", empresa_atual);
            cmd.Parameters.AddWithValue("@Cod_funcionario", (Cod_funcionario_atual == -1) ? (object)DBNull.Value : Cod_funcionario_atual);
            cmd.Connection = cn;
            SqlDataReader reader = cmd.ExecuteReader();
            listBoxLojas.Items.Clear();

            while (reader.Read())
            {
                Loja L = new Loja();
                L.Cod_loja = reader["Cod_loja"].ToString();
                L.Nome_loja = reader["Nome_loja"].ToString();
                L.E_mail = reader["E_mail"].ToString();
                L.Telefone = reader["Telefone"].ToString();
                L.Cod_endereco = reader["Cod_endereco"].ToString();
                L.Cod_empresa = reader["Cod_empresa"].ToString();
                L.ativa = reader["ativa"].ToString();

                listBoxLojas.Items.Add(L);
            }

            cn.Close();

            loja_atual = 0;
            ShowContact();
        }

        private void submeterLoja(Loja L)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_NovaLoja @Nome_loja, @E_mail, @Telefone, @Cod_endereco, @Cod_empresa";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Nome_loja", L.Nome_loja);
            cmd.Parameters.AddWithValue("@E_mail", L.E_mail);
            cmd.Parameters.AddWithValue("@Telefone", L.Telefone);
            cmd.Parameters.AddWithValue("@Cod_endereco", L.Cod_endereco);
            cmd.Parameters.AddWithValue("@Cod_empresa", L.Cod_empresa);
            cmd.Connection = cn;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível criar a Loja. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }



        private void UpdateContact(Loja L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_UpdateLoja @Cod_loja, @ativa";
            
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_loja", L.Cod_loja);
            cmd.Parameters.AddWithValue("@ativa", L.ativa);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível editar a Loja. \n ERROR MESSAGE: \n" + ex.Message);
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
            textBoxCod_loja.ReadOnly = true;
            textBoxNome_loja.ReadOnly = true;
            textBoxE_mail.ReadOnly = true;
            textBoxTelefone.ReadOnly = true;
            textBoxCod_endereco.ReadOnly = true;
            textBoxativa.ReadOnly = true;
        }

        public void UnlockControls(bool filtrar)
        {
            if (filtrar)
            {
                textBoxCod_loja.ReadOnly = false;
            }
            
            textBoxNome_loja.ReadOnly = false;
            textBoxE_mail.ReadOnly = false;
            textBoxTelefone.ReadOnly = false;
            textBoxCod_endereco.ReadOnly = false;
            textBoxativa.ReadOnly = false;
        }

        public void UnlockControls_Editar()
        {
            //textBoxCod_loja.ReadOnly = false;
            //textBoxNome_loja.ReadOnly = false;
            //textBoxE_mail.ReadOnly = false;
            //textBoxTelefone.ReadOnly = false;
            //textBoxCod_endereco.ReadOnly = false;
            textBoxativa.ReadOnly = false;
        }

        public void ShowButtons()
        {
            LockControls();
            
            buttonFiltrar.Visible = true;
            buttonGuardar.Visible = false;
            buttonFuncionarios.Visible = true;
            buttonDocumentos.Visible = true;
            buttonProdutos.Visible = true;
            buttonCancelar.Visible = false;
            buttonProcurar.Visible = false;

            if (Cod_funcionario_atual == -1)
            {
                buttonCriar.Visible = true;
                buttonEditar.Visible = true;
                buttonEnderecos.Visible = true;
            }
            else
            {
                buttonCriar.Visible = false;
                buttonEditar.Visible = false;
                buttonEnderecos.Visible = false;
            }
        }

        public void ClearFields()
        {
            textBoxCod_loja.Text = "";
            textBoxNome_loja.Text = "";
            textBoxE_mail.Text = "";
            textBoxTelefone.Text = "";
            textBoxCod_endereco.Text = "";
            textBoxativa.Text = "";
        }

        public void ShowContact()
        {
            if (listBoxLojas.Items.Count == 0 | loja_atual < 0)
                return;
            Loja L = new Loja();
            L = (Loja)listBoxLojas.Items[loja_atual];

            textBoxCod_loja.Text = L.Cod_loja;
            textBoxNome_loja.Text = L.Nome_loja;
            textBoxE_mail.Text = L.E_mail;
            textBoxTelefone.Text = L.Telefone;
            textBoxCod_endereco.Text = L.Cod_endereco;
            textBoxativa.Text = L.ativa;
        }

        public void HideButtons()
        {
            buttonCriar.Visible = false;
            buttonEditar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonGuardar.Visible = true;
            buttonFuncionarios.Visible = false;
            buttonDocumentos.Visible = false;
            buttonProdutos.Visible = false;
            buttonCancelar.Visible = true;
            buttonProcurar.Visible = false;
        }


        public bool salvarLoja()
        {
            Loja L = new Loja();
            try
            {
                L.Cod_loja = textBoxCod_loja.Text;
                L.Nome_loja = textBoxNome_loja.Text;
                L.E_mail = textBoxE_mail.Text;
                L.Telefone = textBoxTelefone.Text;
                L.Cod_endereco = textBoxCod_endereco.Text;
                L.Cod_empresa = empresa_atual.ToString();
                L.ativa = textBoxativa.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
            if (criar)
            {
                submeterLoja(L);
                listBoxLojas.Items.Add(L);
            }
            else
            {
                UpdateContact(L);
                listBoxLojas.Items[loja_atual] = L;
            }
            return true;
        }

 
        private void buttonCriar_Click(object sender, EventArgs e)
        {
            criar = true;
            ClearFields();
            UnlockControls(false);
            HideButtons();
            listBoxLojas.Enabled = false;
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxLojas.Enabled = true;
            if (listBoxLojas.Items.Count > 0)
            {
                loja_atual = listBoxLojas.SelectedIndex;
                if (loja_atual < 0)
                    loja_atual = 0;
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
            loja_atual = listBoxLojas.SelectedIndex;
            if (loja_atual < 0)
            {
                MessageBox.Show("Selecione uma Loja");
                return;
            }
            criar = false;
            UnlockControls_Editar();
            HideButtons();
            listBoxLojas.Enabled = false;
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
            listBoxLojas.Enabled = true;
            int idx = listBoxLojas.FindString(textBoxCod_loja.Text);
            listBoxLojas.SelectedIndex = idx;
            ShowButtons();
        }


        private bool procurarLojas()
        {
            Loja L = new Loja();
            try
            {
                L.Cod_loja = textBoxCod_loja.Text;
                L.Nome_loja = textBoxNome_loja.Text;
                L.E_mail = textBoxE_mail.Text;
                L.Telefone = textBoxTelefone.Text;
                L.Cod_endereco = textBoxCod_endereco.Text;
                L.Cod_empresa = empresa_atual.ToString();
                L.ativa = textBoxativa.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }


            if (!verifySGBDConnection())
                return false;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "EXEC ClubeVideo.pr_SearchLoja @Cod_empresa, @Cod_funcionario, @Cod_loja, @Nome_loja, @E_mail, @Telefone, @Cod_endereco, @ativa";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_empresa", L.Cod_empresa);
            cmd.Parameters.AddWithValue("@Cod_funcionario", (Cod_funcionario_atual == -1) ? (object)DBNull.Value : Cod_funcionario_atual);
            cmd.Parameters.AddWithValue("@Cod_loja", L.Cod_loja.Equals("") ? (object)DBNull.Value : L.Cod_loja);
            cmd.Parameters.AddWithValue("@Nome_loja", L.Nome_loja.Equals("") ? (object)DBNull.Value : L.Nome_loja);
            cmd.Parameters.AddWithValue("@E_mail", L.E_mail.Equals("") ? (object)DBNull.Value : L.E_mail);
            cmd.Parameters.AddWithValue("@Telefone", L.Telefone.Equals("") ? (object)DBNull.Value : L.Telefone);
            cmd.Parameters.AddWithValue("@Cod_endereco", L.Cod_endereco.Equals("") ? (object)DBNull.Value : L.Cod_endereco);
            cmd.Parameters.AddWithValue("@ativa", L.ativa.Equals("") ? (object)DBNull.Value : L.ativa);
            
            cmd.Connection = cn;


            SqlDataReader reader = cmd.ExecuteReader();
            listBoxLojas.Items.Clear();
            ClearFields();

            while (reader.Read())
            {
                Loja LL = new Loja();
                
                LL.Cod_loja = reader["Cod_loja"].ToString();
                LL.Nome_loja = reader["Nome_loja"].ToString();
                LL.E_mail = reader["E_mail"].ToString();
                LL.Telefone = reader["Telefone"].ToString();
                LL.Cod_endereco = reader["Cod_endereco"].ToString();
                LL.Cod_empresa = reader["Cod_empresa"].ToString();
                LL.ativa = reader["ativa"].ToString();

                listBoxLojas.Items.Add(LL);
            }

            cn.Close();

            loja_atual = 0;
            ShowContact();

            return true;
        }

        public void HideButtons_Procurar()
        {
            buttonCriar.Visible = false;
            buttonEditar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonGuardar.Visible = false;
            buttonFuncionarios.Visible = false;
            buttonDocumentos.Visible = false;
            buttonProdutos.Visible = false;
            buttonCancelar.Visible = true;
            buttonProcurar.Visible = true;
        }

        private void buttonFiltrar_Click(object sender, EventArgs e)
        {
            ClearFields();
            UnlockControls(true);
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


        private void Form_closed(object sender, FormClosedEventArgs e)
        {
            Visible = true;
        }


        private void buttonFuncionarios_Click(object sender, EventArgs e)
        {
            string n_loja = textBoxCod_loja.Text;

            if (!n_loja.Equals(""))
            {
                Visible = false;
                Funcionarios_da_Loja funcionarios = new Funcionarios_da_Loja(empresa_atual, n_loja, Cod_funcionario_atual);
                funcionarios.FormClosed += new FormClosedEventHandler(Form_closed);
                funcionarios.Show();
            }
            else
            {
                MessageBox.Show("Escolha uma Loja");
            }
               
        }


        private void buttonProdutos_Click(object sender, EventArgs e)
        {
            
            string n_loja = textBoxCod_loja.Text;

            if (!n_loja.Equals(""))
            {
                Visible = false;
                Produtos_da_Loja produtos = new Produtos_da_Loja(n_loja);
                produtos.FormClosed += new FormClosedEventHandler(Form_closed);
                produtos.Show();
            }
            else
            {
                MessageBox.Show("Escolha uma Loja");
            }
        }

        private void buttonDocumentos_Click(object sender, EventArgs e)
        {
            string n_loja = textBoxCod_loja.Text;

            if (!n_loja.Equals(""))
            {
                if (Cod_funcionario_atual == -1)
                {
                    Visible = false;
                    TiposDocumentos tipos = new TiposDocumentos(empresa_atual, n_loja, Cod_funcionario_atual, false);
                    tipos.FormClosed += new FormClosedEventHandler(Form_closed);
                    tipos.Show();
                }
                else
                {
                    Visible = false;
                    TiposDocumentos tipos = new TiposDocumentos(empresa_atual, n_loja, Cod_funcionario_atual, true);
                    tipos.FormClosed += new FormClosedEventHandler(Form_closed);
                    tipos.Show();
                }
            }
            else
            {
                MessageBox.Show("Escolha uma Loja");
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

        private void textBoxCod_endereco_TextChanged(object sender, EventArgs e)
        {

        }

        private void buttonEnderecos_Click(object sender, EventArgs e)
        {
            Visible = false;
            CriarEndereco criarEndereco = new CriarEndereco();

            criarEndereco.FormClosed += new FormClosedEventHandler(Form_closed);
            criarEndereco.Show();
        }

    }
}
