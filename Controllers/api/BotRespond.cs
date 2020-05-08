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
                OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();
                if (botMessage.postback.payload.StartsWith("LESSON"))
                {
                     _postLession(db,botMessage);
                }
                if (botMessage.postback.payload.StartsWith("GROUPCONTENT"))
                {
                    _postContentfromGroup(db, botMessage);
                }
                if (botMessage.postback.payload.StartsWith("CONTENT"))
                {
                    _postContentformContent(db, botMessage);
                }
                if (botMessage.postback.payload.StartsWith("ANS_QUES"))
                {
                    _postAnswerfromQuestion(db, botMessage);
                }
                if (botMessage.postback.payload.StartsWith("QUES"))
                {
                    _postQuestion(botMessage);
                }
                db.Dispose();
            }

      
        }

        private void _postLession(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String lesson = mess.postback.payload.Split(spa)[1];
            int lessonpkseq = int.Parse(lesson);
            LESSION lession = db.LESSION.Where(x => x.PK_SEQ == lessonpkseq).FirstOrDefault();

            GROUP_CONTENT gcontent = db.GROUP_CONTENT.Where(x => x.LESSION_FK == lession.PK_SEQ).OrderBy(x => x.PK_SEQ).First();
            _postContentfromGroup(db, mess, gcontent);
        }

        private void _postContentfromGroup(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess,GROUP_CONTENT gcontetn)
        {
            List<CONTENT> lcontent = db.CONTENT.Where(x => x.GROUP_CONTENT_FK == gcontetn.PK_SEQ).OrderBy(x => x.STT).ToList();
            _sendContentList(db, lcontent, mess.sender.id);
        }

        private void _postContentfromGroup(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String gcontent = mess.postback.payload.Split(spa)[1];
            int gcontent_pk = int.Parse(gcontent);
            GROUP_CONTENT groupcontent = db.GROUP_CONTENT.Where(x => x.PK_SEQ == gcontent_pk).First();
            List<CONTENT> lcontent = db.CONTENT.Where(x => x.GROUP_CONTENT_FK == groupcontent.PK_SEQ).OrderBy(x => x.STT).ToList();
            _sendContentList(db, lcontent, mess.sender.id);
        }

        private void _postContentformContent(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String content = mess.postback.payload.Split(spa)[1];
            int content_pk = int.Parse(content);
            CONTENT ct = db.CONTENT.Where(x => x.PK_SEQ == content_pk).First();
            List<CONTENT> contents = db.CONTENT.Where(x=> x.GROUP_CONTENT_FK == ct.GROUP_CONTENT_FK && x.STT >= ct.STT).OrderBy(x => x.STT).ToList();
            _sendContentList(db, contents,mess.sender.id);
        }

        private void _postAnswerfromQuestion(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String content = mess.postback.payload.Split(spa)[2];
            int content_pk = int.Parse(content);
            QUESTION qs = db.QUESTION.Where(x => x.PK_SEQ == content_pk).First();
            _postQuestion(db,qs,mess);
        }

        private void _postQuestion(BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String next = mess.postback.payload.Split(spa)[2]+"_"+ mess.postback.payload.Split(spa)[3];
            String json = fbTemplate.ButtonTemplate(mess.sender.id, "Bạn muốn hỏi gì nào.Khi nào hỏi xong bấm nút bên dưới để tiếp tục bài học nhé", new List<ResponseButtons>() {
                new ResponseButtons()
                {
                    type = "postback",
                    title = "Tiếp tục bài học",
                    payload = next
                }
            });
            _post(json);
        }
       

        private void _sendContentList(OOPEZZ_DBEntities db, List<CONTENT> lcontent,String senderid)
        {
            foreach (CONTENT content in lcontent)
            {
                String json= "";
                switch (content.TYPE)
                {
                    case CONTENT_TYPE_TEXT:
                        json = fbTemplate.SimpleTextTemplate(senderid,content.CONTENT_TEXT);
                        break;
                    case CONTENT_TYPE_IMG:
                        json = fbTemplate.ImageUrlTemplate(senderid,content.CONTENT_TEXT);
                        break;
                    case CONTENT_TYPE_OPTION:
                        json = fbTemplate.OptionPosbackTemplate(senderid, content.CONTENT_TEXT);
                        _post(json);
                        return;
                    default:
                        break;
                }
                _post(json);
            }
        }

        private string _post( String data)
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