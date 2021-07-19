using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class ListaPrecos
    {
        public String Cod_lista_precos;
        public String Descricao;
        public String Cod_empresa;

        public override string ToString()
        {
            return Cod_lista_precos + " " + Descricao;
        }

        public ListaPrecos() : base()
        {
        }
    }
}
