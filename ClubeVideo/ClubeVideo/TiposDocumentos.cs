using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClubeVideo
{
    public partial class TiposDocumentos : Form
    {
        private int empresa_atual;
        private string loja_atual;
        private int nVendedor_atual;
        private bool funcLoja_atual;

        public TiposDocumentos(int empresa, string loja, int nVendedor, bool funcLoja)
        {
            empresa_atual = empresa;
            loja_atual = loja;
            nVendedor_atual = nVendedor;
            funcLoja_atual = funcLoja;

            InitializeComponent();
        }

        private void Form_closed(object sender, FormClosedEventArgs e)
        {
            Visible = true;
        }

        private void buttonTD1_Click(object sender, EventArgs e)
        {
            Visible = false;
            Documentos documentos = new Documentos(empresa_atual, loja_atual, nVendedor_atual, 1, funcLoja_atual);
            documentos.FormClosed += new FormClosedEventHandler(Form_closed);
            documentos.Show();
        }

        private void buttonTD2_Click(object sender, EventArgs e)
        {
            Visible = false;
            Documentos documentos = new Documentos(empresa_atual, loja_atual, nVendedor_atual, 2, funcLoja_atual);
            documentos.FormClosed += new FormClosedEventHandler(Form_closed);
            documentos.Show();
        }

        private void buttonTD3_Click(object sender, EventArgs e)
        {
            Visible = false;
            Documentos documentos = new Documentos(empresa_atual, loja_atual, nVendedor_atual, 3, funcLoja_atual);
            documentos.FormClosed += new FormClosedEventHandler(Form_closed);
            documentos.Show();
        }

        private void buttonTD4_Click(object sender, EventArgs e)
        {
            Visible = false;
            Documentos documentos = new Documentos(empresa_atual, loja_atual, nVendedor_atual, 4, funcLoja_atual);
            documentos.FormClosed += new FormClosedEventHandler(Form_closed);
            documentos.Show();
        }

        private void buttonTD5_Click(object sender, EventArgs e)
        {
            Visible = false;
            Documentos documentos = new Documentos(empresa_atual, loja_atual, nVendedor_atual, 5, funcLoja_atual);
            documentos.FormClosed += new FormClosedEventHandler(Form_closed);
            documentos.Show();
        }

        private void buttonTD6_Click(object sender, EventArgs e)
        {
            Visible = false;
            Documentos documentos = new Documentos(empresa_atual, loja_atual, nVendedor_atual, 6, funcLoja_atual);
            documentos.FormClosed += new FormClosedEventHandler(Form_closed);
            documentos.Show();
        }
    }
}
