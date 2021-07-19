using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Loja
    {
        public String Cod_loja;
        public String Nome_loja;
        public String E_mail;
        public String Telefone;
        public String Cod_endereco;
        public String Cod_empresa;
        public String ativa;

        public override string ToString()
        {
            return Cod_loja + " " + Nome_loja;
        }

        public string ToStringC()
        {
            return "Cod_loja: " + Cod_loja + "\nNome_loja: " + Nome_loja;
        }

        public Loja() : base()
        {
        }
    }
}
