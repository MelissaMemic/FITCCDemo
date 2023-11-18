using AutoMapper;
using FITCCRS2.Model;
using FITCCRS2.Model.Requests;
using FITCCRS2.Model.Requests.PredavacDogadjaj;
using FITCCRS2.Model.Requests.PredavacRequest;
using FITCCRS2.Model.Requests.ProjekatRequest;
using FITCCRS2.Model.Requests.RezultatiRequest;
using FITCCRS2.Model.Requests.RolesRequest;
using FITCCRS2.Model.Requests.SponzorRequest;
using FITCCRS2.Model.Requests.TakmicenjeRequest;
using FITCCRS2.Model.Requests.TimRequest;
using FITCCRS2.Model.Requests.UserRequest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FITCCRS2.Services.Mapping
{
    public class ProfileMapping:Profile
    {
        public ProfileMapping()
        {
            CreateMap<Database.Takmicenje, Model.Takmicenje>();
            CreateMap<Database.Dogadjaj, Model.Dogadjaj>();
            CreateMap<Database.Agendum, Model.Agenda>();
            CreateMap<Database.Kategorija, Model.Kategorija>();
            CreateMap<Database.Kriterij, Model.Kriteriji>();
            CreateMap<Database.Projekat, Model.Projekat>();
            CreateMap<Database.Rezultat, Model.Rezultati>();
            CreateMap<Database.Tim, Model.Tim>();
            CreateMap<Database.Sponzor, Model.Sponzor>();
            CreateMap<Database.Predavac, Model.Predavac>();
            CreateMap<Database.PredavacDogadjaj, Model.PredavacDogadjaj>();
            CreateMap<Database.AspNetUser, Model.User>();
            CreateMap<Database.AspNetRole, Model.Roles>();
            CreateMap<Database.User, Model.User>();


            CreateMap<TakmicenjeInsertRequest, Database.Takmicenje>();
            CreateMap<TakmicenjeUpdateRequest, Database.Takmicenje>();

            CreateMap<RezultatiInsertRequest, Database.Rezultat>();
            CreateMap<RezultatiUpdateRequest, Database.Rezultat>();

            CreateMap<KategorijaInsertRequest, Database.Kategorija>();
            CreateMap<KategorijaUpdateRequest, Database.Kategorija>();

            CreateMap<PredavacDogadjajUpsertRequest, Database.PredavacDogadjaj>();
            CreateMap<PredavacUpsertRequest, Database.Predavac>();

            CreateMap<SponzorUpsertRequest, Database.Sponzor>();

            CreateMap<ProjekatUpsertRequest, Database.Projekat>();

            CreateMap<TimInsertRequest, Database.Tim>();
            CreateMap<TimUpdateRequest, Database.Tim>();

            CreateMap<UserUpsertRequest, Database.AspNetUser>();
            CreateMap<RolesUpsertRequest, Database.AspNetRole>();

            CreateMap<UserUpsertRequest, Database.User>();




        }
    }
}
