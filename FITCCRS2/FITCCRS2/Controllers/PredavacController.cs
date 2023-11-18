using FITCCRS2.Model;
using FITCCRS2.Model.Requests.PredavacRequest;
using FITCCRS2.Model.SearchObjects;
using FITCCRS2.Services.BaseService;
using FITCCRS2.Services.PredavacService;
using FITCCRS2.Services.RezultatiService;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FITCCRS2.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class PredavacController : BaseCRUDController<Model.Predavac, BaseSearchObject, PredavacUpsertRequest, PredavacUpsertRequest>
    {
        public IPredavacService _service { get; set; }
        public PredavacController(IPredavacService service) : base(service)
        {
            _service = service;
        }
    }
}
