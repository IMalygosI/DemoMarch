using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using DemoMarch.Models;
using System.Linq;

namespace DemoMarch;

public partial class Profile : Window
{
    Employee Employee1;
    Client Client1;
    public Profile()
    {
        InitializeComponent();
        Employee1 = new Employee();
        Client1 = new Client();
    }


    /// <summary>
    /// ���� ��� ������������� Employee
    /// </summary>
    /// <param name="employee"></param>
    public Profile(Employee employee)
    {
        InitializeComponent();
        Employee1 = employee;

        FioName.Text = Employee1.Fio;
        Post.Text = Employee1.PostJob;

        if (Employee1.PostId == 1) // ����� � ������������� ����� ������� ����� ������������ ������, ����������������� ���� ������������� �� ������� �����, �������� � ������� � ��������� ����������,  ������������ �� ����� �������.
        {
            History.IsVisible = true;
            Othet.IsVisible = true;
        }
        else if (Employee1.PostId == 2) // �������� � �������� ����� ������������ �����;
        {
            Orders.IsVisible = true;
        }
        else if (Employee1.PostId == 3) // ������� ����� � ������� ����� ����� ������������ ����� � ������� �����;
        {
            Orders.IsVisible = true;
            Orders_Prinat.IsVisible = true;
        }
    }

    /// <summary>
    /// ���� ��� ��������
    /// </summary>
    /// <param name="client"></param>
    public Profile(Client client)
    {
        InitializeComponent();
        Client1 = client;
    }

    private void Button_Click_Logout(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        MainWindow mainWindow = new MainWindow();
        mainWindow.Show();
        Close();
    }

    private void Button_Click_History(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        History history = new History(Employee1);
        history.Show();
        Close();
    }

    private void Button_Click_Orders(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        GlavnoeOkko glavnoeOkko = new GlavnoeOkko(Employee1);
        glavnoeOkko.Show();
        Close();
    }
}