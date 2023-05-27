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

namespace WpfEnglishSchoolApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для SellWindow.xaml
    /// </summary>
    public partial class SellWindow : Window
    {
        public Sell currentItem { get; private set; }
        Good good;


        public SellWindow(Sell p, Good g)
        {
            InitializeComponent();

            List<Client> clients = EnglishSchoolABCEntities.GetContext().Clients.Where(i => i.RoleId != 1).ToList();

            ComboBoxClient.ItemsSource = clients;
            TbGood.Text = g.GoodName;
            currentItem = p;
            currentItem.DateSell = DateTime.Now;
            currentItem.GoodId = g.GoodId;
            good = g;

            DataContext = currentItem;
        }


        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (UpDownCount.Value is null)
                s.AppendLine("Количество не задано");
            if (DateTimeDateSell.Value is null)
                s.AppendLine("укажите дату продажи");
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
            currentItem.DateSell = Convert.ToDateTime(DateTimeDateSell.Value.ToString());
            currentItem.Count = Convert.ToInt32(UpDownCount.Value);
            currentItem.UserName = (ComboBoxClient.SelectedItem as Client).UserName;
            //   currentItem.CategoryId = Convert.ToInt32(ComboCategory.SelectedValue);
            this.DialogResult = true;
        }

     
    }
}