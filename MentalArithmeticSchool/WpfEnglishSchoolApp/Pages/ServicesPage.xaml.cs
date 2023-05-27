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
    /// Логика взаимодействия для ServicesPage.xaml
    /// </summary>
  
        public partial class ServicesPage : Page
        {
            int _itemcount = 0;
            public ServicesPage()
            {
                InitializeComponent();
                // загрузка данных в combobox + добавление дополнительной строки
                // загрузка данных в listview сортируем по названию
                ListBoxServices.ItemsSource = EnglishSchoolABCEntities.GetContext().
                    Services.OrderBy(p => p.ServiceName).ToList();
                _itemcount = ListBoxServices.Items.Count;
                // отображение количества записей
                TextBlockCount.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
            }

            private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
            {
                //обновление данных после каждой активации окна
                if (Visibility == Visibility.Visible)
                {

                    EnglishSchoolABCEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                    ListBoxServices.ItemsSource = EnglishSchoolABCEntities.GetContext().Services.OrderBy(p => p.ServiceName).ToList();
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
                ListBoxServices.ItemsSource = currentServices;
                // отображение количества записей
                TextBlockCount.Text = $" Результат запроса: {currentServices.Count} записей из {_itemcount}";
            }
            // сортировка товаров 
            private void ComboSortSelectionChanged(object sender, SelectionChangedEventArgs e)
            {
                UpdateData();
            }
        }
    }

