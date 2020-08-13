package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.CategoryDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.MemberDTO;
import kr.co.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Inject
	private BoardService bService;
	
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String mainHome() {
		return "board/mainPage";
	}

	
	//어드민페이지
	@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	public void adminPage(Model model) {
		List<MemberDTO> memberList = bService.memberList();
		
		model.addAttribute("memberList", memberList);
	}
	
	//카테고리 등록/조회 페이지
	@RequestMapping(value = "/categoryInsert", method = RequestMethod.GET)
	public void categoryInsert(Model model) {
		List<CategoryDTO> categoryList = bService.categoryList();
		
		model.addAttribute("categoryList", categoryList);
	}
	
	//카테고리 등록
	@RequestMapping(value = "/categoryInsert", method = RequestMethod.POST)
	public String categoryInsert(CategoryDTO categoryDTO, RedirectAttributes redirectAttr) {
		//카테고리 중복확인
		int CategoryChk = bService.categoryChk(categoryDTO);
		
		if (CategoryChk == 0) {
			bService.categoryInsert(categoryDTO);
			return "redirect:/board/categoryInsert";
		} else {
			redirectAttr.addFlashAttribute("msg", "중복된 카테고리명 입니다.");
			return "redirect:/board/categoryInsert";
		}
	}
	
	//상품 등록/조회 페이지
	@RequestMapping(value = "/goodsInsert", method = RequestMethod.GET)
	public String goodsInsert(Model model) {
		List<CategoryDTO> categoryList = bService.categoryList();

		model.addAttribute("categoryList", categoryList);
		return "/board/goodsInsert";
	}
	
	//상품 등록
	@RequestMapping(value = "/goodsInsert", method = RequestMethod.POST)
	public String goodsInsert(GoodsDTO goodsDTO, RedirectAttributes redirectAttr) {
		//상품 중복확인
		int GoodsChk = bService.goodsChk(goodsDTO);
		
		if (GoodsChk == 0) {
			bService.goodsInsert(goodsDTO);
			return "redirect:/board/goodsInsert";
		} else {
			redirectAttr.addFlashAttribute("msg", "중복된 상품명 입니다.");
			return "redirect:/board/goodsInsert";
		}
	}
	
	//상품 리스트 ajax
	@ResponseBody
	@RequestMapping(value = "/selectGoods", method = RequestMethod.POST)
	public List<GoodsDTO> selectGoods(int cno) {
		List<GoodsDTO> goodsList = bService.goodsList(cno);
		
		return goodsList;
	}
	

}
