   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:WpfEnglishSchoolApp.PagesWpfEnglishSchoolApp.Pages  5      )    #WpfEnglishSchoolApp.Pages.VisitPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.5.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      3local'clr-namespace:WpfEnglishSchoolApp.Pages  5      -   5          N� Title$  Посещение��5
   	      	base_page#��[  6   .��5      �  � ColumnDefinitions 5   
   �� 5      $	��300 �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��2��6.   .+�5      �� $#��Выберите услугу��6     base_textblock#��[ 63   �� 5      -   5         ��Name$ ComboServices��5   5   $��Stretch=�6   $
��auto��6L    �� SelectedValuePath$ 	ServiceId��5       �� DisplayMemberPath$ ServiceName��5      5      � 5   
   -   5         �Name$ GridService��5      $	��300��6$   $��1��60   $��0��6=    5      �� 5       $	��310 �6    �� 5!      $
��auto �6    �� 5"      $��20 �6    .+�5$      �� $	��240��6   $��0��6    $��Uniform=�6-   $��Center=�5%       ��5&       ��  �� Path$ GetPhoto��� 5'      $��1��6   $	��100��6&   .+�5)      �� $
��Auto��5*   <     item_textblock#��[ 5+   $   $��Center=�5,   (     PrimaryHueDarkBrush#��[ 5-   (   $
��Bold"�5.   (   $��20(�6:   ��5)      �� *
TotalPrice+	 �� StringFormat$	 c��
 �� ConverterCulture$
 ru-RU��5.   :   5/      �� 50      $��10(�6   $��2��51      $��2q�53   (   $	��300��56   (   $
��Left=�64   y�52   (   �� $ GetVisibility���54   (   �� $ Discount�$	 {0}% скидка.��56   4   57      &   System.Windows.Controls.DataGrid  5;   
   -   5          Name$ DtData��5;         AutoGenerateColumns .  $��1��6@   $��1��6M      
IsReadOnly .    SelectionMode$ Single =�5=         Columns 5>      0  *System.Windows.Controls.DataGridTextColumn  5?      ,  &System.Windows.Controls.DataGridColumn   Header$ № п��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 62   �� *	VisitId+  5@      $ Дата и время��6%    6;   �� *
DateActual+$
 ru-RU��  5A      $ Клиент��6%    65   �� *Client.LastName+5E      �� 5F   
   $��2��6   $��1��6"   $ 
Horizontal=�62   $��Center=�6K   $��Center=�6f   .+�5G      �� -   5         ��Name$ btnAdd��5G      $��Добавить��6%   68   �� 5H      -   5        $ 	btnDelete��5H      $��Удалить��6(   6:   5I      5K      5L      