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
    /// Логика взаимодействия для ClientTypePage.xaml
    /// </summary>
    public partial class ClientTypePage : Page
    {
        List<ClientType> brands;
        public ClientTypePage()
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
                brands = EnglishSchoolABCEntities.GetContext().ClientTypes.OrderBy(p => p.ClientTypeName).ToList();
                DtData.ItemsSource = brands;
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


                ClientTypeWindow window = new ClientTypeWindow(new ClientType());
                if (window.ShowDialog() == true)
                {
                    EnglishSchoolABCEntities.GetContext().ClientTypes.Add(window.currentItem);
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
                ClientType selected = DtData.SelectedItem as ClientType;


                ClientTypeWindow window = new ClientTypeWindow(
                    new ClientType
                    {
                        ClientTypeId = selected.ClientTypeId,
                        ClientTypeName = selected.ClientTypeName,
                        Color = selected.Color,
                    }
                    );

                if (window.ShowDialog() == true)
                {
                    selected = EnglishSchoolABCEntities.GetContext().ClientTypes.Find(window.currentItem.ClientTypeId);
                    // получаем измененный объект
                    if (selected != null)
                    {

                        selected.ClientTypeId = window.currentItem.ClientTypeId;
                        selected.ClientTypeName = window.currentItem.ClientTypeName;
                        selected.Color = window.currentItem.Color;
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
                    ClientType deletedItem = DtData.SelectedItem as ClientType;


                    if (deletedItem.Clients.Count > 0)
                        throw new Exception("Есть зависимые записи");

                    EnglishSchoolABCEntities.GetContext().ClientTypes.Remove(deletedItem);
                    EnglishSchoolABCEntities.GetContext().SaveChanges();
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