   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:WpfEnglishSchoolApp.WindowsWpfEnglishSchoolApp.Windows  5   	   1    +WpfEnglishSchoolApp.Windows.TimeTableWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   X TXceed.Wpf.Toolkit, Version=4.3.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      5local)clr-namespace:WpfEnglishSchoolApp.Windows  5   	     � Title$   Преподаватель��5	   	   $	��260��6   $	��800��6,      base_window_1#��[  68    � WindowStartupLocation$ CenterScreen=�6_    � Icon$? 9/WpfEnglishSchoolApp;component/Resources/school_logo1.ico��6�   .��5
      �  � RowDefinitions 5   
   �� 5      �� 5      �� 5      �� 5      �� 5      $��50 �6    � ColumnDefinitions 5   
   �� 5      $	��187 �6   �� 5      .+�5   
   �� $��Тренер��6   $��Center=�6"   $��0��6=   $��20 0 0 0q�6J   $��0��6]   $��30��6m   �� 5   
   -   5         ��Name$ 	TbTrainer��5   >   $��1��6   $��Center=�6#   $��0��6Q   $��30��6^   $	��0,7q�6j    �� 
IsReadOnly . 6w   �� 5   
   -   5         ��Name$ ComboDayWeek��5      $	��200��6*   $��Stretch=�66   $
��Left=�6R   $��1��5   5   $��1��6B   .@�5      �� $��Понедельник��6   �� 5      $��Вторник��6   �� 5      $��
Среда��6   �� 5       $��Четверг��6   �� 5!      $��Пятница��6   �� 5"      $��Суббота��6   �� 5#      $��Воскресенье��6   5$      �� 5(   
   $��Время ��6   $��Center=�6"   $��2��6=   $��20 0 0 0q�6K   $��0��6^   $��20��6n   "  Xceed.Wpf.Toolkit.TimePicker  5)   
   -   5          Name$ TimePickerDayTime��5)      $
��Left=�6|   $��2��5*      $��1��6,   $	��240��6<   $��2��6H   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.DateTime, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]	   Value	 5)   6   �� *	DayTime+
 �� StringFormat$
 t�� �� ConverterCulture$ ru-RU��5*   H   �� 5-   
   $��1��6   $��0��6!   $��День недели��61   $��20 0 0 0q�6F   $��Center=�6Y   �� 5.   
   $��3��6   $��0��6!   $��Услуга��61   $��20 0 0 0q�6A   $��Center=�6T   �� 5/   
   -   5        $ ComboCategory��5/      $��3��6L   $��1��6Y    �� DisplayMemberPath$ ServiceName��6j    �� SelectedValuePath$ 	ServiceId��50       �� SelectedItem 5/   +   �� *	Service+50      �� 51   
   $��Center=�6    �� Orientation$ 
Horizontal=�62   $��7��6K   $��2��6X   $��127,0,103,0q�6l   $	��162��6�   .+�52      �� -   5         �� 	IsDefault . $��60��52   '   $��5q�65   .��6U   OK6Y   �� 53       �� IsCancel . $��60��6%   $��5q�63   .��6>   Отмена6F   54      55      56      