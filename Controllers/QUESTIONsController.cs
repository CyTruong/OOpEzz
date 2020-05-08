using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OE.Models;

namespace OE.Controllers.fbclass
{
    public class QUESTIONsController : Controller
    {
        private OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();

        // GET: QUESTIONs
        public ActionResult Index()
        {
            return View(db.QUESTION.ToList());
        }

        // GET: QUESTIONs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QUESTION qUESTION = db.QUESTION.Find(id);
            if (qUESTION == null)
            {
                return HttpNotFound();
            }
            return View(qUESTION);
        }

        // GET: QUESTIONs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: QUESTIONs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PK_SEQ,QUESTION_TEXT,QUESTION_USER_FK,BEST_ANSWER_FK,STATUS")] QUESTION qUESTION)
        {
            if (ModelState.IsValid)
            {
                db.QUESTION.Add(qUESTION);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(qUESTION);
        }

        // GET: QUESTIONs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QUESTION qUESTION = db.QUESTION.Find(id);
            if (qUESTION == null)
            {
                return HttpNotFound();
            }
            return View(qUESTION);
        }

        // POST: QUESTIONs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PK_SEQ,QUESTION_TEXT,QUESTION_USER_FK,BEST_ANSWER_FK,STATUS")] QUESTION qUESTION)
        {
            if (ModelState.IsValid)
            {
                db.Entry(qUESTION).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(qUESTION);
        }

        // GET: QUESTIONs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QUESTION qUESTION = db.QUESTION.Find(id);
            if (qUESTION == null)
            {
                return HttpNotFound();
            }
            return View(qUESTION);
        }

        // POST: QUESTIONs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            QUESTION qUESTION = db.QUESTION.Find(id);
            db.QUESTION.Remove(qUESTION);
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
    }
}
