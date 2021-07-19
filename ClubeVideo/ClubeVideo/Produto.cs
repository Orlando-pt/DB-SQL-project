using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Produto
    {
        public String nProduto;
        public String artigo;
        public String loja;
        public String disponibilidade;

        public override string ToString()
        {
            return nProduto + " " + artigo;
        }

        public Produto() : base()
        {
        }
    }
}
