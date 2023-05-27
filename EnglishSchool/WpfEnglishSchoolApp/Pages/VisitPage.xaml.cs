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
    /// Логика взаимодействия для VisitPage.xaml
    /// </summary>
    public partial class VisitPage : Page
    {
        Service _currentService;
        public VisitPage(Service service)
        {
            InitializeComponent();

            _currentService = service;
            LoadData(service);

        }
        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        // загрузка данных в DataGrid и ComboBox
        void LoadData(Service service)
        {
            //if (Manager.CurrentUser.Role == false)
            //{
            //    btnAdd.Visibility = Visibility.Collapsed;
            //    btnDelete.Visibility = Visibility.Collapsed;
            //    CardTrainer.DataContext = null;
            //    ComboGoods.ItemsSource = null;
            //    ComboGoods.ItemsSource = EnglishSchoolABCEntities.GetContext().Buys.Where(p => p.UserName == Manager.CurrentUser.UserName).OrderBy(p => p.AbonementId).ToList();
            //    ComboGoods.SelectedIndex = -1;
            //    ComboGoods.SelectedValue = service.Id;
            //    DtData.ItemsSource = EnglishSchoolABCEntities.GetContext().Visits.Where(p => p.BuytId == service.Id).OrderBy(p => p.DateTime).ToList();
            //    CardTrainer.DataContext = service;
            //}

            //else
            //{
                GridService.DataContext = null;
                ComboServices.ItemsSource = null;
            ComboServices.ItemsSource = EnglishSchoolABCEntities.GetContext().Services.OrderBy(p => p.ServiceName).ToList();
            ComboServices.SelectedIndex = -1;
            ComboServices.SelectedValue = service.ServiceId;
            DtData.ItemsSource = EnglishSchoolABCEntities.GetContext().Visits.Where(p => p.ServiceId == service.ServiceId).OrderBy(p => p.DateActual).ToList();
            GridService.DataContext = service;
           // }
        }
        // фильтрация продаж по товару
        private void ComboGoodsSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboServices.SelectedIndex >= 0)
            {
                int goodId = Convert.ToInt32(ComboServices.SelectedValue);
                _currentService = ComboServices.SelectedItem as Service;
                var x = EnglishSchoolABCEntities.GetContext().Visits.Where(p => p.ServiceId == goodId).OrderBy(p => p.DateActual).ToList();
                DtData.ItemsSource = x;
                GridService.DataContext = ComboServices.SelectedItem;
                // MessageBox.Show("+");
            }
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                Service g = ComboServices.SelectedItem as Service;
                VisitWindow window = new VisitWindow(new Visit(), g);
                if (window.ShowDialog() == true)
                {
                    EnglishSchoolABCEntities.GetContext().Visits.Add(window.currentItem);
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
                Service g = ComboServices.SelectedItem as Service;
                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                Visit selected = DtData.SelectedItem as Visit;

                //    double k = selected.Count;

                VisitWindow window = new VisitWindow(
                    new Visit
                    {
                        VisitId = selected.VisitId,
                        UserName = selected.UserName,
                        ServiceId = selected.ServiceId,
                        Paid = selected.Paid,
                        Rewiew = selected.Rewiew,
                        DateActual = selected.DateActual,
                    }, g
                    );

                if (window.ShowDialog() == true)
                {
                    selected = EnglishSchoolABCEntities.GetContext().Visits.Find(window.currentItem.VisitId);
                    // получаем измененный объект
                    if (selected != null)
                    {

                        selected.VisitId = window.currentItem.VisitId;
                        selected.ServiceId = g.ServiceId;
                        selected.UserName = window.currentItem.UserName;
                        selected.Paid = window.currentItem.Paid;
                        selected.Rewiew = window.currentItem.Rewiew;
                        selected.DateActual = window.currentItem.DateActual;

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
                Service g = ComboServices.SelectedItem as Service;

                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись? ", "Удаление", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    Visit deletedItem = DtData.SelectedItem as Visit;
                   
                    EnglishSchoolABCEntities.GetContext().Visits.Remove(deletedItem);
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

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                LoadData(_currentService);
            }
        }
    }
}