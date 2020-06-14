using OE.fbclass.fbTemplate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OE.Models;
using System.Net;
using System.IO;
using System.Diagnostics;

namespace OE.Controllers.api
{
    public partial class OopEzzController 
    {
        public const int CONTENT_TYPE_TEXT = 1;
        public const int CONTENT_TYPE_IMG = 2;
        public const int CONTENT_TYPE_OPTION = 3;


        public void ProgressRequest(BotMessageReceivedRequest botMessage)
        {
            OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();
            string senderid = botMessage.sender.id;
            USER user = db.USER.Where(x => x.TOKEN == senderid).FirstOrDefault();
            if (user == null)
            {
                _postGreeting(db,botMessage);
                UserControl control = new UserControl();
                control.CreateUser(db, botMessage.sender.id);
            }


            //ko có post back tức là câu hỏi hoặc chat lệnh cơ bản
            if (botMessage.postback == null)
            {
                //TIn nhắn thường
                if (botMessage.message == null || botMessage.message.text==null)
                {
                    return;
                }
                ProgressCommonRequest(botMessage);
                //botMessage.postback = new BotPostback { payload = botMessage.message.text };
            }
            else
            {
                if (botMessage.postback.payload == null)
                {
                    return;
                }
                if (botMessage.postback.payload.StartsWith("LESSON"))
                {
                    _postGroupContentListFromLS(db, botMessage);
                     //_postLession(db,botMessage);
                }
                if (botMessage.postback.payload.StartsWith("GROUPCONTENT"))
                {
                    _postContentfromGroup(db, botMessage);
                }
                if (botMessage.postback.payload.StartsWith("CONTENT"))
                {
                    _postContentformContent(db, botMessage);
                }
                if (botMessage.postback.payload.StartsWith("MENUG"))
                {
                    //_postGroupContentList(db, botMessage);
                }
                if (botMessage.postback.payload.StartsWith("ANS"))
                {
                    _postAnswer(db, botMessage);
                }
                if (botMessage.postback.payload.StartsWith("QUES"))
                {
                    _postQuestion(botMessage);
                }
           
            }

            db.Dispose();

        }

        public void ProgressCommonRequest(BotMessageReceivedRequest botMessage)
        {
            String mess = botMessage.message.text.ToLower();

            OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();

            try
            {
                if (mess.StartsWith("[ques]") || mess.StartsWith("ques"))
                {
                    _rqQuestion(db, botMessage);
                }
                else
            if (mess.StartsWith("[help]") || mess.StartsWith("help"))
                {
                    _help(db, botMessage);
                }
                else
            if (mess.StartsWith("[menu]") || mess.StartsWith("menu"))
                {
                    _lessonmenu2(db, botMessage);

                }
                else
            if (mess.StartsWith("[process]"))
                {

                }
                else
                    _question(db, botMessage);

            }
            catch (Exception e)
            {
                Console.WriteLine("exeption " + e.ToString());
            }

            db.Dispose();
        }

    }
}