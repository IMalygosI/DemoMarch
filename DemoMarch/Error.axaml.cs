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
    public Error(string Warning)
    {
        InitializeComponent();

        if (Warning == "������! ���� ������ ��� ������ �������!") 
        {
            warning.Text = Warning;
        }
    }
}