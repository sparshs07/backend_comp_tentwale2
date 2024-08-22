package utils;

import java.util.Random;

import java.io.IOException;
import java.io.InputStream;


import javax.json.Json;

public class AppUtility { 
    


    public static String generateOTP() {
        return Integer.toString(new Random().nextInt(888889) + 111111);
    }

    public static boolean checkGoogleRecaptchaResponse(String recaptchaURL,String secretKey,String responseToken) throws IOException{
        String url= recaptchaURL+"?secret="+secretKey+"&response="+responseToken;
        InputStream is=ThirdPartyServer.sendThirdPartyRequest(url);
        return Json.createReader(is).readObject().getBoolean("success");
    }
}
