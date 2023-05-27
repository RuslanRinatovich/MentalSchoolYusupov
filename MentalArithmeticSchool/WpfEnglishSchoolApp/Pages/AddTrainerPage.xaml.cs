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
    /// Логика взаимодействия для AddTrainerPage.xaml
    /// </summary>
    public partial class AddTrainerPage : Page
    {
        private Worker _currentItem = new Worker();
        // путь к файлу
        private string _filePath = null;
        // название текущей главной фотографии
        private string _photoName = null;
        // текущая папка приложения
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"\Images\";
        // передача в AddGoodPage товара 
        List<WorkerSpec> currentItems = new List<WorkerSpec>();
        class ComboBoxTypeItem
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public bool Selected { get; set; }
        }
          List<ComboBoxTypeItem> servicesItems = new List<ComboBoxTypeItem>();
        
        private string GetComboBoxItemContent(List<ComboBoxTypeItem> items)
        {
            List<string> s = new List<string>();

            foreach (ComboBoxTypeItem item in items)
            {
                if (item.Selected == true)
                {
                    s.Add(item.Name);

                }
            }
            return String.Join(", ", s);
        }
        // загрузка 

        private void LoadServices()
        {
            servicesItems.Clear();
            List<WorkerSpec> xlist = EnglishSchoolABCEntities.GetContext().WorkerSpecs.Where(i => i.WorkerId == _currentItem.WorkerId).ToList();
            List<Speciality> items = EnglishSchoolABCEntities.GetContext().Specialities.ToList();

            List<int> datas = new List<int>();
            foreach (WorkerSpec c in xlist)
            {
                datas.Add(c.SpecialityId);
                currentItems.Add(c);
            }
            //  MessageBox.Show(currentItems.Count.ToString());


            foreach (Speciality item in items)
            {
                if (datas.Contains(item.SpecialityId))
                {
                    servicesItems.Add(new ComboBoxTypeItem
                    {
                        Id = item.SpecialityId,

                        Name = item.SpecialityName,
                        Selected = true
                    });

                }
                else
                    servicesItems.Add(new ComboBoxTypeItem
                    {
                        Id = item.SpecialityId,
                        Name = item.SpecialityName,
                        Selected = false
                    });
            }
            ComboCategories.ItemsSource = null;
            ComboCategories.ItemsSource = servicesItems;

        }
        //сохраytybt
        void SaveServices()
        {
            List<WorkerSpec> saveItems = new List<WorkerSpec>();

            foreach (ComboBoxTypeItem item in servicesItems)
            {
                if (item.Selected == true)
                {
                    saveItems.Add(new WorkerSpec
                    {
                        WorkerId = _currentItem.WorkerId,
                        SpecialityId = item.Id,
                    }); ;
                }
            }
            // MessageBox.Show(currentItems.Count.ToString());
            // MessageBox.Show(saveItems.Count.ToString());
            List<WorkerSpec> delItems = new List<WorkerSpec>();
            List<WorkerSpec> addItems = new List<WorkerSpec>();

            foreach (WorkerSpec x in currentItems)
            {
                bool b = false;
                foreach (WorkerSpec y in saveItems)
                {
                    if ((y.SpecialityId == x.SpecialityId) && (y.WorkerId == x.WorkerId))
                    {
                        b = true;
                        break;
                    }

                }
                if (!b)
                    delItems.Add(x);
            }

            foreach (WorkerSpec x in saveItems)
            {
                bool b = false;
                foreach (WorkerSpec y in currentItems)
                {
                    if ((y.SpecialityId == x.SpecialityId) && (y.WorkerId == x.WorkerId))
                    {
                        b = true;
                        break;
                    }

                }
                if (!b)
                    addItems.Add(x);
            }

            string s = "";
            //foreach (WorkerSpec x in delItems)
            //{
            //    if ((x.Abonements.Count == 0) && (x.TimeTables.Count == 0))
            //        EnglishSchoolABCEntities.GetContext().WorkerSpecs.Remove(x);
            //    else
            //        s += "\n" + x.Speciality.Name;


            //}
            //if (s != "")
            //    MessageBox.Show($"Не удалось удалить у данного тренера следующие " +
            //        $"направления: {s}, поскольку у данного тренера есть абонементы" +
            //        $" и занятия по данным направлениям", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);


            EnglishSchoolABCEntities.GetContext().WorkerSpecs.RemoveRange(delItems);
            EnglishSchoolABCEntities.GetContext().WorkerSpecs.AddRange(addItems);

            EnglishSchoolABCEntities.GetContext().SaveChanges();
        }


        public AddTrainerPage(Worker selectedItem)
        {
            InitializeComponent();
            // если передано null, то мы добавляем новый товар
            if (selectedItem != null)
            {
                _currentItem = selectedItem;
                TextBoxGoodId.Visibility = Visibility.Hidden;
                int x = selectedItem.WorkerId;

                //_filePath = _currentDirectory + _currentItem.Photo;
            }
            else
            {
                _currentItem.Birthday = DateTime.Today;
            }
            DataContext = _currentItem;
            LoadServices();
            _photoName = _currentItem.Photo;
        }
        // проверка полей
        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentItem.LastName))
                s.AppendLine("Поле фамилия пустое");
            if (string.IsNullOrWhiteSpace(_currentItem.FirstName))
                s.AppendLine("Поле имя пустое");
            if (string.IsNullOrWhiteSpace(_currentItem.MiddleName))
                s.AppendLine("Поле отчество пустое");

            if (_currentItem.Birthday == null)
                s.AppendLine("Выберите дату рождения");

            if (_currentItem.WorkExperience == 0)
                s.AppendLine("Укажите стаж");
            if (string.IsNullOrWhiteSpace(_currentItem.Info))
                s.AppendLine("Заполните информацию о тренере");
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
            if (_currentItem.WorkerId == 0)
            {
                // добавление нового товара
                // формируем новое название файла картинки,
                // так как в папке может быть файл с тем же именем
                string photo = ChangePhotoName();
                // путь куда нужно скопировать файл
                string dest = _currentDirectory + photo;
                File.Copy(_filePath, dest);
                _currentItem.Photo = photo;
                // добавляем товар в БД
                EnglishSchoolABCEntities.GetContext().Workers.Add(_currentItem);

            }


            try
            {
                if (_filePath != null)
                {

                    string photo = ChangePhotoName();
                    string dest = _currentDirectory + photo;
                    File.Copy(_filePath, dest);
                    _currentItem.Photo = photo;
                }
                // Сохраняем изменения в БД
                EnglishSchoolABCEntities.GetContext().SaveChanges();
                SaveServices();
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

    }
}
