using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Disponibilidade
    {
        public String nDisponibilidade;
        public String descricao;

        public override string ToString()
        {
            return nDisponibilidade + " " + descricao;
        }

        public string ToStringC()
        {
            return "nDisponibilidade: " + nDisponibilidade + "\ndescricao: " + descricao;
        }

        public Disponibilidade() : base()
        {
        }
    }
}
