using System;
using System.Collections.Generic;
using Avalonia.Media.Imaging;

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

    public string? Image { get; set; }

    public virtual Post Post { get; set; } = null!;

    public virtual TypeOfEntrance TypeOfEntrance { get; set; } = null!;

    public virtual ICollection<Client> Clients { get; set; } = new List<Client>();
    public string PostJob => PostId == 1 ? "Администратор" :
                             PostId == 2 ? "Продавец" :
                             PostId == 3 ? "Старший смены" : "Post";

    public Bitmap ImageSourse => Image != null ? new Bitmap($"Assets/{Image}.jpeg") : null!;

}
