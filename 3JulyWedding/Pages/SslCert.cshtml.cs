using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace _3JulyWedding.Pages
{
    public class SslCert : PageModel
    {
        public ContentResult OnGet(string id)
        {
            return new ContentResult
            {
                ContentType = "text/plain",
                Content = $"{id}.{Environment.GetEnvironmentVariable("LETS_ENCRYPT_KEY")}"
            };
        }
    }
}