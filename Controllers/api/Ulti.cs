using OE.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OE.Controllers.api
{
    public static class Ulti
    {
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

        private static List<char> REPLACEMENTS = new List<char> { '-', '\0', '\0', '\0', '\0', '\0',
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


        public static String replaceAEIOU(String s)
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

        private static List<String> banList = new List<string>() { "là cái gì", "như thế nào", "cho mình hỏi", "cho hỏi", "là gì", "là sao", "tôi", "tui", "tớ", "là" };

        public static String removeCommonstr(String str)
        {
            foreach (String rms in banList)
            {
                str = str.Replace(rms, "");
            }
            return str;
        }

        public static string replaceKeyword(OOPEZZ_DBEntities db, string str)
        {
            List<KEYWORD> keywords = db.KEYWORD.Where(x => x.STATUS == 1).OrderByDescending(x => x.ORDER).ToList();
            foreach (KEYWORD kw in keywords)
            {
                str = str.Replace(kw.EN.ToLower().Trim(), kw.VI.ToLower().Trim());
            }
            return str;
        }

        public static int LevenshteinDistance(List<String> s, List<String> t)
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
            for (int i = 0; i <= n; i++)
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

        public static bool calculateResultisAvaiable(int lvtDistance, List<String> input)
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
                float minDis = (float)input.Count / 3;
                if (lvtDistance < Math.Ceiling(minDis))
                {
                    return true;
                }
                return false;
            }
        }

        public static string UnicodeDecode(String text)
        {
            return System.Text.RegularExpressions.Regex.Unescape(text);

        }
    }
}