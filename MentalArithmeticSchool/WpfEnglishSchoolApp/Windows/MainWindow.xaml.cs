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
using WpfEnglishSchoolApp.Pages;
using WpfEnglishSchoolApp.Windows;

namespace WpfEnglishSchoolApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        bool f = false;
        public MainWindow()
        {
            InitializeComponent();
            
            Manager.CurrentClient = null;
            Manager.MainFrame = MainFrame;
            f = false;
            MainFrame.Navigate(new CatalogGoddsPage());
        }

        private void WindowClosed(object sender, EventArgs e)
        {

            App.Current.Shutdown();
        }
        //событие попытки закрытия окна,
        // если пользователь выберет Cancel, то форму не закроем
        private void WindowClosing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MessageBoxResult x = MessageBox.Show("Вы действительно хотите выйти?",
                "Выйти", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (x == MessageBoxResult.Cancel)
                e.Cancel = true;
        }
        // Кнопка назад
        private void BtnBackClick(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }
        // Кнопка навигации
        private void BtnEditGoodsClick(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new GoodsPage());
          //  BtnEnter.Visibility = Visibility.Collapsed;

        }
        // Событие отрисовки страницы
        // Скрываем или показываем кнопку Назад 
        // Скрываем или показываем кнопки Для перехода к остальным страницам
        private void MainFrameContentRendered(object sender, EventArgs e)
        {
            if (Manager.CurrentClient is null)
            {
                BtnEnter.Visibility = Visibility.Visible;
                BtnServices.Visibility = Visibility.Visible;
                BtnGoods.Visibility = Visibility.Visible;
                BtnBack.Visibility = Visibility.Collapsed;
                return;
            }

            if (Manager.CurrentClient.RoleId == 1)
            {

                if (MainFrame.CanGoBack)
                {
                    BtnBack.Visibility = Visibility.Visible;
                    BtnEditGoods.Visibility = Visibility.Collapsed;
                    BtnEditServices.Visibility = Visibility.Collapsed;
                 //   BtnEditWorkers.Visibility = Visibility.Collapsed;
                    BtnEnter.Visibility = Visibility.Collapsed;
                    BtnServices.Visibility = Visibility.Collapsed;
                    BtnGoods.Visibility = Visibility.Collapsed;
                    BtnAllAccount.Visibility = Visibility.Collapsed;
                    BtnMyAccount.Visibility = Visibility.Collapsed;

                }
                else
                {
                    BtnBack.Visibility = Visibility.Collapsed;
                    BtnEditGoods.Visibility = Visibility.Visible;
                    BtnEditServices.Visibility = Visibility.Visible;
              //      BtnEditWorkers.Visibility = Visibility.Visible;
                    BtnEnter.Visibility = Visibility.Visible;
                    BtnServices.Visibility = Visibility.Visible;
                    BtnAllAccount.Visibility = Visibility.Visible;
                    BtnGoods.Visibility = Visibility.Visible;
                    BtnMyAccount.Visibility = Visibility.Visible;
                }
                return;
            }
            if (Manager.CurrentClient.RoleId == 2)
            {

                if (MainFrame.CanGoBack)
                {
                    BtnBack.Visibility = Visibility.Visible;
                    BtnEditGoods.Visibility = Visibility.Collapsed;
                    BtnEditServices.Visibility = Visibility.Collapsed;
                //    BtnEditWorkers.Visibility = Visibility.Collapsed;
                    BtnEnter.Visibility = Visibility.Collapsed;
                    BtnServices.Visibility = Visibility.Collapsed;
                    BtnGoods.Visibility = Visibility.Collapsed;
                    BtnMyAccount.Visibility = Visibility.Collapsed;
                    BtnAllAccount.Visibility = Visibility.Collapsed;
                }
                else
                {
                    BtnBack.Visibility = Visibility.Collapsed;
                    BtnEditGoods.Visibility = Visibility.Visible;
                    BtnEditServices.Visibility = Visibility.Visible;
               //     BtnEditWorkers.Visibility = Visibility.Visible;
                    BtnEnter.Visibility = Visibility.Visible;
                    BtnServices.Visibility = Visibility.Visible;
                    BtnGoods.Visibility = Visibility.Visible;
                    BtnMyAccount.Visibility = Visibility.Visible;
                    BtnAllAccount.Visibility = Visibility.Visible;
                }
                return;
            }



            //if (MainFrame.CanGoBack)
            //{
            //    BtnBack.Visibility = Visibility.Visible;
            //    //BtnServices.Visibility = Visibility.Collapsed;
            //    //BtnGoods.Visibility = Visibility.Collapsed;
            //    BtnEnter.Visibility = Visibility.Collapsed;
            //    BtnOrder.Visibility = Visibility.Collapsed;
            //    BtnBuyes.Visibility = Visibility.Collapsed;
            //    if (f)
            //    {
            //        BtnBack.Visibility = Visibility.Collapsed;
            //    }
            //    f = false;


            //    if (Manager.CurrentClient is null)
            //    {
            //        BtnEnter.Visibility = Visibility.Visible;
            //        return;
            //    }

            //    if (Manager.CurrentClient.RoleId == 1)
            //    {
            //        BtnEditGoods.Visibility = Visibility.Visible;
            //        BtnEditServices.Visibility = Visibility.Visible;
            //    }
            //    else
            //    {
            //        BtnMyAccount.Visibility = Visibility.Collapsed;
            //        BtnMyOrders.Visibility = Visibility.Collapsed;
            //    }
               
            //}
            //else
            //{
            //    BtnBack.Visibility = Visibility.Collapsed;
            //    BtnEnter.Visibility = Visibility.Visible;
            //    BtnGoods.Visibility = Visibility.Visible;
            //    BtnServices.Visibility = Visibility.Visible;

            //    if (Manager.CurrentClient is null)
            //        return;

            //    BtnOrder.Visibility = Visibility.Visible;
            //    BtnBuyes.Visibility = Visibility.Visible;

            //    if (Manager.CurrentClient.RoleId == 1)
            //    {
            //        BtnEditGoods.Visibility = Visibility.Visible;
            //        BtnEditServices.Visibility = Visibility.Visible;
            //    }
            //    else
            //    {
            //        BtnMyAccount.Visibility = Visibility.Visible;
            //        BtnMyOrders.Visibility = Visibility.Visible;
            //    }

            //}

            //if (f)
            //{
            //    BtnBack.Visibility = Visibility.Collapsed;
            //    MessageBox.Show("++");
            //}
   
        }

        private void BtnEditDev_Click(object sender, RoutedEventArgs e)
        {
        }

        private void BtnEditGroups_Click(object sender, RoutedEventArgs e)
        {
          //  MainFrame.Navigate(new CategoryPage());
        }

        private void BtnEnter_Click(object sender, RoutedEventArgs e)
        {
            if (Manager.CurrentClient != null)
            {
                MessageBoxResult messageBoxResult = MessageBox.Show($"Выйти из системы??? ", "Выход", MessageBoxButton.OKCancel,
MessageBoxImage.Question);
                if (messageBoxResult == MessageBoxResult.OK)
                {
                    IconBtnKey.Kind = MaterialDesignThemes.Wpf.PackIconKind.Login;
                    Manager.CurrentClient = null;
                    BtnEditGoods.Visibility = Visibility.Collapsed;
                    BtnEditServices.Visibility = Visibility.Collapsed;
                //    BtnEditWorkers.Visibility = Visibility.Collapsed;
                    BtnGoods.Visibility = Visibility.Visible;
                    BtnServices.Visibility = Visibility.Visible;
                    BtnAllAccount.Visibility = Visibility.Collapsed;
                    //BtnOrder.Visibility = Visibility.Collapsed;
                    //BtnBuyes.Visibility = Visibility.Collapsed;
                    BtnMyAccount.Visibility = Visibility.Collapsed;
                    //BtnMyOrders.Visibility = Visibility.Collapsed;
                    BtnEnter.ToolTip = "Войти";
                    return;
                }
            }

            LoginWindow window = new LoginWindow();
            if (window.ShowDialog() == true)
            {

                if (Manager.CurrentClient.RoleId == 1)
                {
                    BtnBack.Visibility = Visibility.Collapsed;
                    BtnEditServices.Visibility = Visibility.Visible;
                 //   BtnEditWorkers.Visibility = Visibility.Visible;
                    BtnEditGoods.Visibility = Visibility.Visible;
                    BtnMyAccount.Visibility = Visibility.Visible;
                    BtnAllAccount.Visibility = Visibility.Visible;
                    //  BtnOrder.Visibility = Visibility.Visible;
                    //  BtnBuyes.Visibility = Visibility.Visible;
                }
                else
                {
                    BtnMyAccount.Visibility = Visibility.Visible;
                    BtnAllAccount.Visibility = Visibility.Collapsed;
                    //  BtnMyOrders.Visibility = Visibility.Visible;
                    //  BtnOrder.Visibility = Visibility.Visible;
                    //  BtnBuyes.Visibility = Visibility.Visible;
                }
                BtnEnter.ToolTip = "Выйти";

            }

        }



        private void BtnMyOrder_Click(object sender, RoutedEventArgs e)
        {
            //MainFrame.Navigate(new StatusPage());


        }

        private void BtnMyAccount_Click(object sender, RoutedEventArgs e)
        {
            try
            {


                ClientWindow window = new ClientWindow(Manager.CurrentClient);

                if (window.ShowDialog() == true)
                {

                    MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }
        }

        private void BtnOrder_Click(object sender, RoutedEventArgs e)
        {

           // MainFrame.Navigate(new OrderPage());


        }

        private void BtnMyOrders_Click(object sender, RoutedEventArgs e)
        {
            //try
            //{


            //    MakeOrderWindow window = new MakeOrderWindow();

            //    if (window.ShowDialog() == true)
            //    {

            //        MessageBox.Show("Запись изменена", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
            //    }
            //}
            //catch
            //{
            //    MessageBox.Show("Ошибка");
            //}
        }

        private void BtnBuyes_Click(object sender, RoutedEventArgs e)
        {
        //    MainFrame.Navigate(new BuyPage());
        }

        private void BtnEditServices_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new AdminServicesPage());
        }

        private void BtnServices_Click(object sender, RoutedEventArgs e)
        {
            f = true;
            MainFrame.Navigate(new ServicesPage());
            Manager.MainFrame.NavigationService.RemoveBackEntry();


        }

        private void BtnGoods_Click(object sender, RoutedEventArgs e)
        {
            f = true;
            MainFrame.Navigate(new CatalogGoddsPage());
            Manager.MainFrame.NavigationService.RemoveBackEntry();
            
        }

        private void BtnAllAccount_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new AllClientsPage());
        }

        private void BtnEditworkers_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new TrainersPage());
        }
    }
}
