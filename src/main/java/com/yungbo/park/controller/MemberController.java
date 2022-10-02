package com.yungbo.park.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

    @RequestMapping("/memberList.do")
    public String memberList() { //기본적으로 spring은 request, response를 받을 필요가 없다
        System.out.println("MemberController.memberList");
        return "memberList";
    }


    @RequestMapping("/memberInsert.do")
    public String memberInsert() { //기본적으로 spring은 request, response를 받을 필요가 없다


        return "redirect:memberList.do";
    }

    @RequestMapping("/memberRegister.do")
    public String memberRegister() { //기본적으로 spring은 request, response를 받을 필요가 없다

        return "memberRegister";
    }



}
