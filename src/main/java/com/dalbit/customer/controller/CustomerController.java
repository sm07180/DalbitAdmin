package com.dalbit.customer.controller;

import com.dalbit.customer.service.DeclarationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    DeclarationService declarationService;

    @GetMapping("/blockAdm/list")
    public String blockAdmList() {
        return "customer/blockAdm/list";
    }

    /**
     * profile List
     * @param model
     * @return
     */
    @GetMapping("/image/list")
    public String imageList(Model model) {
        return "customer/image/list";
    }

    @RequestMapping("/image/popup/imagePopup")
    public String imageReportPopup(Model model) { return "customer/image/popup/imagePopup"; }

    /**
     * Question List
     * @param model
     * @return
     */
    @GetMapping("/question/list")
    public String list(Model model) {
        return "customer/question/list";
    }

    @GetMapping("/restrictions/list")
    public String restrictionsList(Model model) {
        return "customer/restrictions/list";
    }

    @GetMapping("/sms/list")
    public String smsList(Model model) {
        return "customer/sms/list";
    }

    @RequestMapping("/sms/popup/smsSendPopup")
    public String smsPopup(Model model, HttpServletRequest request) {
        return "customer/sms/popup/smsSendPopup";
    }

    @GetMapping("/question/macro")
    public String macro(Model model) {
        return "customer/question/macro";
    }

    /**
     * Declaration List
     * @param model
     * @return
     */
    @GetMapping("/declaration/list")
    public String declarationList(Model model) {
        return "customer/declaration/list";
    }

    @RequestMapping("/declaration/popup/declarationPopup")
    public String declarationPopup(Model model) {
        return "customer/declaration/popup/declarationPopup";
    }

    @GetMapping("/declaration/image")
    public String declarationImage(Model model) {
        return "customer/declaration/image";
    }

    @RequestMapping("/declaration/popup/reportPopup")
    public String imagePopup(Model model, HttpServletRequest request) {
        return "customer/declaration/popup/reportPopup";
    }

    /**
     * 미성년자 메일 발송 내역
     */
    @RequestMapping("/send/mail/log/list")
    public String sendMailLogList(Model model) {
        return "customer/sendMailLog/list";
    }

    /**
     * 미성년자 메일 발송 내용 (팝업)
     */
    @GetMapping("/send/mail/detail/agree/pop")
    public String sendMailDetailAgreePop(Model model, @RequestParam(value = "mailEtc", defaultValue = "") String mailEtc) {
        model.addAttribute("mailEtc", mailEtc);
        return "customer/sendMailLog/mailAgreeDetailPop";
    }

    @RequestMapping("/send/mail/detail/pay/pop")
    public String sendMailDetailPayPop(Model model, @RequestParam(value = "mailEtc", defaultValue = "") String mailEtc) {
        model.addAttribute("mailEtc", mailEtc);
        return "customer/sendMailLog/mailPayDetailPop";
    }

    @RequestMapping("/send/mail/detail/cancel/pop")
    public String sendMailDetailCancelPop(Model model, @RequestParam(value = "mailEtc", defaultValue = "") String mailEtc) {
        model.addAttribute("mailEtc", mailEtc);
        return "customer/sendMailLog/mailCancelDetailPop";
    }
}
