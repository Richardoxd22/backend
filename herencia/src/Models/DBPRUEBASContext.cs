using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace product.Models
{
    public partial class DBPRUEBASContext : DbContext
    {
        public DBPRUEBASContext()
        {
        }

        public DBPRUEBASContext(DbContextOptions<DBPRUEBASContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Usuario> Usuarios { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=DBPRUEBAS;Integrated Security=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.IdUsuario)
                    .HasName("PK__USUARIO__5B65BF9767C2E54A");

                entity.ToTable("USUARIO");

                entity.Property(e => e.Correo)
                    .HasMaxLength(60)
                    .IsUnicode(false);

                entity.Property(e => e.DocumentoIdentidad)
                    .HasMaxLength(60)
                    .IsUnicode(false);

                entity.Property(e => e.Nombres)
                    .HasMaxLength(60)
                    .IsUnicode(false);

                entity.Property(e => e.Saldo)
                    .HasMaxLength(60)
                    .IsUnicode(false);

                entity.Property(e => e.Telefono)
                    .HasMaxLength(60)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
