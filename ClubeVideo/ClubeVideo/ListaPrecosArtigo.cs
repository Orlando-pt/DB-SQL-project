using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class ListaPrecosArtigo
    {
        public String Cod_artigo;
        public String Cod_lista_precos;
        public String Preco;

        public override string ToString()
        {
            return Cod_artigo + " " + Preco;
        }

        public ListaPrecosArtigo() : base()
        {
        }
    }
}
