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
    
    public partial class Sell
    {
        public int SellId { get; set; }
        public int GoodId { get; set; }
        public int Count { get; set; }
        public System.DateTime DateSell { get; set; }
        public string UserName { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual Good Good { get; set; }
    }
}
