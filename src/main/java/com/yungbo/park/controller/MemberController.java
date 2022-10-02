package com.yungbo.park.controller;

import com.yungbo.park.model.MemberDAO;
import com.yungbo.park.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MemberController {

    @Autowired
    private MemberDAO dao;

    /*MemberDAO 에다 @Repository 하면 spring 에서 자동으로 메모리에 올려놓고 */

    @RequestMapping("/memberList.do")
    public String memberList(Model model) { //기본적으로 spring은 request, response를 받을 필요가 없다
        List<MemberVO> list = dao.memberList();
        // 객체바인딩
        model.addAttribute("list", list);
        return "memberList";
    }

    @RequestMapping("/memberInsert.do")
    public String memberInsert(MemberVO vo) { //기본적으로 spring은 request, response를 받을 필요가 없다
        //Parameter 수집(VO)



        return "redirect:/memberList.do";
    }

    @RequestMapping("/memberRegister.do")
    public String memberRegister() { //기본적으로 spring은 request, response를 받을 필요가 없다



        return "memberRegister";
    }

    @RequestMapping("/mapperTest.do")
    public String mapperTest() {

        String s = dao.mapperTest();

        System.out.println("s = " + s);
        return "success";
    }



}
