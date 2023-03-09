package com.mycom.auction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

                /*  new com.twilio.type.PhoneNumber("+821041034815"),
                  new com.twilio.type.PhoneNumber("+15005550006"),*/
@Controller
public class SmsSender {

	    // Twilio 계정 SID와 인증 토큰
    public static final String ACCOUNT_SID = System.getenv("ACe840315512fc1acef77f62a3a118c3cb");
    public static final String AUTH_TOKEN = System.getenv("6f809560165ec851f98f5607b3e3f9ad");

    // Twilio trial 번호
    @GetMapping("/aa")
    public static void sendSms() {
    	 Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
         Message message = Message.creator(
                 new com.twilio.type.PhoneNumber("+821041034815"),
                 new com.twilio.type.PhoneNumber("+15005550006"),
                 "All in the game, yo")
             .create();
    }
}
  
  
  
