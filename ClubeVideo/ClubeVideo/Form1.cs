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
    public partial class Form1 : Form
    {
        private SqlConnection cn;
        public static int empresa_atual = 1;
        private int Cod_Funcionario_atual;

        public Form1(int Cod_funcionario)
        {
            Cod_Funcionario_atual = Cod_funcionario;

            InitializeComponent();
            empresaFuncionario();
            loadNomeEmpresa();
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



        private void loadNomeEmpresa()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_NOMEEMPFUN", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nrEmpresa", empresa_atual);
            cmd.Parameters.AddWithValue("@nrFuncionario", Cod_Funcionario_atual);
            cmd.Parameters.Add("@nomeEmpresa", SqlDbType.VarChar, 30);
            cmd.Parameters["@nomeEmpresa"].Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@nomeFuncionario", SqlDbType.VarChar, 40);
            cmd.Parameters["@nomeFuncionario"].Direction = ParameterDirection.Output;

            try
            {
                _ = cmd.ExecuteNonQuery();
            } catch (Exception ex)
            {
                throw new Exception("Erro a conectar com base de dados e recolher nome da empresa \nMensagem erro: " + ex.Message);
            }

            labelNomeEmpresa.Text = (String)cmd.Parameters["@nomeEmpresa"].Value;
            labelNomeFunc.Text = "Bem-vinda/o " + ((String)cmd.Parameters["@nomeFuncionario"].Value).Split(' ')[0];

            cn.Close();
        }

        private void buttonEmpresa_Click(object sender, EventArgs e)
        {
            Visible = false;
            Empresas empresas = new Empresas();

            empresas.FormClosed += new FormClosedEventHandler(Form_closed);
            empresas.Show();
        }

        private void buttonArtigos_Click(object sender, EventArgs e)
        {
            Visible = false;
            Artigos artigos = new Artigos();

            artigos.FormClosed += new FormClosedEventHandler(Form_closed);
            artigos.Show();
        }

        private void buttonLojas_Click(object sender, EventArgs e)
        {
            Visible = false;
            Lojas lojas = new Lojas(empresa_atual, -1);

            lojas.FormClosed += new FormClosedEventHandler(Form_closed);
            lojas.Show();
        }

        private void buttonFuncionarios_Click(object sender, EventArgs e)
        {
            Visible = false;
            Funcionarios funcionarios = new Funcionarios(empresa_atual);

            funcionarios.FormClosed += new FormClosedEventHandler(Form_closed);
            funcionarios.Show();
        }
        private void buttonTerceiro_Click(object sender, EventArgs e)
        {
            Visible = false;
            Terceiros terceiros = new Terceiros();

            terceiros.FormClosed += new FormClosedEventHandler(Form_closed);
            terceiros.Show();
        }
        private void buttonListaPrecos_Click(object sender, EventArgs e)
        {
            Visible = false;
            ListasDePrecos lista = new ListasDePrecos(empresa_atual);

            lista.FormClosed += new FormClosedEventHandler(Form_closed);
            lista.Show();
        }

        private void Form_closed(object sender, FormClosedEventArgs e)
        {
            Visible = true;
            loadNomeEmpresa();
        }

        private void buttonEnderecos_Click(object sender, EventArgs e)
        {
            Visible = false;
            Enderecos enderecos = new Enderecos();

            enderecos.FormClosed += new FormClosedEventHandler(Form_closed);
            enderecos.Show();
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            Visible = false;
            Login login = new Login();

            login.FormClosed += new FormClosedEventHandler(Form_closed);
            login.Show();
        }
    }
}
