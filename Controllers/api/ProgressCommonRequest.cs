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
        //chuyen tieng viet khong dau
        private static List<char> SPECIAL_CHARACTERS = new List<char> { ' ', '!', '"', '#', '$', '%',
           '*', '+', ',', ':', '<', '=', '>', '?', '@', '[', '\\', ']', '^',
           '`', '|', '~', 'À', 'Á', 'Â', 'Ã', 'È', 'É', 'Ê', 'Ì', 'Í', 'Ò',
           'Ó', 'Ô', 'Õ', 'Ù', 'Ú', 'Ý', 'à', 'á', 'â', 'ã', 'è', 'é', 'ê',
           'ì', 'í', 'ò', 'ó', 'ô', 'õ', 'ù', 'ú', 'ý', 'Ă', 'ă', 'Đ', 'đ',
           'Ĩ', 'ĩ', 'Ũ', 'ũ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ạ', 'ạ', 'Ả', 'ả', 'Ấ',
           'ấ', 'Ầ', 'ầ', 'Ẩ', 'ẩ', 'Ẫ', 'ẫ', 'Ậ', 'ậ', 'Ắ', 'ắ', 'Ằ', 'ằ',
           'Ẳ', 'ẳ', 'Ẵ', 'ẵ', 'Ặ', 'ặ', 'Ẹ', 'ẹ', 'Ẻ', 'ẻ', 'Ẽ', 'ẽ', 'Ế',
           'ế', 'Ề', 'ề', 'Ể', 'ể', 'Ễ', 'ễ', 'Ệ', 'ệ', 'Ỉ', 'ỉ', 'Ị', 'ị',
           'Ọ', 'ọ', 'Ỏ', 'ỏ', 'Ố', 'ố', 'Ồ', 'ồ', 'Ổ', 'ổ', 'Ỗ', 'ỗ', 'Ộ',
           'ộ', 'Ớ', 'ớ', 'Ờ', 'ờ', 'Ở', 'ở', 'Ỡ', 'ỡ', 'Ợ', 'ợ', 'Ụ', 'ụ',
           'Ủ', 'ủ', 'Ứ', 'ứ', 'Ừ', 'ừ', 'Ử', 'ử', 'Ữ', 'ữ', 'Ự', 'ự', 'Ý', 'Ỳ', 'Ỵ', 'ỳ', 'ỵ', 'ý'};

        private static List<char> REPLACEMENTS =new List<char> { '-', '\0', '\0', '\0', '\0', '\0',
           '\0', '_', '\0', '_', '\0', '\0', '\0', '\0', '\0', '\0', '_',
           '\0', '\0', '\0', '\0', '\0', 'A', 'A', 'A', 'A', 'E', 'E', 'E',
           'I', 'I', 'O', 'O', 'O', 'O', 'U', 'U', 'Y', 'a', 'a', 'a', 'a',
           'e', 'e', 'e', 'i', 'i', 'o', 'o', 'o', 'o', 'u', 'u', 'y', 'A',
           'a', 'D', 'd', 'I', 'i', 'U', 'u', 'O', 'o', 'U', 'u', 'A', 'a',
           'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A',
           'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'E', 'e', 'E', 'e',
           'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'I',
           'i', 'I', 'i', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o',
           'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O',
           'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u',
           'U', 'u', 'Y', 'Y', 'Y', 'y', 'y', 'y'};


        private String replaceAEIOU(String s)
        {
            int maxLength = Math.Min(s.Length, 236);
            char[] buffer = new char[maxLength];
            int n = 0;
            for (int i = 0; i < maxLength; i++)
            {
                char ch = s[i];
                int index = SPECIAL_CHARACTERS.BinarySearch(ch);
                if (index >= 0)
                {
                    buffer[n] = REPLACEMENTS[index];
                }
                else
                {
                    buffer[n] = ch;
                }
                // skip not printable characters
                if (buffer[n] > 31)
                {
                    n++;
                }
            }

            // skip trailing slashes
            while (n > 0 && buffer[n - 1] == '/')
            {
                n--;
            }
            return new String(buffer);
        }

        private List<String> banList = new List<string>() {"là cái gì", "như thế nào", "cho mình hỏi", "cho hỏi","là gì","là sao","bạn","tôi","tui","tớ","là"};

        private String removeCommonstr(String str)
        {
            foreach (String rms in banList)
            {
               str =  str.Replace(rms, "");
            }
            return str;
        }

        private string replaceKeyword(OOPEZZ_DBEntities db, string str)
        {
            List<KEYWORD> keywords = db.KEYWORD.Where(x => x.STATUS == 1).OrderByDescending(x => x.ORDER).ToList();
            foreach (KEYWORD kw in keywords)
            {
                str = str.Replace(kw.EN.ToLower().Trim(), kw.VI.ToLower().Trim());
            }
            return str;
        }

        private int LevenshteinDistance(List<String> s , List<String> t)
        {
            int n = s.Count;
            int m = t.Count;
            int[,] d = new int[n + 1, m + 1];
            if (n == 0)
            {
                return m;
            }

            if (m == 0)
            {
                return n;
            }
            for (int i =  0; i <= n; i++)
            {
                d[i, 0] = i;
            }
            for (int j = 0; j <= m; j++)
            {
                d[0, j] = j;
            }
            for (int i = 1; i <= n; i++)
            {
                for (int j = 1; j <= m; j++)
                {
                    int cost = (t.ElementAt(j - 1).Equals(s.ElementAt(i - 1))) ? 0 : 1;

                    d[i, j] = Math.Min(
                        Math.Min(d[i - 1, j] + 1,
                        d[i, j - 1] + 1),
                        d[i - 1, j - 1] + cost);
                }
            }
            return d[n, m];
        }

        public bool calculateResultisAvaiable(int lvtDistance, List<String> input)
        {
            if (input.Count < 3)
            {
                if (lvtDistance == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                if (lvtDistance < input.Count /3)
                {
                    return true;
                }
                return false;
            }
        }
      
//=============================================================================================================
        public void ProgressCommonRequest(BotMessageReceivedRequest botMessage)
        {
            String mess = botMessage.message.text.ToLower();

            OOPEZZ_DBEntities db = new OOPEZZ_DBEntities();

            try
            {
                if (mess.StartsWith("[ques]"))
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

                }else
            if (mess.StartsWith("[process]"))
                {

                }
                else
                    _question(db, botMessage);

            }
            catch (Exception e)
            {
                Console.WriteLine("exeption "+e.ToString());
            }
            
            db.Dispose();
        }

        private void _help(OOPEZZ_DBEntities db, BotMessageReceivedRequest botMessage)
        {
            String json = fbTemplate.SimpleTextTemplate(botMessage.sender.id,"Chào bạn");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "OOPEzz là bot chat hỗ trợ bạn học môn lập trình hướng đối tượng bằng ngôn ngữ C++ của trường Đại học Công Thông tin");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Chatbot có thể giúp bạn trả lời những câu hỏi xung quanh C++, OOP. Bạn chỉ cần hỏi và mình sẽ tìm câu trả lời phù hợp nhất");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Để xem được menu bài học chat [menu]");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Để hiện lại bảng hướng dẫn chat [help]");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(botMessage.sender.id, "Để xem tiến độ học tập chat [process] (upcomming)");
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
            USER user = db.USER.Where(x => x.TOKEN == botMessage.sender.id).FirstOrDefault();
            int userpkseq = 0;
            if (user==null)
            {
                user = new USER
                {
                    STATUS = 1,
                    TOKEN = botMessage.sender.id,
                    USERNAME = ""
                };
                db.SaveChanges();
                userpkseq = db.USER.Add(user).PK_SEQ;
    
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
            mess = removeCommonstr(mess);
            mess = mess.Trim();
            mess = replaceKeyword(db, mess);
            mess = replaceAEIOU(mess);
            char[] charac = { '-' };
            List<String> strques = mess.Split(charac).ToList();


            List<QUESTION> questionlist = db.QUESTION.ToList();
            int maxCompare = 10000;
            QUESTION result = null;
            foreach (QUESTION question in questionlist)
            {
                List<String> ques = replaceAEIOU(question.QUESTION_TEXT.ToLower()).Split(charac).ToList();
                int resultLength = LevenshteinDistance(strques, ques);
                if (resultLength < maxCompare)
                {
                    maxCompare = resultLength;
                    result = question;
                }
            }

            if (!calculateResultisAvaiable(maxCompare, replaceAEIOU(result.QUESTION_TEXT.ToLower()).Split(charac).ToList()) || result == null)
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
            int maxCompare = 10000;
            char[] charac = { '-' };
            List<GROUP_CONTENT> gcontents = db.GROUP_CONTENT.ToList();
            List<GROUP_CONTENT> gresult = new List<GROUP_CONTENT>();
            maxCompare = 1000;
            foreach (GROUP_CONTENT goupcontent in gcontents)
            {
                List<String> gStrStr = replaceAEIOU(goupcontent.NAME.ToLower()).Split(charac).ToList();
                int resultLength = LevenshteinDistance(strques, gStrStr);
                if (calculateResultisAvaiable(resultLength, gStrStr))
                {
                    gresult.Add(goupcontent);
                }
               
            }
            //Tìm xong  => post
            if (linkedques != null)
            {
                _postQuestion(db, linkedques, mess);

            }
            else
            {
                _postNoQuest(mess);
            }
            //post group content
            if (gresult.Count>0)
            {
                String json = fbTemplate.SimpleTextTemplate(mess.sender.id, "Ngoài ra mình kiếm được 1 số bài học cho bạn");
                _post(json);
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
          

        }

        private void _postQuestion(OOPEZZ_DBEntities db, QUESTION question,BotMessageReceivedRequest mess)
        {
            ANSWER answer = db.ANSWER.Where(x => x.QUESTION_FK == question.PK_SEQ).OrderByDescending(x => x.STATUS).First() ;

            String json = "";
            json = fbTemplate.SimpleTextTemplate(mess.sender.id, "Câu hỏi : ");
            _post(json);
            json = fbTemplate.SimpleTextTemplate(mess.sender.id, question.QUESTION_TEXT);
            _post(json);

            String answer_pkseq_contents = answer.ANSWER_TEXT;
            char[] charac = { '#' };
            List<String> pkseqs = answer_pkseq_contents.Split(charac).ToList();
            List<CONTENT> contents = new List<CONTENT>();
            foreach (String pkseq in pkseqs)
            {
                int pk= int.Parse(pkseq);
                CONTENT ct = db.CONTENT.Where(x => x.PK_SEQ == pk).First();
                contents.Add(ct);
            }
            _sendContentList(db, contents, mess.sender.id);


            //json = fbTemplate.ButtonTemplate(mess.sender.id, "Bấm nút bên dưới để tiếp tục bài học nhé", new List<ResponseButtons>() {
            //    new ResponseButtons()
            //    {
            //        type = "postback",
            //        title = "Tiếp tục bài học",
            //        payload = ""
            //    }
            //});
        }

        private void _postNoQuest(BotMessageReceivedRequest mess)
        {
            String json = fbTemplate.SimpleTextTemplate(mess.sender.id,"Hiện tại không có câu hỏi tương tự, để đặt câu hỏi soạn tin nhắn với từ khóa '[QUES]' ơ đầu tin ");
            _post(json);
        }
    }
}