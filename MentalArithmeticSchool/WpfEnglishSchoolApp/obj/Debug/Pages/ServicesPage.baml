   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:WpfEnglishSchoolApp.PagesWpfEnglishSchoolApp.Pages  5      ,    &WpfEnglishSchoolApp.Pages.ServicesPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:WpfEnglishSchoolApp.Pages     5      -   5          N� Title$  Каталог услуг��5	         	base_page#��[  5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � $��0��6   $��Stretch=�5        PrimaryHueLightBrush#��[ 5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $:��4Введите название для поиска:��6     base_textblock#��[ 5      �� 5      -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   5      5      �� 5      $ 
Horizontal=�6   .+�5      �� $#��Выберите скидку��6   #��[ 5      �� 5      -   5         ��Name$ ComboSkidka��5   '   $	��275��6   .@�5!      �� $��Все��6#   �� 5"      $��от 0 до 5%��6#   �� 5#      $��от 5% до 15%��6#   �� 5$      $��от 15% до 30%��6#   �� 5%      $��от 30% до 70%��6#   �� 5&      $��от 70% до 100%��6#   5(      5)      �� 5*      $ 
Horizontal=�6   .+�5+      �� $!��Сортировать по��6   #��[ 5,      �� 5-      -   5        $ 	ComboSort��5.      $	��275��5-      .@�50      �� $!��По возрастанию��6#   �� 51      $��По убыванию��6#   52      53      54      �� 56   
   -   5         ��Name$ ListBoxServices��56      $��Visible=�57      $��Stretch=�58       �� SelectedValuePath$ 	ServiceId��59      $��1��5:      $��0��6     	good_item#��[ 5;      ��5=      �� 5>      .R�5?      �� $��5q�6!   $ 
Horizontal=�5@   !   .+�5A      �� $��60��6    $��80��6+   ��67   ��  �� Path$ GetPhoto��� 5B      .+�5C      �� $��2q�6(   $��16(�5D   (   $
��Wrap=�5F   (   $
��Auto��5G   (   $
��Left=�65   ��5E   (   �� $ ServiceName�5G   5   �� 5H      $ 
Horizontal=�6)   .+�5I   "   �� $��2q�6,   
���  ��$
��Bold"�5L   ,   $��14(�5M   ,   $
��Auto��5O   -   $
��Left=�5P   ,   $��Strikethrough{�5Q   ,   y�5J   ,   �� $ GetVisibility���5N   ,   �� $ Price�5Q   ,   �� 5R   "   $��2q�6,   $��14(�67     PrimaryHueDarkBrush#��[ 5S   ,   $
��Bold"�5T   ,   $	��300��5V   ,   $
��Left=�5W   ,   ��5U   ,   �� $ 
TotalPrice�5W   ,   5X      �� 5Y      $��10(�6(   $��2q�5[   (   $	��300��5^   (   $
��Left=�64   y�5Z   (   �� $ GetVisibility���5\   (   �� $ Discount� �� StringFormat$ {0}% скидка.��5^   4   5_      5`      5a      5c      �� 5d   
   -   5        	 ��Name$	 TextBlockCount��5d   !   $��2��6   6!   5e      5f      