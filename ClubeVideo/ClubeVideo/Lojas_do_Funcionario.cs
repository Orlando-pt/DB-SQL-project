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
    public partial class Lojas_do_Funcionario : Form
    {
        private SqlConnection cn;
        private string Cod_funcionario_atual;

        private int loja_atual_Disp;
        private int loja_atual_Esc;

        public Lojas_do_Funcionario(string Cod_funcionario)
        {

            Cod_funcionario_atual = Cod_funcionario;
            InitializeComponent();
            load_LojasEsc();
            load_LojasDisp();
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
            if (listBoxLojasDisp.SelectedIndex >= 0)
            {
                loja_atual_Disp = listBoxLojasDisp.SelectedIndex;
            }
        }

        private void listBoxProdutosEsc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxLojasEsc.SelectedIndex >= 0)
            {
                loja_atual_Esc = listBoxLojasEsc.SelectedIndex;
            }
        }


        public void ShowButtons()
        {
            buttonCriar.Visible = true;
            buttonEliminar.Visible = true;
            buttonTerminar.Visible = true;
        }

        

        private void load_LojasEsc()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_FuncionarioLojas_load @Cod_funcionario";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_funcionario", Cod_funcionario_atual);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            listBoxLojasEsc.Items.Clear();

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

                listBoxLojasEsc.Items.Add(L);
            }

            cn.Close();

            loja_atual_Esc = 0;
        }


        private void load_LojasDisp()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_FuncionarioNLojas_load @Cod_funcionario";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_funcionario", Cod_funcionario_atual);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            listBoxLojasDisp.Items.Clear();

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

                listBoxLojasDisp.Items.Add(L);
            }

            cn.Close();

            loja_atual_Disp = 0;
        }



        private void submeterProduto(Loja L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_insertFuncionarioLoja @Cod_loja, @Cod_funcionario";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_loja", L.Cod_loja);
            cmd.Parameters.AddWithValue("@Cod_funcionario", Cod_funcionario_atual);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível atribuir o Funcionário à Loja. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();

            }
            if (rows == 1)
            {
                MessageBox.Show("Atribuido");
            }
            else
            {
                MessageBox.Show("Não Atribuido");
            }
        }

        private void buttonCriar_Click(object sender, EventArgs e)
        {
            if (listBoxLojasDisp.SelectedIndex > -1)
            {
                try
                {
                    Loja L = (Loja)listBoxLojasDisp.SelectedItem;
                    submeterProduto(L);

                    listBoxLojasEsc.Items.Add(L);

                    //load_LojasEsc();
                    //load_LojasDisp();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }


                listBoxLojasDisp.Items.RemoveAt(listBoxLojasDisp.SelectedIndex);
                if (loja_atual_Disp == listBoxLojasDisp.Items.Count)
                    loja_atual_Disp = (listBoxLojasDisp.Items.Count - 1);

                if (loja_atual_Disp == -1)
                {
                    MessageBox.Show("Não existem mais Lojas disponíveis");
                }
                
            }
        }


        private void RemoveLoja(Loja L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_deleteFuncionarioLoja @Cod_loja, @Cod_funcionario";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_loja", L.Cod_loja);
            cmd.Parameters.AddWithValue("@Cod_funcionario", Cod_funcionario_atual);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível retirar o Funcionário da Loja. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            if (rows == 1)
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
            if (listBoxLojasEsc.SelectedIndex > -1)
            {
                try
                {
                    Loja L = (Loja)listBoxLojasEsc.SelectedItem;
                    RemoveLoja(L);
                    listBoxLojasDisp.Items.Add(L);

                    //load_LojasEsc();
                    //load_LojasDisp();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }


                listBoxLojasEsc.Items.RemoveAt(listBoxLojasEsc.SelectedIndex);
                if (loja_atual_Esc == listBoxLojasEsc.Items.Count)
                    loja_atual_Esc = listBoxLojasEsc.Items.Count - 1;

                if (loja_atual_Esc == -1)
                {
                    MessageBox.Show("Não existem mais Lojas atribuidas");
                }
                
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
