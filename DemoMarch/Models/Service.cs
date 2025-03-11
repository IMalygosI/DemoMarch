using System;
using System.Collections.Generic;

namespace DemoMarch.Models;

public partial class Service
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? CodeServices { get; set; }

    public decimal? CostRubPerHour { get; set; }

    public virtual ICollection<Order> OrderIdServises { get; set; } = new List<Order>();
}
