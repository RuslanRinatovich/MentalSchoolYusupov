   M S B A M L   `   `   `  ����N  JWpfEnglishSchoolApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:WpfEnglishSchoolApp.PagesWpfEnglishSchoolApp.Pages  5      .    (WpfEnglishSchoolApp.Pages.AllClientsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:WpfEnglishSchoolApp.Pages     5      -   5          N� Title$#  Список клиентов��5	         	base_page#��[  6F   .��5
      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   �� 5      $��40 �6   .+�5   
   � $��0��6   $��Stretch=�5        PrimaryHueLightBrush#��[ 5      .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $0��*Введите ФИО для поиска:��6     base_textblock#��[ 5      �� 5      -   5         ��Name$ 
TBoxSearch��5   &   $	��275��6   5      5      �� 5      $ 
Horizontal=�6   .+�5      �� $2��,Выберите статус клиента��6   #��[ 5      �� 5      -   5         ��Name$ ComboClientType��5   '   $	��275��6    �� DisplayMemberPath$ ClientTypeName��5      5       �� 5!      $ 
Horizontal=�6   .+�5"      �� $!��Сортировать по��6   #��[ 5#      �� 5$      -   5        $ 	ComboSort��5%      $	��275��5$      .@�5'      �� $!��По возрастанию��6#   �� 5(      $��По убыванию��6#   5)      5*      5+      &   System.Windows.Controls.DataGrid  5,   
   -   5          Name$ DataGridClients��5,      $��1��6,      AutoGenerateColumns .     
IsReadOnly . 	   SelectionMode$	 Single=�5/      
   RowStyle
 52      �� 53       �� 
TargetType)  #System.Windows.Controls.DataGridRow"  6   .�54      ��  �� Property � �� �� Value 63   �� *ClientType.Color+55         Columns 57      0  *System.Windows.Controls.DataGridTextColumn  58      ,  &System.Windows.Controls.DataGridColumn   Header$ Статус��6S      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6c   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *ClientType.ClientTypeName+6c     59      $7 1Имя пользователя в системе��6B   $ 2* 6f    6%   �� *
UserName+6f     5:      $ Фамилия��6B   $ 2* 6S    6%   �� *
LastName+6S     5;      $ Имя��6C   $ 2* 6P    6%   �� *	FirstName+6P     5<      $ Отчество��6D   $ 2* 6V    6%   �� *
MiddleName+6V     5=      $ Дата рождения��6q   $ 2* 6�    6%   �� *DateOfBirth+ �� StringFormat$ d�� �� ConverterCulture$ ru-RU��6�     5>      $ Телефон��6?   $ 2* 6P    6%   �� *Phone+6P     5?      $ Email��6?   $ 2* 6N    6%   �� *Email+6N   4  .System.Windows.Controls.DataGridTemplateColumn  5A      $
 auto 6)   $  Редактировать��66      CellTemplate 5B      �� 5C      .R�5D      ��  ��Name$ BtnEdit��6%   -   5        $	��...��5D   6   $��0q�6X   5E      5G      5K      �� 5L   
   -   5        $ BtnClientType��5L      $��2��6(   $	��180��65   $��Right=�6A   $��	3 0 120 0q�6]   $��Типы клиентов��5M      6)   �� 5O   
   -   5        $ 	BtnDelete��5O      $��2��6$   $	��100��61   $��Right=�6=   $��3q�6Y   $��Удалить��5P      6#   �� 5Q   
   -	   5         ��Name$ TextBlockCount��5Q   !   $��2��6   $	��500��69   $
��Left=�6E   5R      5S      