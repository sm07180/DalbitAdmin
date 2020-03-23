package com.dalbit.util;

import com.dalbit.common.code.ErrorStatus;
import com.dalbit.exception.GlobalException;
import lombok.var;
import okhttp3.*;

import java.io.IOException;

public class OkHttpClientUtil {

    public static final MediaType JSON = MediaType.get("application/json; charset=utf-8");

    // one instance, reuse
    OkHttpClient client = new OkHttpClient();

    public String sendGet(String url) throws Exception {

        Request request = new Request.Builder()
                .url(url)
                /*.addHeader("custom-key", "mkyong")  // add request headers
                .addHeader("User-Agent", "OkHttp Bot")*/
                .build();

        try (Response response = client.newCall(request).execute()) {
            return response.body().string();
        }

    }

    public Response sendPost(String url, RequestBody formBody) throws GlobalException {
        try{

            Request request = new Request.Builder()
                    .url(url)
                    .post(formBody)
                    .build();

            Call call = client.newCall(request);
            Response response = call.execute();

            return response;
        }catch (Exception e){
            throw new GlobalException(ErrorStatus.잘못된호출);
        }

    }

}
