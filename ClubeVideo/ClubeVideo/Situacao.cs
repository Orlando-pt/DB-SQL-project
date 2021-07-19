using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Situacao
    {
        public String Cod_Situacao;
        public String Descricao;

        public override string ToString()
        {
            return Cod_Situacao + " " + Descricao;
        }

        public string ToStringC()
        {
            return "nCod_Situacao: " + Cod_Situacao + "\nDescricao: " + Descricao;
        }

        public Situacao() : base()
        {
        }
    }
}
