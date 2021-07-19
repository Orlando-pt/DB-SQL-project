using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Artigo
    {
        public String nArtigo;
        public String nome;
        public String stockMin;
        public String stockMax;
        public String precoStock;
        public String dataCriacao;
        public String dataUltAlteracao;
        public String iva;
        public String stock;
        public String qtStock;
        public String qtDispLojas;
        public String qtAlugLojas;
        public String estado;

        public override string ToString()
        {
            return nArtigo + " " + nome;
        }

        public string ToStringC()
        {
            return "nArtigo: " + nArtigo + "\nnome: " + nome + "\nstockMin: " + stockMin + "\nstockMax: " + stockMax
                + "\nprecoStock: " + precoStock + "\ndataCriacao: " + dataCriacao + "\ndataUltAlteracao: " + dataUltAlteracao
                + "\niva: " + iva + "\nstock: " + stock + "\nqtStock: " + qtStock + "\nqtDispLojas: " + qtDispLojas
                + "\nqtAlugLojas: " + qtAlugLojas + "\nestado: " + estado;
        }

        public Artigo() : base()
        {
        }
    }
}
