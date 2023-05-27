using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfEnglishSchoolApp.Models
{
    public partial class Service
    {
        /// <summary>
        /// Возвращает абсолютный путь к изображению
        /// </summary>
        public string GetPhoto
        {
            get
            {
                if (MainPhoto is null)                   return null;
                return Directory.GetCurrentDirectory() + @"\Images\" + MainPhoto.Trim();
            }
        }
        /// <summary>
        /// Задает цвет фона товара
        /// </summary>
        public string GetColor
        {
            get
            {
                if (Discount > 0)
                    return "#98FB98";
                else
                    return "#FFF";
            }
        }

        public string GetVisibility
        {
            get
            {
                if (Discount == 0)
                    return "Collapsed";
                else
                    return "Visible";
            }
        }

        public string TotalPrice
        {

            get
            {
                double p = Price - Price * Discount / 100;
                return $"{p:F2} рублей за {TimeLength} минут";
            }
        }
    }
}
