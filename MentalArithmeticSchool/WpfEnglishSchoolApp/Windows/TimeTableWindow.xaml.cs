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
    /// Логика взаимодействия для TimeTableWindow.xaml
    /// </summary>
    public partial class TimeTableWindow : Window
    {
        public TimeSheet currentItem { get; private set; }
        Worker worker;


        public TimeTableWindow(TimeSheet p, Worker g)
        {
            InitializeComponent();

            currentItem = p;
            worker = g;
            List<Service> specialities = EnglishSchoolABCEntities.GetContext().Services.OrderBy(x => x.ServiceName).ToList();
            TbTrainer.Text = g.GetFIO;
            ComboCategory.ItemsSource = specialities;


            DataContext = currentItem;

        }


        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (ComboCategory.SelectedIndex == -1)
                s.AppendLine("Не выбрана услуга");

            if (ComboDayWeek.SelectedIndex == -1)
                s.AppendLine("Не выбран день недели");
            if (TimePickerDayTime.Value is null)
                s.AppendLine("Укажите время занятия");

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
            //currentItem.CategoryId = Convert.ToInt32(ComboCategory.SelectedValue);
            currentItem.DayWeek = ComboDayWeek.Text;
            currentItem.ServiceTime = Convert.ToDateTime(TimePickerDayTime.Value).TimeOfDay;
            int catid = Convert.ToInt32(ComboCategory.SelectedValue);
            currentItem.ServiceId = catid;
            currentItem.WorkerId = worker.WorkerId;
            this.DialogResult = true;
        }

            }
}