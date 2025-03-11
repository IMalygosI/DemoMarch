using System;
using System.Collections.Generic;
using DemoMarch.Models;
using Microsoft.EntityFrameworkCore;

namespace DemoMarch.Context;

public partial class DimaBaseContext : DbContext
{
    public DimaBaseContext()
    {
    }

    public DimaBaseContext(DbContextOptions<DimaBaseContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Client> Clients { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<Post> Posts { get; set; }

    public virtual DbSet<Service> Services { get; set; }

    public virtual DbSet<Status> Statuses { get; set; }

    public virtual DbSet<TypeOfEntrance> TypeOfEntrances { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=89.110.53.87:5522;Database=dima_base;Username=dima;password=dima");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Client>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("client_pk");

            entity.ToTable("Client", "DemoMarch");

            entity.Property(e => e.Id)
                .UseIdentityAlwaysColumn()
                .HasColumnName("ID");
            entity.Property(e => e.ClientCode).HasColumnName("Client_Code");
            entity.Property(e => e.DateBirthday).HasColumnName("Date_Birthday");
            entity.Property(e => e.Email).HasColumnType("character varying");
            entity.Property(e => e.Fio)
                .HasMaxLength(255)
                .HasColumnName("FIO");
            entity.Property(e => e.Password).HasColumnType("character varying");

            entity.HasMany(d => d.Employees).WithMany(p => p.Clients)
                .UsingEntity<Dictionary<string, object>>(
                    "User",
                    r => r.HasOne<Employee>().WithMany()
                        .HasForeignKey("EmployeeId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("user_employee_fk"),
                    l => l.HasOne<Client>().WithMany()
                        .HasForeignKey("ClientId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("user_client_fk"),
                    j =>
                    {
                        j.HasKey("ClientId", "EmployeeId").HasName("user_pk");
                        j.ToTable("User", "DemoMarch");
                        j.IndexerProperty<int>("ClientId").HasColumnName("ClientID");
                        j.IndexerProperty<int>("EmployeeId").HasColumnName("EmployeeID");
                    });

            entity.HasMany(d => d.OrderClientCodes).WithMany(p => p.ClientCodes)
                .UsingEntity<Dictionary<string, object>>(
                    "OrderAndClient",
                    r => r.HasOne<Order>().WithMany()
                        .HasForeignKey("OrderClientCode")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("orderandclient_order_fk"),
                    l => l.HasOne<Client>().WithMany()
                        .HasForeignKey("ClientCode")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("orderandclient_client_fk"),
                    j =>
                    {
                        j.HasKey("ClientCode", "OrderClientCode").HasName("orderandclient_pk");
                        j.ToTable("OrderAndClient", "DemoMarch");
                        j.IndexerProperty<int>("ClientCode").HasColumnName("Client_Code");
                        j.IndexerProperty<int>("OrderClientCode").HasColumnName("Order_Client_Code");
                    });
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("employee_pk");

            entity.ToTable("Employee", "DemoMarch");

            entity.Property(e => e.Id)
                .UseIdentityAlwaysColumn()
                .HasColumnName("ID");
            entity.Property(e => e.CodeEmployee)
                .HasColumnType("character varying")
                .HasColumnName("Code_Employee");
            entity.Property(e => e.Fio)
                .HasMaxLength(255)
                .HasColumnName("FIO");
            entity.Property(e => e.LastEntry).HasColumnName("Last_Entry");
            entity.Property(e => e.Login).HasColumnType("character varying");
            entity.Property(e => e.Password).HasColumnType("character varying");
            entity.Property(e => e.PostId).HasColumnName("Post_ID");
            entity.Property(e => e.TypeOfEntranceId).HasColumnName("Type_Of_Entrance_ID");

            entity.HasOne(d => d.Post).WithMany(p => p.Employees)
                .HasForeignKey(d => d.PostId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("employee_post_fk");

            entity.HasOne(d => d.TypeOfEntrance).WithMany(p => p.Employees)
                .HasForeignKey(d => d.TypeOfEntranceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("employee_type_of_entrance_fk");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("order_pk");

            entity.ToTable("Order", "DemoMarch");

            entity.Property(e => e.Id)
                .UseIdentityAlwaysColumn()
                .HasColumnName("ID");
            entity.Property(e => e.ClientCode).HasColumnName("Client_Code");
            entity.Property(e => e.ClosingDate).HasColumnName("Closing_Date");
            entity.Property(e => e.DateOfCreation).HasColumnName("Date_Of_Creation");
            entity.Property(e => e.OrderCode).HasColumnName("Order_Code");
            entity.Property(e => e.OrderTime).HasColumnName("Order_Time");
            entity.Property(e => e.ServicesCode).HasColumnName("Services_Code");
            entity.Property(e => e.TimeRental).HasColumnName("Time_Rental");

            entity.HasOne(d => d.StatusNavigation).WithMany(p => p.Orders)
                .HasForeignKey(d => d.Status)
                .HasConstraintName("order_status_fk");

            entity.HasMany(d => d.Servises).WithMany(p => p.OrderIdServises)
                .UsingEntity<Dictionary<string, object>>(
                    "OrderAndServise",
                    r => r.HasOne<Service>().WithMany()
                        .HasForeignKey("ServiseId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("orderandservise_services_fk"),
                    l => l.HasOne<Order>().WithMany()
                        .HasForeignKey("OrderIdServise")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("orderandservise_order_fk"),
                    j =>
                    {
                        j.HasKey("OrderIdServise", "ServiseId").HasName("orderandservise_pk");
                        j.ToTable("OrderAndServise", "DemoMarch");
                        j.IndexerProperty<int>("OrderIdServise").HasColumnName("Order_ID_Servise");
                        j.IndexerProperty<int>("ServiseId").HasColumnName("Servise_ID");
                    });
        });

        modelBuilder.Entity<Post>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("post_pk");

            entity.ToTable("Post", "DemoMarch");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name).HasColumnType("character varying");
        });

        modelBuilder.Entity<Service>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("services_pk");

            entity.ToTable("Services", "DemoMarch");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.CodeServices)
                .HasColumnType("character varying")
                .HasColumnName("Code_Services");
            entity.Property(e => e.CostRubPerHour)
                .HasPrecision(19, 4)
                .HasColumnName("Cost_RUB_Per_Hour");
            entity.Property(e => e.Name).HasColumnType("character varying");
        });

        modelBuilder.Entity<Status>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("status_pk");

            entity.ToTable("Status", "DemoMarch");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name).HasColumnType("character varying");
        });

        modelBuilder.Entity<TypeOfEntrance>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("type_of_entrance_pk");

            entity.ToTable("Type_Of_Entrance", "DemoMarch");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Name).HasColumnType("character varying");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
