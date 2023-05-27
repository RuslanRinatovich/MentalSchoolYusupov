using System;
using System.Collections.Generic;
using System.Data.Entity;
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
    /// Логика взаимодействия для SpecialitiesPage.xaml
    /// </summary>
    public partial class SpecialitiesPage : Page
    {
        List<Speciality> developers;
        public SpecialitiesPage()
        {
            InitializeComponent();
        }


        void LoadData()
        {
            try
            {
                DtData.ItemsSource = null;
                //загрузка обновленных данных
                EnglishSchoolABCEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                developers = EnglishSchoolABCEntities.GetContext().Specialities.OrderBy(p => p.SpecialityName).ToList();
                DtData.ItemsSource = developers;
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                LoadData();
            }
        }

        private void DataGridGoodLoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }


        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {


                SpecialityWindow window = new SpecialityWindow(new Speciality());
                if (window.ShowDialog() == true)
                {
                    EnglishSchoolABCEntities.GetContext().Specialities.Add(window.currentItem);
                    EnglishSchoolABCEntities.GetContext().SaveChanges();
                    LoadData();
                    MessageBox.Show("Запись добавлена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }

        private void btnChange_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                Speciality selected = DtData.SelectedItem as Speciality;


                SpecialityWindow window = new SpecialityWindow(
                    new Speciality
                    {
                        SpecialityId = selected.SpecialityId,
                        SpecialityName = selected.SpecialityName,
                        SpecialityPay = selected.SpecialityPay
                    }
                    );

                if (window.ShowDialog() == true)
                {
                    selected = EnglishSchoolABCEntities.GetContext().Specialities.Find(window.currentItem.SpecialityId);
                    // получаем измененный объект
                    if (selected != null)
                    {

                        selected.SpecialityId = window.currentItem.SpecialityId;
                        selected.SpecialityName = window.currentItem.SpecialityName;
                        selected.SpecialityPay = window.currentItem.SpecialityPay;
                        EnglishSchoolABCEntities.GetContext().Entry(selected).State = EntityState.Modified;
                        EnglishSchoolABCEntities.GetContext().SaveChanges();
                        LoadData();
                        MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    }
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
                // если ни одного объекта не выделено, выходим
                if (DtData.SelectedItem == null) return;
                // получаем выделенный объект
                MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить запись? ", "Удаление", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    Speciality deletedItem = DtData.SelectedItem as Speciality;



                    EnglishSchoolABCEntities.GetContext().WorkerSpecs.Load();
                    var list = EnglishSchoolABCEntities.GetContext().WorkerSpecs.Local;
                    int k = 0;
                    foreach (WorkerSpec item in list)
                    {
                        if (item.SpecialityId == deletedItem.SpecialityId)
                            k++;
                    }
                    // MessageBox.Show(k.ToString());
                    if (k > 0)
                    {
                        MessageBox.Show("Ошибка удаления, есть связанные записи", "Error",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    EnglishSchoolABCEntities.GetContext().Specialities.Remove(deletedItem);
                    EnglishSchoolABCEntities.GetContext().SaveChanges();
                    LoadData();
                    MessageBox.Show("Запись удалена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка, есть связанные записи");
            }
            finally
            {
                LoadData();
            }
        }
    }
}
