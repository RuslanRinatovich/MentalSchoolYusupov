   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:WpfEnglishSchoolApp.WindowsWpfEnglishSchoolApp.Windows  5   	   ,    &WpfEnglishSchoolApp.Windows.SellWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ;local)clr-namespace:WpfEnglishSchoolApp.Windows     5   	   X TXceed.Wpf.Toolkit, Version=4.3.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5        � Title$  Продажа��5	   	   $	��260��6   $	��800��6&      base_window_1#��[  62    � WindowStartupLocation$ CenterScreen=�6Y    � Icon$? 9/WpfEnglishSchoolApp;component/Resources/school_logo1.ico��6~   .��5
      �  � RowDefinitions 5   
   �� 5      $	��47* �6   �� 5      $
��Auto �6   �� 5      $	��47* �6   �� 5      $	��45* �6   �� 5      $��50 �6    � ColumnDefinitions 5   
   �� 5      $	��187 �6   �� 5      .+�5   
   �� $��
Товар��6   $��Center=�6!   $��0��6<   $��20 0 0 0q�6I   $��0��6\   $��16��6l   �� 5   
   -   5         ��Name$ TbGood��5   >   $��1��6   $��Center=�6#   $��0��6N   $��30��6[   $	��0,7q�6g    �� 
IsReadOnly . 6t   $  Xceed.Wpf.Toolkit.DoubleUpDown  5   
   -   5          Name$ UpDownCount��5      $	��100��62   $
��Left=�5   4   �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Double, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   	Increment$ 1X�5   6   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Double, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]	   Minimum$	 0X�6D   $��2��6P   $��1��6]   
   Value
 5   O   �� *LessonCount+5   ]   �� 5!   
   $��Клиент��6   $��Center=�6"   $��1��6=   $��20,5,0,5q�6J   $��0��6]   $��30��6m   �� 5"   
   -   5         ��Name$ ComboBoxClient��5"      $��1��6K   $��1��6X    �� DisplayMemberPath$ LastName��6i    �� SelectedValuePath$ UserName��5#       �� SelectedItem 5"   +   �� *Client+5#      �� 5$   
   $��2��6   $��0��6!   $��Количество��61   $��20 0 0 0q�6E   $��Center=�6X   �� 5%   
   $��3��6   $��0��6!   $��Дата и время��61   $��20 0 0 0q�6G   $��Center=�6Z   &   Xceed.Wpf.Toolkit.DateTimePicker  5&   
   -   5        $��DateTimeDateSell��5&      $��3��66   $��1��6C   �� 5'   
   $��Center=�6    �� Orientation$ 
Horizontal=�62   $��7��6K   $��2��6X   $��127,0,103,0q�6l   $	��162��6�   .+�5(      �� -   5         �� 	IsDefault . $��60��5(   '   $��5q�65   .��6U   OK6Y   �� 5)       �� IsCancel . $��60��6%   $��5q�63   .��6>   Отмена6F   5*      5+      5,      