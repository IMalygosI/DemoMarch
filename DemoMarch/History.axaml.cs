using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using DemoMarch.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace DemoMarch;

public partial class History : Window
{
    List<Employee> history = new List<Employee>();
    Employee Employee1;

    public History()
    {
        InitializeComponent();
        Employee1 = new Employee();
        Loang();
    }
    public History(Employee employee)
    {
        InitializeComponent();
        Employee1 = employee;

        Loang();
    }
    public void Loang()
    {
        history = Helper.DateBase.Employees.Include(df => df.Post).Include(df => df.TypeOfEntrance).ToList();

        ListBox_History.ItemsSource = history;
    }

    private void Button_Click_Logout(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        Profile profile = new Profile(Employee1);
        profile.Show();
        Close();
    }
}