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
    public class KEYWORDsController : Controller
    {
        private OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();

        // GET: KEYWORDs
        public ActionResult Index()
        {
            return View(db.KEYWORD.ToList());
        }

        // GET: KEYWORDs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KEYWORD kEYWORD = db.KEYWORD.Find(id);
            if (kEYWORD == null)
            {
                return HttpNotFound();
            }
            return View(kEYWORD);
        }

        // GET: KEYWORDs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: KEYWORDs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PK_SEQ,EN,VI,RELATE,ORDER,STATUS")] KEYWORD kEYWORD)
        {
            if (ModelState.IsValid)
            {
                char[] splitchar = { ' ' };
                kEYWORD.ORDER = kEYWORD.VI.Trim().Split().Count();
                kEYWORD.STATUS = 1;
                db.KEYWORD.Add(kEYWORD);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(kEYWORD);
        }

        // GET: KEYWORDs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KEYWORD kEYWORD = db.KEYWORD.Find(id);
            if (kEYWORD == null)
            {
                return HttpNotFound();
            }
            return View(kEYWORD);
        }

        // POST: KEYWORDs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PK_SEQ,EN,VI,RELATE,ORDER,STATUS")] KEYWORD kEYWORD)
        {
            if (ModelState.IsValid)
            {
                db.Entry(kEYWORD).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(kEYWORD);
        }

        // GET: KEYWORDs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KEYWORD kEYWORD = db.KEYWORD.Find(id);
            if (kEYWORD == null)
            {
                return HttpNotFound();
            }
            return View(kEYWORD);
        }

        // POST: KEYWORDs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            KEYWORD kEYWORD = db.KEYWORD.Find(id);
            db.KEYWORD.Remove(kEYWORD);
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
