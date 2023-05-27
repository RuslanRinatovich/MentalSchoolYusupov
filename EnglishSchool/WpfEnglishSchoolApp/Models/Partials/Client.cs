using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfEnglishSchoolApp.Models
{
    public partial class Client
    {
        /// <summary>
        /// Возвращает абсолютный путь к изображению
        /// </summary>
        public string GetFIO
        {
            get
            {

                return $"{LastName} {FirstName} {MiddleName}";
            }
        } }
    }
