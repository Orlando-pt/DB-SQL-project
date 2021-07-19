using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class LinhaDocumento
    {
        public String nLinha;
        public String documento;
        public String tipoDoc;
        public String empresa;
        public String artigo;
        public String quantidade;
        public String precoUnit;
        public String taxaIVA;
        public String dataEntrega;
        public String valorMov;
        public String valorIVA;
        public String valorTotalIVA;
        public String desconto;
        public String estado;

        public override string ToString()
        {
            return nLinha + " " + documento + " " + tipoDoc + " " + estado;
        }

        public string ToStringC()
        {
            return "nLinha: " + nLinha + "\ndocumento: " + documento
                + "\ntipoDoc: " + tipoDoc + "\nartigo: " + artigo
                + "\nquantidade: " + quantidade + "\nprecoUnit: " + precoUnit
                + "\ntaxaIVA: " + taxaIVA + "\ndataEntrega: " + dataEntrega
                + "\nvalorMov: " + valorMov + "\nvalorIVA: " + valorIVA
                + "\nvalorTotalIVA: " + valorTotalIVA + "\ndesconto: " + desconto
                + "\nestado: " + estado;
        }

        public LinhaDocumento() : base()
        {
        }
    }
}
