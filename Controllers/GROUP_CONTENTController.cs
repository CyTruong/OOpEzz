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
    public class GROUP_CONTENTController : Controller
    {
        private OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();

        // GET: GROUP_CONTENT
        public ActionResult Index()
        {
            return View(db.GROUP_CONTENT.ToList());
        }

        // GET: GROUP_CONTENT/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GROUP_CONTENT gROUP_CONTENT = db.GROUP_CONTENT.Find(id);
            if (gROUP_CONTENT == null)
            {
                return HttpNotFound();
            }
            return View(gROUP_CONTENT);
        }

        // GET: GROUP_CONTENT/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: GROUP_CONTENT/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PK_SEQ,LESSION_FK,NAME,DESCRIPTION")] GROUP_CONTENT gROUP_CONTENT)
        {
            if (ModelState.IsValid)
            {
                db.GROUP_CONTENT.Add(gROUP_CONTENT);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(gROUP_CONTENT);
        }

        // GET: GROUP_CONTENT/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GROUP_CONTENT gROUP_CONTENT = db.GROUP_CONTENT.Find(id);
            if (gROUP_CONTENT == null)
            {
                return HttpNotFound();
            }
            return View(gROUP_CONTENT);
        }

        // POST: GROUP_CONTENT/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PK_SEQ,LESSION_FK,NAME,DESCRIPTION")] GROUP_CONTENT gROUP_CONTENT)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gROUP_CONTENT).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(gROUP_CONTENT);
        }

        // GET: GROUP_CONTENT/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GROUP_CONTENT gROUP_CONTENT = db.GROUP_CONTENT.Find(id);
            if (gROUP_CONTENT == null)
            {
                return HttpNotFound();
            }
            return View(gROUP_CONTENT);
        }

        // POST: GROUP_CONTENT/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GROUP_CONTENT gROUP_CONTENT = db.GROUP_CONTENT.Find(id);
            db.GROUP_CONTENT.Remove(gROUP_CONTENT);
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
