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
    
    public partial class Good
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Good()
        {
            this.Complects = new HashSet<Complect>();
            this.Complects1 = new HashSet<Complect>();
            this.Sells = new HashSet<Sell>();
            this.Stores = new HashSet<Store>();
        }
    
        public int GoodId { get; set; }
        public Nullable<int> CategoryId { get; set; }
        public string GoodName { get; set; }
        public string MainPhoto { get; set; }
        public string SecondPhotos { get; set; }
        public double Price { get; set; }
        public Nullable<double> Weight { get; set; }
        public Nullable<double> Width { get; set; }
        public Nullable<double> Heigth { get; set; }
        public Nullable<double> Length { get; set; }
        public int DeveloperId { get; set; }
        public bool Active { get; set; }
    
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Complect> Complects { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Complect> Complects1 { get; set; }
        public virtual Developer Developer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sell> Sells { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Store> Stores { get; set; }
    }
}
