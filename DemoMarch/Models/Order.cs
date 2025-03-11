using System;
using System.Collections.Generic;

namespace DemoMarch.Models;

public partial class Order
{
    public int Id { get; set; }

    public string? OrderCode { get; set; }

    public DateOnly? DateOfCreation { get; set; }

    public TimeOnly? OrderTime { get; set; }

    public int? ClientCode { get; set; }

    public string? ServicesCode { get; set; }

    public int? Status { get; set; }

    public DateOnly? ClosingDate { get; set; }

    public int? TimeRental { get; set; }

    public virtual Status? StatusNavigation { get; set; }

    public virtual ICollection<Client> ClientCodes { get; set; } = new List<Client>();

    public virtual ICollection<Service> Servises { get; set; } = new List<Service>();
}
