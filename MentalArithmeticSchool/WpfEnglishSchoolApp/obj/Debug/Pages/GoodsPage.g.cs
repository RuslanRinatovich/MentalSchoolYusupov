﻿#pragma checksum "..\..\..\Pages\GoodsPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "EA3E4F354A2BF8301FA2890AA0D81354BE6FE5A93B46F2D9B4AA7728A9655DA4"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

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
using WpfEnglishSchoolApp.Pages;


namespace WpfEnglishSchoolApp.Pages {
    
    
    /// <summary>
    /// GoodsPage
    /// </summary>
    public partial class GoodsPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector, System.Windows.Markup.IStyleConnector {
        
        
        #line 24 "..\..\..\Pages\GoodsPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxSearch;
        
        #line default
        #line hidden
        
        
        #line 30 "..\..\..\Pages\GoodsPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox ComboDeveloper;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\..\Pages\GoodsPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox ComboSort;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\..\Pages\GoodsPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid DataGridGood;
        
        #line default
        #line hidden
        
        
        #line 83 "..\..\..\Pages\GoodsPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnExcel;
        
        #line default
        #line hidden
        
        
        #line 84 "..\..\..\Pages\GoodsPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnEditDev;
        
        #line default
        #line hidden
        
        
        #line 85 "..\..\..\Pages\GoodsPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnAdd;
        
        #line default
        #line hidden
        
        
        #line 87 "..\..\..\Pages\GoodsPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnDelete;
        
        #line default
        #line hidden
        
        
        #line 89 "..\..\..\Pages\GoodsPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBlockCount;
        
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
            System.Uri resourceLocater = new System.Uri("/WpfEnglishSchoolApp;component/pages/goodspage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\GoodsPage.xaml"
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
            
            #line 10 "..\..\..\Pages\GoodsPage.xaml"
            ((WpfEnglishSchoolApp.Pages.GoodsPage)(target)).IsVisibleChanged += new System.Windows.DependencyPropertyChangedEventHandler(this.PageIsVisibleChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.TBoxSearch = ((System.Windows.Controls.TextBox)(target));
            
            #line 25 "..\..\..\Pages\GoodsPage.xaml"
            this.TBoxSearch.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TBoxSearchTextChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.ComboDeveloper = ((System.Windows.Controls.ComboBox)(target));
            
            #line 31 "..\..\..\Pages\GoodsPage.xaml"
            this.ComboDeveloper.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.ComboTypeSelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.ComboSort = ((System.Windows.Controls.ComboBox)(target));
            
            #line 39 "..\..\..\Pages\GoodsPage.xaml"
            this.ComboSort.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.ComboSortSelectionChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.DataGridGood = ((System.Windows.Controls.DataGrid)(target));
            
            #line 49 "..\..\..\Pages\GoodsPage.xaml"
            this.DataGridGood.LoadingRow += new System.EventHandler<System.Windows.Controls.DataGridRowEventArgs>(this.DataGridGoodLoadingRow);
            
            #line default
            #line hidden
            return;
            case 8:
            this.BtnExcel = ((System.Windows.Controls.Button)(target));
            
            #line 83 "..\..\..\Pages\GoodsPage.xaml"
            this.BtnExcel.Click += new System.Windows.RoutedEventHandler(this.BtnExcel_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.BtnEditDev = ((System.Windows.Controls.Button)(target));
            
            #line 84 "..\..\..\Pages\GoodsPage.xaml"
            this.BtnEditDev.Click += new System.Windows.RoutedEventHandler(this.BtnEditDev_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.BtnAdd = ((System.Windows.Controls.Button)(target));
            
            #line 86 "..\..\..\Pages\GoodsPage.xaml"
            this.BtnAdd.Click += new System.Windows.RoutedEventHandler(this.BtnAddClick);
            
            #line default
            #line hidden
            return;
            case 11:
            this.BtnDelete = ((System.Windows.Controls.Button)(target));
            
            #line 88 "..\..\..\Pages\GoodsPage.xaml"
            this.BtnDelete.Click += new System.Windows.RoutedEventHandler(this.BtnDeleteClick);
            
            #line default
            #line hidden
            return;
            case 12:
            this.TextBlockCount = ((System.Windows.Controls.TextBlock)(target));
            return;
            }
            this._contentLoaded = true;
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        void System.Windows.Markup.IStyleConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 6:
            
            #line 69 "..\..\..\Pages\GoodsPage.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.ButtonClick);
            
            #line default
            #line hidden
            break;
            case 7:
            
            #line 77 "..\..\..\Pages\GoodsPage.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.BtnSellClick);
            
            #line default
            #line hidden
            break;
            }
        }
    }
}

