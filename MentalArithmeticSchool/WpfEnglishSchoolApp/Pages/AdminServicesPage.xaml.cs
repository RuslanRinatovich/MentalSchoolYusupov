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
using Excel = Microsoft.Office.Interop.Excel;
namespace WpfEnglishSchoolApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdminServicesPage.xaml
    /// </summary>
    public partial class AdminServicesPage : Page
    {
        List<Service> services;
        int _itemcount = 0;
        public AdminServicesPage()
        {
            InitializeComponent();
        }
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            // открытие редактирования товара
            // передача выбранного товара в AddGoodPage
            Manager.MainFrame.Navigate(new AddServicePage((sender as Button).DataContext as Service));
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
            // получаем текущие данные из бд
            var currentServices =
                EnglishSchoolABCEntities.GetContext().
                Services.OrderBy(p => p.ServiceName).ToList();
            // выбор по скидке
            if (ComboSkidka.SelectedIndex > 0)
            {
                int a = 0;
                int b = 0;
                switch (ComboSkidka.SelectedIndex)
                {
                    case 1:
                        a = 0;
                        b = 5;
                        break;
                    case 2:
                        a = 5;
                        b = 15;
                        break;
                    case 3:
                        a = 15;
                        b = 30;
                        break;
                    case 4:
                        a = 30;
                        b = 70;
                        break;
                    case 5:
                        a = 70;
                        b = 100;
                        break;
                }
                currentServices = currentServices.
                    Where(p => p.Discount >= a && p.Discount < b).ToList();
            }
            // выбор тех товаров, в названии которых есть поисковая строка
            currentServices = currentServices.
                Where(p => p.ServiceName.ToLower().
                Contains(TBoxSearch.Text.ToLower())).ToList();

            // сортировка
            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    currentServices = currentServices.
                        OrderBy(p => p.Price).ToList();
                // сортировка по убыванию цены
                if (ComboSort.SelectedIndex == 1)
                    currentServices = currentServices.
                        OrderByDescending(p => p.Price).ToList();
            }
            // В качестве источника данных присваиваем список данных
            services = currentServices;
            DataGridServices.ItemsSource = currentServices;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {currentServices.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }
        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                DataGridServices.ItemsSource = null;
                //загрузка обновленных данных
               
                EnglishSchoolABCEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                services = EnglishSchoolABCEntities.GetContext().Services.OrderBy(p => p.ServiceName).ToList();
                _itemcount = services.Count;
                DataGridServices.ItemsSource = services;
                TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
            }
        }

        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            // открытие  AddGoodPage для добавления новой записи
            Manager.MainFrame.Navigate(new AddServicePage(null));
        }

        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selectedServices = DataGridServices.SelectedItems.Cast<Service>().ToList();
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedServices.Count()} записей???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    // берем из списка удаляемых товаров один элемент
                    Service x = selectedServices[0];
                    // проверка, есть ли у товара в таблице о продажах связанные записи
                    // если да, то выбрасывается исключение и удаление прерывается
                    if (x.Visits.Count > 0)
                        throw new Exception("Есть связанные записи об оказании этой услуги");

                    // удаляем сервис
                    EnglishSchoolABCEntities.GetContext().Services.Remove(x);
                    //сохраняем изменения
                    EnglishSchoolABCEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    services = EnglishSchoolABCEntities.GetContext().Services.OrderBy(p => p.ServiceName).ToList();
                    DataGridServices.ItemsSource = null;
                    DataGridServices.ItemsSource = services;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        // отображение номеров строк в DataGrid
        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }

        private void BtnSell_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new VisitPage((sender as Button).DataContext as Service));
        }

        private void PrintExcel()
        {
            string fileName = AppDomain.CurrentDomain.BaseDirectory + "\\" + "Services" + ".xltx";
            Excel.Application xlApp = new Excel.Application();
            Excel.Worksheet xlSheet = new Excel.Worksheet();
            try
            {
                //добавляем книгу
                xlApp.Workbooks.Open(fileName, Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                                          Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                                          Type.Missing, Type.Missing, Type.Missing, Type.Missing,
                                          Type.Missing, Type.Missing);
                //делаем временно неактивным документ
                xlApp.Interactive = false;
                xlApp.EnableEvents = false;
                Excel.Range xlSheetRange;
                //выбираем лист на котором будем работать (Лист 1)
                xlSheet = (Excel.Worksheet)xlApp.Sheets[1];
                //Название листа
                xlSheet.Name = "Список услуг";
                int row = 2;
                int i = 0;


                foreach (Service service in services )
                {
                    xlSheet.Cells[row, 1] = (i + 1).ToString();
                    string s;
                    // DateTime y = Convert.ToDateTime(dtOrders.Rows[i].Cells[1].Value);
                    xlSheet.Cells[row, 2] = service.ServiceId.ToString();
                    s = "";


                    xlSheet.Cells[row, 3] = service.ServiceName.ToString();
                    xlSheet.Cells[row, 4] = service.Price.ToString();
                    s = "";
                    if (service.TimeLength != 0) s = service.TimeLength.ToString();
                    xlSheet.Cells[row, 5] = s;
                    s = "";
                    if (service.Discount != 0) s = service.Discount.ToString();
                    xlSheet.Cells[row, 6] = s;
                   
                    row++;
                    Excel.Range r = xlSheet.get_Range("A" + row.ToString(), "F" + row.ToString());
                    r.Insert(Excel.XlInsertShiftDirection.xlShiftDown);
                    i++;
                }




                row--;
                xlSheetRange = xlSheet.get_Range("A2:F" + (row + 1).ToString(), Type.Missing);
                xlSheetRange.Borders.LineStyle = true;
                //xlSheet.Cells[row + 1, 9] = "=SUM(I2:I" + row.ToString() + ")";

                //xlSheet.Cells[row + 1, 8] = "ИТОГО:";
                row++;

                //выбираем всю область данных*/
                xlSheetRange = xlSheet.UsedRange;
                //выравниваем строки и колонки по их содержимому
                xlSheetRange.Columns.AutoFit();
                xlSheetRange.Rows.AutoFit();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                //Показываем ексель
                xlApp.Visible = true;
                xlApp.Interactive = true;
                xlApp.ScreenUpdating = true;
                xlApp.UserControl = true;
            }
        }


        private void BtnExcel_Click(object sender, RoutedEventArgs e)
        {
            PrintExcel();
        }
    }
}

