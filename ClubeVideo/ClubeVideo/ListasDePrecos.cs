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
    public partial class ListasDePrecos : Form
    {
        private SqlConnection cn;
        private int lista_atual;
        private int empresa_atual;
        private bool criar;

        public ListasDePrecos(int empresa)
        {
            empresa_atual = empresa;
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
            if (listBoxListas.SelectedIndex >= 0)
            {
                lista_atual = listBoxListas.SelectedIndex;
                ShowContact();
            }
        }


        private void loadLojas()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_ListasPrecos_load @Cod_empresa";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_empresa", empresa_atual);
            cmd.Connection = cn;


            SqlDataReader reader = cmd.ExecuteReader();
            listBoxListas.Items.Clear();

            while (reader.Read())
            {
                ListaPrecos L = new ListaPrecos();

                L.Cod_lista_precos = reader["Cod_lista_precos"].ToString();
                L.Descricao = reader["Descricao"].ToString();
                L.Cod_empresa = reader["Cod_empresa"].ToString();

                listBoxListas.Items.Add(L);
            }

            cn.Close();

            lista_atual = 0;
            ShowContact();
        }

        private bool submeterLoja(ListaPrecos L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return false;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_criarListasPrecos @Cod_lista_precos, @Descricao, @Cod_empresa";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_lista_precos", L.Cod_lista_precos);
            cmd.Parameters.AddWithValue("@Descricao", L.Descricao);
            cmd.Parameters.AddWithValue("@Cod_empresa", L.Cod_empresa);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível criar a Lista de Preços. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            if (rows > 0)
            {
                MessageBox.Show("Criou");
                return true;
            }
            else
            {
                MessageBox.Show("Não Criou");
                return false;
            }
        }


        // Helper routines

        public void LockControls()
        {
            textBoxnCod_lista_precos.ReadOnly = true;
            textBoxDescricao.ReadOnly = true;
        }

        public void UnlockControls(bool filtrar)
        {
            textBoxnCod_lista_precos.ReadOnly = false;
            textBoxDescricao.ReadOnly = false;
        }

        public void ShowButtons()
        {
            LockControls();
            buttonCriar.Visible = true; 
            buttonFiltrar.Visible = true;
            buttonArtigos.Visible = true;
            buttonGuardar.Visible = false;
            buttonCancelar.Visible = false;
            buttonProcurar.Visible = false;
        }

        public void ClearFields()
        {
            textBoxnCod_lista_precos.Text = "";
            textBoxDescricao.Text = "";
        }

        public void ShowContact()
        {
            if (listBoxListas.Items.Count == 0 | lista_atual < 0)
                return;
            ListaPrecos L = new ListaPrecos();
            L = (ListaPrecos)listBoxListas.Items[lista_atual];

            textBoxnCod_lista_precos.Text = L.Cod_lista_precos;
            textBoxDescricao.Text = L.Descricao;
        }

        public void HideButtons()
        {
            buttonCriar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonArtigos.Visible = false;
            buttonGuardar.Visible = true;
            buttonCancelar.Visible = true;
            buttonProcurar.Visible = false;
        }


        public bool salvarLoja()
        {
            ListaPrecos L = new ListaPrecos();
            try
            {
                L.Cod_lista_precos = textBoxnCod_lista_precos.Text;
                L.Descricao = textBoxDescricao.Text;
                L.Cod_empresa = empresa_atual.ToString();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
            if (criar)
            {
                bool valid = submeterLoja(L);

                if (valid)
                {
                    listBoxListas.Items.Add(L);
                }
            }
            return true;
        }


        private void Form_closed(object sender, FormClosedEventArgs e)
        {
            Visible = true;
        }


        private void buttonCriar_Click(object sender, EventArgs e)
        {
            criar = true;
            ClearFields();
            UnlockControls(false);
            HideButtons();
            listBoxListas.Enabled = false;
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxListas.Enabled = true;
            if (listBoxListas.Items.Count > 0)
            {
                lista_atual = listBoxListas.SelectedIndex;
                if (lista_atual < 0)
                    lista_atual = 0;
                ShowContact();
            }
            else
            {
                ClearFields();
                LockControls();
            }
            ShowButtons();
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
            listBoxListas.Enabled = true;
            int idx = listBoxListas.FindString(textBoxnCod_lista_precos.Text);
            listBoxListas.SelectedIndex = idx;
            ShowButtons();
        }


        private bool procurarLojas()
        {
            ListaPrecos L = new ListaPrecos();
            try
            {
                L.Cod_lista_precos = textBoxnCod_lista_precos.Text;
                L.Descricao = textBoxDescricao.Text;
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
            cmd.CommandText = "EXEC ClubeVideo.pr_SearchListaPrecos @Cod_empresa, @Cod_lista_precos, @Descricao";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_empresa", L.Cod_empresa);
            cmd.Parameters.AddWithValue("@Cod_lista_precos", L.Cod_lista_precos.Equals("") ? (object)DBNull.Value : L.Cod_lista_precos);
            cmd.Parameters.AddWithValue("@Descricao", L.Descricao.Equals("") ? (object)DBNull.Value : L.Descricao);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            listBoxListas.Items.Clear();
            ClearFields();

            while (reader.Read())
            {
                ListaPrecos LL = new ListaPrecos();

                LL.Cod_lista_precos = reader["Cod_lista_precos"].ToString();
                LL.Descricao = reader["Descricao"].ToString();
                LL.Cod_empresa = reader["Cod_empresa"].ToString();

                listBoxListas.Items.Add(LL);
            }

            cn.Close();

            lista_atual = 0;
            ShowContact();

            return true;
        }

        public void HideButtons_Procurar()
        {
            buttonCriar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonArtigos.Visible = false;
            buttonGuardar.Visible = false;
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


        private void buttonArtigos_Click(object sender, EventArgs e)
        {
            ListaPrecos L = new ListaPrecos();
            try
            {
                L.Cod_lista_precos = textBoxnCod_lista_precos.Text;
                L.Descricao = textBoxDescricao.Text;
                L.Cod_empresa = empresa_atual.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return;
            }

            Visible = false;
            Artigos_da_Lista artigos = new Artigos_da_Lista(L.Cod_lista_precos);
            artigos.FormClosed += new FormClosedEventHandler(Form_closed);
            artigos.Show();

        }



        private void textBoxCod_endereco_TextChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }
    }
}
