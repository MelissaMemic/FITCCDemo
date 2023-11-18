﻿using System;
using System.Collections.Generic;

namespace FITCCRS2.Services.Database
{
    public partial class ApiScopeProperty
    {
        public int Id { get; set; }
        public int ScopeId { get; set; }
        public string Key { get; set; } = null!;
        public string Value { get; set; } = null!;

        public virtual ApiScope Scope { get; set; } = null!;
    }
}
