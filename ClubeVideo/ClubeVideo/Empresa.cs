using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Empresa
    {
        public String nEmpresa;
        public String sigla;
        public String descricao;
        public String capitalSocial;
        public String NIF;
        public String telefone;
        public String endEletronico;
        public String ano;
        public String CAE;
        public String codEndereco;

        public Empresa() : base()
        {

        }

        public override String ToString()
        {
            return nEmpresa + " - " + sigla;
        }
    }

    
}
