using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для AddGoodPage.xaml
    /// </summary>
    public partial class AddGoodPage : Page
    {
        //текущий товар
        private Good _currentGood = new Good();
        // путь к файлу
        private string _filePath = null;
        // название текущей главной фотографии
        private string _photoName = null;
        // текущая папка приложения
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"\Images\";
        // передача в AddGoodPage товара 
        public AddGoodPage(Good selectedGood)
        {
            InitializeComponent();
            // если передано null, то мы добавляем новый товар

            if (selectedGood != null)
            {
                _currentGood = selectedGood;
                TextBoxGoodId.Visibility = Visibility.Hidden;
                TextBlockGoodId.Visibility = Visibility.Hidden;
                int x = selectedGood.GoodId;
                // загрузка комплементарных товаров
                List<Complect> additional = EnglishSchoolABCEntities.GetContext().Complects.Where(p => p.MainGoodId == selectedGood.GoodId).ToList();
                List<Good> goods = new List<Good>();
                foreach (Complect item in additional)
                {
                    goods.Add(item.Good1);
                }
                ListViewAdditional.ItemsSource = goods;

                _filePath = _currentDirectory + _currentGood.MainPhoto;
            }
            DataContext = _currentGood;
            _photoName = _currentGood.MainPhoto;
            //загрузка производителей
            ComboDeveloper.ItemsSource = EnglishSchoolABCEntities.GetContext().Developers.ToList();
        }
        // проверка полей
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentGood.GoodName))
                s.AppendLine("Поле название пустое");
            if (_currentGood.Developer == null)
                s.AppendLine("Выберите производителя");
            if (_currentGood.Price < 0)
                s.AppendLine("Цена не может быть отрицательной");
            if (!string.IsNullOrWhiteSpace(TextBoxHeight.Text))
            {
                double x = 0;
                if (!double.TryParse(TextBoxHeight.Text, out x))
                    s.AppendLine("Высота только число");
                else if (x < 0)
                {
                    s.AppendLine("Высота не может быть отрицательной");
                }
            }
            if (!string.IsNullOrWhiteSpace(TextBoxLength.Text))
            {
                double x = 0;
                if (!double.TryParse(TextBoxLength.Text, out x))
                    s.AppendLine("Длина только число");
                else if (x < 0)
                {
                    s.AppendLine("Длина не может быть отрицательной");
                }
            }
            if (!string.IsNullOrWhiteSpace(TextBoxWidth.Text))
            {
                double x = 0;
                if (!double.TryParse(TextBoxWidth.Text, out x))
                    s.AppendLine("Ширина только число");
                else if (x < 0)
                {
                    s.AppendLine("Ширина не может быть отрицательной");
                }
            }
            if (!string.IsNullOrWhiteSpace(TextBoxWeight.Text))
            {
                double x = 0;
                if (!double.TryParse(TextBoxWeight.Text, out x))
                    s.AppendLine("Вес только число");
                else if (x < 0)
                {
                    s.AppendLine("Вес не может быть отрицательным");
                }
            }
            if (string.IsNullOrWhiteSpace(_photoName))
                s.AppendLine("фото не выбрано пустое");
            return s;
        }
        // сохранение 
        private void BtnSaveClick(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            // проверка полей прошла успешно
            if (_currentGood.GoodId == 0)
            {
                // добавление нового товара
                // формируем новое название файла картинки,
                // так как в папке может быть файл с тем же именем
                string photo = ChangePhotoName();
                // путь куда нужно скопировать файл
                string dest = _currentDirectory + photo;
                File.Copy(_filePath, dest);
                _currentGood.MainPhoto = photo;
                // добавляем товар в БД
                EnglishSchoolABCEntities.GetContext().Goods.Add(_currentGood);
            }
            try
            {
                if (_filePath != null)
                {

                    string photo = ChangePhotoName();
                    string dest = _currentDirectory + photo;
                    File.Copy(_filePath, dest);
                    _currentGood.MainPhoto = photo;
                }
                // Сохраняем изменения в БД
                EnglishSchoolABCEntities.GetContext().SaveChanges();
                MessageBox.Show("Запись Изменена");
                // Возвращаемся на предыдущую форму
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
        // загрузка фото 
        private void BtnLoadClick(object sender, RoutedEventArgs e)
        {
            try
            {
                //Диалог открытия файла
                OpenFileDialog op = new OpenFileDialog();
                op.Title = "Select a picture";
                op.Filter = "JPEG Files (*.jpeg)|*.jpeg|PNG Files (*.png)|*.png|JPG Files (*.jpg)|*.jpg|GIF Files (*.gif)|*.gif";
                // диалог вернет true, если файл был открыт
                if (op.ShowDialog() == true)
                {
                    // проверка размера файла
                    // по условию файл дожен быть не более 2Мб.
                    FileInfo fileInfo = new FileInfo(op.FileName);
                    if (fileInfo.Length > (1024 * 1024 * 2))
                    {
                        // размер файла меньше 2Мб. Поэтому выбрасывается новое исключение
                        throw new Exception("Размер файла должен быть меньше 2Мб");
                    }
                    ImagePhoto.Source = new BitmapImage(new Uri(op.FileName));
                    _photoName = op.SafeFileName;
                    _filePath = op.FileName;
                }
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                _filePath = null;
            }
        }
        //подбор имени файла
        string ChangePhotoName()
        {
            string x = _currentDirectory + _photoName;
            string photoname = _photoName;
            int i = 0;
            if (File.Exists(x))
            {
                while (File.Exists(x))
                {
                    i++;
                    x = _currentDirectory + i.ToString() + photoname;
                }
                photoname = i.ToString() + photoname;
            }
            return photoname;

        }
        // открытие этой же страницы
        // в качестве параметра передаем выделенный товар в комплементарных товарах
        private void ListViewAdditionalPreviewMouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (ListViewAdditional.SelectedItems.Count > 0)
            {
                Good good = (sender as ListView).SelectedItem as Good;
                Manager.MainFrame.Navigate(new AddGoodPage(good));
            }
        }
        // открытие окна редактирования комплементарных товаров
        private void BtnEditAdditionalClick(object sender, RoutedEventArgs e)
        {
            if (_currentGood.GoodId != 0)
            {
                Manager.MainFrame.Navigate(new AdditionalGoodsPage(_currentGood));
            }
        }
        // Событие визуализации страницы
        // после визуализации окна данные в listView подгружаются снова
        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            // загрузка комплементарных товаров
            List<Complect> additional = EnglishSchoolABCEntities.GetContext().Complects.Where(p => p.MainGoodId == _currentGood.GoodId).ToList();
            List<Good> goods = new List<Good>();
            foreach (Complect item in additional)
            {
                goods.Add(item.Good1);
            }
            ListViewAdditional.ItemsSource = goods;
        }
    }
}
