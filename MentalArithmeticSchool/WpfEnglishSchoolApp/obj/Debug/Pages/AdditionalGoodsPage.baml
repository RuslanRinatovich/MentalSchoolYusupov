   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:WpfEnglishSchoolApp.PagesWpfEnglishSchoolApp.Pages  5      3    -WpfEnglishSchoolApp.Pages.AdditionalGoodsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:WpfEnglishSchoolApp.Pages     5        N� Title$/  )Дополнительные товары��5	         	base_page#��[  6$   .��5      �  � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $��* �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��2��6.   .+�5      �� $!��Выберите товар��6     base_textblock#��[ 5      �� 5      -   5         ��Name$ 
ComboGoods��5   5   $��Stretch=�6    �� SelectedValuePath$ GoodId��5       �� DisplayMemberPath$ GoodName��5      5      �� 5   
   $/��)Дополнительные товары��6   $��1��61   $��0��6>   �� 5   
   -   5         ��Name$ ListBoxAdditional��5      $��Visible=�6-   $��Stretch=�5       $ GoodId��6=   $��2��5!      $��0��6(   ��5"      �� 5#      .R�5$      �� $��5q�6!   $ 
Horizontal=�6,   .+�5%      ��  ��Name$ 	BtnDelete��6!   -   5        $��-��5%   4   $��40��6@     PrimaryHueDarkBrush#��[ 6L   $��Right=�5&   -   6I   �� 5'      $��60��6    $��60��6+   ��67   �� 	 �� Path$	 GetPhoto��� 5(      .+�5)      �� $��14(�6(   $	��350��5,   4   $
��Left=�6@   ��5*   4   �� $	 GoodName�
 �� StringFormat$
 Товар: {0}��5,   @   �� 5-      $��14(�6(   $	��300��5/   4   $
��Left=�6@   ��5-   6   �� $	 Price�$
 {0:f2} руб.��5/   @   50      51      52      54      �� 57   
   $��Все товары��6   $��1��6'   $��1��64   �� 59   
   -   5        $ ListBoxAllGoods��59      $��Visible=�5:      $��Stretch=�5;       $ GoodId��6>   $��2��5<      $��1��6(   ��5>      �� 5?      .R�5@      �� $��5q�6!   $ 
Horizontal=�6,   .+�5A      �� $ BtnAdd��6!   -   5        $��+��5A   1   $��40��6=   $��Right=�5B   -   6I   �� 5C      $��60��6    $��60��6+   ��67   �� $	 GetPhoto��� 5D      .+�5E      �� $��14(�6(   $	��350��5H   4   $
��Left=�6@   ��5F   4   �� $	 GoodName�$
 Товар: {0}��5H   @   �� 5I      $��14(�6(   $	��300��5K   4   $
��Left=�6@   ��5I   6   �� $	 Price�$
 {0:f2} руб.��5K   @   5L      5M      5N      5P      5T      5U      