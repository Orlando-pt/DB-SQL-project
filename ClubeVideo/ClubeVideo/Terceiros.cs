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
    public partial class Terceiros : Form
    {
        private SqlConnection cn;
        private bool criar;
        private int terceiro_atual;
        public bool novo_endereco = false;
        public Terceiros()
        {
            InitializeComponent();
            load_terceiros();
            LockControls();
            ShowButtons();
            esconder_endereco();
        }

        private void Terceiros_Load(object sender, EventArgs e)
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

        private void load_terceiros()
        {
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("EXEC ClubeVideo.pr_TodosTerceiros", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listBoxTerceiros.Items.Clear();

            while (reader.Read())
            {
                Terceiro T = new Terceiro();
                T.Cod_terceiro = reader["Cod_terceiro"].ToString();
                T.Cod_empresa = reader["Cod_empresa"].ToString();
                T.Nome_terceiro = reader["Nome_terceiro"].ToString();
                T.CAE = reader["CAE"].ToString();
                T.Data_c_registo = reader["Data_c_registo"].ToString();
                T.Cod_relacao_ter_emp = reader["Cod_relacao_ter_emp"].ToString();
                T.Telefone = reader["Telefone"].ToString();
                T.NIF = reader["NIF"].ToString();
                T.Cod_morada = reader["Cod_morada"].ToString();
                T.E_mail = reader["E_mail"].ToString();
                T.Cod_lista_precos = reader["Cod_lista_precos"].ToString();

                listBoxTerceiros.Items.Add(T);
            }

            cn.Close();

            terceiro_atual = 0;
            Mostrar_Terceiro();
        }

        public void Mostrar_Terceiro()
        {
            if (listBoxTerceiros.Items.Count == 0 | terceiro_atual < 0)
                return;
            Terceiro terceiro = new Terceiro();

            terceiro = (Terceiro)listBoxTerceiros.Items[terceiro_atual];

            textBoxCodTerceiro.Text = terceiro.Cod_terceiro;
            textBoxNomeTerceiro.Text = terceiro.Nome_terceiro;
            textBoxCAE.Text = terceiro.CAE;
            textBoxTelefone.Text = terceiro.Telefone;
            textBoxCodTpRelacao.Text = terceiro.Cod_relacao_ter_emp;
            textBoxDataRegisto.Text = terceiro.Data_c_registo;
            textBoxEmail.Text = terceiro.E_mail;
            textBoxCodEndereco.Text = terceiro.Cod_morada;
            textBoxNIF.Text = terceiro.NIF;
            textBoxCodListaPrecos.Text = terceiro.Cod_lista_precos;
        }

        public void ClearFields()
        {
            textBoxCodTerceiro.Text = "";
            textBoxNomeTerceiro.Text = "";
            textBoxCAE.Text = "";
            textBoxTelefone.Text = "";
            textBoxCodTpRelacao.Text = "";
            textBoxDataRegisto.Text = "";
            textBoxEmail.Text = "";
            textBoxCodEndereco.Text = "";
            textBoxNIF.Text = "";
            textBoxCodListaPrecos.Text = "";
        }

        public void HideButtons()
        {
            UnlockControls();
            buttonEditar.Visible = false;
            buttonCriar.Visible = false;
            buttonRemover.Visible = false;
            buttonOk.Visible = false;
            buttonSalvar.Visible = true;
            buttonCancelar.Visible = true;
            buttonCriarEndereco.Visible = true;
        }

        public void ShowButtons()
        {
            LockControls();
            buttonEditar.Visible = true;
            buttonCriar.Visible = true;
            buttonRemover.Visible = true;
            buttonOk.Visible = false;
            buttonSalvar.Visible = false;
            buttonCancelar.Visible = false;
            buttonCriarEndereco.Visible = false;
        }

        public void LockControls()
        {
            textBoxCodTerceiro.ReadOnly = true;
            textBoxNomeTerceiro.ReadOnly = true;
            textBoxCAE.ReadOnly = true;
            textBoxTelefone.ReadOnly = true;
            textBoxCodTpRelacao.ReadOnly = true;
            textBoxDataRegisto.ReadOnly = true;
            textBoxEmail.ReadOnly = true;
            textBoxCodEndereco.ReadOnly = true;
            textBoxNIF.ReadOnly = true;
            textBoxCodListaPrecos.ReadOnly = true;
        }

        public void UnlockControls()
        {
            textBoxCodTerceiro.ReadOnly = false;
            textBoxNomeTerceiro.ReadOnly = false;
            textBoxCAE.ReadOnly = false;
            textBoxTelefone.ReadOnly = false;
            textBoxCodTpRelacao.ReadOnly = false;
            textBoxDataRegisto.ReadOnly = false;
            textBoxEmail.ReadOnly = false;
            textBoxCodEndereco.ReadOnly = false;
            textBoxNIF.ReadOnly = false;
            textBoxCodListaPrecos.ReadOnly = false;
        }

        private void buttonCriar_Click(object sender, EventArgs e)
        {
            criar = true;
            ClearFields();
            HideButtons();
            listBoxTerceiros.Enabled = false;
        }

        private void buttonCancelar_Click(object sender, EventArgs e)
        {
            listBoxTerceiros.Enabled = true;
            if (listBoxTerceiros.Items.Count > 0)
            {
                terceiro_atual = listBoxTerceiros.SelectedIndex;
                if (terceiro_atual < 0)
                    terceiro_atual = 0;
                Mostrar_Terceiro();
            }
            else
            {
                ClearFields();
                LockControls();
            }
            ShowButtons();
        }

        private bool salvarTerceiro()
        {
            Terceiro terceiro = new Terceiro();
            Endereco e = get_endereco();
            try
            {
                terceiro.Cod_terceiro = textBoxCodTerceiro.Text;
                terceiro.Cod_empresa = "1";
                terceiro.Nome_terceiro = textBoxNomeTerceiro.Text;
                terceiro.CAE = textBoxCAE.Text;
                terceiro.Telefone = textBoxTelefone.Text;
                terceiro.Cod_relacao_ter_emp = textBoxCodTpRelacao.Text;
                terceiro.Data_c_registo = textBoxDataRegisto.Text;
                terceiro.E_mail = textBoxEmail.Text;
                terceiro.Cod_morada = textBoxCodEndereco.Text;
                terceiro.NIF = textBoxNIF.Text;
                terceiro.Cod_lista_precos = textBoxCodListaPrecos.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
            if (criar)
            {
                submeter_terceiro(terceiro, e);
            }
            else
            {
                atualizar_terceiro(terceiro);
                listBoxTerceiros.Items[terceiro_atual] = terceiro;
            }


            return true;
        }

        private void submeter_terceiro(Terceiro t, Endereco e)
        {
            String output = String.Empty;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_submeterTerceiro", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@codTerceiro", t.Cod_terceiro);
            cmd.Parameters.AddWithValue("@codEmpresa", t.Cod_empresa);
            cmd.Parameters.AddWithValue("@nomeTerceiro", t.Nome_terceiro);
            cmd.Parameters.AddWithValue("@CAE", t.CAE);
            cmd.Parameters.AddWithValue("@dataRegisto", t.Data_c_registo);
            cmd.Parameters.AddWithValue("@cod_relacao", t.Cod_relacao_ter_emp);
            cmd.Parameters.AddWithValue("@telefone", t.Telefone);
            cmd.Parameters.AddWithValue("@NIF", t.NIF);
            cmd.Parameters.AddWithValue("@codMorada", t.Cod_morada);
            cmd.Parameters.AddWithValue("@email", t.E_mail);
            cmd.Parameters.AddWithValue("@codListaPrecos", t.Cod_lista_precos);

            if (novo_endereco)
            {
                cmd.Parameters.AddWithValue("@nEndereco", e.nEndereco);
                cmd.Parameters.AddWithValue("@morada", e.morada);
                cmd.Parameters.AddWithValue("@codigoPostal", e.codigoPostal);
                cmd.Parameters.AddWithValue("@localidade", e.localidade);
                cmd.Parameters.AddWithValue("@distrito", e.distrito);
                cmd.Parameters.AddWithValue("@concelho", e.concelho);
                cmd.Parameters.AddWithValue("@freguesia", e.freguesia);
                cmd.Parameters.AddWithValue("@pais", e.pais);
            }

            cmd.Parameters.Add("@Msg_resposta", SqlDbType.NVarChar, 250);
            cmd.Parameters["@Msg_resposta"].Direction = ParameterDirection.Output;

            try
            {
                _ = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Erro a submeter terceiro. \n Mensagem erro: \n" + ex.Message);
            }

            output = (string)cmd.Parameters["@Msg_resposta"].Value;

            cn.Close();

            if (!output.Equals("ok"))
            {
                MessageBox.Show(output, "ERROR!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            listBoxTerceiros.Items.Add(e);
            novo_endereco = false;
            MessageBox.Show("Operação efetuada com sucesso.");
        }

        private void atualizar_terceiro(Terceiro t)
        {
            String output = String.Empty;

            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("ClubeVideo.pr_UpdateTerceiro", cn);
            cmd.CommandType = CommandType.StoredProcedure;



            cmd.Parameters.Clear();
            if (!t.Cod_terceiro.Equals("")) 
                cmd.Parameters.AddWithValue("@codTerceiro", t.Cod_terceiro);
            if (!t.Cod_empresa.Equals(""))
                cmd.Parameters.AddWithValue("@codEmpresa", t.Cod_empresa);
            if (!t.Nome_terceiro.Equals(""))
                cmd.Parameters.AddWithValue("@nomeTerceiro", t.Nome_terceiro);
            if (!t.CAE.Equals(""))
                cmd.Parameters.AddWithValue("@CAE", t.CAE);
            if (!t.Data_c_registo.Equals(""))
                cmd.Parameters.AddWithValue("@dataRegisto", t.Data_c_registo);
            if (!t.Cod_relacao_ter_emp.Equals(""))
                cmd.Parameters.AddWithValue("@cod_relacao", t.Cod_relacao_ter_emp);
            if (!t.Telefone.Equals(""))
                cmd.Parameters.AddWithValue("@telefone", t.Telefone);
            if (!t.NIF.Equals(""))
                cmd.Parameters.AddWithValue("@NIF", t.NIF);
            if (!t.Cod_morada.Equals(""))
                cmd.Parameters.AddWithValue("@codMorada", t.Cod_morada);
            if (!t.E_mail.Equals(""))
                cmd.Parameters.AddWithValue("@email", t.E_mail);
            if (!t.Cod_lista_precos.Equals(""))
                cmd.Parameters.AddWithValue("@codListaPrecos", t.Cod_lista_precos);


            cmd.Parameters.Add("@Msg_resposta", SqlDbType.NVarChar, 250);
            cmd.Parameters["@Msg_resposta"].Direction = ParameterDirection.Output;

            try
            {
                _ = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Failed to update Terceiro in database. \n ERROR MESSAGE: \n" + ex.Message);
            }
            finally
            {
                output = (string)cmd.Parameters["@Msg_resposta"].Value;
                if (output.Equals("ok"))
                    MessageBox.Show("Update OK");
                else
                    MessageBox.Show(output, "ERROR!", MessageBoxButtons.OK, MessageBoxIcon.Error);

                cn.Close();
            }
        }

        private void esconder_endereco()
        {
            textBoxNrEndereco.Visible = false;
            textBoxMorada.Visible = false;
            textBoxCodPostal.Visible = false;
            textBoxLocalidade.Visible = false;
            textBoxDistrito.Visible = false;
            textBoxConcelho.Visible = false;
            textBoxFreguesia.Visible = false;
            textBoxPais.Visible = false;
            label11.Visible = false;
            label12.Visible = false;
            label13.Visible = false;
            label14.Visible = false;
            label15.Visible = false;
            label16.Visible = false;
            label17.Visible = false;
            label18.Visible = false;

            textBoxCodTerceiro.Visible = true;
            textBoxNomeTerceiro.Visible = true;
            textBoxCAE.Visible = true;
            textBoxTelefone.Visible = true;
            textBoxCodTpRelacao.Visible = true;
            textBoxDataRegisto.Visible = true;
            textBoxEmail.Visible = true;
            textBoxCodEndereco.Visible = true;
            textBoxNIF.Visible = true;
            textBoxCodListaPrecos.Visible = true;
            label1.Visible = true;
            label2.Visible = true;
            label3.Visible = true;
            label4.Visible = true;
            label5.Visible = true;
            label6.Visible = true;
            label7.Visible = true;
            label8.Visible = true;
            label9.Visible = true;
            label10.Visible = true;
        }

        private Endereco get_endereco()
        {
            Endereco endereco = new Endereco();
            try
            {
                endereco.nEndereco = textBoxNrEndereco.Text;
                endereco.morada = textBoxMorada.Text;
                endereco.codigoPostal = textBoxCodPostal.Text;
                endereco.localidade = textBoxLocalidade.Text;
                endereco.distrito = textBoxDistrito.Text;
                endereco.concelho = textBoxConcelho.Text;
                endereco.freguesia = textBoxFreguesia.Text;
                endereco.pais = textBoxPais.Text;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return null;
            }

            return endereco;
        }

        private void mostrar_endereco()
        {
            textBoxNrEndereco.Visible = true;
            textBoxMorada.Visible = true;
            textBoxCodPostal.Visible = true;
            textBoxLocalidade.Visible = true;
            textBoxDistrito.Visible = true;
            textBoxConcelho.Visible = true;
            textBoxFreguesia.Visible = true;
            textBoxPais.Visible = true;
            label11.Visible = true;
            label12.Visible = true;
            label13.Visible = true;
            label14.Visible = true;
            label15.Visible = true;
            label16.Visible = true;
            label17.Visible = true;
            label18.Visible = true;

            textBoxCodTerceiro.Visible = false;
            textBoxNomeTerceiro.Visible = false;
            textBoxCAE.Visible = false;
            textBoxTelefone.Visible = false;
            textBoxCodTpRelacao.Visible = false;
            textBoxDataRegisto.Visible = false;
            textBoxEmail.Visible = false;
            textBoxCodEndereco.Visible = false;
            textBoxNIF.Visible = false;
            textBoxCodListaPrecos.Visible = false;
            label1.Visible = false;
            label2.Visible = false;
            label3.Visible = false;
            label4.Visible = false;
            label5.Visible = false;
            label6.Visible = false;
            label7.Visible = false;
            label8.Visible = false;
            label9.Visible = false;
            label10.Visible = false;
        }

        private void buttonSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                _ = salvarTerceiro();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            listBoxTerceiros.Enabled = true;
            int idx = listBoxTerceiros.FindString(textBoxNomeTerceiro.Text);
            listBoxTerceiros.SelectedIndex = idx;
            ShowButtons();
        }

        public void esconder_botoes()
        {
            buttonEditar.Visible = false;
            buttonCriar.Visible = false;
            buttonRemover.Visible = false;
            buttonOk.Visible = true;
            buttonSalvar.Visible = false;
            buttonCancelar.Visible = false;
            buttonCriarEndereco.Visible = false;
        }

        private void buttonCriarEndereco_Click(object sender, EventArgs e)
        {
            novo_endereco = true;
            esconder_botoes();
            mostrar_endereco();
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            HideButtons();
            esconder_endereco();
        }

        private void buttonEditar_Click(object sender, EventArgs e)
        {
            terceiro_atual = listBoxTerceiros.SelectedIndex;
            criar = false;

            if (terceiro_atual < 0)
            {
                MessageBox.Show("Selecione algo para editar.");
                return;
            }
            HideButtons();
            listBoxTerceiros.Enabled = false;
        }

        private void listBoxTerceiros_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBoxTerceiros.SelectedIndex >= 0)
            {
                terceiro_atual = listBoxTerceiros.SelectedIndex;
                Mostrar_Terceiro();
            }
        }

        
        private void buttonRemover_Click(object sender, EventArgs e)
        {
           if (listBoxTerceiros.SelectedIndex > -1)
           {
               try
               {
                   remover_terceiro(((Terceiro)listBoxTerceiros.SelectedItem).Cod_terceiro);
               }
               catch (Exception ex)
               {
                   MessageBox.Show(ex.Message);
                   return;
               }
               listBoxTerceiros.Items.RemoveAt(listBoxTerceiros.SelectedIndex);
               if (terceiro_atual == listBoxTerceiros.Items.Count)
                   terceiro_atual = listBoxTerceiros.Items.Count - 1;
               if (terceiro_atual == -1)
               {
                   ClearFields();
                   MessageBox.Show("There are no more Terceiros");
               }
               else
               {
                   Mostrar_Terceiro();
               }
           }
           else
           {
               MessageBox.Show("Selecione um terceiro.");
               return;
           }
        }

        private void remover_terceiro(String id)
        {
           if(!verifySGBDConnection())
               return;

           SqlCommand cmd = new SqlCommand("ClubeVideo.pr_RemoverTerceiro", cn);
           cmd.CommandType = CommandType.StoredProcedure;

           cmd.Parameters.Clear();
           cmd.Parameters.AddWithValue("@codTerceiro", id);

           try
           {
               _ = cmd.ExecuteNonQuery();
           }
           catch (Exception ex)
           {
               throw new Exception("Falha a remover terceiro. \n ERROR MESSAGE: \n" + ex.Message);
           }
           finally
           {
               cn.Close();
           }
        }

    }
}
