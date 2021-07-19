using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Profissao
    {
        public String Cod_Profissao;
        public String Descricao;

        public override string ToString()
        {
            return Cod_Profissao + " " + Descricao;
        }

        public string ToStringC()
        {
            return "nCod_Profissao: " + Cod_Profissao + "\nDescricao: " + Descricao;
        }

        public Profissao() : base()
        {
        }
    }
}
