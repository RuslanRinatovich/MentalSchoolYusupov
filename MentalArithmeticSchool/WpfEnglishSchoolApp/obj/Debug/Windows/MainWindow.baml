   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:WpfEnglishSchoolAppWpfEnglishSchoolApp  5   	   $    WpfEnglishSchoolApp.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.5.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -local!clr-namespace:WpfEnglishSchoolApp  5   	   -   5        $	��450��5   	   $	��800��6     � Icon$?  9/WpfEnglishSchoolApp;component/Resources/school_logo1.png��6"    � WindowStartupLocation$ CenterScreen=�5   !    � Title 5	      ��  �� ElementName$ 	MainFrame�� �� Path$ Content.Title�.��5      �  � RowDefinitions 5   
   �� 5      $��75 �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   � �� 5   
    !  PrimaryHueDarkForegroundBrush#��[  6   �� 5   
   $?��9/WpfEnglishSchoolApp;component/Resources/school_logo1.png��6   $��	10,10,0,0q�5      $
��Left=�5      $��55��6+   $��62��67   �� 5   
   $��0��6   $K��EАИС «Школа ментальной арифметики IQ007»��6!   $��Center=�5      $��Center=�5      $��20(�5      $
��Bold"�5       � 5   
   -   5          �Name$ 	MainFrame��5      $��1��6#     � NavigationUIVisibility$ Hidden=�5       $��1q�5!      6$   �� 5"   
   $��0��6    �� Orientation$ 
Horizontal=�6"   $��Right=�6;   $��0 0 20 0q�6W   .+�5#      �� -   5        	 ��Name$	 BtnGoods��5#      
 � ToolTip$
 Товары школы��6?   .��5$      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Hexagon=�6+   $��0q�6:   5%      �� 5&      -   5        $	 BtnServices��5&      $
 Услуги школы��6E   .��5'        $ School=�6+   $��0q�69   5(      �� 5*      -   5        $	 BtnEditGoods��5*      $<
 6Редактировать список товаров��6F   $y�	Collapsed=�6m   .��5+        $ 	AlphaPBox=�6+   $��0q�6<   5,      �� 5-      -   5        $	 BtnEditServices��5-      $8
 2Редактировать список услуг��6M   $y�	Collapsed=�6r   .��5.        $ 	AlphaSBox=�6+   $��0q�6<   5/      �� 5:      -   5        $	 BtnMyAccount��5:      $
 Мой профиль��6G   $y�	Collapsed=�6]   .��5;        $ Account=�6+   $��0q�6:   5<      �� 5@      -   5        $	 BtnAllAccount��5@      $#
 Список клиентов��6I   $y�	Collapsed=�6c   .��5A        $ AccountBoxMultiple=�6+   $��0q�6E   5B      �� 5C      -	   5        $	 BtnEnter��5C      $
 
Войти��6?   .��5D        -
   5          Name$ 
IconBtnKey��5D   *   $ Login=�6?   $��0q�6L   5E      �� 5F      -   5        $	 BtnBack��5F      $
 
Назад��5G   '   $y�	Collapsed=�67   .��5H        $ 	ArrowBack=�6+   $��0q�6<   5J      5K      �� 5L   
   $��2��6     PrimaryHueLightBrush#��[ 6!   5N      5O      