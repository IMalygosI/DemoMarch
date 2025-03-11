using System;
using System.Collections.Generic;

namespace DemoMarch.Models;

public partial class Client
{
    public int Id { get; set; }

    public string? Fio { get; set; }

    public int? ClientCode { get; set; }

    public string? Passport { get; set; }

    public DateOnly? DateBirthday { get; set; }

    public string? Adress { get; set; }

    public string? Email { get; set; }

    public string? Password { get; set; }

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();

    public virtual ICollection<Order> OrderClientCodes { get; set; } = new List<Order>();
}
