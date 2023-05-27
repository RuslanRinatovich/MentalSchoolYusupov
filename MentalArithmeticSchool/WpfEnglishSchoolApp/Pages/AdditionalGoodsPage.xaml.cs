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

namespace WpfEnglishSchoolApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdditionalGoodsPage.xaml
    /// </summary>
    public partial class AdditionalGoodsPage : Page
    {
        // текущий выбранный товар
        Good _currentGood = null;
        public AdditionalGoodsPage(Good good)
        {
            InitializeComponent();
            _currentGood = good;
            LoadGoodsIntoCombo(good);
            LoadData(good);
        }

        //Загрузка в Combo товаров
        void LoadGoodsIntoCombo(Good good)
        {
            ComboGoods.ItemsSource = EnglishSchoolABCEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList(); ;
            ComboGoods.SelectedIndex = 0;
            ComboGoods.SelectedValue = good.GoodId;
        }

        // загрузка данных в два ListBox
        void LoadData(Good good)
        {
            List<Complect> additional = EnglishSchoolABCEntities.GetContext().Complects.Where(p => p.MainGoodId == good.GoodId).ToList();
            List<Good> goods = new List<Good>();
            List<Good> allGoods = EnglishSchoolABCEntities.GetContext().Goods.Where(p => p.Active == true).ToList();
            foreach (Complect item in additional)
            {
                goods.Add(item.Good1);
                allGoods.Remove(item.Good1);
            }
            allGoods.Remove(good);
            ListBoxAdditional.ItemsSource = goods;
            ListBoxAllGoods.ItemsSource = allGoods;
        }
        // фильтрация дополнительных товаров товаров 
        private void ComboGoodsSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboGoods.SelectedIndex >= 0)
            {
                int goodId = Convert.ToInt32(ComboGoods.SelectedValue);
                var x = EnglishSchoolABCEntities.GetContext().Goods.FirstOrDefault(p => p.GoodId == goodId);
                _currentGood = x;
                LoadData(x);
            }
        }
        //Добавление комплементарного товара
        private void BtnAddClick(object sender, RoutedEventArgs e)
        {
            var g = (sender as Button).DataContext as Good;
            Complect complect = new Complect();
            complect.MainGoodId = _currentGood.GoodId;
            complect.SecondGoodId = g.GoodId;
            // вывод сообщения с вопросом Добавить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Добавить запись???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся добавить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    //добавляем комплементарный товар
                    EnglishSchoolABCEntities.GetContext().Complects.Add(complect);
                    //сохраняем изменения
                    EnglishSchoolABCEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись добавлена");
                    //обновляем данные в ListBox
                    LoadData(_currentGood);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка добавления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        //удаление комплементарного товара
        private void BtnDeleteClick(object sender, RoutedEventArgs e)
        {
            var g = (sender as Button).DataContext as Good;

            var deletedItem = EnglishSchoolABCEntities.GetContext().Complects.FirstOrDefault(p => p.MainGoodId == _currentGood.GoodId &&
            p.SecondGoodId == g.GoodId);
            // вывод сообщения с вопросом Удалить запись?
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись???",
                "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            //если пользователь нажал ОК пытаемся удалить запись
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    // удаляем запись о комплементарном товаре
                    EnglishSchoolABCEntities.GetContext().Complects.Remove(deletedItem);
                    //сохраняем изменения
                    EnglishSchoolABCEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись удалена");
                    //обновляем данные в ListBox
                    LoadData(_currentGood);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
