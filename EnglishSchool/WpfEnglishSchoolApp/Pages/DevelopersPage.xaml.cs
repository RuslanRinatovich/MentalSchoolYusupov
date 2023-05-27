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
    /// Логика взаимодействия для DevelopersPage.xaml
    /// </summary>
    public partial class DevelopersPage : Page
    {
        List<Developer> developers;
        public DevelopersPage()
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
                developers = EnglishSchoolABCEntities.GetContext().Developers.OrderBy(p => p.DeveloperName).ToList();
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


                DeveloperWindow window = new DeveloperWindow(new Developer());
                if (window.ShowDialog() == true)
                {
                    EnglishSchoolABCEntities.GetContext().Developers.Add(window.currentItem);
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
                Developer selected = DtData.SelectedItem as Developer;


                DeveloperWindow window = new DeveloperWindow(
                    new Developer
                    {
                        DeveloperId = selected.DeveloperId,
                        DeveloperName = selected.DeveloperName,
                        WorkBeginDate = selected.WorkBeginDate
                    }
                    );

                if (window.ShowDialog() == true)
                {
                    selected = EnglishSchoolABCEntities.GetContext().Developers.Find(window.currentItem.DeveloperId);
                    // получаем измененный объект
                    if (selected != null)
                    {

                        selected.DeveloperId = window.currentItem.DeveloperId;
                        selected.DeveloperName = window.currentItem.DeveloperName;
                        selected.WorkBeginDate = window.currentItem.WorkBeginDate;
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
                    Developer deletedItem = DtData.SelectedItem as Developer;


                   
                    //   MessageBox.Show(k.ToString());
                    if (deletedItem.Goods.Count > 0)
                    {
                        MessageBox.Show("Ошибка удаления, есть связанные записи", "Error",
                            MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    EnglishSchoolABCEntities.GetContext().Developers.Remove(deletedItem);
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
