﻿using System;
using System.Collections.Generic;

namespace DemoMarch.Models;

public partial class TypeOfEntrance
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();
}
