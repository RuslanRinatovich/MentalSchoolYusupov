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
    /// Логика взаимодействия для DeveloperWindow.xaml
    /// </summary>
    public partial class DeveloperWindow : Window
    {
        public Developer currentItem { get; private set; }
        public DeveloperWindow(Developer p)
        {
            InitializeComponent();
            currentItem = p;
            if (p is null)
                currentItem.WorkBeginDate = DateTime.Today;
            this.DataContext = currentItem;
        }

        private void Accept_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
        }
    }
}