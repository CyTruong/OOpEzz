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

        private void _postGreeting(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess)
        {
            string js = fbTemplate.SimpleTextTemplate(mess.sender.id, "Chào bạn đến với OE Bot");
            _post(js);
            js = fbTemplate.SimpleTextTemplate(mess.sender.id, "Vì đây là lần đầu nên mình sẽ hướng dẫn qua tí");
            _post(js);
            js = fbTemplate.SimpleTextTemplate(mess.sender.id, "OOPEzz là bot chat hỗ trợ bạn học môn lập trình hướng đối tượng bằng ngôn ngữ C++ của trường Đại học Công Thông tin");
            _post(js);
            js = fbTemplate.SimpleTextTemplate(mess.sender.id, "Chatbot có thể giúp bạn trả lời những câu hỏi xung quanh C++, OOP. Bạn chỉ cần hỏi và mình sẽ tìm câu trả lời phù hợp nhất");
            _post(js);
            js = fbTemplate.SimpleTextTemplate(mess.sender.id, "Ví dụ, bạn chỉ cần chat 'hướng đối tượng là gì' thì bot sẽ tự tìm kiếm câu trả lời phù hợp nhất");
            _post(js);
            js = fbTemplate.SimpleTextTemplate(mess.sender.id, "Ngoài ra để đặt câu hỏi cho về bài học hay bất cứ cái gì mà bot chưa giải quyết thỏa đáng chỉ cần chat '[QUES] mình có câu hỏi là'");
            _post(js);
            js = fbTemplate.SimpleTextTemplate(mess.sender.id, "Để xem được danh sách chủ đề chat [menu]");
            _post(js);
            js = fbTemplate.SimpleTextTemplate(mess.sender.id, "Để hiện lại bảng hướng dẫn chat [help]");
            _post(js);
            js = fbTemplate.SimpleTextTemplate(mess.sender.id, "Để xem tiến độ học tập chat [process] (upcomming)");
            _post(js);
            js = fbTemplate.SimpleTextTemplate(mess.sender.id, "-------");
            _post(js);

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

        private void _postContentfromGroup(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess, GROUP_CONTENT gcontetn)
        {
            List<CONTENT> lcontent = db.CONTENT.Where(x => x.GROUP_CONTENT_FK == gcontetn.PK_SEQ).OrderBy(x => x.STT).ToList();
            _postContentList(db, lcontent, mess.sender.id);
        }

        private void _postContentfromGroup(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String gcontent = mess.postback.payload.Split(spa)[1];
            int gcontent_pk = int.Parse(gcontent);
            GROUP_CONTENT groupcontent = db.GROUP_CONTENT.Where(x => x.PK_SEQ == gcontent_pk).First();
            List<CONTENT> lcontent = db.CONTENT.Where(x => x.GROUP_CONTENT_FK == groupcontent.PK_SEQ).OrderBy(x => x.STT).ToList();
            _postContentList(db, lcontent, mess.sender.id);
        }

        private void _postContentformContent(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String content = mess.postback.payload.Split(spa)[1];
            int content_pk = int.Parse(content);
            CONTENT ct = db.CONTENT.Where(x => x.PK_SEQ == content_pk).First();
            List<CONTENT> contents = db.CONTENT.Where(x => x.GROUP_CONTENT_FK == ct.GROUP_CONTENT_FK && x.STT >= ct.STT).OrderBy(x => x.STT).ToList();
            _postContentList(db, contents, mess.sender.id);
        }

        private void _postGroupContentListFromLS(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String ls = mess.postback.payload.Split(spa)[1];
            int ls_pk = int.Parse(ls);
            List<GROUP_CONTENT> listgcontent = db.GROUP_CONTENT.Where(x => x.LESSION_FK == ls_pk).ToList();
            _sendGroupContentList(db, listgcontent, mess.sender.id);
        }

       
        private void _postQuestion(BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String next = mess.postback.payload.Split(spa)[2] + "_" + mess.postback.payload.Split(spa)[3];
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


        private void _postContentList(OOPEZZ_DBEntities db, List<CONTENT> lcontent, String senderid)
        {
            foreach (CONTENT content in lcontent)
            {
                String json = "";
                switch (content.TYPE)
                {
                    case CONTENT_TYPE_TEXT:
                        json = fbTemplate.SimpleTextTemplate(senderid, content.CONTENT_TEXT);
                        break;
                    case CONTENT_TYPE_IMG:
                        json = fbTemplate.ImageUrlTemplate(senderid, content.CONTENT_TEXT);
                        break;
                    case CONTENT_TYPE_OPTION:
                        json = fbTemplate.OptionPosbackTemplate(senderid, content.CONTENT_TEXT);
                        break;
                    //_post(json);
                    //return;
                    default:
                        break;
                }
                _post(json);
            }
        }

        private void _sendGroupContentList(OOPEZZ_DBEntities db, List<GROUP_CONTENT> lgcontent, String senderid)
        {
            foreach (GROUP_CONTENT gcontent in lgcontent)
            {
                String json = fbTemplate.ButtonTemplate(senderid, gcontent.NAME, new List<ResponseButtons>() {
                    new ResponseButtons()
                    {
                        type="postback",
                        title= "xem",
                        payload = "GROUPCONTENT_"+gcontent.PK_SEQ
                    }
                });
                _post(json);

            }
        }

        private void _postAnswer(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess)
        {
            char[] spa = { '_' };
            String content = mess.postback.payload.Split(spa)[1];
            int content_pk = int.Parse(content);
            ANSWER answer = db.ANSWER.Where(x => x.QUESTION_FK == content_pk).OrderByDescending(x => x.STATUS).First();
            String answer_pkseq_contents = answer.ANSWER_TEXT;
            char[] charac = { '#' };
            List<String> pkseqs = answer_pkseq_contents.Split(charac).ToList();
            List<CONTENT> contents = new List<CONTENT>();
            foreach (String pkseq in pkseqs)
            {
                int pk = int.Parse(pkseq);
                CONTENT ct = db.CONTENT.Where(x => x.PK_SEQ == pk).First();
                contents.Add(ct);
            }
            _postContentList(db, contents, mess.sender.id);

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