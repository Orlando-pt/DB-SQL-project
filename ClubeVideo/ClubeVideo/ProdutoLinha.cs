using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class ProdutoLinha
    {
        public String produto;
        public String artigo;
        public String linha;
        public String documento;
        public String tipoDoc;
        public String empresa;
        public String dataDevolucao;

        public override string ToString()
        {
            return produto + " " + artigo + " " + linha;
        }

        public ProdutoLinha() : base()
        {
        }
    }
}
