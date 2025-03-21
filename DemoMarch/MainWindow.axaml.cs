using Avalonia.Controls;
using Microsoft.EntityFrameworkCore;
using MsBox.Avalonia;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace DemoMarch
{
    public partial class MainWindow : Window
    {
        bool war = true;
        public MainWindow()
        {
            InitializeComponent();
        }

        /// <summary>
        /// ������ �� 10 ������ ������������ ������ ����� (����������� ��������� ����)
        /// </summary>
        /// <returns></returns>
        private async Task isvisible()
        {
            await Task.Delay(10000);
            Entrance_Vhod.IsVisible = true;

        }

        /// <summary>
        /// ��������� �����
        /// </summary>
        /// <param name="lenght"></param>
        /// <returns></returns>
        private string GenerateStringCapcha(int lenght)
        {
            string chars = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789";
            Random random = new Random();
            char[] result = new char[lenght];
            for (int i = 0; i < lenght; i++)
            {
                int index = random.Next(chars.Length);
                result[i] = chars[index];
            }
            return new string(result);
        }

        /// <summary>
        /// ���������� � ����� �����
        /// </summary>
        private void UpdateCaptcha()
        {

            string ratdomText = GenerateStringCapcha(7);
            CapchaText.Text = ratdomText;

        }

        /// <summary>
        /// ���� �� ������ � �����
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_Entrance(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            var User = Helper.DateBase.Employees.FirstOrDefault(a => a.Login == login.Text);

            bool isSuccessfulAttempt = false; 

            if (war != true)
            {
                if (User != null)
                {
                    if (User.Password == passworld.Text && CapchaText.Text != null && CapchaTextBox.Text != null && CapchaText.Text == CapchaTextBox.Text)
                    {
                        isSuccessfulAttempt = true; 
                        Profile profile = new Profile(User);
                        profile.Show();
                        Close();
                        CapchaText.IsVisible = false;
                        CapchaTextBox.IsVisible = false;
                    }
                    else
                    {
                        string Warning = "������! ���� �����, ������ ��� ������ �������!";
                        Error error = new Error(Warning);
                        error.ShowDialog(this);

                        Entrance_Vhod.IsVisible = false;

                        isvisible();
                        UpdateCaptcha();
                    }
                }
                else
                {
                    string Errors = "������! ���� ������ ��� ������ �������!";
                    Error error = new Error(Errors);
                    error.ShowDialog(this);
                }
            }
            else
            {
                if (User != null && User.Password == passworld.Text)
                {
                    isSuccessfulAttempt = true;
                    Profile profile = new Profile(User);
                    profile.Show();
                    Close();
                }
                else
                {
                    war = false;

                    CapchaTextBox.IsVisible = true;
                    CapchaText.IsVisible = true;

                    string Warning = "������! ���� ������ ��� ������ �������!";
                    Error error = new Error(Warning);
                    error.ShowDialog(this);
                    UpdateCaptcha();
                }
            }

            // ���������� ������ ����� � ��
            if (User != null)
            {
                User.LastEntry = DateOnly.FromDateTime(DateTime.Now); // ��������� ������� ����
                User.TypeOfEntranceId = isSuccessfulAttempt ? 1 : 2; // 1 - �������, 2 - ���������
                Helper.DateBase.SaveChanges();
            }
            else
            {
                // ���� ������������ �� ������, �� ����� ��� �����
                var userWithLogin = Helper.DateBase.Employees.FirstOrDefault(a => a.Login == login.Text);
                if (userWithLogin != null)
                {
                    userWithLogin.LastEntry = DateOnly.FromDateTime(DateTime.Now); // ��������� ������� ����
                    userWithLogin.TypeOfEntranceId = 2; // ���������� �������
                    Helper.DateBase.SaveChanges();
                }
            }
        }

        /// <summary>
        /// ����� ������
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Maska(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
        {
            if (passworld != null)
            {
                passworld.PasswordChar = passworld.PasswordChar == '*' ? '\0' : '*';
            }
        }
    }
}