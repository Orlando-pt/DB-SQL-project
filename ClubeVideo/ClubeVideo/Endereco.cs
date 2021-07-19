using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClubeVideo
{
    class Endereco
    {
        public String nEndereco;
        public String morada;
        public String codigoPostal;
        public String localidade;
        public String distrito;
        public String concelho;
        public String freguesia;
        public String pais;

        public override string ToString()
        {
            return nEndereco + " -- " + morada + " -- " + concelho;
        }

        public string ToStringC()
        {
            return "nEndereco: " + nEndereco + "\nmorada: " + morada + "\ncodigoPostal: " + codigoPostal
            + "\nlocalidade: " + localidade + "\ndistrito: " + distrito + "\nconcelho: " + concelho
            + "\nfreguesia: " + freguesia + "\npais: " + pais;
        }

        public Endereco() : base()
        {
        }
    }
}
