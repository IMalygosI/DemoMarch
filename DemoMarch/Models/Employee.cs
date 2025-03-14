﻿using System;
using System.Collections.Generic;

namespace DemoMarch.Models;

public partial class Employee
{
    public int Id { get; set; }

    public int PostId { get; set; }

    public string Fio { get; set; } = null!;

    public string Login { get; set; } = null!;

    public string Password { get; set; } = null!;

    public DateOnly LastEntry { get; set; }

    public int TypeOfEntranceId { get; set; }

    public string? CodeEmployee { get; set; }

    public virtual Post Post { get; set; } = null!;

    public virtual TypeOfEntrance TypeOfEntrance { get; set; } = null!;

    public virtual ICollection<Client> Clients { get; set; } = new List<Client>();
}
