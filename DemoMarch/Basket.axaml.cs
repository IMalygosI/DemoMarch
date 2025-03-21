using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using DemoMarch.Models;
using System.Collections.Generic;
using System.Linq;

namespace DemoMarch;

public partial class Basket : Window
{
    Employee Employee1;
    List<Basket> baskets = new List<Basket>();
    public Basket()
    {
        InitializeComponent();
        Employee1 = new Employee();
        Loang();
    }
    public Basket(Employee employee)
    {
        InitializeComponent();
        Employee1 = employee;
        Loang();
    }

    public void Loang()
    {




    }

    private void Button_Click_Logout(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        GlavnoeOkko glavnoeOkko = new GlavnoeOkko(Employee1);
        glavnoeOkko.Show();
        Close();
    }
}