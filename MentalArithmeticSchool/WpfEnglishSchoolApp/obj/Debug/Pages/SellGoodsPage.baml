   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:WpfEnglishSchoolApp.PagesWpfEnglishSchoolApp.Pages  5      -    'WpfEnglishSchoolApp.Pages.SellGoodsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:WpfEnglishSchoolApp.Pages     5        N� Title$  Продажи��5	         	base_page#��[  6   .��5      �  � ColumnDefinitions 5   
   �� 5      $	��300 �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��2��6.   .+�5      �� $!��Выберите товар��6     base_textblock#��[ 5      �� 5      -   5         ��Name$ 
ComboGoods��5   5   $��Stretch=�6    �� SelectedValuePath$ GoodId��5       �� DisplayMemberPath$ GoodName��5      5      � 5   
   -   5         �Name$ GridGood��5      $	��300��6!   $��1��6-   $��0��6:    5      �� 5      $	��310 �6    �� 5      $
��auto �6    �� 5       $��20 �6    .+�5"      �� $	��240��6   $��0��6    $��Uniform=�6-   $��Center=�5#       ��5$       ��  �� Path$ GetPhoto��� 5%      $��1��6   $	��100��6&   .+�5&      �� 	 �� Padding$	 3q�6   $
��Auto��6)     item_textblock#��[ 5'   $   ��5(      `� 5)      
 �� StringFormat$
 {0}{1}��6'   .1�5*      �� $ GoodName�6&   �� 5+      $ GetCount�6&   5,      5.      �� 5/      $
��Auto��50   <   #��[ 51   $   $��Center=�52   (     PrimaryHueDarkBrush#��[ 53   (   $
��Bold"�54   (   $��20(�6:   ��5/      �� *Price+$
 c�� �� ConverterCulture$ ru-RU��54   :   55      �� 56      $
��Auto��63   #��[ 57   $   $��2��6L   ��56      �� *	GetStatus+57   L   58      � 5:   
   $��1��6   $��1��6    5;      �� 5<      �� 5=      $��50 �6    .+�5?      &   System.Windows.Controls.DataGrid  -   5          Name$ DataGridSells��5?         AutoGenerateColumns .     
IsReadOnly .    Columns 5@      0  *System.Windows.Controls.DataGridTextColumn  5A      ,  &System.Windows.Controls.DataGridColumn   Header$ Дата продажи��6)   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6?   �� *
DateSell+$
 0:dd.MM.yyyy H:mm:ss��$ ru-RU��  5B      $ Количество��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6W    6=   �� *Count+6W     5C      $ Клиент��6)   $ * 6[    69   �� *Client.GetFIO+6[   5E      �� 5F      $��1��6   $ 
Horizontal=�6&   $��Center=�6?   $��Center=�6Z   .+�5G      �� -   5         ��Name$ btnAdd��5G      $��Добавить��6)   6<   �� 5H      -   5        $ 	btnDelete��5H      $��Удалить��6,   6>   5I      5J      5L      5M      