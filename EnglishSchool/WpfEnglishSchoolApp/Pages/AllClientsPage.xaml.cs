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
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfEnglishSchoolApp.Models;
using WpfEnglishSchoolApp.Windows;

namespace WpfEnglishSchoolApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AllClientsPage.xaml
    /// </summary>
    public partial class AllClientsPage : Page
    {
        public AllClientsPage()
        {
            InitializeComponent();
        }

        private void BtnClientType_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new ClientTypePage());
        }

        int _itemcount = 0;
       
        
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            //// открытие редактирования товара
            //// передача выбранного товара в AddGoodPage
            //Manager.MainFrame.Navigate(new AddGoodPage((sender as Button).DataContext as Good));
            try
            {
                ClientWindow window = new ClientWindow((sender as Button).DataContext as Client);

                if (window.ShowDialog() == true)
                {

                    MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }

        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                DataGridClients.ItemsSource = null;
                //загрузка обновленных данных
                var clienttypes = EnglishSchoolABCEntities.GetContext().ClientTypes.OrderBy(p => p.ClientTypeName).ToList();
                clienttypes.Insert(0, new ClientType
                {
                    ClientTypeName = "Все типы"
                }
                );
                ComboClientType.ItemsSource = clienttypes;
                ComboClientType.SelectedIndex = 0;
                EnglishSchoolABCEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                List<Client> clients = EnglishSchoolABCEntities.GetContext().Clients.OrderBy(p => p.LastName).ToList();
                DataGridClients.ItemsSource = clients;
                _itemcount = clients.Count;
                TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
            }
        }

        // Поиск товаров, которые содержат данную поисковую строку
        private void TBoxSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }
        // Поиск товаров конкретного производителя
        private void ComboTypeSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }
        /// <summary>
        /// Метод для фильтрации и сортировки данных
        /// </summary>
        private void UpdateData()
        {
            var currentData = EnglishSchoolABCEntities.GetContext().Clients.OrderBy(p => p.LastName).ToList();
            if (ComboClientType.SelectedIndex > 0)
                currentData = currentData.Where(p => p.ClientTypeId == (ComboClientType.SelectedItem as ClientType).ClientTypeId).ToList();
            currentData = currentData.Where(p => (p.LastName + p.FirstName + p.MiddleName).ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();
            if (ComboSort.SelectedIndex >= 0)
            {
                if (ComboSort.SelectedIndex == 0)
                    currentData = currentData.OrderBy(p => p.LastName).ToList();
                if (ComboSort.SelectedIndex == 1)
                    currentData = currentData.OrderByDescending(p => p.LastName).ToList();
            }
            DataGridClients.ItemsSource = currentData;
            TextBlockCount.Text = $" Результат запроса: {currentData.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }
        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            // открытие  AddGoodPage для добавления новой записи
            Manager.MainFrame.Navigate(new AddGoodPage(null));
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            var selectedItem = DataGridClients.SelectedItems.Cast<Client>().ToList();
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedItem.Count()} записей???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    Client x = selectedItem[0];
                    if (x.Visits.Count > 0)
                        throw new Exception("Есть зависимые записи");
                     EnglishSchoolABCEntities.GetContext().Clients.Remove(x);
                    EnglishSchoolABCEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<Client> clients = EnglishSchoolABCEntities.GetContext().Clients.OrderBy(p => p.LastName).ToList();
                    DataGridClients.ItemsSource = null;
                    DataGridClients.ItemsSource = clients;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        private void BtnSellClick(object sender, RoutedEventArgs e)
        {
            // открытие страницы о продажах SellGoodsPage
            // передача в него выбранного товара
            Manager.MainFrame.Navigate(new SellGoodsPage((sender as Button).DataContext as Good));
        }
        // отображение номеров строк в DataGrid
        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }
    }
}

