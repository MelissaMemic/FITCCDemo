using FITCCRS2.Model;
using FITCCRS2.Model.Requests;
using FITCCRS2.Model.Requests.DpgadjaRequest;
using FITCCRS2.Model.SearchObjects;
using FITCCRS2.Services.BaseService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FITCCRS2.Services.DogadjajService
{
    public interface IDogadjajService: IBaseCRUDService<Dogadjaj, DogadjajSearchObject, DogadjajUpsertRequest, DogadjajUpsertRequest>
    {
        List<Model.Dogadjaj> getLastTakmicenjeDogadjaj();
    }
}
