   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:WpfEnglishSchoolApp.PagesWpfEnglishSchoolApp.Pages  5      )    #WpfEnglishSchoolApp.Pages.GoodsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:WpfEnglishSchoolApp.Pages     5      -   5          N� Title$  Товары��5
         	base_page#��[  6<   .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   � $��0��6   $��Stretch=�5        PrimaryHueLightBrush#��[ 5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $:��4Введите название для поиска:��6     base_textblock#��[ 5      �� 5      -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   5      5      �� 5      $ 
Horizontal=�6   .+�5      �� $1��+Выберите производителя��6   #��[ 5      �� 5      -   5         ��Name$ ComboDeveloper��5   '   $	��275��6    �� DisplayMemberPath$ DeveloperName��5       5!      �� 5"      $ 
Horizontal=�6   .+�5#      �� $!��Сортировать по��6   #��[ 5$      �� 5%      -   5        $ 	ComboSort��5&      $	��275��5%      .@�5(      �� $!��По возрастанию��6#   �� 5)      $��По убыванию��6#   5*      5+      5,      &   System.Windows.Controls.DataGrid  5-   
   -   5          Name$ DataGridGood��5-      $��1��6)      AutoGenerateColumns .     
IsReadOnly . 	   SelectionMode$	 Single=�50      
   Columns
 52      4  .System.Windows.Controls.DataGridTemplateColumn  53      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 6)      Header$+ %Главное изображение��65      CellTemplate 54      �� 55      .R�56      �� ��6$   ��  �� Path$ GetPhoto�57      59      0  *System.Windows.Controls.DataGridTextColumn  5:      $+ %Наименование товара��6B   $	 10* 6_   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *
GoodName+6_     5;      $ Стоимость��6k   $ * 6~    6%   �� *Price+ �� StringFormat$ c�� �� ConverterCulture$ ru-RU��6~     5<      $ Вес��6@   $ * 6M    6%   �� *Weight+6M     5=      $ 
Длина��6@   $ * 6O    6%   �� *Length+6O     5>      $ Ширина��6?   $ * 6O    6%   �� *Width+6O     5?      $ Высота��6@   $ * 6P    6%   �� *Heigth+6P     5@      $  Производитель��6Q   $ * 6h    6%   �� *Developer.DeveloperName+6h     5A      $  Есть в наличие��6C   $ * 6[    6%   �� *	GetStatus+6[     5B      $
 auto 6)   $  Редактировать��66    5C      �� 5D      .R�5E      ��  ��Name$ BtnEdit��6%   -   5        $	��...��5E   6   $��0q�6X   5F      5H        5J      $
 auto 6)   $ Продажи��66    5K      �� 5L      .R�5M      �� $ BtnSell��6%   -   5        $	��...��5M   6   $��0q�6Y   5N      5P      5R      �� 5S   
   -   5        $ BtnExcel��5S      $��Excel��6$   $��2��64   $	��100��6A   $��Right=�6M   $��	3 0 400 0q�6i   6|   �� 5T   
   -	   5        $ 
BtnEditDev��5T      $ ��Производитель��6&   $��2��6>   $	��140��6K   $��Right=�6W   $��	3 0 240 0q�6s   6�   �� 5U   
   -
   5        $ BtnAdd��5U      $��2��6!   $	��100��6.   $��Right=�6:   $��	3 0 120 0q�6V   $��Добавить��5V      6$   �� 5W   
   -   5        $ 	BtnDelete��5W      $��2��6$   $	��100��61   $��Right=�6=   $��3q�6Y   $��Удалить��5X      6#   �� 5Y   
   -   5         ��Name$ TextBlockCount��5Y   !   $��2��6   $	��500��69   $
��Left=�6E   5Z      5[      