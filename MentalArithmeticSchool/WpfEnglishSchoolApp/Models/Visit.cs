//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfEnglishSchoolApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Visit
    {
        public int VisitId { get; set; }
        public string UserName { get; set; }
        public int ServiceId { get; set; }
        public Nullable<bool> Paid { get; set; }
        public string Rewiew { get; set; }
        public System.DateTime DateActual { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual Service Service { get; set; }
    }
}