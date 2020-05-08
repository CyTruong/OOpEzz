using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OE.fbclass.fbTemplate;
using OE.Models;

namespace OE.Controllers
{
    public class ANSWERsController : Controller
    {
        private OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();

        // GET: ANSWERs
        public ActionResult Index()
        {
            return View(db.ANSWER.ToList());
        }

        // GET: ANSWERs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ANSWER aNSWER = db.ANSWER.Find(id);
            if (aNSWER == null)
            {
                return HttpNotFound();
            }
            return View(aNSWER);
        }

        // GET: ANSWERs/Create
        public ActionResult Create()
        {
            return View();
        }


        
        // POST: ANSWERs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PK_SEQ,ANSWER_TEXT,ANSWER_USER_FK,QUESTION_FK,STATUS")] ANSWER aNSWER)
        {
            if (ModelState.IsValid)
            {
                db.ANSWER.Add(aNSWER);
                db.SaveChanges();
                NotifinewAnswer((int)aNSWER.QUESTION_FK);
                return RedirectToAction("Index");
            }

            return View(aNSWER);
        }

        // GET: ANSWERs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ANSWER aNSWER = db.ANSWER.Find(id);
            if (aNSWER == null)
            {
                return HttpNotFound();
            }
            return View(aNSWER);
        }

        // POST: ANSWERs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PK_SEQ,ANSWER_TEXT,ANSWER_USER_FK,QUESTION_FK,STATUS")] ANSWER aNSWER)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aNSWER).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(aNSWER);
        }

        // GET: ANSWERs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ANSWER aNSWER = db.ANSWER.Find(id);
            if (aNSWER == null)
            {
                return HttpNotFound();
            }
            return View(aNSWER);
        }

        // POST: ANSWERs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ANSWER aNSWER = db.ANSWER.Find(id);
            db.ANSWER.Remove(aNSWER);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private void NotifinewAnswer(int questionpk)
        {
            QUESTION qs = db.QUESTION.Where(x => x.PK_SEQ == questionpk && x.STATUS != 0).First();
            string token = db.USER.Where(x => x.PK_SEQ == qs.QUESTION_USER_FK).First().TOKEN;
            string newanswer = fbTemplate.SimpleTextTemplate(token, "Đã có câu trả lời cho câu hỏi : " + qs.QUESTION_TEXT);
            _post(newanswer);
            newanswer = fbTemplate.ButtonTemplate(token, "Bạn có muốn xem qua", new List<ResponseButtons>()
            {
                new ResponseButtons()
                {
                    title ="Xem",
                    type = "postback",
                    payload = "ANS_QUES_"+qs.PK_SEQ
                }
            });
            _post(newanswer);
        }
        private string _post(String data)
        {
            String url = "https://graph.facebook.com/v6.0/me/messages?access_token=EAALoqL63m1YBAPhBNoTABGDGYEuxdZCZBerC0HJ9dLLa1b8UgcZAF43qcN44q1T4K3ju297hBy9SEyCHOZAHZAnEk8uW3r93IgZC9wZBqnxrS8cacrjYLvZAiQVPOEZCypFTbZAA2OZB1ggWSa5XurSVx6cHMcvlbnfGEwBpM6jSVuBtgZDZD";
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.ContentType = "application/json";
            request.Method = "POST";
            using (var requestWriter = new StreamWriter(request.GetRequestStream()))
            {
                requestWriter.Write(data);
            }
            HttpWebResponse response = null;
            try
            {
                response = (HttpWebResponse)request.GetResponse();
            }
            catch (Exception e)
            {
                Debug.Write(e.ToString(), "Debug");
            }
            if (response == null)
                //throw new InvalidOperationException("GetResponse returns null");
                return "";

            using (var sr = new StreamReader(response.GetResponseStream()))
            {
                return sr.ReadToEnd();
            }
        }
    }
}
