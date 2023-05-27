using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using WpfEnglishSchoolApp.Models;
using WpfEnglishSchoolApp.Windows;
namespace WpfEnglishSchoolApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для VisitWindow.xaml
    /// </summary>
    public partial class VisitWindow : Window
    {
        public Visit currentItem { get; private set; }



        public VisitWindow(Visit p, Service b)
        {
            InitializeComponent();

            List<Client> clients = EnglishSchoolABCEntities.GetContext().Clients.Where(i => i.RoleId != 1).ToList();
           
            ComboBoxClient.ItemsSource = clients;
            currentItem = p;
            currentItem.DateActual = DateTime.Now;
            currentItem.ServiceId = b.ServiceId;
            TbInfo.Text = b.ServiceName;
            DataContext = currentItem;

        }


        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (DatePickerDate.Value == null)
                s.AppendLine("Не выбрана дата");
            if (ComboBoxClient.SelectedIndex == -1)
                s.AppendLine("Не выбран клиент");
            return s;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }

            currentItem.DateActual = Convert.ToDateTime(DatePickerDate.Value.ToString());
            currentItem.UserName = (ComboBoxClient.SelectedItem as Client).UserName;
            this.DialogResult = true;
        }


    }
}