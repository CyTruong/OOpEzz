using Newtonsoft.Json;
using OE.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;

namespace OE.Controllers.api
{
    public class UserControl
    {
        public int CreateUser(OOPEZZ_DBEntities db,string PSID)
        {
            string fbtoken = AppInstance.getInstance().getFbPageToken();
            string url = "https://graph.facebook.com/" + PSID +
                "?fields=first_name,last_name,gender&access_token=" +
                fbtoken;

            var request = (HttpWebRequest)WebRequest.Create(url);
            request.ContentType = "application/json";
            request.Method = "GET";
            WebResponse response =  request.GetResponse();
            string result = new StreamReader(response.GetResponseStream()).ReadToEnd();
            //UserAPITemplate userResponse =  new System.Web.Script.Serialization.JavaScriptSerializer().Deserialize<UserAPITemplate>(result);
            UserAPITemplate userResponse = JsonConvert.DeserializeObject<UserAPITemplate>(result);
            string name = Ulti.UnicodeDecode(userResponse.LastName + " " + userResponse.FirstName); 
            USER user = new USER()
            {
                STATUS = 1,
                TOKEN = PSID,
                USERNAME = name
            };
            db.USER.Add(user);
            db.SaveChanges();

            return user.PK_SEQ;
        }
    }

    class UserAPITemplate
    {
        [JsonProperty("first_name")]
        public string FirstName { get; set; }

        [JsonProperty("last_name")]
        public string LastName { get; set; }

        [JsonProperty("gender")]
        public string Gender { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }
    }
}