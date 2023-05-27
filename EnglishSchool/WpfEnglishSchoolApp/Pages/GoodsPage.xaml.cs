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
    /// Логика взаимодействия для GoodsPage.xaml
    /// </summary>
    public partial class GoodsPage : Page
    {
        List<Good> goods;
        int _itemcount = 0;
        public GoodsPage()
        {
            InitializeComponent();
            // загрузка данных в combobox + добавление дополнительной строки
           
        }
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            // открытие редактирования товара
            // передача выбранного товара в AddGoodPage
            Manager.MainFrame.Navigate(new AddGoodPage((sender as Button).DataContext as Good));
        }

        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                DataGridGood.ItemsSource = null;
                //загрузка обновленных данных
                var developers = EnglishSchoolABCEntities.GetContext().Developers.OrderBy(p => p.DeveloperName).ToList();
                developers.Insert(0, new Developer
                {
                    DeveloperName = "Все типы"
                }
                );
                ComboDeveloper.ItemsSource = developers;
                ComboDeveloper.SelectedIndex = 0;
                EnglishSchoolABCEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                goods = EnglishSchoolABCEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList();
                DataGridGood.ItemsSource = goods;
                _itemcount = goods.Count;
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
            // получаем текущие данные из бд
            var currentGoods = EnglishSchoolABCEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList();
            // выбор только тех товаров, которые принадлежат данному производителю
            if (ComboDeveloper.SelectedIndex > 0)
                currentGoods = currentGoods.Where(p => p.DeveloperId == (ComboDeveloper.SelectedItem as Developer).DeveloperId).ToList();
            // выбор тех товаров, в названии которых есть поисковая строка
            currentGoods = currentGoods.Where(p => p.GoodName.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();

            // сортировка
            if (ComboSort.SelectedIndex >= 0)
            {
                // сортировка по возрастанию цены
                if (ComboSort.SelectedIndex == 0)
                    currentGoods = currentGoods.OrderBy(p => p.Price).ToList();
                // сортировка по убыванию цены
                if (ComboSort.SelectedIndex == 1)
                    currentGoods = currentGoods.OrderByDescending(p => p.Price).ToList();
            }
            // В качестве источника данных присваиваем список данных
            goods = currentGoods;
            DataGridGood.ItemsSource = currentGoods;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {currentGoods.Count} записей из {_itemcount}";
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
            // удаление выбранного товара из таблицы
            //получаем все выделенные товары
            var selectedGoods = DataGridGood.SelectedItems.Cast<Good>().ToList();
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedGoods.Count()} записей???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    // берем из списка удаляемых товаров один элемент
                    Good x = selectedGoods[0];
                    // проверка, есть ли у товара в таблице о продажах связанные записи
                    // если да, то выбрасывается исключение и удаление прерывается
                    if (x.Sells.Count > 0)
                        throw new Exception("Есть записи в продажах");
                    //ищем записи в таблице Complect, с которой связан этот товар
                    var complects = EnglishSchoolABCEntities.GetContext().Complects.Where(p => p.MainGoodId == x.GoodId || p.SecondGoodId == x.GoodId).ToList();
                    // удаляем эти записи
                    EnglishSchoolABCEntities.GetContext().Complects.RemoveRange(complects);
                    // удаляем товара
                    EnglishSchoolABCEntities.GetContext().Goods.Remove(x);
                    //сохраняем изменения
                    EnglishSchoolABCEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    goods.Clear();
                    goods = EnglishSchoolABCEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList();
                    DataGridGood.ItemsSource = null;
                    DataGridGood.ItemsSource = goods;
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
        private void BtnEditDev_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new DevelopersPage());
        }

        private void PrintExcel()
        {
            string fileName = AppDomain.CurrentDomain.BaseDirectory + "\\" + "Goods" + ".xltx";
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
                xlSheet.Name = "Список товаров";
                int row = 2;
                int i = 0;


                foreach (Good good in goods)
                {
                    xlSheet.Cells[row, 1] = (i + 1).ToString();
                    string s;
                    // DateTime y = Convert.ToDateTime(dtOrders.Rows[i].Cells[1].Value);
                    xlSheet.Cells[row, 2] = good.GoodId.ToString();
                    s = "";
                   

                    xlSheet.Cells[row, 3] = good.GoodName.ToString();
                    xlSheet.Cells[row, 4] = good.Price.ToString();
                    s = "";
                    if (good.Weight != null) s = good.Weight.ToString();
                    xlSheet.Cells[row, 5] = s;
                    s = "";
                    if (good.Width != null) s = good.Width.ToString();
                    xlSheet.Cells[row, 6] = s;
                    s = "";
                    if (good.Length != null) s = good.Length.ToString();
                    xlSheet.Cells[row, 7] = s;
                    s = "";
                    if (good.Heigth != null) s = good.Heigth.ToString();
                    xlSheet.Cells[row, 8] = s;

                            xlSheet.Cells[row, 9] = good.Developer.DeveloperName;
                    xlSheet.Cells[row, 10] = good.GetStatus;
                    row++;
                    Excel.Range r = xlSheet.get_Range("A" + row.ToString(), "J" + row.ToString());
                    r.Insert(Excel.XlInsertShiftDirection.xlShiftDown);
                    i++;
                }




                row--;
                xlSheetRange = xlSheet.get_Range("A2:J" + (row + 1).ToString(), Type.Missing);
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
