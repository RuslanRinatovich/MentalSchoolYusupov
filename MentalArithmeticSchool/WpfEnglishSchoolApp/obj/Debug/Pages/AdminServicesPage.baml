   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:WpfEnglishSchoolApp.PagesWpfEnglishSchoolApp.Pages  5      1    +WpfEnglishSchoolApp.Pages.AdminServicesPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:WpfEnglishSchoolApp.Pages     5      -   5          N� Title$  Услуги��5	         	base_page#��[  5
      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   � $��0��6   $��Stretch=�5        PrimaryHueLightBrush#��[ 5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $:��4Введите название для поиска:��6     base_textblock#��[ 5      �� 5      -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   5      5      �� 5      $ 
Horizontal=�6   .+�5      �� $#��Выберите скидку��6   #��[ 5      �� 5      -   5         ��Name$ ComboSkidka��5   '   $	��275��6   .@�5       �� $��Все��6#   �� 5!      $��от 0 до 5%��6#   �� 5"      $��от 5% до 15%��6#   �� 5#      $��от 15% до 30%��6#   �� 5$      $��от 30% до 70%��6#   �� 5%      $��от 70% до 100%��6#   5'      5(      �� 5)      $ 
Horizontal=�6   .+�5*      �� $!��Сортировать по��6   #��[ 5+      �� 5,      -   5        $ 	ComboSort��5-      $	��275��5,      .@�5/      �� $!��По возрастанию��6#   �� 50      $��По убыванию��6#   51      52      53      &   System.Windows.Controls.DataGrid  54   
   -   5          Name$ DataGridServices��54      $��1��6-      AutoGenerateColumns .     
IsReadOnly .    SelectionMode$ Single=�57      	   Columns	 59      4  .System.Windows.Controls.DataGridTemplateColumn  5:      ,  &System.Windows.Controls.DataGridColumn
   Width5  /System.Windows.Controls.DataGridLengthConverter$	
 100 6)      Header$+ %Главное изображение��65      CellTemplate 5;      �� 5<      .R�5=      �� ��6$   ��  �� Path$ GetPhoto�5>      5@      0  *System.Windows.Controls.DataGridTextColumn  5A      $- 'Наименование сервиса��5B   %   $
 5* 6C   1  +System.Windows.Controls.DataGridBoundColumn   Binding 5A   %   �� *ServiceName+5B   C     5C      $ Описание��5D   %   $
 5* 67    5C   %   �� *ServiceDescription+5D   7     5E      $ Стоимость��5F   %   $
 3* 68    5E   %   �� *Price+ �� StringFormat$ c�� �� ConverterCulture$ ru-RU��5F   8     5G      $&  Длительность, мин��5H   %   $
 3* 6@    5G   %   �� *
TimeLength+5H   @     5I      $ Скидка��5J   %   $
 3* 65    5I   %   �� *
Discount+$
 {0}%��5J   5     5K      $

 auto 6)   $  Редактировать��5L   )    5M      �� 5N      .R�5O      ��  ��Name$ BtnEdit��6%   -   5        $	��...��5O   6   $��0q�6X   5P      5R        5S      $

 auto 6)   $ Продажи��5T   )    5U      �� 5V      .R�5W      �� $ BtnSell��6%   -   5        $	��...��5W   6   $��0q�6Z   5X      5Z      5\      �� 5]   
   -   5        $ BtnExcel��5]      $��Excel��6$   $��2��64   $	��100��6A   $��Right=�6M   $��	3 0 240 0q�6i   6|   �� 5^   
   -	   5        $ BtnAdd��5^      $��2��6!   $	��100��6.   $��Right=�6:   $��	3 0 120 0q�6V   $��Добавить��5_      6$   �� 5`   
   -
   5        $ 	BtnDelete��5`      $��2��6$   $	��100��61   $��Right=�6=   $��3q�6Y   $��Удалить��5a      6#   �� 5b   
   -   5         ��Name$ TextBlockCount��5b   !   $��2��6   $	��500��69   $
��Left=�6E   5c      5d      