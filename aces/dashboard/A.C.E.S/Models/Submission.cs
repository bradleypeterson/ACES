﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace A.C.E.S.Models
{
    public class Submission
    {
        public int Id { get; set; }
        public int StudentAssignmentId { get; set; }
        public DateTime DateSubmitted { get; set; }
        public float Grade { get; set; }
    }
}
