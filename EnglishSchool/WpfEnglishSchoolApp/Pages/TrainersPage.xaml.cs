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
    /// Логика взаимодействия для TrainersPage.xaml
    /// </summary>
    public partial class TrainersPage : Page
    {
        List<Worker> workers;

        public TrainersPage()
        {
            InitializeComponent();
        }
        private void ButtonClick(object sender, RoutedEventArgs e)
        {
            // открытие редактирования товара
            // передача выбранного товара в AddGoodPage
            Manager.MainFrame.Navigate(new AddTrainerPage((sender as Button).DataContext as Worker));
        }

        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                DataGridGood.ItemsSource = null;
                //загрузка обновленных данных
                EnglishSchoolABCEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                workers = EnglishSchoolABCEntities.GetContext().Workers.OrderBy(p => p.LastName).ToList();
                DataGridGood.ItemsSource = workers;
            }
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
            var selectedGoods = DataGridGood.SelectedItems.Cast<Worker>().ToList();
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedGoods.Count()} записей???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    // берем из списка удаляемых товаров один элемент
                    Worker x = selectedGoods[0];
                    // проверка, есть ли у товара в таблице о продажах связанные записи
                    // если да, то выбрасывается исключение и удаление прерывается
                    if ((x.TimeSheets.Count > 0))
                        throw new Exception("Ошибка удаления, есть связанные записи");

                    // удаляем товара
                    EnglishSchoolABCEntities.GetContext().Workers.Remove(x);
                    //сохраняем изменения
                    EnglishSchoolABCEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    workers.Clear();
                    workers = EnglishSchoolABCEntities.GetContext().Workers.OrderBy(p => p.LastName).ToList();
                    DataGridGood.ItemsSource = null;
                    DataGridGood.ItemsSource = workers;
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
            //Manager.MainFrame.Navigate(new SellGoodsPage((sender as Button).DataContext as Worker));
        }
        // отображение номеров строк в DataGrid
        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        private void PrintExcel()
        {
            string fileName = AppDomain.CurrentDomain.BaseDirectory + "\\" + "Workers" + ".xltx";
            Excel.Application xlApp = new Excel.Application();
            Excel.Worksheet xlSheet = new Excel.Worksheet();
            try
            {
                //добавляем книгу
                xlApp.Workbooks.Open(fileName, System.Type.Missing, System.Type.Missing, System.Type.Missing, System.Type.Missing,
                                          System.Type.Missing, System.Type.Missing, System.Type.Missing, System.Type.Missing,
                                          System.Type.Missing, System.Type.Missing, System.Type.Missing, System.Type.Missing,
                                          System.Type.Missing, System.Type.Missing);
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


                foreach (Worker car in workers)
                {
                    xlSheet.Cells[row, 1] = (i + 1).ToString();
                    string s;
                    //// DateTime y = Convert.ToDateTime(dtOrders.Rows[i].Cells[1].Value);
                    xlSheet.Cells[row, 2] = car.WorkerId.ToString();
                    s = "";
                    //if (car.CategoryId != null) s = car.Category.Name.ToString();
                    //xlSheet.Cells[row, 3] = s;
                    ////if (car.BrandId != null) s = car.Brand.Name.ToString();
                    ////xlSheet.Cells[row, 4] = s;
                    ////s = "";

                    //xlSheet.Cells[row, 4] = car.Name.ToString();
                    ////s = "";
                    ////if (car.EngineCapacity != null) s = car.EngineCapacity.ToString();
                    ////xlSheet.Cells[row, 6] = s;
                    ////s = "";
                    ////if (car.FuelRate != null) s = car.FuelRate.ToString();
                    ////xlSheet.Cells[row, 7] = s;
                    ////s = "";
                    ////if (car.TrunkVolume != null) s = car.TrunkVolume.ToString();
                    ////xlSheet.Cells[row, 8] = s;
                    //s = "";



                    //if (car.Price != null) s = car.Price.ToString();
                    xlSheet.Cells[row, 5] = s;


                    row++;
                    Excel.Range r = xlSheet.get_Range("A" + row.ToString(), "E" + row.ToString());
                    r.Insert(Excel.XlInsertShiftDirection.xlShiftDown);
                    i++;
                }




                row--;
                xlSheetRange = xlSheet.get_Range("A2:E" + (row + 1).ToString(), System.Type.Missing);
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





        private void BtnCategories_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new SpecialitiesPage());
        }

        private void BtnTimeTable_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new TimeTablePage((sender as Button).DataContext as Worker));
        }
    }
}
