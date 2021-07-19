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
    public partial class Artigos : Form
    {
        private SqlConnection cn;
        private int artigo_atual;
        public Artigos()
        {
            InitializeComponent();
            loadArtigos();
            LockControls();
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

        private void loadArtigos()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("EXEC ClubeVideo.pr_TodosArtigos", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBoxArtigos.Items.Clear();

            while (reader.Read())
            {
                Artigo A = new Artigo();
                //C.CustomerID = reader["CustomerID"].ToString();
                A.nArtigo = reader["nArtigo"].ToString();
                A.nome = reader["nome"].ToString();
                A.stockMin = reader["stockMin"].ToString();
                A.stockMax = reader["stockMax"].ToString();
                A.precoStock = reader["precoStock"].ToString();
                A.dataCriacao = reader["dataCriacao"].ToString();
                A.dataUltAlteracao = reader["dataUltAlt"].ToString();
                A.iva = reader["IVA"].ToString();
                A.stock = reader["stock"].ToString();
                A.qtStock = reader["quantStock"].ToString();
                A.qtDispLojas = reader["quantDispLojas"].ToString();
                A.qtAlugLojas = reader["quantAlugLojas"].ToString();
                A.estado = reader["estado"].ToString();

                listBoxArtigos.Items.Add(A);
            }

            cn.Close();


            artigo_atual = 0;
            Mostrar_artigo();
        }

        public void Mostrar_artigo()
        {
            if (listBoxArtigos.Items.Count == 0 | artigo_atual < 0)
                return;
            Artigo artigo = new Artigo();
            artigo = (Artigo)listBoxArtigos.Items[artigo_atual];
            textBoxArtigo.Text = artigo.nArtigo;
            textBoxNome.Text = artigo.nome;
            textBoxStockMin.Text = artigo.stockMin;
            textBoxStockMax.Text = artigo.stockMax;
            textBoxPrecoStock.Text = artigo.precoStock;
            textBoxCriacao.Text = artigo.dataCriacao;
            textBoxUltAlteracao.Text = artigo.dataUltAlteracao;
            textBoxIva.Text = artigo.iva;
            textBoxStock.Text = artigo.stock;
            textBoxQtStock.Text = artigo.qtStock;
            textBoxQtLojas.Text = artigo.qtAlugLojas;
            textBoxQtAlugLojas.Text = artigo.qtAlugLojas;
            textBoxEstado.Text = artigo.estado;
        }

        public void ClearFields()
        {
            textBoxArtigo.Text = "";
            textBoxNome.Text = "";
            textBoxStockMin.Text = "";
            textBoxStockMax.Text = "";
            textBoxPrecoStock.Text = "";
            textBoxCriacao.Text = "";
            textBoxUltAlteracao.Text = "";
            textBoxIva.Text = "";
            textBoxStock.Text = "";
            textBoxQtStock.Text = "";
            textBoxQtLojas.Text = "";
            textBoxQtAlugLojas.Text = "";
            textBoxEstado.Text = "";
        }

        public void HideButtons()
        {
            UnlockControls();
            buttonEditar.Visible = false;
            buttonProcurar.Visible = false;
            buttonProcuraPorNome.Visible = false;
            buttonSalvar.Visible = true;
            buttonCancelar.Visible = true;
        }

        public void ShowButtons()
        {
            LockControls();
            buttonEditar.Visible = true;
            buttonProcurar.Visible = true;
            buttonProcuraPorNome.Visible = false;
            buttonSalvar.Visible = false;
            buttonCancelar.Visible = false;
        }

        public void LockControls()
        {
            textBoxArtigo.ReadOnly = true;
            textBoxNome.ReadOnly = true;
            textBoxStockMin.ReadOnly = true;
            textBoxStockMax.ReadOnly = true;
            textBoxPrecoStock.ReadOnly = true;
            textBoxCriacao.ReadOnly = true;
            textBoxUltAlteracao.ReadOnly = true;
            textBoxIva.ReadOnly = true;
            textBoxStock.ReadOnly = true;
            textBoxQtStock.ReadOnly = true;
            textBoxQtLojas.ReadOnly = true;
            textBoxQtAlugLojas.ReadOnly = true;
            textBoxEstado.ReadOnly = true;
        }

        public void UnlockControls()
        {
            textBoxArtigo.ReadOnly = false;
            textBoxNome.ReadOnly = false;
            textBoxStockMin.ReadOnly = false;
            textBoxStockMax.ReadOnly = false;
            textBoxPrecoStock.ReadOnly = false;
            textBoxCriacao.ReadOnly = false;
            textBoxUltAlteracao.ReadOnly = false;
            textBoxIva.ReadOnly = false;
            textBoxStock.ReadOnly = false;
            textBoxQtStock.ReadOnly = false;
            textBoxQtLojas.ReadOnly = false;
            textBoxQtAlugLojas.ReadOnly = false;
            textBoxEstado.ReadOnly = false;
        }

        public bool salvarArtigo()
        {
            Artigo artigo = new Artigo();
            try
            {
                artigo.nArtigo = textBoxArtigo.Text;
                artigo.nome = textBoxNome.Text;
                artigo.stockMin = textBoxStockMin.Text;
                artigo.stockMax = textBoxStockMax.Text;
                artigo.precoStock = textBoxStock.Text;
                artigo.dataCriacao = textBoxCriacao.Text;
                artigo.dataUltAlteracao = textBoxUltAlteracao.Text;
                artigo.iva = textBoxIva.Text;
                artigo.stock = textBoxStock.Text;
                artigo.qtStock = textBoxQtStock.Text;
                artigo.qtDispLojas = textBoxQtLojas.Text;
                artigo.qtAlugLojas = textBoxQtAlugLojas.Text;
                artigo.estado = textBoxEstado.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
            
            atualizar_artigo(artigo);
            listBoxArtigos.Items[artigo_atual] = artigo;
  
            return true;
        }

        private void atualizar_artigo(Artigo a)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            /*update ClubeVideo.Artigo Set nome = 'The Prestige', stockMin = 1001, stockMax= 6000, precoStock = 15,
	dataCriacao = '', dataUltAlt = '', Iva = 1, stock = 1 where nArtigo = 15;
             */
            cmd.CommandText = "EXEC ClubeVideo.pr_UpdateArtigos " + "@nome = @nome_, " + "@stockMin = @stockMin_, " + "@stockMax = @stockMax_, " + "@precoStock = @precoStock_, " + "@dataUltAlt = @dataUltAlt_, "
                + "@Iva = @Iva_, " + "@stock = @stock_, " + "@estado = @estado_, " + "@nArtigo = @nArtigo_;";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nArtigo_", a.nArtigo);
            cmd.Parameters.AddWithValue("@nome_", a.nome);
            cmd.Parameters.AddWithValue("@stockMin_", a.stockMin);
            cmd.Parameters.AddWithValue("@stockMax_", a.stockMax);
            cmd.Parameters.AddWithValue("@precoStock_", a.precoStock);
            cmd.Parameters.AddWithValue("@dataUltAlt_", a.dataUltAlteracao);
            cmd.Parameters.AddWithValue("@IVA_", a.iva);
            cmd.Parameters.AddWithValue("@stock_", a.stock);
            cmd.Parameters.AddWithValue("@estado_", a.estado);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to update product in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                if (rows == 1)
                    MessageBox.Show("Update OK");
                else
                    MessageBox.Show("Update NOT OK");

                cn.Close();
            }
        }

        /*
        private void submeterArtigo(Artigo a)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_InsertInArtigos " + "@nome = @nome_, " + "@stockMin = @stockMin_, " + "@stockMax = @stockMax_, " + "@precoStock = @precoStock_, " + "@dataCriacao = @dataCriacao_, " + "@dataUltAlt = @dataUltAlt_, "
                + "@Iva = @Iva_, " + "@stock = @stock_, " + "@quantStock = @quantStock_, " + "@quantDispLojas = @quantDispLojas_, " + "@quantAlugLojas = @quantAlugLojas_, " + "@estado = @estado_, " + "@nArtigo = @nArtigo_;";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nArtigo_", a.nArtigo);
            cmd.Parameters.AddWithValue("@nome_", a.nome);
            cmd.Parameters.AddWithValue("@stockMin_", a.stockMin);
            cmd.Parameters.AddWithValue("@stockMax_", a.stockMax);
            cmd.Parameters.AddWithValue("@precoStock_", a.precoStock);
            cmd.Parameters.AddWithValue("@dataCriacao_", a.dataCriacao);
            cmd.Parameters.AddWithValue("@dataUltAlt_", a.dataUltAlteracao);
            cmd.Parameters.AddWithValue("@IVA_", a.iva);
            cmd.Parameters.AddWithValue("@stock_", a.stock);
            cmd.Parameters.AddWithValue("@quantStock_", a.qtStock);
            cmd.Parameters.AddWithValue("@quantDispLojas_", a.qtDispLojas);
            cmd.Parameters.AddWithValue("@quantAlugLojas_", a.qtAlugLojas);
            cmd.Parameters.AddWithValue("@estado_", a.estado);
            cmd.Connection = cn;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to update product in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }*/

        private void listBoxArtigos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxArtigos.SelectedIndex >= 0)
            {
                artigo_atual = listBoxArtigos.SelectedIndex;
                Mostrar_artigo();
            }
        }

        /*private void buttonCriar_Click(object sender, EventArgs e)
        {
            criar = true;
            ClearFields();
            HideButtons();
            listBoxArtigos.Enabled = false;
        }*/

        private void buttonSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                _ = salvarArtigo();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            listBoxArtigos.Enabled = true;
            int idx = listBoxArtigos.FindString(textBoxArtigo.Text);
            listBoxArtigos.SelectedIndex = idx;
            ShowButtons();
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxArtigos.Enabled = true;
            if (listBoxArtigos.Items.Count > 0)
            {
                artigo_atual = listBoxArtigos.SelectedIndex;
                if (artigo_atual < 0)
                    artigo_atual = 0;
                Mostrar_artigo();
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
                MessageBox.Show("Please select a product to edit");
                return;
            }
            HideButtons();
            listBoxArtigos.Enabled = false;
        }

        /*private void remover_artigo(string nArtigo)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "DELETE ClubeVideo.Artigo WHERE nArtigo=@nArtigo ";
            cmd.Parameters.Clear();
            _ = cmd.Parameters.AddWithValue("@nArtigo", nArtigo);
            cmd.Connection = cn;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to delete product in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }*/
        /*private void buttonRemover_Click(object sender, EventArgs e)
        {
            if (listBoxArtigos.SelectedIndex > -1)
            {
                try
                {
                    remover_artigo(((Artigo)listBoxArtigos.SelectedItem).nArtigo);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }
                listBoxArtigos.Items.RemoveAt(listBoxArtigos.SelectedIndex);
                if (artigo_atual == listBoxArtigos.Items.Count)
                    artigo_atual = listBoxArtigos.Items.Count - 1;
                if (artigo_atual == -1)
                {
                    ClearFields();
                    MessageBox.Show("There are no more products");
                }
                else
                {
                    Mostrar_artigo();
                }
            }
            else
            {
                MessageBox.Show("Please select a product to remove");
                return;
            }
        }*/

        private void ocultar_tudo()
        {
            textBoxIva.Text = "";
            textBoxArtigo.Visible = false;
            textBoxNome.Visible = false;
            textBoxStockMin.Visible = false;
            textBoxStockMax.Visible = false;
            textBoxPrecoStock.Visible = false;
            textBoxCriacao.Visible = false;
            textBoxUltAlteracao.Visible = false;
            textBoxStock.Visible = false;
            textBoxQtStock.Visible = false;
            textBoxQtLojas.Visible = false;
            textBoxQtAlugLojas.Visible = false;
            textBoxEstado.Visible = false;
            // labels
            label8.Text = "Procurar por número do artigo...";
            label1.Visible = false;
            label2.Visible = false;
            label3.Visible = false;
            label4.Visible = false;
            label5.Visible = false;
            label6.Visible = false;
            label7.Visible = false;
            label9.Visible = false;
            label10.Visible = false;
            label11.Visible = false;
            label12.Visible = false;
            label13.Visible = false;
        }

        private void voltar_a_mostrar()
        {
            textBoxArtigo.Visible = true;
            textBoxNome.Visible = true;
            textBoxStockMin.Visible = true;
            textBoxStockMax.Visible = true;
            textBoxPrecoStock.Visible = true;
            textBoxCriacao.Visible = true;
            textBoxUltAlteracao.Visible = true;
            textBoxStock.Visible = true;
            textBoxQtStock.Visible = true;
            textBoxQtLojas.Visible = true;
            textBoxQtAlugLojas.Visible = true;
            textBoxEstado.Visible = true;
            // labels
            label8.Text = "IVA";
            label1.Visible = true;
            label2.Visible = true;
            label3.Visible = true;
            label4.Visible = true;
            label5.Visible = true;
            label6.Visible = true;
            label7.Visible = true;
            label9.Visible = true;
            label10.Visible = true;
            label11.Visible = true;
            label12.Visible = true;
            label13.Visible = true;
        }

        /* Usar para o caso de se procurar pelo nome
        private int quantos_numeros(string s)
        {
            char[] c = s.ToCharArray();
            for (int i = 0; i < s.Length; i++)
            {
                if (!char.IsDigit(c[i]))
                {
                    return i;
                }
            }
            return s.Length - 1;
        }*/

        private void procurar_artigo()
        {
            string nome_procura = textBoxIva.Text;
            if (!string.IsNullOrEmpty(nome_procura))
            {
                int index = listBoxArtigos.FindString(nome_procura);
                if (index != -1)
                {
                    listBoxArtigos.SetSelected(index, true);
                    artigo_atual = index;
                }
                else
                    MessageBox.Show("The search string did not match any items in the ListBox");
            }
            Mostrar_artigo();
            voltar_a_mostrar();
            ShowButtons();
        }

        private void buttonProcurar_Click(object sender, EventArgs e)
        {
            ocultar_tudo();
            HideButtons();
            buttonSalvar.Visible = false;
            buttonProcuraPorNome.Visible = true;
        }

        private void buttonProcuraPorNome_Click(object sender, EventArgs e)
        {
            procurar_artigo();
            buttonProcuraPorNome.Visible = false;
        }
    }
}
