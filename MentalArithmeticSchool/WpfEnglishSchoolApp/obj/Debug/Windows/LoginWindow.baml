   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:WpfEnglishSchoolApp.WindowsWpfEnglishSchoolApp.Windows  5   	   -    'WpfEnglishSchoolApp.Windows.LoginWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.5.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   5local)clr-namespace:WpfEnglishSchoolApp.Windows  5   	     � Title$  Вход��5	      $	��250��6   $	��400��5
   	   $	��250��6   $	��400��6%    � WindowStartupLocation$ CenterScreen=�5   	      base_window#��[  5   	    � 
ResizeMode$ NoResize=�5   	    � Icon$? 9/WpfEnglishSchoolApp;component/Resources/school_logo1.ico��6   .��5      �  � ColumnDefinitions 5   
   �� 5       � RowDefinitions 5   
   �� 5      $��75 �6   �� 5      $��40 �6   �� 5      $��40 �6   �� 5      �� 5      $��20 �6   .+�5   
   � '  !MaterialDesignThemes.Wpf.PackIcon  5   
      Kind$ LoginVariant=�6"     PrimaryHueMidBrush#��[ 66   $��	10,10,0,0q�5      $
��Left=�5      $��55��6+   $��62��67   �� 5   
   $��0��6   $��АИС��6!   $��Center=�5      $��Center=�5       $��16(�5!      $
��Wrap=�6"    �� TextAlignment$ Center=�66   $
��Bold"�5"      $��60��6&   $��
65,10,48,5q�62   $	��281��6F   �� 5%   
   -   5         ��Name$ TbLogin��5%      $��1��6$   $��1��5&      )  #MaterialDesignThemes.Wpf.HintAssist	   Hint$	 
Логин��6&   $	��300��5'      $��admin��6"   G� 5)   
   -   5        
 G�Name$
 TbPass��5)      $��30��6&   $	��300��62   $	 Пароль��6>    G� Password$ 1��6f   $��2��6s   �� 5*   
    �� Orientation$ 
Horizontal=�6   $��3��6.   $��Center=�6;   .+�5+      �� -   5         ��Name$ BtnOk��5-      $	��100��5+      $��30��6!    $  MaterialDesignFlatAccentBgButton#��[ 6-   $��OK��5,      5.      �� 5/      -   5        $ 	BtnCancel��52      $	��100��5/      $��30��50      $��Cancel��51      53      54      )  #MaterialDesignThemes.Wpf.DialogHost  56   
   -   5          Name$ 
DialogHost��56   $   $��1q�57   #      DialogContent 58      �� 5;      .+�5=      � $	��Top=�6   $��35, 60q�63   $	��180��6C   $	��420��6P   .+�5>      �� $��Регистрация ��6    $��Center=�67   $	��Top=�6T   $��0 0 0 20q�6l   
�������$��18(�6�   �� 5?      $��Center=�6%   $��15q�6@   .+�5@      �� -   5        $ 
tbRegLogin��5@   &   $��0, 10q�6:    �� TextAlignment$
 Left=�6J   $	 
ЛОГИН��6_   $��18(�6�   G� 5A      -   5        $
 psbPassword1��5A   *   $
��0,10q�6@   $	 ПАРОЛЬ��6N   .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton . $��18(�6�   G� 5B      -   5        $
 psbPassword2��5B   *   $
��0,10q�6@   $	 ПАРОЛЬ��6N    . $��18(�6�   5C      5D      �� 5E      $��Center=�6!   $��10 20q�6>   .+�5G      �� $ 
Horizontal=�6%   $��Center=�6>   .+�5H      �� -	   5        $ btnOk��5H   %   .��5I   "   �� $ 
Horizontal=�6-   $��Center=�6F   .+�5J   &     $ Check=�6>   $��5q�6L   $��Center=�6W   �� 5K   &   $��Ok��60   $��Center=�6:   5L   #   5N      �� 5Q      -
   5        $ 	btnCancel��5Q   %   .��5R   "   �� $ 
Horizontal=�6-   $��Center=�6F   .+�5S   &     $ Cancel=�6>   $��5q�6M   $��Center=�6X   �� 5T   &   $��Cancel��60   $��Center=�6>   5U   #   5V      5W      5X      5Y      5[      5\      5]      