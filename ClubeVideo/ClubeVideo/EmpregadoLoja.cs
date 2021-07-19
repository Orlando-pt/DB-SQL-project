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
    public partial class EmpregadoLoja : Form
    {
        private SqlConnection cn;
        private int Cod_Funcionario_atual;
        private int empresa_atual;

        public EmpregadoLoja(int Cod_Funcionario)
        {
            Cod_Funcionario_atual = Cod_Funcionario;

            InitializeComponent();
            empresaFuncionario();
        }


        private void EmpregadoLoja_Load(object sender, EventArgs e)
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


        private void empresaFuncionario()
        {

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SELECT * FROM ClubeVideo.f_EmpresaFuncionario(@Cod_funcionario)";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_funcionario", Cod_Funcionario_atual);
            cmd.Connection = cn;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível determinar a empresa. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    empresa_atual = Int32.Parse(reader["Cod_empresa"].ToString());
                }

                cn.Close();
            }
        }


        private void Form_closed(object sender, FormClosedEventArgs e)
        {
            Visible = true;
        }


        private void buttonLojas_Click(object sender, EventArgs e)
        {
            Visible = false;
            Lojas lojas = new Lojas(empresa_atual, Cod_Funcionario_atual);

            lojas.FormClosed += new FormClosedEventHandler(Form_closed);
            lojas.Show();
        }

        private void buttonTerceiro_Click(object sender, EventArgs e)
        {
            Visible = false;
            Terceiros terceiros = new Terceiros();

            terceiros.FormClosed += new FormClosedEventHandler(Form_closed);
            terceiros.Show();
        }
    }
}
