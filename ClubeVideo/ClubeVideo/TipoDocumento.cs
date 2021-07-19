using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class TipoDocumento
    {
        public String nTipoDoc;
        public String empresa;
        public String descricao;

        public override string ToString()
        {
            return nTipoDoc + " " + descricao;
        }

        public string ToStringC()
        {
            return "nTipoDoc: " + nTipoDoc + "\ndescricao: " + descricao;
        }

        public TipoDocumento() : base()
        {
        }
    }
}
