   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:WpfEnglishSchoolApp.WindowsWpfEnglishSchoolApp.Windows  5   	   2    ,WpfEnglishSchoolApp.Windows.SpecialityWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   X TXceed.Wpf.Toolkit, Version=4.3.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   	   5local)clr-namespace:WpfEnglishSchoolApp.Windows  5   	     � Title$   Специализация��5	   
   $	��220��6    $	��800��6-      base_window_1#��[  69    � WindowStartupLocation$ CenterScreen=�5
   	    � Icon$? 9/WpfEnglishSchoolApp;component/Resources/school_logo1.ico��6.   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��50 �6    � ColumnDefinitions 5   
   �� 5      $	��187 �6   �� 5      .+�5   
   �� $��Название��6   $��Center=�6$   $��0��6?   $��20,5,0,5q�6L   $��0��6_   $��30��6o   �� 5   
   -   5         ��Name$ TbName��5   >   $��1��6   $��Center=�6#   $��0��6n   $��30��6{   $	��0,5q�6�    �� 
IsReadOnly . ��6N   �� *SpecialityName+6�   �� 5   
   $��
Оклад��6   $��Center=�6!   $��1��6<   $��20,5,0,5q�6I   $��0��6\   $��30��6l   $  Xceed.Wpf.Toolkit.DoubleUpDown  5   
   -   5          Name$ 	UpDownPay��5      $��1��6/   $��1��6<   �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Double, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   FormatString$ c��6l   	   	Increment$		 0.1X�6}   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Double, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]
   Minimum$
 1X�6�      Value 6L   �� *SpecialityPay+6�   �� 5   
   $��Center=�6    �� Orientation$ 
Horizontal=�62   $��3��6K   $��140,0,303,0q�6X   $	��162��6m   $��1��6y   .+�5      �� -   5         �� 	IsDefault . $��60��5   '   $��5q�65   .��6U   OK6Y   �� 5       �� IsCancel . $��60��6%   $��5q�63   .��6>   Отмена6F   5       5!      5"      