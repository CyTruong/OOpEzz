using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using OE.Models;

namespace OE.Controllers
{
    public class LESSION_TAGController : Controller
    {
        private OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();

        // GET: LESSION_TAG
        public ActionResult Index()
        {
            return View(db.LESSION_TAG.ToList());
        }

        // GET: LESSION_TAG/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LESSION_TAG lESSION_TAG = db.LESSION_TAG.Find(id);
            if (lESSION_TAG == null)
            {
                return HttpNotFound();
            }
            return View(lESSION_TAG);
        }

        // GET: LESSION_TAG/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LESSION_TAG/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PK_SEQ,LESSON_FK,TAG_FK")] LESSION_TAG lESSION_TAG)
        {
            if (ModelState.IsValid)
            {
                db.LESSION_TAG.Add(lESSION_TAG);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(lESSION_TAG);
        }

        // GET: LESSION_TAG/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LESSION_TAG lESSION_TAG = db.LESSION_TAG.Find(id);
            if (lESSION_TAG == null)
            {
                return HttpNotFound();
            }
            return View(lESSION_TAG);
        }

        // POST: LESSION_TAG/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PK_SEQ,LESSON_FK,TAG_FK")] LESSION_TAG lESSION_TAG)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lESSION_TAG).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lESSION_TAG);
        }

        // GET: LESSION_TAG/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LESSION_TAG lESSION_TAG = db.LESSION_TAG.Find(id);
            if (lESSION_TAG == null)
            {
                return HttpNotFound();
            }
            return View(lESSION_TAG);
        }

        // POST: LESSION_TAG/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LESSION_TAG lESSION_TAG = db.LESSION_TAG.Find(id);
            db.LESSION_TAG.Remove(lESSION_TAG);
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
