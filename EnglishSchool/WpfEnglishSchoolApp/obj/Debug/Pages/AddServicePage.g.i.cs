﻿#pragma checksum "..\..\..\Pages\AddServicePage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "BF339C5C5F92D536909D15388AF5958DFA44BD66E0867A74218A42A57157CF12"
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
    /// AddServicePage
    /// </summary>
    public partial class AddServicePage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 28 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnSave;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBlockServiceId;
        
        #line default
        #line hidden
        
        
        #line 49 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxServiceId;
        
        #line default
        #line hidden
        
        
        #line 51 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxServiceName;
        
        #line default
        #line hidden
        
        
        #line 53 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxServiceDesc;
        
        #line default
        #line hidden
        
        
        #line 55 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxPrice;
        
        #line default
        #line hidden
        
        
        #line 58 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxTimeLength;
        
        #line default
        #line hidden
        
        
        #line 61 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TextBoxShare;
        
        #line default
        #line hidden
        
        
        #line 63 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Image ImagePhoto;
        
        #line default
        #line hidden
        
        
        #line 65 "..\..\..\Pages\AddServicePage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnLoad;
        
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
            System.Uri resourceLocater = new System.Uri("/WpfEnglishSchoolApp;component/pages/addservicepage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\AddServicePage.xaml"
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
            this.BtnSave = ((System.Windows.Controls.Button)(target));
            
            #line 31 "..\..\..\Pages\AddServicePage.xaml"
            this.BtnSave.Click += new System.Windows.RoutedEventHandler(this.BtnSaveClick);
            
            #line default
            #line hidden
            return;
            case 2:
            this.TextBlockServiceId = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 3:
            this.TextBoxServiceId = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.TextBoxServiceName = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.TextBoxServiceDesc = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.TextBoxPrice = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            this.TextBoxTimeLength = ((System.Windows.Controls.TextBox)(target));
            return;
            case 8:
            this.TextBoxShare = ((System.Windows.Controls.TextBox)(target));
            return;
            case 9:
            this.ImagePhoto = ((System.Windows.Controls.Image)(target));
            return;
            case 10:
            this.BtnLoad = ((System.Windows.Controls.Button)(target));
            
            #line 67 "..\..\..\Pages\AddServicePage.xaml"
            this.BtnLoad.Click += new System.Windows.RoutedEventHandler(this.BtnLoadClick);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

