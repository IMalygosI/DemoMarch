using Avalonia.Controls;
using MsBox.Avalonia;
using System.Linq;

namespace DemoMarch
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Entrance();
        }


        public async void Entrance() 
        {
            var user = Helper.DateBase.Clients.FirstOrDefault(a => a.Password == passworld.Text && a.Email == login.Text);

            if (user != null)
            {
                GlavnoeOkko glavnoeOkko = new GlavnoeOkko();
                glavnoeOkko.Show();
                Close();
            }
            else
            {
                string Warning = "Ошибка! Ввод Логина или Пароля неверен!";
                Error error = new Error(Warning);
                error.ShowDialog(this);
                error.Close();
            }
        }


        private void Maska(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            if (passworld != null)
            {
                passworld.PasswordChar = passworld.PasswordChar == '*' ? '\0' : '*';
            }
        }
    }
}