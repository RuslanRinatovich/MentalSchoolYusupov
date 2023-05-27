using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfEnglishSchoolApp.Models
{
   public partial class Worker
    {
        public string GetPhoto
        {
            get
            {
                if (Photo is null)
                    return null;
                return System.IO.Directory.GetCurrentDirectory() + @"\Images\" + Photo.Trim();
            }
        }
        public string GetFIO
        {
            get
            {
                return $"{LastName} {FirstName} {MiddleName}";
            }
        }

        public string GetSpecialities
        {
            get
            {
                List<string> s = new List<string>();
                foreach (WorkerSpec spec in WorkerSpecs)
                {
                    s.Add(spec.Speciality.SpecialityName);
                }
                return String.Join(", ", s);
            }
        }
    }
}
