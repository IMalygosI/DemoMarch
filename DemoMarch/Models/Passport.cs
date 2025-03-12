using System;
using System.Collections.Generic;

namespace DemoMarch.Models;

public partial class Passport
{
    public int Id { get; set; }

    public int IdClient { get; set; }

    public int? NumberPassport { get; set; }

    public int? SetialPassport { get; set; }

    public virtual ICollection<Client> Clients { get; set; } = new List<Client>();
}
