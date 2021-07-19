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
    public partial class ProdutosLinha : Form
    {
        private SqlConnection cn;
        private string linha_atual;
        private string documento_atual;
        private string tipoDoc_atual;
        private string empresa_atual;
        private int produto_atual_Disp;
        private int produto_atual_Esc;
        private bool editavel_atual;

        public ProdutosLinha(string linha, string documento, string tipoDoc, string empresa, bool editavel)
        {

            linha_atual = linha;
            documento_atual = documento;
            tipoDoc_atual = tipoDoc;
            empresa_atual = empresa;
            editavel_atual = editavel;
            InitializeComponent();
            load_ProdutosEsc();
            load_ProdutosDisp();
            ShowButtons();
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


        private void listBoxProdutosDisp_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxProdutosDisp.SelectedIndex >= 0)
            {
                produto_atual_Disp = listBoxProdutosDisp.SelectedIndex;
            }
        }

        private void listBoxProdutosEsc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxProdutosEsc.SelectedIndex >= 0)
            {
                produto_atual_Esc = listBoxProdutosEsc.SelectedIndex;
                ShowProduto();
            }
        }


        public void ShowButtons()
        {
            if (editavel_atual)
            {
                buttonCriar.Visible = true;
                buttonEliminar.Visible = true;
                buttonTerminar.Visible = true;
            }
            else
            {
                buttonCriar.Visible = false;
                buttonEliminar.Visible = false;
            }
        }


        public void ShowProduto()
        {
            if (listBoxProdutosEsc.Items.Count == 0 | produto_atual_Esc < 0)
            {
                return;
            }

            ProdutoLinha L = new ProdutoLinha();
            L = (ProdutoLinha)listBoxProdutosEsc.Items[produto_atual_Esc];

            textBoxdataDevolucao.Text = L.dataDevolucao;
        }


        private void load_ProdutosEsc()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SELECT * FROM ClubeVideo.f_ProdutosLinha (@linha, @documento, @tipoDoc, @empresa)";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@linha", linha_atual);
            cmd.Parameters.AddWithValue("@documento", documento_atual);
            cmd.Parameters.AddWithValue("@tipoDoc", tipoDoc_atual);
            cmd.Parameters.AddWithValue("@empresa", empresa_atual);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            listBoxProdutosEsc.Items.Clear();

            while (reader.Read())
            {
                ProdutoLinha L = new ProdutoLinha();

                L.produto = reader["produto"].ToString();
                L.artigo = reader["artigo"].ToString();
                L.linha = reader["linha"].ToString();
                L.documento = reader["documento"].ToString();
                L.tipoDoc = reader["tipoDoc"].ToString();
                L.empresa = reader["empresa"].ToString();
                L.dataDevolucao = reader["dataDevolucao"].ToString();

                listBoxProdutosEsc.Items.Add(L);
            }

            cn.Close();

            produto_atual_Esc = 0;
            ShowProduto();
        }


        private void load_ProdutosDisp()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_ProdutosDisponiveis @linha, @documento, @tipoDoc, @empresa";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@linha", linha_atual);
            cmd.Parameters.AddWithValue("@documento", documento_atual);
            cmd.Parameters.AddWithValue("@tipoDoc", tipoDoc_atual);
            cmd.Parameters.AddWithValue("@empresa", empresa_atual);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            listBoxProdutosDisp.Items.Clear();

            while (reader.Read())
            {
                Produto L = new Produto();

                L.nProduto = reader["nProduto"].ToString();
                L.artigo = reader["artigo"].ToString();
                L.loja = reader["loja"].ToString();
                L.disponibilidade = reader["disponibilidade"].ToString();

                listBoxProdutosDisp.Items.Add(L);
            }

            cn.Close();

            produto_atual_Disp = 0;
        }



        private void submeterProduto(Produto L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_NovoProdutoLinha @produto, @artigo, @linha, @documento, @tipoDoc, @empresa, @dataDevolucao";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@produto", L.nProduto);
            cmd.Parameters.AddWithValue("@artigo", L.artigo);
            cmd.Parameters.AddWithValue("@linha", linha_atual);
            cmd.Parameters.AddWithValue("@documento", documento_atual);
            cmd.Parameters.AddWithValue("@tipoDoc", tipoDoc_atual);
            cmd.Parameters.AddWithValue("@empresa", empresa_atual);
            cmd.Parameters.AddWithValue("@dataDevolucao", textBoxdataDevolucao.Text.Equals("") ? (object)DBNull.Value : textBoxdataDevolucao.Text);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível adicionar o Produto à Linha do Documento. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();

            }
            if (rows > 0)
            {
                MessageBox.Show("Adicionou");
            }
            else
            {
                MessageBox.Show("Não Adicionou");
            }
        }

        private void buttonCriar_Click(object sender, EventArgs e)
        {
            if (listBoxProdutosDisp.SelectedIndex > -1)
            {
                try
                {
                    Produto L = (Produto)listBoxProdutosDisp.SelectedItem;
                    submeterProduto(L);

                    //ProdutoLinha LL = new ProdutoLinha();

                    //LL.produto = L.nProduto;
                    //LL.artigo = L.artigo;
                    //LL.linha = linha_atual;
                    //LL.documento = documento_atual;
                    //LL.tipoDoc = tipoDoc_atual;
                    //LL.empresa = empresa_atual;
                    //LL.dataDevolucao = textBoxdataDevolucao.Text;

                    //listBoxProdutosEsc.Items.Add(L);

                    textBoxdataDevolucao.Text = "";
                    load_ProdutosEsc();
                    load_ProdutosDisp();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }

                /*
                listBoxProdutosDisp.Items.RemoveAt(listBoxProdutosDisp.SelectedIndex);
                if (produto_atual_Disp == listBoxProdutosDisp.Items.Count)
                    produto_atual_Disp = listBoxProdutosDisp.Items.Count - 1;

                if (produto_atual_Disp == -1)
                {
                    MessageBox.Show("There are no more Produtos");
                }
                */
            }
        }


        private void RemoveProduto(ProdutoLinha L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_deleteProdutoLinha @produto, @artigo, @linha, @documento, @tipoDoc, @empresa";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@produto", L.produto);
            cmd.Parameters.AddWithValue("@artigo", L.artigo);
            cmd.Parameters.AddWithValue("@linha", L.linha);
            cmd.Parameters.AddWithValue("@documento", L.documento);
            cmd.Parameters.AddWithValue("@tipoDoc", L.tipoDoc);
            cmd.Parameters.AddWithValue("@empresa", L.empresa);
            cmd.Parameters.AddWithValue("@dataDevolucao", L.dataDevolucao.Equals("") ? (object)DBNull.Value : L.dataDevolucao);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível retirar o Produto da Linha do Documento. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            if (rows > 0)
            {
                MessageBox.Show("Retirou");
            }
            else
            {
                MessageBox.Show("Não Retirou");
            }
        }


        private void buttonEliminar_Click(object sender, EventArgs e)
        {
            if (listBoxProdutosEsc.SelectedIndex > -1)
            {
                try
                {
                    ProdutoLinha L = (ProdutoLinha)listBoxProdutosEsc.SelectedItem;
                    RemoveProduto(L);
                    textBoxdataDevolucao.Text = "";
                    load_ProdutosEsc();
                    load_ProdutosDisp();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }

                /*
                listBoxProdutosEsc.Items.RemoveAt(listBoxProdutosEsc.SelectedIndex);
                if (produto_atual_Esc == listBoxProdutosEsc.Items.Count)
                    produto_atual_Esc = listBoxProdutosEsc.Items.Count - 1;

                if (produto_atual_Esc == -1)
                {
                    MessageBox.Show("There are no more Produtos");
                }
                */
            }
        }



        private void buttonTerminar_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        private void textBoxCod_endereco_TextChanged(object sender, EventArgs e)
        {

        }

        
    }
}
