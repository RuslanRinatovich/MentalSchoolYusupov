   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:WpfEnglishSchoolApp.PagesWpfEnglishSchoolApp.Pages  5      0    *WpfEnglishSchoolApp.Pages.CatalogGoddsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:WpfEnglishSchoolApp.Pages     5      -   5          N� Title$#  Каталог товаров��5	         	base_page#��[  5      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � $��0��6   $��Stretch=�5        PrimaryHueLightBrush#��[ 5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $:��4Введите название для поиска:��6     base_textblock#��[ 5      �� 5      -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   5      5      �� 5      $ 
Horizontal=�6   .+�5      �� $1��+Выберите производителя��6   #��[ 5      �� 5      -   5         ��Name$ ComboDeveloper��5   '   $	��275��6    �� DisplayMemberPath$ DeveloperName��5!      5"      �� 5#      $ 
Horizontal=�6   .+�5$      �� $!��Сортировать по��6   #��[ 5%      �� 5&      -   5        $ 	ComboSort��5'      $	��275��5&      .@�5)      �� $!��По возрастанию��6#   �� 5*      $��По убыванию��6#   5+      5,      5-      �� 5.   
   -   5         ��Name$ 
LViewGoods��5.      $��1��6'   $��Disabled=�5/        	good_item#��[ 50      ��51      �� 52      .R�53      �  � Orientation$ 
Horizontal=�6    $��Center=�69   54      ��56      �� 57      .R�58      � $��20q�6   $	��300��6'    59      �� 5:      $	��310 �6,   �� 5;      $
��auto �6,   �� 5<      $��20 �6,   .+�5>      �� $	��240��6    $��0��6,   $��Uniform=�69   $��Center=�5?       $��5q�6=   ��5@       ��  �� Path$ GetPhoto��� 5A      $��1��6%   $	��100��62   .+�5B      �� 	 �� Padding$	 3q�6)   $
��Auto��65     item_textblock#��[ 5C   $   ��5D   "   `� 5E   &   
 �� StringFormat$
 {0}{1}��63   .1�5F   *   �� $ GoodName�62   �� 5G   *   $ GetCount�62   5H   '   5J      �� 5K      $
��Auto��5L   <   #��[ 5M   $   $��Center=�5N   (   #��[ 5O   (   $
��Bold"�5P   (   $��20(�6:   ��5K   (   �� *Price+$
 c�� �� ConverterCulture$ ru-RU��5P   :   5Q      �� 5R      $
��Auto��6?   #��[ 5S   $   $��2��6L   ��5R   $   �� *	GetStatus+5S   L   5T      5U      5W      �� 5X   
   -   5         ��Name$ TextBlockCount��5X   !   $��2��6   6!   5Y      5Z      