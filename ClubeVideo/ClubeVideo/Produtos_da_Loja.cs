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
    public partial class Produtos_da_Loja : Form
    {
        private SqlConnection cn;
        private string loja_atual;
        private int produto_atual;

        public Produtos_da_Loja(string loja)
        {
            loja_atual = loja;
            InitializeComponent();
            ShowButtons();
            loadProdutos();
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
            if (listBoxProdutos.SelectedIndex >= 0)
            {
                produto_atual = listBoxProdutos.SelectedIndex;
                ShowContact();
            }
        }


        private void loadProdutos()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("SELECT * FROM ClubeVideo.f_ProdutosEmLoja (@loja)", cn);
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@loja", loja_atual);

            SqlDataReader reader = cmd.ExecuteReader();
            listBoxProdutos.Items.Clear();

            while (reader.Read())
            {
                Produto L = new Produto();

                L.nProduto = reader["nProduto"].ToString();
                L.artigo = reader["artigo"].ToString();
                L.loja = reader["loja"].ToString();
                L.disponibilidade = reader["disponibilidade"].ToString();

                listBoxProdutos.Items.Add(L);
            }

            cn.Close();


            produto_atual = 0;
            ShowContact();
        }

        // Helper routines

        public void LockControls()
        {
            textBoxnProduto.ReadOnly = true;
            textBoxartigo.ReadOnly = true;
            textBoxloja.ReadOnly = true;
            textBoxdisponibilidade.ReadOnly = true;
        }

        public void UnlockControls()
        {
            textBoxnProduto.ReadOnly = false;
            textBoxartigo.ReadOnly = false;
            //textBoxloja.ReadOnly = false;
            textBoxdisponibilidade.ReadOnly = false;
        }

        public void ShowButtons()
        {
            LockControls();
            buttonFiltrar.Visible = true; 
            buttonCancelar.Visible = false;
            buttonProcurar.Visible = false;
        }

        public void ClearFields()
        {
            textBoxnProduto.Text = "";
            textBoxartigo.Text = "";
            //textBoxloja.Text = "";
            textBoxdisponibilidade.Text = "";
        }

        public void ShowContact()
        {
            if (listBoxProdutos.Items.Count == 0 | produto_atual < 0)
                return;
            Produto L = new Produto();
            L = (Produto)listBoxProdutos.Items[produto_atual];

            textBoxnProduto.Text = L.nProduto;
            textBoxartigo.Text = L.artigo;
            textBoxloja.Text = L.loja;
            textBoxdisponibilidade.Text = L.disponibilidade;
        }

        public void HideButtons()
        {
            buttonFiltrar.Visible = false;
            buttonCancelar.Visible = true;
            buttonProcurar.Visible = false;
        }


        

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxProdutos.Enabled = true;
            if (listBoxProdutos.Items.Count > 0)
            {
                produto_atual = listBoxProdutos.SelectedIndex;
                if (produto_atual < 0)
                    produto_atual = 0;
                ShowContact();
            }
            else
            {
                ClearFields();
                LockControls();
            }
            ShowButtons();
        }


        private bool procurarLojas()
        {
            Produto L = new Produto();
            try
            {
                L.nProduto = textBoxnProduto.Text;
                L.artigo = textBoxartigo.Text;
                L.loja = textBoxloja.Text;
                L.disponibilidade = textBoxdisponibilidade.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }


            if (!verifySGBDConnection())
                return false;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_SearchProdutosLoja @loja, @nProduto, @artigo, @disponibilidade";
            
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@loja", loja_atual);
            cmd.Parameters.AddWithValue("@nProduto", L.nProduto.Equals("") ? (object)DBNull.Value : L.nProduto);
            cmd.Parameters.AddWithValue("@artigo", L.artigo.Equals("") ? (object)DBNull.Value : L.artigo);
            cmd.Parameters.AddWithValue("@disponibilidade", L.disponibilidade.Equals("") ? (object)DBNull.Value : L.disponibilidade);

            cmd.Connection = cn;



            SqlDataReader reader = cmd.ExecuteReader();
            listBoxProdutos.Items.Clear();
            ClearFields();

            while (reader.Read())
            {
                Produto LL = new Produto();

                LL.nProduto = reader["nProduto"].ToString();
                LL.artigo = reader["artigo"].ToString();
                LL.loja = reader["loja"].ToString();
                LL.disponibilidade = reader["disponibilidade"].ToString();
                
                listBoxProdutos.Items.Add(LL);
            }

            cn.Close();

            produto_atual = 0;
            ShowContact();

            return true;
        }

        public void HideButtons_Procurar()
        {
            buttonFiltrar.Visible = false;
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



        private void labelartigo_Click(object sender, EventArgs e)
        {
            String nArtigo = textBoxartigo.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Artigo @nArtigo";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nArtigo", nArtigo.Equals("") ? (object)DBNull.Value : nArtigo);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";

            while (reader.Read())
            {
                Artigo LL = new Artigo();

                LL.nArtigo = reader["nArtigo"].ToString();
                LL.nome = reader["nome"].ToString();
                LL.stockMin = reader["stockMin"].ToString();
                LL.stockMax = reader["stockMax"].ToString();
                LL.precoStock = reader["precoStock"].ToString();
                LL.dataCriacao = reader["dataCriacao"].ToString();
                LL.dataUltAlteracao = reader["dataUltAlt"].ToString();
                LL.iva = reader["IVA"].ToString();
                LL.stock = reader["stock"].ToString();
                LL.qtStock = reader["quantStock"].ToString();
                LL.qtDispLojas = reader["quantDispLojas"].ToString();
                LL.qtAlugLojas = reader["quantAlugLojas"].ToString();
                LL.estado = reader["estado"].ToString();

                Mensagem += LL.ToStringC() + "\n\n";
            }

            cn.Close();
            MessageBox.Show(Mensagem);
        }



        private void labelloja_Click(object sender, EventArgs e)
        {
            String Cod_loja = textBoxloja.Text;

            if (!Cod_loja.Equals(""))
            {
                if (!verifySGBDConnection())
                    return;

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "EXEC ClubeVideo.pr_Loja null, @Cod_loja";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@Cod_loja", Cod_loja);
                cmd.Connection = cn;

                SqlDataReader reader = cmd.ExecuteReader();

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

                    MessageBox.Show(LL.ToStringC());
                }

                cn.Close();
            }
            else
            {
                MessageBox.Show("Escolha uma Loja");
            }
        }


        private void labeldisponibilidade_Click(object sender, EventArgs e)
        {
            String nDisponibilidade = textBoxdisponibilidade.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Disponibilidade @nDisponibilidade";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nDisponibilidade", nDisponibilidade.Equals("") ? (object)DBNull.Value : nDisponibilidade);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";

            while (reader.Read())
            {
                Disponibilidade LL = new Disponibilidade();

                LL.nDisponibilidade = reader["nDisponibilidade"].ToString();
                LL.descricao = reader["descricao"].ToString();

                Mensagem += LL.ToStringC() + "\n\n";
                //MessageBox.Show(LL.ToStringC());
            }

            cn.Close();
            MessageBox.Show(Mensagem);
        }


        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void buttonArtigos_Click(object sender, EventArgs e)
        {

        }
    }
}
