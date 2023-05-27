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
    /// Логика взаимодействия для SellGoodsPage.xaml
    /// </summary>
    public partial class SellGoodsPage : Page
    {
        public SellGoodsPage(Good good)
        {
            InitializeComponent();
            LoadData(good);

        }
        // загрузка данных в DataGrid и ComboBox
        void LoadData(Good good)
        {
            DataGridSells.ItemsSource = EnglishSchoolABCEntities.GetContext().Sells.Where(p => p.GoodId == good.GoodId).OrderBy(p => p.DateSell).ToList();
            ComboGoods.ItemsSource = EnglishSchoolABCEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList(); ;
            ComboGoods.SelectedIndex = 0;
            ComboGoods.SelectedValue = good.GoodId;
            GridGood.DataContext = good;
        }
        // фильтрация продаж по товару
        private void ComboGoodsSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboGoods.SelectedIndex > 0)
            {
                int goodId = Convert.ToInt32(ComboGoods.SelectedValue);
                var x = EnglishSchoolABCEntities.GetContext().Sells.Where(p => p.GoodId == goodId).OrderBy(p => p.DateSell).ToList();
                DataGridSells.ItemsSource = x;
                GridGood.DataContext = ComboGoods.SelectedItem;
            }
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                Good g = ComboGoods.SelectedItem as Good;
                
                SellWindow window = new SellWindow(new Sell(), g);
                if (window.ShowDialog() == true)
                {
                    EnglishSchoolABCEntities.GetContext().Sells.Add(window.currentItem);
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
        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Good g = ComboGoods.SelectedItem as Good;

                // если ни одного объекта не выделено, выходим
                if (DataGridSells.SelectedItem == null) return;
                // получаем выделенный объект
                MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись? ", "Удаление", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    Sell deletedItem = DataGridSells.SelectedItem as Sell;
                    EnglishSchoolABCEntities.GetContext().Sells.Remove(deletedItem);
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
