package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.GoodsDTO;
import kr.co.service.GoodsService;

@Controller
@RequestMapping("goods")
public class GoodsController {
  @Inject
  private GoodsService gooService;

  @RequestMapping(value = "/update", method = RequestMethod.POST)
  public String update(GoodsDTO gDto) {
    gooService.update(gDto);

    return "redirect:/goods/list";
  }

  @RequestMapping(value = "/update/{gno}", method = RequestMethod.GET)
  public String updateui(Model model, @PathVariable("gno") int gno) {
    GoodsDTO gDto = gooService.updateUI(gno);
    List<GoodsDTO> clist = gooService.clist();
    
    model.addAttribute("gDto", gDto);
    model.addAttribute("clist", clist);

    return "goods/update";
  }

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void list(Model model) {
    List<GoodsDTO> glist = gooService.list();

    model.addAttribute("list", glist);
  }

  @RequestMapping(value = "/insert", method = RequestMethod.POST)
  public String insert(GoodsDTO gDto) {

    gooService.insert(gDto);

    return "redirect:/goods/list";
  }

  @RequestMapping(value = "/insert", method = RequestMethod.GET)
  public void insert(Model model) {
    List<GoodsDTO> clist = gooService.clist();
    model.addAttribute("clist", clist);
  }

  /* 제품번호 중복체크 */
  @ResponseBody
  @RequestMapping(value = "/gooChk", method = RequestMethod.POST)
  public int gooChk(GoodsDTO gDto) {
    int result = gooService.gooChk(gDto);
    return result;
  }
}
