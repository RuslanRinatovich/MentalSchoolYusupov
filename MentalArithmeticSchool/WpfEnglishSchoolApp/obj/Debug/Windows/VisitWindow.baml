   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:WpfEnglishSchoolApp.WindowsWpfEnglishSchoolApp.Windows  5   	   -    'WpfEnglishSchoolApp.Windows.VisitWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   X TXceed.Wpf.Toolkit, Version=4.3.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   	   5local)clr-namespace:WpfEnglishSchoolApp.Windows  5   	     � Title$!  Оказание услуг��5	   	   $	��220��6    $	��800��6-      base_window_1#��[  69    � WindowStartupLocation$ CenterScreen=�5
   	    � Icon$? 9/WpfEnglishSchoolApp;component/Resources/school_logo1.ico��6.   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��50 �6    � ColumnDefinitions 5   
   �� 5      $	��240 �6   �� 5      .+�5   
   �� $��Услуга��6   $��Center=�6"   $��0��6=   $��20,5,0,5q�6J   $��0��6]   $��30��6m   �� 5   
   -   5         ��Name$ TbInfo��5   >   $��1��6   $��Center=�6#   $��0��6N   $��30��6[   $	��0,5q�6g    �� 
IsReadOnly . 6t   �� 5   
   $��Клиент��6   $��Center=�6"   $��1��6=   $��20,5,0,5q�6J   $��0��6]   $��30��6m   �� 5   
   -   5         ��Name$ ComboBoxClient��5      $��1��6K   $��1��6X    �� DisplayMemberPath$ LastName��6i   	 �� SelectedValuePath$	 UserName��5      
 �� SelectedItem
 5   +   �� *Client+5      �� 5   
   $;��5Дата и время оказания услуги ��6   $��Center=�69   $��2��6T   $��	20,10,0,9q�6b   $��0��6v   $��20��6�   &   Xceed.Wpf.Toolkit.DateTimePicker  5    
   -   5          Name$ DatePickerDate��5       $
��Left=�6n   $��2��5!      $��1��6,   $	��240��6<   $��2��6H   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.DateTime, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Value 5    7   �� *
DateActual+ �� ConverterCulture$ ru-RU��5!   H   �� 5#   
   $��Center=�6    �� Orientation$ 
Horizontal=�62   $��3��6K   $��140,0,303,0q�6X   $	��162��6m   $��1��6y   .+�5$      �� -   5         �� 	IsDefault . $��60��5$   '   $��5q�65   .��6U   OK6Y   �� 5%       �� IsCancel . $��60��6%   $��5q�63   .��6>   Отмена6F   5&      5'      5(      