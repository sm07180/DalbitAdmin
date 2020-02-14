package com.dalbit;

import com.dalbit.sample.service.SampleService;
import com.dalbit.util.AES;
import com.dalbit.util.CipherUtil;
import com.dalbit.util.RestApiUtil;
import com.dalbit.sample.vo.SampleVo;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.security.Security;

@Slf4j
@SpringBootTest
@ActiveProfiles({"local"})
public class SampleVoTest {

    /*@Value("${active.profile.name}")
    private String profileName;

    @Autowired
    private SampleService sampleService;

    @Test
    public void test(){
        log.debug(profileName);
    }

    @Test
    public void 암복호화테스트() throws Exception {

        final String secretKey = "ssshhhhhhhhhhh!!!!";

        Security.setProperty("crypto.policy", "unlimited");

        String text = "안녕하세요";

        String encText = AES.encrypt(text, secretKey);
        log.debug(encText);

        String decText = AES.decrypt(encText, secretKey);
        log.debug(decText);
    }

    @Test
    public void 단방향암호화() throws Exception {
        String text = "1234";
        String salt = "leejaeho";
        String salt2 = "leejaeho1";

        log.debug(CipherUtil.encryptSha(CipherUtil.CIPHER_ALGORITHM.SHA256, text));
        log.debug(CipherUtil.encryptSha(CipherUtil.CIPHER_ALGORITHM.SHA256, text));

        log.debug(CipherUtil.encryptSha(CipherUtil.CIPHER_ALGORITHM.SHA512, text));
        log.debug(CipherUtil.encryptSha(CipherUtil.CIPHER_ALGORITHM.SHA512, text));

        log.debug(CipherUtil.encryptSha256WithSalt(text, salt));
        log.debug(CipherUtil.encryptSha256WithSalt(text, salt));
        log.debug(CipherUtil.encryptSha256WithSalt(text, salt2));
        log.debug(CipherUtil.encryptSha256WithSalt(text, salt2));


        log.debug(CipherUtil.encryptSha256WithSalt("leejaeho114", "1234"));
        log.debug(CipherUtil.encryptSha256WithSalt("leejaeho114", "1234"));
    }

    @Test
    public void 트랜젝션(){
        SampleVo sampleVo = new SampleVo();
        sampleVo.setId("transaction");
        sampleVo.setName("테스트");
        sampleVo.setAge(20);

        sampleService.transactionTest(sampleVo);
    }

    @Test
    public void restApi테스트(){
        RestApiUtil.sendGet("https://devm-leejaeho1144.wawatoc.com/errorTestData");
    }

    @Test
    public void restApiPOST테스트(){
        RestApiUtil.sendPost("https://devm-leejaeho1144.wawatoc.com/sample", "");
    }*/
}
