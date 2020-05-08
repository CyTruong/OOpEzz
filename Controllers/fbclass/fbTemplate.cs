using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OE.fbclass.fbTemplate
{
    public  class fbTemplate
    {
      
        public static String SimpleTextTemplate(String recipientId, String text)
        {

            BotMessageResponse response = new BotMessageResponse
            {
                recipient = new BotUser { id = recipientId },
                message = new MessageResponse
                {
                    text = text
                }
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.None,
                           new JsonSerializerSettings
                           {
                               NullValueHandling = NullValueHandling.Ignore
                           });
        }

        public static String GenericTemplate(String recipientId,String title,String subtitle,String imageS,List<ResponseButtons> list)
        {
            BotMessageResponse response = new BotMessageResponse {
                recipient = new BotUser { id = recipientId },
                message = new MessageResponse
                {
                   
                    attachment = new MessageAttachment
                    {
                        type = "template",
                        payload = new MessageAttachmentPayLoad
                        {
                            template_type = "generic",
                            elements = new List<PayloadElements>
                            {
                                new PayloadElements
                                {
                                    title = title,
                                    image_url = imageS,
                                    subtitle = subtitle,
                                    buttons = list
                                }
                            },
                                                       
                        }
                    }
                }
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.None,
                            new JsonSerializerSettings
                            {
                                NullValueHandling = NullValueHandling.Ignore
                            });
        }


        public static String OptionPosbackTemplate(String recepid,String content)
        {
            char[] spa = { '#' };
            String[] arr = content.Split(spa);
            int i = 0;
            String title = arr[0];
            List<ResponseButtons> listbutton= new List<ResponseButtons>();
            while (i+2 < arr.Length)
            {
                ResponseButtons bt = new ResponseButtons
                {
                    type = "postback",
                    title = arr[i + 1],
                    payload = arr[i + 2]

                };
                i = i + 2;
                listbutton.Add(bt);
            }
            return ButtonTemplate(recepid,title,listbutton);
        }

        public static String ButtonTemplate(String recepid,  String text, List<ResponseButtons> list)
        {
            BotMessageResponse response = new BotMessageResponse
            {
                recipient = new BotUser { id = recepid },
                message = new MessageResponse
                {
                    attachment = new MessageAttachment
                    {
                        type = "template",
                        payload = new MessageAttachmentPayLoad
                        {
                            template_type = "button",
                            text = text,
                            buttons = list
                        }
                    }
                }
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.None,
                            new JsonSerializerSettings
                            {
                                NullValueHandling = NullValueHandling.Ignore
                            });

        }

        public static String ImageUrlTemplate(String recepid, String uri)
        {
            BotMessageResponse response = new BotMessageResponse
            {
                recipient = new BotUser { id = recepid },
                message = new MessageResponse
                {
                    attachment = new MessageAttachment
                    {
                        type = "image",
                        payload = new MessageAttachmentPayLoad
                        {
                            url = uri
                          
                        }
                    }
                }
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.None,
                       new JsonSerializerSettings
                       {
                           NullValueHandling = NullValueHandling.Ignore
                       });
        }

        public static String ListTemplate(String receiveid,List<PayloadElements> elementslist,List<ResponseButtons> bts = null)
        {
            BotMessageResponse response = new BotMessageResponse
            {
                recipient = new BotUser { id = receiveid },
                message = new MessageResponse
                {
                    attachment = new MessageAttachment
                    {
                        type = "template",
                        payload = new MessageAttachmentPayLoad
                        {
                            template_type = "list",
                            top_element_style = "compact",
                            elements = elementslist,
                            buttons = bts
                        }
                    }
                }
            };
            return Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.None,
                      new JsonSerializerSettings
                      {
                          NullValueHandling = NullValueHandling.Ignore
                      });
        }
    }
}   