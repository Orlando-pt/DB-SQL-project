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
    public partial class LinhasDocumento : Form
    {
        private SqlConnection cn;
        private string documento_atual;
        private string tipoDoc_atual;
        private string empresa_atual;
        private int linha_atual;
        private bool editavel_atual;
        private bool criar;

        public LinhasDocumento(string documento, string tipoDoc, string empresa, bool editavel)
        {
            documento_atual = documento;
            tipoDoc_atual = tipoDoc;
            empresa_atual = empresa;
            editavel_atual = editavel;
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
            if (listBoxLinhas.SelectedIndex >= 0)
            {
                linha_atual = listBoxLinhas.SelectedIndex;
                ShowContact();
            }
        }


        private void loadLojas()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SELECT * FROM ClubeVideo.f_Linhas (@documento, @tipoDoc, @empresa)";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@documento", documento_atual);
            cmd.Parameters.AddWithValue("@tipoDoc", tipoDoc_atual);
            cmd.Parameters.AddWithValue("@empresa", empresa_atual);
            cmd.Connection = cn;
            SqlDataReader reader = cmd.ExecuteReader();
            listBoxLinhas.Items.Clear();

            while (reader.Read())
            {
                LinhaDocumento L = new LinhaDocumento();
                L.nLinha = reader["nLinha"].ToString();
                L.documento = reader["documento"].ToString();
                L.tipoDoc = reader["tipoDoc"].ToString();
                L.empresa = reader["empresa"].ToString();
                L.artigo = reader["artigo"].ToString();
                L.quantidade = reader["quantidade"].ToString();
                L.precoUnit = reader["precoUnit"].ToString();
                L.taxaIVA = reader["taxaIVA"].ToString();
                L.dataEntrega = reader["dataEntrega"].ToString();
                L.valorMov = reader["valorMov"].ToString();
                L.valorIVA = reader["valorIVA"].ToString();
                L.valorTotalIVA = reader["valorTotalIVA"].ToString();
                L.desconto = reader["desconto"].ToString();
                L.estado = reader["estado"].ToString();

                listBoxLinhas.Items.Add(L);
            }

            cn.Close();

            linha_atual = 0;
            ShowContact();
        }

        private bool submeterLoja(LinhaDocumento L)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return false;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_NovaLinha @nLinha, @documento, @tipoDoc, @empresa, @artigo, @quantidade, @dataEntrega, @desconto";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nLinha", L.nLinha);
            cmd.Parameters.AddWithValue("@documento", L.documento);
            cmd.Parameters.AddWithValue("@tipoDoc", L.tipoDoc);
            cmd.Parameters.AddWithValue("@empresa", L.empresa);
            cmd.Parameters.AddWithValue("@artigo", L.artigo);
            cmd.Parameters.AddWithValue("@quantidade", L.quantidade);
            cmd.Parameters.AddWithValue("@dataEntrega", DateTime.Parse(L.dataEntrega));
            cmd.Parameters.AddWithValue("@desconto", L.desconto.Equals("") ? (object)DBNull.Value : L.desconto);




            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível criar a Linha. \n ERROR MESSAGE: \n" + ex.Message);
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



        private void RemoveContact(LinhaDocumento L)
        {
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_deleteLinha @nLinha, @documento, @tipoDoc, @empresa ";
            
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nLinha", L.nLinha);
            cmd.Parameters.AddWithValue("@documento", L.documento);
            cmd.Parameters.AddWithValue("@tipoDoc", L.tipoDoc);
            cmd.Parameters.AddWithValue("@empresa", L.empresa);
            //cmd.Parameters.AddWithValue("@artigo", L.artigo);
            //cmd.Parameters.AddWithValue("@quantidade", L.quantidade);
            //cmd.Parameters.AddWithValue("@precoUnit", L.precoUnit);
            //cmd.Parameters.AddWithValue("@taxaIVA", L.taxaIVA);
            //cmd.Parameters.AddWithValue("@dataEntrega", L.dataEntrega);
            //cmd.Parameters.AddWithValue("@valorMov", L.valorMov);
            //cmd.Parameters.AddWithValue("@valorIVA", L.valorIVA);
            //cmd.Parameters.AddWithValue("@valorTotalIVA", L.valorTotalIVA);
            //cmd.Parameters.AddWithValue("@desconto", L.desconto.Equals("") ? (object)DBNull.Value : L.desconto);
            cmd.Connection = cn;

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível eliminar a Linha. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }


        // Helper routines

        public void LockControls()
        {
            textBoxnLinha.ReadOnly = true;
            textBoxdocumento.ReadOnly = true;
            textBoxtipoDoc.ReadOnly = true;
            textBoxartigo.ReadOnly = true;
            textBoxquantidade.ReadOnly = true;
            textBoxprecoUnit.ReadOnly = true;
            textBoxtaxaIVA.ReadOnly = true;
            textBoxdataEntrega.ReadOnly = true;
            textBoxvalorMov.ReadOnly = true;
            textBoxvalorIVA.ReadOnly = true;
            textBoxvalorTotalIVA.ReadOnly = true;
            textBoxdesconto.ReadOnly = true;
            textBoxestado.ReadOnly = true;
        }

        public void UnlockControls(bool filtrar)
        {
            textBoxnLinha.ReadOnly = false;
            //textBoxdocumento.ReadOnly = false;
            //textBoxtipoDoc.ReadOnly = false;
            textBoxartigo.ReadOnly = false;
            textBoxquantidade.ReadOnly = false;

            if (filtrar)
            {
                textBoxprecoUnit.ReadOnly = false;
                textBoxtaxaIVA.ReadOnly = false;
                textBoxvalorMov.ReadOnly = false;
                textBoxvalorIVA.ReadOnly = false;
                textBoxvalorTotalIVA.ReadOnly = false;
            }

            textBoxdataEntrega.ReadOnly = false;
            textBoxdesconto.ReadOnly = false;

            if (filtrar)
            {
                textBoxestado.ReadOnly = false;
            }
            
        }


        public void ShowButtons()
        {
            LockControls();
            buttonFiltrar.Visible = true;
            buttonProdutos.Visible = true;
            buttonAtualizar.Visible = true;
            buttonGuardar.Visible = false;
            buttonCancelar.Visible = false;
            buttonProcurar.Visible = false;

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
                buttonTerminar.Visible = false;
            }
        }

        public void ClearFields()
        {
            textBoxnLinha.Text = "";
            //textBoxdocumento.Text = "";
            //textBoxtipoDoc.Text = "";
            textBoxartigo.Text = "";
            textBoxquantidade.Text = "";
            textBoxprecoUnit.Text = "";
            textBoxtaxaIVA.Text = "";
            textBoxdataEntrega.Text = "";
            textBoxvalorMov.Text = "";
            textBoxvalorIVA.Text = "";
            textBoxvalorTotalIVA.Text = "";
            textBoxdesconto.Text = "";
            textBoxestado.Text = "";
        }

        public void ShowContact()
        {
            if (listBoxLinhas.Items.Count == 0 | linha_atual < 0)
            {
                textBoxdocumento.Text = documento_atual;
                textBoxtipoDoc.Text = tipoDoc_atual;
                return;
            }
                
            LinhaDocumento L = new LinhaDocumento();
            L = (LinhaDocumento)listBoxLinhas.Items[linha_atual];

            textBoxnLinha.Text = L.nLinha;
            textBoxdocumento.Text = L.documento;
            textBoxtipoDoc.Text = L.tipoDoc;
            textBoxartigo.Text = L.artigo;
            textBoxquantidade.Text = L.quantidade;
            textBoxprecoUnit.Text = L.precoUnit;
            textBoxtaxaIVA.Text = L.taxaIVA;
            textBoxdataEntrega.Text = L.dataEntrega;
            textBoxvalorMov.Text = L.valorMov;
            textBoxvalorIVA.Text = L.valorIVA;
            textBoxvalorTotalIVA.Text = L.valorTotalIVA;
            textBoxdesconto.Text = L.desconto;
            textBoxestado.Text = L.estado;
        }

        public void HideButtons()
        {
            buttonCriar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonProdutos.Visible = false;
            buttonAtualizar.Visible = false;
            buttonTerminar.Visible = false;
            buttonGuardar.Visible = true;
            buttonEliminar.Visible = false;
            buttonCancelar.Visible = true;
            buttonProcurar.Visible = false;
        }


        public bool salvarLoja()
        {
            LinhaDocumento L = new LinhaDocumento();
            try
            {
                L.nLinha = textBoxnLinha.Text;
                L.documento = textBoxdocumento.Text;
                L.tipoDoc = textBoxtipoDoc.Text;
                L.artigo = textBoxartigo.Text;
                L.quantidade = textBoxquantidade.Text;
                L.precoUnit = textBoxprecoUnit.Text;
                L.taxaIVA = textBoxtaxaIVA.Text;
                L.dataEntrega = textBoxdataEntrega.Text;
                L.valorMov = textBoxvalorMov.Text;
                L.valorIVA = textBoxvalorIVA.Text;
                L.valorTotalIVA = textBoxvalorTotalIVA.Text;
                L.desconto = textBoxdesconto.Text;
                L.estado = textBoxestado.Text;
                L.empresa = empresa_atual.ToString();
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
                    listBoxLinhas.Items.Add(L); 
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
            listBoxLinhas.Enabled = false;
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxLinhas.Enabled = true;
            if (listBoxLinhas.Items.Count > 0)
            {
                linha_atual = listBoxLinhas.SelectedIndex;
                if (linha_atual < 0)
                    linha_atual = 0;
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
            listBoxLinhas.Enabled = true;
            int idx = listBoxLinhas.FindString(textBoxnLinha.Text);
            listBoxLinhas.SelectedIndex = idx;
            ShowButtons();
            loadLojas();
        }


        private void buttonEliminar_Click(object sender, EventArgs e)
        {
            if (listBoxLinhas.SelectedIndex > -1)
            {
                try
                {
                    RemoveContact(((LinhaDocumento)listBoxLinhas.SelectedItem));
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    return;
                }
                listBoxLinhas.Items.RemoveAt(listBoxLinhas.SelectedIndex);
                if (linha_atual == listBoxLinhas.Items.Count)
                    linha_atual = listBoxLinhas.Items.Count - 1;
                if (linha_atual == -1)
                {
                    ClearFields();
                    MessageBox.Show("Não existem mais Linhas");
                }
                else
                {
                    ShowContact();
                }
            }
        }


        private bool procurarLojas()
        {
            LinhaDocumento L = new LinhaDocumento();
            try
            {
                L.nLinha = textBoxnLinha.Text;
                L.documento = textBoxdocumento.Text;
                L.tipoDoc = textBoxtipoDoc.Text;
                L.artigo = textBoxartigo.Text;
                L.quantidade = textBoxquantidade.Text;
                L.precoUnit = textBoxprecoUnit.Text;
                L.taxaIVA = textBoxtaxaIVA.Text;
                L.dataEntrega = textBoxdataEntrega.Text;
                L.valorMov = textBoxvalorMov.Text;
                L.valorIVA = textBoxvalorIVA.Text;
                L.valorTotalIVA = textBoxvalorTotalIVA.Text;
                L.desconto = textBoxdesconto.Text;
                L.estado = textBoxestado.Text;
                L.empresa = empresa_atual.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }


            if (!verifySGBDConnection())
                return false;

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "EXEC ClubeVideo.pr_SearchLinha @empresa, @nLinha, @documento, @tipoDoc, @artigo, @quantidade, @precoUnit, @taxaIVA, @dataEntrega, @valorMov, @valorIVA, @valorTotalIVA, @desconto, @estado";

            cmd.Parameters.Clear();

            cmd.Parameters.AddWithValue("@empresa", L.empresa);
            cmd.Parameters.AddWithValue("@nLinha", L.nLinha.Equals("") ? (object)DBNull.Value : L.nLinha);
            cmd.Parameters.AddWithValue("@documento", L.documento.Equals("") ? (object)DBNull.Value : L.documento);
            cmd.Parameters.AddWithValue("@tipoDoc", L.tipoDoc.Equals("") ? (object)DBNull.Value : L.tipoDoc);
            cmd.Parameters.AddWithValue("@artigo", L.artigo.Equals("") ? (object)DBNull.Value : L.artigo);
            cmd.Parameters.AddWithValue("@quantidade", L.quantidade.Equals("") ? (object)DBNull.Value : L.quantidade);
            cmd.Parameters.AddWithValue("@precoUnit", L.precoUnit.Equals("") ? (object)DBNull.Value : Convert.ToDecimal(L.precoUnit));
            cmd.Parameters.AddWithValue("@taxaIVA", L.taxaIVA.Equals("") ? (object)DBNull.Value : L.taxaIVA);
            cmd.Parameters.AddWithValue("@dataEntrega", L.dataEntrega.Equals("") ? (object)DBNull.Value : DateTime.Parse(L.dataEntrega));
            cmd.Parameters.AddWithValue("@valorMov", L.valorMov.Equals("") ? (object)DBNull.Value : Convert.ToDecimal(L.valorMov));
            cmd.Parameters.AddWithValue("@valorIVA", L.valorIVA.Equals("") ? (object)DBNull.Value : Convert.ToDecimal(L.valorIVA));
            cmd.Parameters.AddWithValue("@valorTotalIVA", L.valorTotalIVA.Equals("") ? (object)DBNull.Value : Convert.ToDecimal(L.valorTotalIVA));
            cmd.Parameters.AddWithValue("@desconto", L.desconto.Equals("") ? (object)DBNull.Value : L.desconto);
            cmd.Parameters.AddWithValue("@estado", L.estado.Equals("") ? (object)DBNull.Value : L.estado);

            cmd.Connection = cn;


            SqlDataReader reader = cmd.ExecuteReader();
            listBoxLinhas.Items.Clear();
            ClearFields();

            while (reader.Read())
            {
                LinhaDocumento LL = new LinhaDocumento();

                LL.nLinha = reader["nLinha"].ToString();
                LL.documento = reader["documento"].ToString();
                LL.tipoDoc = reader["tipoDoc"].ToString();
                LL.empresa = reader["empresa"].ToString();
                LL.artigo = reader["artigo"].ToString();
                LL.quantidade = reader["quantidade"].ToString();
                LL.precoUnit = reader["precoUnit"].ToString();
                LL.taxaIVA = reader["taxaIVA"].ToString();
                LL.dataEntrega = reader["dataEntrega"].ToString();
                LL.valorMov = reader["valorMov"].ToString();
                LL.valorIVA = reader["valorIVA"].ToString();
                LL.valorTotalIVA = reader["valorTotalIVA"].ToString();
                LL.desconto = reader["desconto"].ToString();
                LL.estado = reader["estado"].ToString();

                listBoxLinhas.Items.Add(LL);
            }

            cn.Close();

            linha_atual = 0;
            ShowContact();

            return true;
        }

        public void HideButtons_Procurar()
        {
            buttonCriar.Visible = false;
            buttonFiltrar.Visible = false;
            buttonProdutos.Visible = false;
            buttonAtualizar.Visible = false;
            buttonGuardar.Visible = false;
            buttonTerminar.Visible = false;
            buttonEliminar.Visible = false;
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



        private void buttonProdutos_Click(object sender, EventArgs e)
        {
            LinhaDocumento L = new LinhaDocumento();
            try
            {
                L.nLinha = textBoxnLinha.Text;
                L.documento = textBoxdocumento.Text;
                L.tipoDoc = textBoxtipoDoc.Text;
                //L.artigo = textBoxartigo.Text;
                //L.quantidade = textBoxquantidade.Text;
                //L.precoUnit = textBoxprecoUnit.Text;
                //L.taxaIVA = textBoxtaxaIVA.Text;
                //L.dataEntrega = textBoxdataEntrega.Text;
                //L.valorMov = textBoxvalorMov.Text;
                //L.valorIVA = textBoxvalorIVA.Text;
                //L.valorTotalIVA = textBoxvalorTotalIVA.Text;
                //L.desconto = textBoxdesconto.Text;
                L.estado = textBoxestado.Text;
                L.empresa = empresa_atual.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return;
            }

            if (L.tipoDoc.Equals("1"))
            {
                if (editavel_atual)
                {
                    MessageBox.Show("Não existem Produtos visíveis");
                }
                else
                {
                    Visible = false;
                    ProdutosLinha produtos = new ProdutosLinha(L.nLinha, L.documento, L.tipoDoc, L.empresa, false);
                    produtos.FormClosed += new FormClosedEventHandler(Form_closed);
                    produtos.Show();
                }
            }
            else
            {
                Visible = false;
                ProdutosLinha produtos = new ProdutosLinha(L.nLinha, L.documento, L.tipoDoc, L.empresa, editavel_atual);
                produtos.FormClosed += new FormClosedEventHandler(Form_closed);
                produtos.Show();
            }
            
        }





        private void labelCod_endereco_Click(object sender, EventArgs e)
        {
            String nEndereco = textBoxquantidade.Text;

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



        private void buttonTerminar_Click(object sender, EventArgs e)
        {
            int rows = 0;

            if (!verifySGBDConnection())
                return;
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "EXEC ClubeVideo.pr_UpdateDocumento @nDocumento, @tipoDoc, @empresa, @estado";

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@nDocumento", documento_atual);
            cmd.Parameters.AddWithValue("@tipoDoc", tipoDoc_atual);
            cmd.Parameters.AddWithValue("@empresa", empresa_atual);
            cmd.Parameters.AddWithValue("@estado", 1);
            cmd.Connection = cn;

            try
            {
                rows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possível concluir o Documento. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                if (rows > 0)
                    MessageBox.Show("Concluído");
                else
                    MessageBox.Show("Não Concluído");
                
                cn.Close();
                this.Close();
            }
        }


        private void buttonAtualizar_Click(object sender, EventArgs e)
        {
            int idx = listBoxLinhas.FindString(textBoxnLinha.Text);

            loadLojas();
            
            listBoxLinhas.SelectedIndex = idx;
        }


        private void textBoxCod_endereco_TextChanged(object sender, EventArgs e)
        {

        }

        
    }
}
