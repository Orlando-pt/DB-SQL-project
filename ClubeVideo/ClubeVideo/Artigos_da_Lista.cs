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
    public partial class Artigos_da_Lista : Form
    {
        private SqlConnection cn;
        private int artigo_atual;
        private string Cod_lista_precos_atual;

        public Artigos_da_Lista(string Cod_lista_precos)
        {
            Cod_lista_precos_atual = Cod_lista_precos;
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
            if (listBoxArtigos.SelectedIndex >= 0)
            {
                artigo_atual = listBoxArtigos.SelectedIndex;
                ShowContact();
            }
        }


        private void loadFuncionarios()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("EXEC ClubeVideo.pr_ArtigosListasPrecos_load @Cod_lista_precos", cn);
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_lista_precos", Cod_lista_precos_atual);

            SqlDataReader reader = cmd.ExecuteReader();
            listBoxArtigos.Items.Clear();

            while (reader.Read())
            {
                ListaPrecosArtigo L = new ListaPrecosArtigo();

                L.Cod_artigo = reader["Cod_artigo"].ToString();
                L.Cod_lista_precos = reader["Cod_lista_precos"].ToString();
                L.Preco = reader["Preco"].ToString();

                listBoxArtigos.Items.Add(L);
            }

            cn.Close();


            artigo_atual = 0;
            ShowContact();
        }


        private void UpdateContact(ListaPrecosArtigo L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_UpdateArtigoListasPrecos @Cod_artigo, @Cod_lista_precos, @Preco";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_artigo", L.Cod_artigo);
            cmd.Parameters.AddWithValue("@Cod_lista_precos", L.Cod_lista_precos);
            cmd.Parameters.AddWithValue("@Preco", L.Preco);

            cmd.Connection = cn;


            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível editar o Artigo da Lista de Preços. \n ERROR MESSAGE: \n" + ex.Message);
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
            textBoxCod_artigo.ReadOnly = true;
            textBoxCod_lista_precos.ReadOnly = true;
            textBoxPreco.ReadOnly = true;
        }

        public void UnlockControls_Editar()
        {
            //textBoxCod_artigo.ReadOnly = false;
            //textBoxCod_lista_precos.ReadOnly = false;
            textBoxPreco.ReadOnly = false;
        }


        public void UnlockControls()
        {
            textBoxCod_artigo.ReadOnly = false;
            //textBoxCod_lista_precos.ReadOnly = false;
            textBoxPreco.ReadOnly = false;
        }

        public void ShowButtons()
        {
            LockControls();
            buttonEditar.Visible = true; ;
            buttonFiltrar.Visible = true; ;
            buttonGuardar.Visible = false;
            buttonCancelar.Visible = false;
            buttonProcurar.Visible = false;
        }

        public void ClearFields()
        {
            textBoxCod_artigo.Text = "";
            //textBoxCod_lista_precos.Text = "";
            textBoxPreco.Text = "";
        }

        public void ShowContact()
        {
            if (listBoxArtigos.Items.Count == 0 | artigo_atual < 0)
                return;
            ListaPrecosArtigo L = new ListaPrecosArtigo();
            L = (ListaPrecosArtigo)listBoxArtigos.Items[artigo_atual];

            textBoxCod_artigo.Text = L.Cod_artigo;
            textBoxCod_lista_precos.Text = L.Cod_lista_precos;
            textBoxPreco.Text = L.Preco;
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
            ListaPrecosArtigo L = new ListaPrecosArtigo();
            try
            {
                L.Cod_artigo = textBoxCod_artigo.Text;
                L.Cod_lista_precos = textBoxCod_lista_precos.Text;
                L.Preco = textBoxPreco.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }

            UpdateContact(L);
            listBoxArtigos.Items[artigo_atual] = L;
            
            return true;
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxArtigos.Enabled = true;
            if (listBoxArtigos.Items.Count > 0)
            {
                artigo_atual = listBoxArtigos.SelectedIndex;
                if (artigo_atual < 0)
                    artigo_atual = 0;
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
            artigo_atual = listBoxArtigos.SelectedIndex;
            if (artigo_atual < 0)
            {
                MessageBox.Show("Selecione um Artigo");
                return;
            }
            UnlockControls_Editar();
            HideButtons();
            listBoxArtigos.Enabled = false;
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
            listBoxArtigos.Enabled = true;
            int idx = listBoxArtigos.FindString(textBoxCod_artigo.Text);
            listBoxArtigos.SelectedIndex = idx;
            ShowButtons();
        }


        private bool procurarLojas()
        {
            ListaPrecosArtigo L = new ListaPrecosArtigo();
            try
            {
                L.Cod_artigo = textBoxCod_artigo.Text;
                L.Cod_lista_precos = textBoxCod_lista_precos.Text;
                L.Preco = textBoxPreco.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }


            if (!verifySGBDConnection())
                return false;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "EXEC ClubeVideo.pr_SearchArtigoListaPrecos @Cod_lista_precos, @Cod_artigo, @Preco";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_lista_precos", Cod_lista_precos_atual);
            cmd.Parameters.AddWithValue("@Cod_artigo", L.Cod_artigo.Equals("") ? (object)DBNull.Value : L.Cod_artigo);
            cmd.Parameters.AddWithValue("@Preco", L.Preco.Equals("") ? (object)DBNull.Value : Convert.ToDecimal(L.Preco));

            cmd.Connection = cn;


            SqlDataReader reader = cmd.ExecuteReader();
            listBoxArtigos.Items.Clear();
            ClearFields();

            while (reader.Read())
            {
                ListaPrecosArtigo LL = new ListaPrecosArtigo();

                LL.Cod_artigo = reader["Cod_artigo"].ToString();
                LL.Cod_lista_precos = reader["Cod_lista_precos"].ToString();
                LL.Preco = reader["Preco"].ToString();

                listBoxArtigos.Items.Add(LL);
            }

            cn.Close();

            artigo_atual = 0;
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

        private void labelartigo_Click(object sender, EventArgs e)
        {
            String nArtigo = textBoxCod_artigo.Text;

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

        private void buttonEnderecos_Click(object sender, EventArgs e)
        {

        }
    }
}
