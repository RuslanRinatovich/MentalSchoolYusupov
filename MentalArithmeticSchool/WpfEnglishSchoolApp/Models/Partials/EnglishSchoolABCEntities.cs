using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfEnglishSchoolApp.Models
{
    public partial class EnglishSchoolABCEntities
    {
        private static EnglishSchoolABCEntities _context;

        public static EnglishSchoolABCEntities GetContext()
        {
            if (_context == null)
            {
                _context = new EnglishSchoolABCEntities();
            }
            return _context;
        }
    }
}
