#pragma checksum "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "5118da596c9dd5a89d5b35572be082d77ac3cc17"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(A.C.E.S.Pages.Students.Pages_Students_Student), @"mvc.1.0.razor-page", @"/Pages/Students/Student.cshtml")]
namespace A.C.E.S.Pages.Students
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\_ViewImports.cshtml"
using A.C.E.S;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemMetadataAttribute("RouteTemplate", "/Students/{ID:int}")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"5118da596c9dd5a89d5b35572be082d77ac3cc17", @"/Pages/Students/Student.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"0fe3f33a1bbfb825705ae137818486ffb09d4dab", @"/Pages/_ViewImports.cshtml")]
    public class Pages_Students_Student : global::Microsoft.AspNetCore.Mvc.RazorPages.Page
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 3 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
  
    ViewData["Title"] = Model.student.Name;
    ViewData["Header"] = $"{Model.student.Name}";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<section class=\"flex-space margin\">\r\n    <div>\r\n        <h3>Contact</h3>\r\n        <p><a");
            BeginWriteAttribute("href", " href=\"", 264, "\"", 298, 2);
            WriteAttributeValue("", 271, "mailto:", 271, 7, true);
#nullable restore
#line 11 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
WriteAttributeValue("", 278, Model.student.Email, 278, 20, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 11 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                                            Write(Model.student.Email);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></p>\r\n    </div>\r\n    <div>\r\n        <h3>Academic Standing:</h3>\r\n        <p>Accademic standing should be computed here.</p>\r\n    </div>\r\n");
            WriteLiteral("</section>\r\n\r\n<section class=\"margin\">\r\n    <h2>Recent Submissions</h2>\r\n");
#nullable restore
#line 36 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
     if (Model.student.Submissions.Count == 0)
    {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <p>There are no assignment submissions for this student.</p>\r\n");
#nullable restore
#line 39 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
    }

#line default
#line hidden
#nullable disable
#nullable restore
#line 40 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
     for (int i = 0; i < 5 && i < Model.student.Submissions.Count; i++)
    {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <p>");
#nullable restore
#line 42 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
      Write(Model.student.Submissions[i].Standing);

#line default
#line hidden
#nullable disable
            WriteLiteral("</p>\r\n");
#nullable restore
#line 43 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
    }

#line default
#line hidden
#nullable disable
            WriteLiteral("</section>\r\n\r\n<section class=\"margin\">\r\n    <h2>Past Submissions</h2>\r\n");
#nullable restore
#line 48 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
     if (Model.student.Submissions.Count == 0)
    {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <p>There are no assignment submissions for this student.</p>\r\n");
#nullable restore
#line 51 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
    }
    

#line default
#line hidden
#nullable disable
            WriteLiteral("</section>");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<A.C.E.S.Pages.Students.StudentModel> Html { get; private set; }
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<A.C.E.S.Pages.Students.StudentModel> ViewData => (global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<A.C.E.S.Pages.Students.StudentModel>)PageContext?.ViewData;
        public A.C.E.S.Pages.Students.StudentModel Model => ViewData.Model;
    }
}
#pragma warning restore 1591
