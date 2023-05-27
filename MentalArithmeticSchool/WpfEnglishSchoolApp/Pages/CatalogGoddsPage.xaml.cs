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
    /// Логика взаимодействия для CatalogGoddsPage.xaml
    /// </summary>
    public partial class CatalogGoddsPage : Page
    {
        int _itemcount = 0;
        public CatalogGoddsPage()
        {
            InitializeComponent();
            // загрузка данных в combobox + добавление дополнительной строки
            var developers = EnglishSchoolABCEntities.GetContext().Developers.OrderBy(p => p.DeveloperName).ToList();
            developers.Insert(0, new Developer
            {
                DeveloperName = "Все типы"
            }
            );
            ComboDeveloper.ItemsSource = developers;
            ComboDeveloper.SelectedIndex = 0;
            // загрузка данных в listview сортируем по названию
            LViewGoods.ItemsSource = EnglishSchoolABCEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList();
            _itemcount = LViewGoods.Items.Count;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
        }

        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //обновление данных после каждой активации окна
            if (Visibility == Visibility.Visible)
            {
                EnglishSchoolABCEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                LViewGoods.ItemsSource = EnglishSchoolABCEntities.GetContext().Goods.OrderBy(p => p.GoodName).ToList();
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
            LViewGoods.ItemsSource = currentGoods;
            // отображение количества записей
            TextBlockCount.Text = $" Результат запроса: {currentGoods.Count} записей из {_itemcount}";
        }
        // сортировка товаров 
        private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

    }
}