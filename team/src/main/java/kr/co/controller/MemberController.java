package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("member")
@SessionAttributes({ "login" })
public class MemberController {
  @Inject
  private MemberService memService;

  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(SessionStatus status) {

    status.setComplete();

    return "redirect:/board/mainPage.page";
  }

  @RequestMapping(value = "/loginpost", method = RequestMethod.POST)
  public String loginpost(LoginDTO login, Model model, HttpSession session) {

    MemberDTO mDto = memService.loginpost(login);
    List<MemberDTO> grlist = memService.grlist();
    
    if (mDto != null) {
      model.addAttribute("login", mDto);
      model.addAttribute("grlist", grlist);
      String path = (String) session.getAttribute("path");
      if (path != null) {
        return "redirect:" + path;
      }
      return "redirect:/board/mainPage.page";
    } else {
      return "redirect:/member/login.page";
    }

  }

  @RequestMapping(value = "/login.page", method = RequestMethod.GET)
  public String login() {
    return "member/login.page";
  }

//  @RequestMapping(value = "/forByUserDel.page/{id}", method = RequestMethod.GET)
//  public String forByUserDel(@PathVariable("id") String id) {
//    memService.forByUserDel(id);
//
//    return "redirect:/board/main.page";
//  }

  @RequestMapping(value = "/delete.page/{id}", method = RequestMethod.GET)
  public String delete(@PathVariable("id") String id) {
    memService.delete(id);

    return "redirect:/member/list.page";
  }

  @RequestMapping(value = "/update", method = RequestMethod.POST)
  public String update(MemberDTO mDto) {
    memService.update(mDto);

    return "redirect:/member/list.page";
  }

  @RequestMapping(value = "/update.page/{id}", method = RequestMethod.GET)
  public String updateui(Model model, @PathVariable("id") String id) {
    MemberDTO mDto = memService.updateUI(id);
    List<MemberDTO> grlist = memService.grlist();

    model.addAttribute("mDto", mDto);
    model.addAttribute("grlist", grlist);

    return "member/update.page";
  }

  @RequestMapping(value = "/read.page/{id}", method = RequestMethod.GET)
  public String read(Model model, @PathVariable("id") String id) {
    MemberDTO mDto = memService.read(id);

    model.addAttribute("mDto", mDto);

    return "member/read.page";
  }

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(Model model) {
    List<MemberDTO> mlist = memService.list();

    model.addAttribute("list", mlist);

    return "member/list.page";
  }

  @RequestMapping(value = "/insert", method = RequestMethod.POST)
  public String insert(MemberDTO mDto) {

    memService.insert(mDto);

    return "redirect:/board/mainPage.page";
  }

  @RequestMapping(value = "/insert", method = RequestMethod.GET)
  public String insert(Model model) {
    List<MemberDTO> grlist = memService.grlist();
    model.addAttribute("grlist", grlist);

    return "member/insert.page";
  }

  /* 아이디 중복체크 */
  @ResponseBody
  @RequestMapping(value = "/idChk", method = RequestMethod.POST)
  public int idChk(MemberDTO mDto) {
    int result = memService.idChk(mDto);
    return result;
  }
}