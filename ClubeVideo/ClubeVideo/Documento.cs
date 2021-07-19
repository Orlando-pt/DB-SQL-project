using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Documento
    {
        public String nDocumento;
        public String tipoDoc;
        public String empresa;
        public String terceiro;
        public String loja;
        public String dataEmissao;
        public String dataEntrega;
        public String nVendedor;
        public String dataVencimento;
        public String fExpedicao;
        public String endEntrega;
        public String endFaturacao;
        public String valorTotal;
        public String valorTotalIVA;
        public String estado;

        public override string ToString()
        {
            return nDocumento + " " + tipoDoc + " " + terceiro + " " + loja + " " + estado;
        }

        public string ToStringC()
        {
            return "nDocumento: " + nDocumento + "\ntipoDoc: " + tipoDoc 
                + "\nterceiro: " + terceiro + "\nloja: " + loja + "\nestado: " + estado;
        }

        public Documento() : base()
        {
        }
    }
}
