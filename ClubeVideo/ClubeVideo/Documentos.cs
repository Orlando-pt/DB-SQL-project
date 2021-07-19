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
    public partial class Documentos : Form
    {
        private SqlConnection cn;
        private int documento_atual;
        private int empresa_atual;
        private string loja_atual;
        private int nVendedor_atual;
        private int tipoDoc_atual;
        private bool funcLoja_atual;
        private bool criar;

        public Documentos(int empresa, string loja, int nVendedor, int tipoDoc, bool funcLoja)
        {
            empresa_atual = empresa;
            loja_atual = loja;
            nVendedor_atual = nVendedor;
            tipoDoc_atual = tipoDoc;
            funcLoja_atual = funcLoja;

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
            if (listBoxDocumentos.SelectedIndex >= 0)
            {
                documento_atual = listBoxDocumentos.SelectedIndex;
                ShowContact();
            }
        }


        private void loadLojas()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Documentos_load @empresa, @loja, @nVendedor, @tipoDoc";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@empresa", empresa_atual);
            cmd.Parameters.AddWithValue("@loja", loja_atual.Equals("") ? (object)DBNull.Value : loja_atual);
            cmd.Parameters.AddWithValue("@nVendedor", (nVendedor_atual == -1) ? (object)DBNull.Value : nVendedor_atual);
            cmd.Parameters.AddWithValue("@tipoDoc", (tipoDoc_atual == -1) ? (object)DBNull.Value : tipoDoc_atual);
            cmd.Connection = cn;


            SqlDataReader reader = cmd.ExecuteReader();
            listBoxDocumentos.Items.Clear();

            while (reader.Read())
            {
                Documento L = new Documento();
                L.nDocumento = reader["nDocumento"].ToString();
                L.tipoDoc = reader["tipoDoc"].ToString();
                L.empresa = reader["empresa"].ToString();
                L.terceiro = reader["terceiro"].ToString();
                L.loja = reader["loja"].ToString();
                L.dataEmissao = reader["dataEmissao"].ToString();
                L.dataEntrega = reader["dataEntrega"].ToString();
                L.nVendedor = reader["nVendedor"].ToString();
                L.dataVencimento = reader["dataVencimento"].ToString();
                L.fExpedicao = reader["fExpedicao"].ToString();
                L.endEntrega = reader["endEntrega"].ToString();
                L.endFaturacao = reader["endFaturacao"].ToString();
                L.valorTotal = reader["valorTotal"].ToString();
                L.valorTotalIVA = reader["valorTotalIVA"].ToString();
                L.estado = reader["estado"].ToString();

                listBoxDocumentos.Items.Add(L);
            }

            cn.Close();

            documento_atual = 0;
            ShowContact();
        }

        private bool submeterLoja(Documento L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return false;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_NovoDocumento @tipoDoc, @empresa, @terceiro, @loja, @dataEmissao, @dataEntrega, @nVendedor, @dataVencimento, @fExpedicao, @endEntrega, @endFaturacao";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@tipoDoc", L.tipoDoc);
            cmd.Parameters.AddWithValue("@empresa", L.empresa);
            cmd.Parameters.AddWithValue("@terceiro", L.terceiro);
            cmd.Parameters.AddWithValue("@loja", L.loja);
            cmd.Parameters.AddWithValue("@dataEmissao", DateTime.Parse(L.dataEmissao));
            cmd.Parameters.AddWithValue("@dataEntrega", DateTime.Parse(L.dataEntrega));
            cmd.Parameters.AddWithValue("@nVendedor", L.nVendedor);
            cmd.Parameters.AddWithValue("@dataVencimento", DateTime.Parse(L.dataVencimento));
            cmd.Parameters.AddWithValue("@fExpedicao", L.fExpedicao);
            cmd.Parameters.AddWithValue("@endEntrega", L.endEntrega);
            cmd.Parameters.AddWithValue("@endFaturacao", L.endFaturacao);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível criar o Documento. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            if (rows == 1)
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
            textBoxnDocumento.ReadOnly = true;
            textBoxtipoDoc.ReadOnly = true;
            textBoxterceiro.ReadOnly = true;
            textBoxloja.ReadOnly = true;
            textBoxdataEmissao.ReadOnly = true;
            textBoxdataEntrega.ReadOnly = true;
            textBoxnVendedor.ReadOnly = true;
            textBoxdataVencimento.ReadOnly = true;
            textBoxfExpedicao.ReadOnly = true;
            textBoxendEntrega.ReadOnly = true;
            textBoxendFaturacao.ReadOnly = true;
            textBoxvalorTotal.ReadOnly = true;
            textBoxvalorTotalIVA.ReadOnly = true;
            textBoxestado.ReadOnly = true;
        }

        public void UnlockControls(bool filtrar)
        {
            if (tipoDoc_atual == -1)
            {
                textBoxtipoDoc.ReadOnly = false;
            }

            textBoxterceiro.ReadOnly = false;

            if (loja_atual.Equals(""))
            {
                textBoxloja.ReadOnly = false;
            }

            textBoxdataEmissao.ReadOnly = false;
            textBoxdataEntrega.ReadOnly = false;

            if (nVendedor_atual == -1)
            {
                textBoxnVendedor.ReadOnly = false;
            }

            textBoxdataVencimento.ReadOnly = false;
            textBoxfExpedicao.ReadOnly = false;
            textBoxendEntrega.ReadOnly = false;
            textBoxendFaturacao.ReadOnly = false;

            if (filtrar)
            {
                textBoxnDocumento.ReadOnly = false;
                textBoxvalorTotal.ReadOnly = false;
                textBoxvalorTotalIVA.ReadOnly = false;
                textBoxestado.ReadOnly = false;
            }

        }

        public void ShowButtons()
        {
            LockControls();
            
            buttonFiltrar.Visible = true;
            buttonLinhas.Visible = true;
            buttonAtualizar.Visible = true;
            
            buttonGuardar.Visible = false;
            buttonCancelar.Visible = false;
            buttonProcurar.Visible = false;

            if (funcLoja_atual)
            {
                buttonCriar.Visible = true;
                buttonEliminar.Visible = true;
                buttonEnderecos.Visible = true;
            }
            else
            {
                buttonCriar.Visible = false;
                buttonEliminar.Visible = false;
                buttonEnderecos.Visible = false;
            }
        }

        public void ClearFields()
        {
            textBoxnDocumento.Text = "";

            if (tipoDoc_atual == -1)
            {
                textBoxtipoDoc.Text = "";
            }

            textBoxterceiro.Text = "";

            if (loja_atual.Equals(""))
            {
                textBoxloja.Text = "";
            }

            textBoxdataEmissao.Text = "";
            textBoxdataEntrega.Text = "";

            if (nVendedor_atual == -1)
            {
                textBoxnVendedor.Text = "";
            }
            
            textBoxdataVencimento.Text = "";
            textBoxfExpedicao.Text = "";
            textBoxendEntrega.Text = "";
            textBoxendFaturacao.Text = "";
            textBoxvalorTotal.Text = "";
            textBoxvalorTotalIVA.Text = "";
            textBoxestado.Text = "";
        }

        public void ShowContact()
        {
            if (listBoxDocumentos.Items.Count == 0 | documento_atual < 0)
            {
                textBoxtipoDoc.Text = tipoDoc_atual.ToString();
                textBoxloja.Text = loja_atual;
                textBoxnVendedor.Text = nVendedor_atual.ToString();
                return;
            }
                
            Documento L = new Documento();
            L = (Documento)listBoxDocumentos.Items[documento_atual];

            textBoxnDocumento.Text = L.nDocumento;
            textBoxtipoDoc.Text = L.tipoDoc;
            textBoxterceiro.Text = L.terceiro;
            textBoxloja.Text = L.loja;
            textBoxdataEmissao.Text = L.dataEmissao;
            textBoxdataEntrega.Text = L.dataEntrega;
            textBoxnVendedor.Text = L.nVendedor;
            textBoxdataVencimento.Text = L.dataVencimento;
            textBoxfExpedicao.Text = L.fExpedicao;
            textBoxendEntrega.Text = L.endEntrega;
            textBoxendFaturacao.Text = L.endFaturacao;
            textBoxvalorTotal.Text = L.valorTotal;
            textBoxvalorTotalIVA.Text = L.valorTotalIVA;
            textBoxestado.Text = L.estado;
        }

        public void HideButtons()
        {
            buttonCriar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonLinhas.Visible = false;
            buttonAtualizar.Visible = false;
            buttonEliminar.Visible = false;
            buttonGuardar.Visible = true;
            buttonCancelar.Visible = true;
            buttonProcurar.Visible = false;
        }


        public bool salvarLoja()
        {
            Documento L = new Documento();
            try
            {
                L.nDocumento = textBoxnDocumento.Text;
                L.tipoDoc = textBoxtipoDoc.Text;
                L.empresa = empresa_atual.ToString();
                L.terceiro = textBoxterceiro.Text;
                L.loja = textBoxloja.Text;
                L.dataEmissao = textBoxdataEmissao.Text;
                L.dataEntrega = textBoxdataEntrega.Text;
                L.nVendedor = textBoxnVendedor.Text;
                L.dataVencimento = textBoxdataVencimento.Text;
                L.fExpedicao = textBoxfExpedicao.Text;
                L.endEntrega = textBoxendEntrega.Text;
                L.endFaturacao = textBoxendFaturacao.Text;
                //L.valorTotal = textBoxvalorTotal.Text;
                //L.valorTotalIVA = textBoxvalorTotalIVA.Text;
                //L.estado = textBoxestado.Text;

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
                    L.estado = "False";
                    listBoxDocumentos.Items.Add(L);
                }
            }
            return true;
        }

 
        private void buttonCriar_Click(object sender, EventArgs e)
        {
            criar = true;
            ClearFields();
            UnlockControls(false);
            HideButtons();
            listBoxDocumentos.Enabled = false;
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxDocumentos.Enabled = true;
            if (listBoxDocumentos.Items.Count > 0)
            {
                documento_atual = listBoxDocumentos.SelectedIndex;
                if (documento_atual < 0)
                    documento_atual = 0;
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
            listBoxDocumentos.Enabled = true;
            int idx = listBoxDocumentos.FindString(textBoxnDocumento.Text);
            listBoxDocumentos.SelectedIndex = idx;
            ShowButtons();
        }


        private bool procurarLojas()
        {
            Documento L = new Documento();
            try
            {
                L.nDocumento = textBoxnDocumento.Text;
                L.tipoDoc = textBoxtipoDoc.Text;
                L.empresa = empresa_atual.ToString();
                L.terceiro = textBoxterceiro.Text;
                L.loja = textBoxloja.Text;
                L.dataEmissao = textBoxdataEmissao.Text;
                L.dataEntrega = textBoxdataEntrega.Text;
                L.nVendedor = textBoxnVendedor.Text;
                L.dataVencimento = textBoxdataVencimento.Text;
                L.fExpedicao = textBoxfExpedicao.Text;
                L.endEntrega = textBoxendEntrega.Text;
                L.endFaturacao = textBoxendFaturacao.Text;
                L.valorTotal = textBoxvalorTotal.Text;
                L.valorTotalIVA = textBoxvalorTotalIVA.Text;
                L.estado = textBoxestado.Text;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }


            if (!verifySGBDConnection())
                return false;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "EXEC ClubeVideo.pr_SearchDocumento @empresa, @nDocumento, @tipoDoc, @terceiro, @loja, @dataEmissao, @dataEntrega, @nVendedor, @dataVencimento, @fExpedicao, @endEntrega, @endFaturacao, @valorTotal, @valorTotalIVA, @estado";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@empresa", L.empresa);
            cmd.Parameters.AddWithValue("@nDocumento", L.nDocumento.Equals("") ? (object)DBNull.Value : L.nDocumento);
            cmd.Parameters.AddWithValue("@tipoDoc", L.tipoDoc.Equals("") ? (object)DBNull.Value : L.tipoDoc);
            cmd.Parameters.AddWithValue("@terceiro", L.terceiro.Equals("") ? (object)DBNull.Value : L.terceiro);
            cmd.Parameters.AddWithValue("@loja", L.loja.Equals("") ? (object)DBNull.Value : L.loja);
            cmd.Parameters.AddWithValue("@dataEmissao", L.dataEmissao.Equals("") ? (object)DBNull.Value : DateTime.Parse(L.dataEmissao));
            cmd.Parameters.AddWithValue("@dataEntrega", L.dataEntrega.Equals("") ? (object)DBNull.Value : DateTime.Parse(L.dataEntrega));
            cmd.Parameters.AddWithValue("@nVendedor", L.nVendedor.Equals("") ? (object)DBNull.Value : L.nVendedor);
            cmd.Parameters.AddWithValue("@dataVencimento", L.dataVencimento.Equals("") ? (object)DBNull.Value : DateTime.Parse(L.dataVencimento));
            cmd.Parameters.AddWithValue("@fExpedicao", L.fExpedicao.Equals("") ? (object)DBNull.Value : L.fExpedicao);
            cmd.Parameters.AddWithValue("@endEntrega", L.endEntrega.Equals("") ? (object)DBNull.Value : L.endEntrega);
            cmd.Parameters.AddWithValue("@endFaturacao", L.endFaturacao.Equals("") ? (object)DBNull.Value : L.endFaturacao);
            cmd.Parameters.AddWithValue("@valorTotal", L.valorTotal.Equals("") ? (object)DBNull.Value : Convert.ToDecimal(L.valorTotal));
            cmd.Parameters.AddWithValue("@valorTotalIVA", L.valorTotalIVA.Equals("") ? (object)DBNull.Value : Convert.ToDecimal(L.valorTotalIVA));
            cmd.Parameters.AddWithValue("@estado", L.estado.Equals("") ? (object)DBNull.Value : L.estado);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            listBoxDocumentos.Items.Clear();
            ClearFields();

            while (reader.Read())
            {
                Documento LL = new Documento();

                LL.nDocumento = reader["nDocumento"].ToString();
                LL.tipoDoc = reader["tipoDoc"].ToString();
                LL.empresa = reader["empresa"].ToString();
                LL.terceiro = reader["terceiro"].ToString();
                LL.loja = reader["loja"].ToString();
                LL.dataEmissao = reader["dataEmissao"].ToString();
                LL.dataEntrega = reader["dataEntrega"].ToString();
                LL.nVendedor = reader["nVendedor"].ToString();
                LL.dataVencimento = reader["dataVencimento"].ToString();
                LL.fExpedicao = reader["fExpedicao"].ToString();
                LL.endEntrega = reader["endEntrega"].ToString();
                LL.endFaturacao = reader["endFaturacao"].ToString();
                LL.valorTotal = reader["valorTotal"].ToString();
                LL.valorTotalIVA = reader["valorTotalIVA"].ToString();
                LL.estado = reader["estado"].ToString();

                listBoxDocumentos.Items.Add(LL);
            }

            cn.Close();

            documento_atual = 0;
            ShowContact();

            return true;
        }

        public void HideButtons_Procurar()
        {
            buttonCriar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonLinhas.Visible = false;
            buttonAtualizar.Visible = false;
            buttonEliminar.Visible = false;
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


        private void buttonLinhas_Click(object sender, EventArgs e)
        {
            Documento L = new Documento();
            try
            {
                L.nDocumento = textBoxnDocumento.Text;
                L.tipoDoc = textBoxtipoDoc.Text;
                L.empresa = empresa_atual.ToString();
                //L.terceiro = textBoxterceiro.Text;
                //L.loja = textBoxloja.Text;
                //L.dataEmissao = textBoxdataEmissao.Text;
                //L.dataEntrega = textBoxdataEntrega.Text;
                //L.nVendedor = textBoxnVendedor.Text;
                //L.dataVencimento = textBoxdataVencimento.Text;
                //L.fExpedicao = textBoxfExpedicao.Text;
                // L.endEntrega = textBoxendEntrega.Text;
                //L.endFaturacao = textBoxendFaturacao.Text;
                //L.valorTotal = textBoxvalorTotal.Text;
                //L.valorTotalIVA = textBoxvalorTotalIVA.Text;
                L.estado = textBoxestado.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return;
            }

            if (L.estado.Equals("False") && funcLoja_atual)
            {
                Visible = false;
                LinhasDocumento linha = new LinhasDocumento(L.nDocumento, L.tipoDoc, L.empresa, true);
                linha.FormClosed += new FormClosedEventHandler(Form_closed);
                linha.Show();
            }
            else
            {
                Visible = false;
                LinhasDocumento linha = new LinhasDocumento(L.nDocumento, L.tipoDoc, L.empresa, false);
                linha.FormClosed += new FormClosedEventHandler(Form_closed);
                linha.Show();
            }
          
        }


        private void labelendEntrega_Click(object sender, EventArgs e)
        {
            String nEndereco = textBoxendEntrega.Text;

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
                MessageBox.Show("Escolha um Endereço de Entrega");
            }
        }


        private void labelendFaturacao_Click(object sender, EventArgs e)
        {
            String nEndereco = textBoxendFaturacao.Text;

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
                MessageBox.Show("Escolha um Endereço de Entrega");
            }
        }


        private void labeltipoDoc_Click(object sender, EventArgs e)
        {
            String nTipoDoc = textBoxtipoDoc.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_TipoDoc @empresa, @nTipoDoc";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nTipoDoc", nTipoDoc.Equals("") ? (object)DBNull.Value : nTipoDoc);
            cmd.Parameters.AddWithValue("@empresa", empresa_atual.ToString());
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";

            while (reader.Read())
            {
                TipoDocumento LL = new TipoDocumento();

                LL.nTipoDoc = reader["nTipoDoc"].ToString();
                LL.empresa = reader["empresa"].ToString();
                LL.descricao = reader["descricao"].ToString();

                Mensagem += LL.ToStringC() + "\n\n";
                //MessageBox.Show(LL.ToStringC());
            }

            cn.Close();
            MessageBox.Show(Mensagem);
        }



        private void labelterceiro_Click(object sender, EventArgs e)
        {
            String Cod_terceiro = textBoxterceiro.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Terceiro @Cod_empresa, @tipoDoc, @Cod_terceiro";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_terceiro", Cod_terceiro.Equals("") ? (object)DBNull.Value : Cod_terceiro);
            cmd.Parameters.AddWithValue("@tipoDoc", (tipoDoc_atual == -1) ? (object)DBNull.Value : tipoDoc_atual);
            cmd.Parameters.AddWithValue("@Cod_empresa", empresa_atual.ToString());
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";

            while (reader.Read())
            {
                Terceiro LL = new Terceiro();

                LL.Cod_terceiro = reader["Cod_terceiro"].ToString();
                LL.Cod_empresa = reader["Cod_empresa"].ToString();
                LL.Nome_terceiro = reader["Nome_terceiro"].ToString();
                LL.CAE = reader["CAE"].ToString();
                LL.Data_c_registo = reader["Data_c_registo"].ToString();
                LL.Cod_relacao_ter_emp = reader["Cod_relacao_ter_emp"].ToString();
                LL.Telefone = reader["Telefone"].ToString();
                LL.NIF = reader["NIF"].ToString();
                LL.Cod_morada = reader["Cod_morada"].ToString();
                LL.E_mail = reader["E_mail"].ToString();
                LL.Cod_lista_precos = reader["Cod_lista_precos"].ToString();

                Mensagem += LL.ToStringC() + "\n\n";
                //MessageBox.Show(LL.ToStringC());
            }

            cn.Close();
            MessageBox.Show(Mensagem);
        }



        private void labelloja_Click(object sender, EventArgs e)
        {
            String Cod_loja = textBoxloja.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Loja @Cod_empresa, @Cod_loja";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_empresa", empresa_atual);
            cmd.Parameters.AddWithValue("Cod_loja", Cod_loja.Equals("") ? (object)DBNull.Value : Cod_loja);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";

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

                Mensagem += LL.ToStringC() + "\n\n";
                //MessageBox.Show(LL.ToStringC());
            }

            cn.Close();
            MessageBox.Show(Mensagem);
        }


        private void labelnVendedor_Click(object sender, EventArgs e)
        {
            String Cod_Funcionario = textBoxnVendedor.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Funcionario @Cod_empresa, @Cod_Funcionario";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@Cod_Funcionario", Cod_Funcionario.Equals("") ? (object)DBNull.Value : Cod_Funcionario);
            cmd.Parameters.AddWithValue("@Cod_empresa", empresa_atual.ToString());
            cmd.Connection = cn;

        SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";

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

                Mensagem += LL.ToStringC() + "\n\n";
                //MessageBox.Show(LL.ToStringC());
            }

            cn.Close();
            MessageBox.Show(Mensagem);
        }



        private void labelfExpedicao_Click(object sender, EventArgs e)
        {
            String nExpedicao = textBoxfExpedicao.Text;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_Expedicao @nExpedicao";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nExpedicao", nExpedicao.Equals("") ? (object)DBNull.Value : nExpedicao);
            cmd.Connection = cn;

            SqlDataReader reader = cmd.ExecuteReader();
            String Mensagem = "";

            while (reader.Read())
            {
                Expedicao LL = new Expedicao();

                LL.nExpedicao = reader["nExpedicao"].ToString();
                LL.descricao = reader["descricao"].ToString();

                Mensagem += LL.ToStringC() + "\n\n";
                //MessageBox.Show(LL.ToStringC());
            }

            cn.Close();
            MessageBox.Show(Mensagem);
        }



        private void buttonEliminar_Click(object sender, EventArgs e)
        {
            if (listBoxDocumentos.SelectedIndex > -1)
            {
                Documento L = (Documento)listBoxDocumentos.SelectedItem;

                if (L.estado.Equals("True"))
                {
                    MessageBox.Show("Não é possível eliminar um Documento concluido");
                }
                else
                {
                    try
                    {
                        RemoveContact(L);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                        return;
                    }


                    listBoxDocumentos.Items.RemoveAt(listBoxDocumentos.SelectedIndex);
                    if (documento_atual == listBoxDocumentos.Items.Count)
                        documento_atual = listBoxDocumentos.Items.Count - 1;
                    if (documento_atual == -1)
                    {
                        ClearFields();
                        MessageBox.Show("Não existem mais Documentos");
                    }
                    else
                    {
                        ShowContact();
                    }
                }
            }
        }



        private void RemoveContact(Documento L)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_DeleteDocumento @nDocumento, @tipoDoc, @empresa";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nDocumento", L.nDocumento);
            cmd.Parameters.AddWithValue("@tipoDoc", L.tipoDoc);
            cmd.Parameters.AddWithValue("@empresa", L.empresa);
            cmd.Connection = cn;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível eliminar o Documento. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }


       
        private void buttonAtualizar_Click(object sender, EventArgs e)
        {
            int idx = listBoxDocumentos.FindString(textBoxnDocumento.Text);

            loadLojas();
            
            listBoxDocumentos.SelectedIndex = idx;
        }


        private void Form_closed(object sender, FormClosedEventArgs e)
        {
            Visible = true;
        }



        private void textBoxCod_endereco_TextChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
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
