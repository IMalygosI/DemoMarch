using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace DemoMarch;

public partial class Error : Window
{
    public Error()
    {
        InitializeComponent();
    }

    /// <summary>
    /// ����� ������
    /// </summary>
    /// <param name="Warning"></param>
    public Error(string Warning)
    {
        InitializeComponent();

        if (Warning == "������! ���� ������ ��� ������ �������!") 
        {
            warning.Text = Warning;
        }
        else if (Warning == "������! ���� �����, ������ ��� ������ �������!")
        {
            warning.Text = Warning;
        }
        else if (Warning == "")
        {
            warning.Text = Warning;
        }
        else if (Warning == "")
        {
            warning.Text = Warning;
        }
        else if (Warning == "")
        {
            warning.Text = Warning;
        }
        else if (Warning == "")
        {
            warning.Text = Warning;
        }
        else if (Warning == "")
        {
            warning.Text = Warning;
        }
    }

    /// <summary>
    /// �������� ���� ������
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void Button_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        Close();
    }
}