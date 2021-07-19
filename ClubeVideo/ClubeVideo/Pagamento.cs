using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Pagamento
    {
        public String Cod_Pagamento;
        public String Descricao;

        public override string ToString()
        {
            return Cod_Pagamento + " " + Descricao;
        }

        public string ToStringC()
        {
            return "nCod_Pagamento: " + Cod_Pagamento + "\nDescricao: " + Descricao;
        }

        public Pagamento() : base()
        {
        }
    }
}
