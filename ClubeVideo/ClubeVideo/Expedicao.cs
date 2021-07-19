using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Expedicao
    {
        public String nExpedicao;
        public String descricao;

        public override string ToString()
        {
            return nExpedicao + " " + descricao;
        }

        public string ToStringC()
        {
            return "nExpedicao: " + nExpedicao + "\ndescricao: " + descricao;
        }

        public Expedicao() : base()
        {
        }
    }
}
