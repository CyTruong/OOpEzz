using OE.fbclass.fbTemplate;
using OE.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OE.Controllers.api
{
    public partial class OopEzzController
    {
       

        private void _help(OOPEZZ_DBEntities db, BotMessageReceivedRequest botMessage)
        {
            String json = fbTemplate.SimpleTextTemplate(botMessage.sender.id,"Chào bạn");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "OOPEzz là bot chat hỗ trợ bạn học môn lập trình hướng đối tượng bằng ngôn ngữ C++ của trường Đại học Công Thông tin");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Chatbot có thể giúp bạn trả lời những câu hỏi xung quanh C++, OOP. Bạn chỉ cần hỏi và mình sẽ tìm câu trả lời phù hợp nhất");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Ví dụ, bạn chỉ cần chat 'hướng đối tượng là gì' thì bot sẽ tự tìm kiếm câu trả lời phù hợp nhất");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Ngoài ra để đặt câu hỏi cho về bài học hay bất cứ cái gì mà bot chưa giải quyết thỏa đáng chỉ cần chat '[QUES] mình có câu hỏi là'");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Để xem được danh sách chủ đề chat [menu]");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Để hiện lại bảng hướng dẫn chat [help]");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Để xem tiến độ học tập chat [process] (upcomming)");
            _post(json);
            json = fbTemplate.ButtonTemplate(botMessage.sender.id, "Xem bài đầu tiên", new List<ResponseButtons>
            {
                new ResponseButtons
                {
                    payload="LESSON_1",
                    type="postback",
                    title = "Xem bài 1"
                }
            });
            _post(json);

        }

        private void _lessonmenu2(OOPEZZ_DBEntities db, BotMessageReceivedRequest botMessage)
        {
            List<LESSION> lessionlist = db.LESSION.ToList();
            string json = fbTemplate.SimpleTextTemplate(botMessage.sender.id,"Danh sách bài học hiện có");
            _post(json);
            foreach (LESSION ls in lessionlist)
            {
                json = fbTemplate.ButtonTemplate(botMessage.sender.id, ls.NAME, new List<ResponseButtons>
                {
                    new ResponseButtons()
                    {
                        type = "postback",
                        title = "Xem",
                        payload = "LESSON_"+ls.PK_SEQ
                    }
                });
                _post(json);
            }
        }
        //private void _lessonmenu(OOPEZZ_DBEntities db, BotMessageReceivedRequest botMessage)
        //{
        //    ///thua
        //    List<LESSION> lessionlist = db.LESSION.ToList();
        //    List<PayloadElements> listelement = new List<PayloadElements>();
        //    foreach (LESSION ls in lessionlist)
        //    {
        //        PayloadElements element = new PayloadElements()
        //        {
        //            title = ls.NAME,
        //            //image_url = ls.IMAGE,
        //            subtitle = ls.DESCRIPTION,
                  
        //            buttons = new List<ResponseButtons>
        //            {
        //                new ResponseButtons
        //                {
        //                    type = "web_url",
        //                    title = "View",
        //                    url = "https://www.facebook.com/pg/OOP-Ezz-108722340761918"
        //                }
        //            },
        //            default_action = new PayloadElementDefautAction
        //            {
        //                type = "web_url",
        //                url = "https://www.facebook.com/pg/OOP-Ezz-108722340761918"
        //            }
        //        };
        //        listelement.Add(element);
        //    }

        //    List<ResponseButtons> lbt = new List<ResponseButtons>()
        //    {
        //        new ResponseButtons
        //        {
        //            title = "View More",
        //            type = "postback",
        //            payload = "payload view more"
        //        }
        //    };
        //    //listelement.RemoveAt(1);
        //    String json = fbTemplate.ListTemplate(botMessage.sender.id, listelement);
        //    _post(json);
            
        //}

        private void _rqQuestion(OOPEZZ_DBEntities db, BotMessageReceivedRequest botMessage)
        {
            String mess = botMessage.message.text.Remove(0,6);
            mess = mess.Trim();
            mess = Ulti.replaceKeyword(db, mess);
            USER user = db.USER.Where(x => x.TOKEN == botMessage.sender.id).FirstOrDefault();
            int userpkseq = -1;
            if (user==null)
            {
                UserControl control = new UserControl();
                userpkseq = control.CreateUser(db, botMessage.sender.id);
            }
            else
            {
                userpkseq = user.PK_SEQ;
            }
            
            QUESTION ques = new QUESTION()
            {
                BEST_ANSWER_FK = 0,
                QUESTION_TEXT = mess,
                QUESTION_USER_FK = userpkseq,
                STATUS = 0
            };
            db.QUESTION.Add(ques);
            db.SaveChanges();
            String json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Oki đã ghi nhận nào có câu trả lời mình sẽ trả lời ngay");
            _post(json);
        }

        private void _question(OOPEZZ_DBEntities db, BotMessageReceivedRequest botMessage)
        {
            String mess = botMessage.message.text.ToLower();
            mess = Ulti.removeCommonstr(mess);
            mess = mess.Trim();
            mess = Ulti.replaceKeyword(db, mess);
            mess = Ulti.replaceAEIOU(mess);
            char[] charac = { '-' };
            List<String> strques = mess.Split(charac).ToList();


            List<QUESTION> questionlist = db.QUESTION.ToList();
            int maxCompare = 10000;
            QUESTION result = null;
            foreach (QUESTION question in questionlist)
            {
                List<String> ques = Ulti.replaceAEIOU(question.QUESTION_TEXT.ToLower()).Split(charac).ToList();
                int resultLength = Ulti.LevenshteinDistance(strques, ques);
                if (resultLength < maxCompare)
                {
                    maxCompare = resultLength;
                    result = question;
                }
            }

            if (!Ulti.calculateResultisAvaiable(maxCompare, Ulti.replaceAEIOU(result.QUESTION_TEXT.ToLower()).Split(charac).ToList()) || result == null)
            {
                _postRelateGroupcontent(db, botMessage, strques);
            }
            else
            {
                _postRelateGroupcontent(db, botMessage, strques,result);

            }

            

        }

        private void _postRelateGroupcontent(OOPEZZ_DBEntities db, BotMessageReceivedRequest mess, List<String> strques, QUESTION linkedques = null)
        {
            char[] charac = { '-' };
            List<GROUP_CONTENT> gcontents = db.GROUP_CONTENT.ToList();
            List<GROUP_CONTENT> gresult = new List<GROUP_CONTENT>();
            foreach (GROUP_CONTENT goupcontent in gcontents)
            {
                List<String> gStrStr = Ulti.replaceAEIOU(goupcontent.NAME.ToLower()).Split(charac).ToList();
                int resultLength = Ulti.LevenshteinDistance(strques, gStrStr);
                if (Ulti.calculateResultisAvaiable(resultLength, gStrStr))
                {
                    gresult.Add(goupcontent);
                }
               
            }
            //Tìm xong  => post
        
          
            //post group content
            if (gresult.Count>0)
            {
                String json;
                foreach (GROUP_CONTENT gcontent in gresult)
                {
                    json = fbTemplate.ButtonTemplate(mess.sender.id, "Nội dung tương tự :" + gcontent.NAME, new List<ResponseButtons> {
                    new ResponseButtons()
                    {
                        type = "postback",
                        title = "Xem",
                        payload = "GROUPCONTENT_"+gcontent.PK_SEQ
                    }
                });
                    _post(json);
                }
             
            }
            else
            {
                if (linkedques != null)
                {                   
                     string json = fbTemplate.SimpleTextTemplate(mess.sender.id, "Câu hỏi tương tự ");
                     _post(json);                   
                    _postQuestion(db, linkedques, mess);
                }
                else
                {
                    _postNoQuest(mess);
                }
            }
          
           


        }

        private void _postQuestion(OOPEZZ_DBEntities db, QUESTION question,BotMessageReceivedRequest mess)
        {

            String json = "";
    
            //json = fbTemplate.SimpleTextTemplate(mess.sender.id, question.QUESTION_TEXT);
            //_post(json);
            json = fbTemplate.ButtonTemplate(mess.sender.id, question.QUESTION_TEXT, new List<ResponseButtons>() {
                new ResponseButtons() {
                    title ="Xem",
                    payload ="ANS_"+question.PK_SEQ ,
                    type = "postback" }
            });
            _post(json);
    
        }

       

        private void _postNoQuest(BotMessageReceivedRequest mess)
        {
            String json = fbTemplate.SimpleTextTemplate(mess.sender.id,"Hiện tại không có câu hỏi tương tự, để đặt câu hỏi soạn tin nhắn với từ khóa '[QUES]' ơ đầu tin ");
            _post(json);
        }
    }
}