//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OE.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class QUESTION
    {
        public int PK_SEQ { get; set; }
        public string QUESTION_TEXT { get; set; }
        public int QUESTION_USER_FK { get; set; }
        public int BEST_ANSWER_FK { get; set; }
        public Nullable<int> STATUS { get; set; }
    }
}