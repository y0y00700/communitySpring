package com.signForm.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.signForm.domain.AdminVO;
import com.signForm.domain.Criteria;
import com.signForm.domain.PageDTO;
import com.signForm.domain.UserVO;
import com.signForm.service.AdminService;
import com.signForm.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
public class AdminController {
	private AdminService service;
	private UserService userService;
	@GetMapping("/login")
	public void adminLogin() {
		log.info("관리자 로그인 페이지로 이동");
	}
	@GetMapping("/loginSuccess")
	public void loginSuccess() {
		log.info("관리자 메인페이지로 이동");
	}
	
	@GetMapping("/userManagingAjax")
	public void userManagingAjax() {
		log.info("(Ajax)회원관리 페이지로 이동");
	}
	
	@GetMapping("/userManaging")
	public void userManaging(Model model,Criteria cri) {
		log.info("(일반)회원관리 페이지로 이동");
		model.addAttribute("user",userService.getList(cri));
		int total=userService.getTotalCount(cri);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
		
	}
	
	@PostMapping("/login")
	public ModelAndView adminLogin(ModelAndView mav,AdminVO avo,RedirectAttributes rttr,HttpServletRequest request) {
		boolean result=service.login(avo);
		if(result) {
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			mav.addObject("id",id);
			rttr.addFlashAttribute("message","관리자 로그인에 성공하였습니다.");
			mav.setViewName("redirect:/admin/loginSuccess");
		}else {
			rttr.addFlashAttribute("message","ID/PW를 다시 확인해주세요");
			mav.setViewName("redirect:/admin/login");
		}
		return mav;
	}
	
	//ajax 처리 (@Controller)
	@PostMapping(value="/requestUser",produces= {MediaType.APPLICATION_JSON})
	@ResponseBody
	public ResponseEntity<List<UserVO>> userList(){
		Criteria cri = new Criteria();
		log.info(cri);
		log.info(userService.getList(cri));
		return new ResponseEntity<>(userService.getList(cri),HttpStatus.OK);
	}
}
