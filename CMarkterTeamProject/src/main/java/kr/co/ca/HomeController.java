package kr.co.ca;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

  @RequestMapping("/intertest1")
  public void intertest1() {
    System.out.println("<<<<<<<<<intertest1>>>>>>>>>");
  }

  @RequestMapping("test5")
  public void test5(@ModelAttribute("str2") String mm) {
    System.out.println(mm);

  }

  @RequestMapping("test4") // http://localhost:8089/test5 뒤에 주소가 없음
  public String test4(RedirectAttributes rtts) {

    rtts.addFlashAttribute("str2", "who");
    return "redirect:/test5";
  }

  @RequestMapping("test2") // http://localhost:8089/test3 뒤에 주소가 있음
  public String test2(Model model) {
    model.addAttribute("str1", "what");
    return "redirect:/test3";
  }

  @RequestMapping("test1")
  public String test1(Model model) {

    model.addAttribute("msg", "!~!~!~!~!~!");

    return "test1";
  }

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(Locale locale, Model model) {
    logger.info("Welcome home! The client locale is {}.", locale);

    Date date = new Date();
    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

    String formattedDate = dateFormat.format(date);

    model.addAttribute("serverTime", formattedDate);

    return "home";
  }

  /**
   * Tiles를 사용하지 않은 일반적인 형태
   */
  @RequestMapping("/test.do")
  public String test() {
    return "test";
  }

  /**
   * Tiles를 사용(header, left, footer 포함)
   */
  @RequestMapping("/testPage.do")
  public String testPage() {
    return "test.page";
  }

  /**
   * Tiles를 사용(header, left, footer 제외)
   */
  @RequestMapping("/testPart.do")
  public String testPart() {
    return "test.part";
  }

}
