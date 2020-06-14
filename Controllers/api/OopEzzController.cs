using OE.fbclass.fbTemplate;
using OE.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace OE.Controllers.api
{
    public partial class OopEzzController : Controller
    {
        public ActionResult Get()
        {
            return new HttpStatusCodeResult(HttpStatusCode.OK);

        }

        public String Test()
        {
            return "123Test";
        }

        public ActionResult Receive()
        {
            var query = Request.QueryString;
            if (query["hub.mode"] == "subscribe" &&
            query["hub.verify_token"] == AppInstance.getInstance().getFbverify_token())
            {
                //string type = Request.QueryString["type"];
                var retVal = query["hub.challenge"];
                return Json(int.Parse(retVal), JsonRequestBehavior.AllowGet);
            }
            else
            {
                return HttpNotFound();
            }
        }

        [ActionName("Receive")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ReceivePost(BotRequest data)
        {
            Task task = Task.Run(() =>
            {
                foreach (var entry in data.entry)
                {
                    foreach (var message in entry.messaging)
                    {
                        if (message.recipient.id.Equals(AppInstance.getInstance().getFbPageId()))
                        {
                            ProgressRequest(message);
                        }

                    }
                }
            });

            return new HttpStatusCodeResult(HttpStatusCode.OK);
        }
    }
}