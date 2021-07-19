using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Terceiro
    {
        public String Cod_terceiro;
        public String Cod_empresa;
        public String Nome_terceiro;
        public String CAE;
        public String Data_c_registo;
        public String Cod_relacao_ter_emp;
        public String Telefone;
        public String NIF;
        public String Cod_morada;
        public String E_mail;
        public String Cod_lista_precos;



        public override string ToString()
        {
            return Cod_terceiro + " " + Nome_terceiro;
        }

        public string ToStringC()
        {
            return "Cod_terceiro: " + Cod_terceiro + "\nNome_terceiro: " + Nome_terceiro
                + "\nCAE: " + CAE  + "\nData_c_registo: " + Data_c_registo
                + "\nCod_relacao_ter_emp: " + Cod_relacao_ter_emp + "\nTelefone: " + Telefone
                + "\nNIF: " + NIF + "\nCod_morada: " + Cod_morada
                + "\nE_mail: " + E_mail + "\nCod_lista_precos: " + Cod_lista_precos;
        }

        public Terceiro() : base()
        {
        }
    }
}
