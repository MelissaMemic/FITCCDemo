using AutoMapper;
using FITCCRS2.Model.Requests;
using FITCCRS2.Model.Requests.DpgadjaRequest;
using FITCCRS2.Model.SearchObjects;
using FITCCRS2.Services.AgendaService;
using FITCCRS2.Services.BaseService;
using FITCCRS2.Services.Database;
using FITCCRS2.Services.KategorijaService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FITCCRS2.Services.DogadjajService
{
    public class DogadjajService : BaseCRUDService<Model.Dogadjaj, Database.Dogadjaj, DogadjajSearchObject, DogadjajUpsertRequest, DogadjajUpsertRequest>, IDogadjajService
    {
        private readonly IAgendaService _agendaService;
        IMapper _mapper;
        RS2SeminarskiContext _context;

        public DogadjajService(RS2SeminarskiContext context, IMapper mapper, IAgendaService agendaService) : base(context, mapper)
        {
            _agendaService = agendaService;
            _mapper = mapper;
            _context=context;
        }

        public List<Model.Dogadjaj> getLastTakmicenjeDogadjaj()
        {
           var agendaList=_agendaService.getLastTakmicenjeAgenda();
           var dogadjajList = _context.Dogadjajs.ToList();
            var list = new List<Model.Dogadjaj>();

            foreach (var agenda in agendaList)
            {
                foreach (var dogadjaj in dogadjajList)
                {
                    if (dogadjaj.AgendaId == agenda.AgendaId)
                    {
                        var dog = _mapper.Map<Model.Dogadjaj>(dogadjaj);
                        list.Add(dog);
                    }
                        
                }
            }
            return list;
        }
    }
}
