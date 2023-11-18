using FITCCRS2.Model.Requests;
using FITCCRS2.Model.Requests.DpgadjaRequest;
using FITCCRS2.Model.SearchObjects;
using FITCCRS2.Services.DogadjajService;
using FITCCRS2.Services.KategorijaService;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FITCCRS2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class DogadjajController : BaseCRUDController<Model.Dogadjaj, DogadjajSearchObject, DogadjajUpsertRequest, DogadjajUpsertRequest>
    {
        public IDogadjajService _dogadjajService { get; set; }
        public DogadjajController(IDogadjajService dogadjajService) : base(dogadjajService)
        {
            _dogadjajService= dogadjajService;
        }

        [HttpGet("getLast")]
        public List<Model.Dogadjaj> getLastTakmicenjeDogadjaj()
        {
            var list = _dogadjajService.getLastTakmicenjeDogadjaj();
            return list;
        }
    }
}
