using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using DemoMarch.Models;
using System.Collections.Generic;
using System.Linq;

namespace DemoMarch;

public partial class GlavnoeOkko : Window
{
    Employee Employee1;
    Client Client1;
    List<Service> services = new List<Service>();
    
    public GlavnoeOkko()
    {
        InitializeComponent();
        Employee1 = new Employee();
        Client1 = new Client();
        Loang();
    }

    /// <summary>
    /// ���� ��� ������������� Employee
    /// </summary>
    /// <param name="employee">������������ ����</param>
    public GlavnoeOkko(Employee employee)
    {
        InitializeComponent();
        Employee1 = employee;
        Loang();
    }

    /// <summary>
    /// ���� ��� ��������
    /// </summary>
    /// <param name="client"></param>
    public GlavnoeOkko(Client client)
    {
        InitializeComponent();
        Client1 = client;
        Loang();
    }

    /// <summary>
    /// �������� �����
    /// </summary>
    public void Loang() 
    {
        services = Helper.DateBase.Services.ToList();
        ListBox_servise.ItemsSource = services;
    }



    /// <summary>
    /// ����� � �������
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void Button_Click_Logout(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        Profile profile = new Profile(Employee1);
        profile.Show();
        Close();
    }
}