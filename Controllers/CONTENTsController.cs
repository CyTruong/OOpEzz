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
    public class CONTENTsController : Controller
    {
        private OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();

        // GET: CONTENTs
        public ActionResult Index()
        {
            List<GROUP_CONTENT> lg = db.GROUP_CONTENT.ToList();
            ViewBag.listgroupcontent = lg.Select(x => new SelectListItem()
            {
                Text = x.NAME,
                Value = x.PK_SEQ.ToString()
            });
            return View(db.CONTENT.ToList());
        }
        [HttpPost]
        public ActionResult Index(FormCollection data)
        {
            if (data["action"].ToString().Equals("New"))
            {
                CONTENT content = new CONTENT()
                {
                    GROUP_CONTENT_FK = int.Parse(data["groupcontent"]),
                    CONTENT_TEXT = data["content"],
                    TYPE = int.Parse(data["type"])
                };
                int? max = 0;
                CONTENT ct = db.CONTENT.Where(x => x.GROUP_CONTENT_FK == content.GROUP_CONTENT_FK).OrderByDescending(x => x.STT).FirstOrDefault();
                if (ct==null)
                {
                    max = 0;

                }else
                 max = ct.STT;

                max++;
                content.STT = max;
                Create(content); 
            }

            String sql = "SELECT* FROM dbo.CONTENT WHERE 1 = 1  ";
            String groupcontentfk = data["groupcontent"];
            if (!groupcontentfk.Equals(""))
            {
                sql += " AND GROUP_CONTENT_FK = " + groupcontentfk;
            }
            List<GROUP_CONTENT> lg = db.GROUP_CONTENT.OrderByDescending(x=>x.PK_SEQ).ToList(); 
            IEnumerable<SelectListItem> listgroupcontent = lg.Select(x => new SelectListItem()
            {
                Text = x.NAME,
                Value = x.PK_SEQ.ToString()
            });
            if (data["action"].ToString().Equals("New"))
            {
                foreach (var gcontent in listgroupcontent)
                {
                    if (gcontent.Value.Equals(data["groupcontent"]))
                    {
                        gcontent.Selected = true;
                        break;
                    }
                }
            }
            ViewBag.listgroupcontent = listgroupcontent;
            return View(db.CONTENT.SqlQuery(sql).ToList());
        }
        // GET: CONTENTs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CONTENT cONTENT = db.CONTENT.Find(id);
            if (cONTENT == null)
            {
                return HttpNotFound();
            }
            return View(cONTENT);
        }

        // GET: CONTENTs/Create
        public ActionResult Create()
        {
            return View();
        }


        // POST: CONTENTs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PK_SEQ,STT,CONTENT_TEXT,TYPE,GROUP_CONTENT_FK")] CONTENT cONTENT)
        {
          
            if (ModelState.IsValid)
            {
                db.CONTENT.Add(cONTENT);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(cONTENT);
        }

        // GET: CONTENTs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CONTENT cONTENT = db.CONTENT.Find(id);
            if (cONTENT == null)
            {
                return HttpNotFound();
            }
            return View(cONTENT);
        }

        // POST: CONTENTs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PK_SEQ,STT,CONTENT_TEXT,TYPE,GROUP_CONTENT_FK")] CONTENT cONTENT)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cONTENT).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cONTENT);
        }

        // GET: CONTENTs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CONTENT cONTENT = db.CONTENT.Find(id);
            if (cONTENT == null)
            {
                return HttpNotFound();
            }
            return View(cONTENT);
        }

        // POST: CONTENTs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CONTENT cONTENT = db.CONTENT.Find(id);
            db.CONTENT.Remove(cONTENT);
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
