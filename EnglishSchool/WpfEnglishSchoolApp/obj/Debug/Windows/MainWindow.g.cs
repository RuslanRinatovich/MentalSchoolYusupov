﻿#pragma checksum "..\..\..\Windows\MainWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "2F797B2DE3EE11FABC22A58CF0DDC66D5D60D6D77EDCD9A6EA147073E45A70AC"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using WpfEnglishSchoolApp;


namespace WpfEnglishSchoolApp {
    
    
    /// <summary>
    /// MainWindow
    /// </summary>
    public partial class MainWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 31 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Frame MainFrame;
        
        #line default
        #line hidden
        
        
        #line 35 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnGoods;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnServices;
        
        #line default
        #line hidden
        
        
        #line 42 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnEditGoods;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnEditServices;
        
        #line default
        #line hidden
        
        
        #line 58 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnMyAccount;
        
        #line default
        #line hidden
        
        
        #line 64 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnAllAccount;
        
        #line default
        #line hidden
        
        
        #line 67 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnEnter;
        
        #line default
        #line hidden
        
        
        #line 68 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal MaterialDesignThemes.Wpf.PackIcon IconBtnKey;
        
        #line default
        #line hidden
        
        
        #line 70 "..\..\..\Windows\MainWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnBack;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/WpfEnglishSchoolApp;component/windows/mainwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Windows\MainWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 12 "..\..\..\Windows\MainWindow.xaml"
            ((WpfEnglishSchoolApp.MainWindow)(target)).Closing += new System.ComponentModel.CancelEventHandler(this.WindowClosing);
            
            #line default
            #line hidden
            
            #line 13 "..\..\..\Windows\MainWindow.xaml"
            ((WpfEnglishSchoolApp.MainWindow)(target)).Closed += new System.EventHandler(this.WindowClosed);
            
            #line default
            #line hidden
            return;
            case 2:
            this.MainFrame = ((System.Windows.Controls.Frame)(target));
            
            #line 33 "..\..\..\Windows\MainWindow.xaml"
            this.MainFrame.ContentRendered += new System.EventHandler(this.MainFrameContentRendered);
            
            #line default
            #line hidden
            return;
            case 3:
            this.BtnGoods = ((System.Windows.Controls.Button)(target));
            
            #line 35 "..\..\..\Windows\MainWindow.xaml"
            this.BtnGoods.Click += new System.Windows.RoutedEventHandler(this.BtnGoods_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.BtnServices = ((System.Windows.Controls.Button)(target));
            
            #line 38 "..\..\..\Windows\MainWindow.xaml"
            this.BtnServices.Click += new System.Windows.RoutedEventHandler(this.BtnServices_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.BtnEditGoods = ((System.Windows.Controls.Button)(target));
            
            #line 42 "..\..\..\Windows\MainWindow.xaml"
            this.BtnEditGoods.Click += new System.Windows.RoutedEventHandler(this.BtnEditGoodsClick);
            
            #line default
            #line hidden
            return;
            case 6:
            this.BtnEditServices = ((System.Windows.Controls.Button)(target));
            
            #line 45 "..\..\..\Windows\MainWindow.xaml"
            this.BtnEditServices.Click += new System.Windows.RoutedEventHandler(this.BtnEditServices_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.BtnMyAccount = ((System.Windows.Controls.Button)(target));
            
            #line 58 "..\..\..\Windows\MainWindow.xaml"
            this.BtnMyAccount.Click += new System.Windows.RoutedEventHandler(this.BtnMyAccount_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.BtnAllAccount = ((System.Windows.Controls.Button)(target));
            
            #line 64 "..\..\..\Windows\MainWindow.xaml"
            this.BtnAllAccount.Click += new System.Windows.RoutedEventHandler(this.BtnAllAccount_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.BtnEnter = ((System.Windows.Controls.Button)(target));
            
            #line 67 "..\..\..\Windows\MainWindow.xaml"
            this.BtnEnter.Click += new System.Windows.RoutedEventHandler(this.BtnEnter_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.IconBtnKey = ((MaterialDesignThemes.Wpf.PackIcon)(target));
            return;
            case 11:
            this.BtnBack = ((System.Windows.Controls.Button)(target));
            
            #line 71 "..\..\..\Windows\MainWindow.xaml"
            this.BtnBack.Click += new System.Windows.RoutedEventHandler(this.BtnBackClick);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

