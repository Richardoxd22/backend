using System;
using System.Collections.Generic;

namespace product.Models
{
    public partial class Usuario
    {
        public int IdUsuario { get; set; }
        public string? DocumentoIdentidad { get; set; }
        public string? Nombres { get; set; }
        public string? Telefono { get; set; }
        public string? Correo { get; set; }
        public string? Saldo { get; set; }
    }
}
