using AutoMapper;
using FITCCRS2.Model.Requests.RezultatiRequest;
using FITCCRS2.Model.SearchObjects;
using FITCCRS2.Services.BaseService;
using FITCCRS2.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FITCCRS2.Services.RezultatiService
{
    public class RezultatiService : BaseCRUDService<Model.Rezultati, Database.Rezultat, RezultatiSearchObject, RezultatiInsertRequest, RezultatiUpdateRequest>, IRezultatiService
    {
        public RezultatiService(RS2SeminarskiContext context, IMapper mapper) : base(context, mapper)
        {
        }
    }
}
