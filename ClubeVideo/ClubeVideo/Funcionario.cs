using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Funcionario
    {
        public String Cod_Funcionario;
        public String Nome_Funcionario;
        public String Data_Nascimento;
        public String Nacionalidade;
        public String Sexo;
        public String Estado_Civil;
        public String Telemovel;
        public String E_mail;
        public String Vencimento;
        public String Data_Admissao;
        public String Cod_endereco;
        public String Cod_Situacao;
        public String Cod_profissao;
        public String Cod_tipo_pagamento;
        public String NIF;
        public String NIB;
        public String No_doc_identificacao;
        public String Cod_empresa;

        public override string ToString()
        {
            return Cod_Funcionario + " " + Nome_Funcionario;
        }

        public string ToStringC()
        {
            return "Cod_Funcionario: " + Cod_Funcionario + "\nNome_Funcionario: " + Nome_Funcionario
                + "\nData_Nascimento: " + Data_Nascimento + "\nNacionalidade: " + Nacionalidade
                + "\nSexo: " + Sexo + "\nEstado_Civil: " + Estado_Civil
                + "\nTelemovel: " + Telemovel + "\nE_mail: " + E_mail
                + "\nVencimento: " + Vencimento + "\nData_Admissao: " + Data_Admissao
                + "\nCod_endereco: " + Cod_endereco + "\nCod_Situacao: " + Cod_Situacao
                + "\nCod_profissao: " + Cod_profissao + "\nCod_tipo_pagamento: " + Cod_tipo_pagamento
                + "\nNIF: " + NIF + "\nNIB: " + NIB
                + "\nNo_doc_identificacao: " + No_doc_identificacao;
        }

        public Funcionario() : base()
        {
        }
    }
}
