using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OE.Controllers.api
{
    public  class AppInstance
    {
        private static AppInstance _instance = null;
        private string FbPageToken;
        private string FbPageId;
        private string Fbverify_token;
        public AppInstance()
        {
            FbPageToken = "EAALoqL63m1YBACpXr3ZA4DJfs0D2ZCDdJYVsA6R2Gv4G7bYOR1ssIL7VrUHEVrKKqvMMWYMuGXRhw1M3Iag1xm4rkfDM7oAZAL7ZCcC7XFNZBBtzjKAAPw4sw73RcZCe4UbJgsFkPbIWmLLLdct9HkXQb5T12YJs1rBTmb9cOJrAZDZD";
            FbPageId = "108722340761918";
            Fbverify_token = "cylasionNhattruong6";
        }

        public static AppInstance getInstance()
        {
            if (_instance == null)
            {
                _instance = new AppInstance();
            }
            return _instance;
        }

        public string getFbPageToken() { return FbPageToken ; }
        public string getFbPageId() { return FbPageId; }
        public string getFbverify_token() { return Fbverify_token; }

    }
}