using System;
using System.Collections.Generic;
using System.Data.Entity;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfEnglishSchoolApp.Models;
using WpfEnglishSchoolApp.Windows;

namespace WpfEnglishSchoolApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для TimeTablePage.xaml
    /// </summary>
    public partial class TimeTablePage : Page
    {
        public TimeTablePage(Worker worker)
        {
            InitializeComponent();
            LoadData(worker);

        }
        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        // загрузка данных в DataGrid и ComboBox
        void LoadData(Worker worker)
        {
            DtData.ItemsSource = EnglishSchoolABCEntities.GetContext().TimeSheets.Where(p => p.WorkerId == worker.WorkerId).OrderBy(p => p.Service.ServiceName).ThenBy(p => p.DayWeek).ThenBy(p => p.ServiceTime).ToList();
            ComboGoods.ItemsSource = EnglishSchoolABCEntities.GetContext().Workers.OrderBy(p => p.LastName).ToList(); ;
            ComboGoods.SelectedIndex = 0;
            ComboGoods.SelectedValue = worker.WorkerId;
            GridGood.DataContext = worker;
        }
        // фильтрация продаж по товару
        private void ComboGoodsSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboGoods.SelectedIndex >= 0)
            {
                int workerId = Convert.ToInt32(ComboGoods.SelectedValue);
                var x = EnglishSchoolABCEntities.GetContext().TimeSheets.Where(p => p.WorkerId == workerId).OrderBy(p => p.Service.ServiceName).ThenBy(p => p.DayWeek).ThenBy(p => p.ServiceTime).ToList();
                DtData.ItemsSource = x;
                GridGood.DataContext = ComboGoods.SelectedItem;
            }
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                Worker g = ComboGoods.SelectedItem as Worker;
            TimeTableWindow window = new TimeTableWindow(new TimeSheet(), g);
            if (window.ShowDialog() == true)
            {
                EnglishSchoolABCEntities.GetContext().TimeSheets.Add(window.currentItem);
                EnglishSchoolABCEntities.GetContext().SaveChanges();

                MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                LoadData(g);
            }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }

        private void btnChange_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Worker g = ComboGoods.SelectedItem as Worker;
                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                TimeSheet selected = DtData.SelectedItem as TimeSheet;

                //    double k = selected.Count;

                TimeTableWindow window = new TimeTableWindow(
                    new TimeSheet
                    {
                        TimeSheetId = selected.TimeSheetId,
                        ServiceId = selected.ServiceId,
                        WorkerId = selected.WorkerId,
                        ServiceTime = selected.ServiceTime,
                        DayWeek = selected.DayWeek
                    }, g
                    );

                if (window.ShowDialog() == true)
                {
                    selected = EnglishSchoolABCEntities.GetContext().TimeSheets.Find(window.currentItem.TimeSheetId);
                    // получаем измененный объект
                    if (selected != null)
                    {

                        selected.TimeSheetId = window.currentItem.TimeSheetId;
                        selected.ServiceId = window.currentItem.ServiceId;
                        selected.ServiceTime = window.currentItem.ServiceTime;
                        selected.DayWeek = window.currentItem.DayWeek;
                        selected.WorkerId = window.currentItem.WorkerId;

                        EnglishSchoolABCEntities.GetContext().Entry(selected).State = EntityState.Modified;
                        EnglishSchoolABCEntities.GetContext().SaveChanges();
                        // LoadData(g);

                        MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                        LoadData(g);
                        //ComboGoods.SelectedIndex = -1;
                    }
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }


        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Worker g = ComboGoods.SelectedItem as Worker;

                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись? ", "Удаление", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    TimeSheet deletedItem = DtData.SelectedItem as TimeSheet;


                    EnglishSchoolABCEntities.GetContext().TimeSheets.Remove(deletedItem);
                    EnglishSchoolABCEntities.GetContext().SaveChanges();


                    LoadData(g);
                    MessageBox.Show("Запись удалена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

    }
}

