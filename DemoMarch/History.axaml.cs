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

        BoxLogins.SelectionChanged += BoxLogins_SelectionChanged;
        BoxData.SelectionChanged += BoxData_SelectionChanged;

        Loang();
        LoangBox();
    }
    public History(Employee employee)
    {
        InitializeComponent();
        Employee1 = employee;

        BoxLogins.SelectionChanged += BoxLogins_SelectionChanged;
        BoxData.SelectionChanged += BoxData_SelectionChanged;

        Loang();
        LoangBox();
    }

    private void BoxData_SelectionChanged(object? sender, SelectionChangedEventArgs e) => Loang();
    private void BoxLogins_SelectionChanged(object? sender, SelectionChangedEventArgs e) => Loang();

    public void LoangBox()
    {
        history = Helper.DateBase.Employees.ToList();

        history.Add(new Employee() { Login = "Фильрация" });


        BoxLogins.ItemsSource = history.OrderByDescending(g => g.Login == "Фильрация");

        BoxData.ItemsSource = history.OrderByDescending(g => g.LastEntry == Employee1.LastEntry);

        BoxLogins.SelectedIndex = 0;
        BoxData.SelectedIndex = 0;

    }
    public void Loang()
    {
        history = Helper.DateBase.Employees.Include(df => df.Post).Include(df => df.TypeOfEntrance).ToList();


        if (BoxLogins.SelectedIndex > 0)
        {
            var SelectLog = (Employee)BoxLogins.SelectedItem;
            history = history.Where(p => p.Login == SelectLog.Login).ToList();
        }
        if (BoxData.SelectedIndex > 0)
        {
            var SelectDate = (Employee)BoxData.SelectedItem;
            history = history.Where(p => p.LastEntry == SelectDate.LastEntry).ToList();
        }

        ListBox_History.ItemsSource = history;
    }

    private void Button_Click_Logout(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        Profile profile = new Profile(Employee1);
        profile.Show();
        Close();
    }
}