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
    
    public partial class TimeSheet
    {
        public int TimeSheetId { get; set; }
        public int WorkerId { get; set; }
        public int ServiceId { get; set; }
        public System.TimeSpan ServiceTime { get; set; }
        public string DayWeek { get; set; }
    
        public virtual Service Service { get; set; }
        public virtual Worker Worker { get; set; }
    }
}
