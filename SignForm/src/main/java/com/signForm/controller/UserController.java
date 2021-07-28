package com.signForm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.signForm.domain.UserVO;
import com.signForm.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/user/*")
public class UserController {
	private UserService service;
	
	@GetMapping("/login")
	public void login() {
		log.info("로그인 폼으로 이동");
	}
	
	@GetMapping("/sign")
	public void sign() {
		log.info("회원가입 폼으로 이동...");
	}
	
	@GetMapping("/loginSuccess")
	public void loginSuccess() {
		log.info("로그인성공 메인 페이지 이동...");
	}
	
	@PostMapping("/sign")
	public String sign(UserVO user,RedirectAttributes rttr) {
		log.info(user.getBirth()+"회원가입 전송폼");	
		service.sign(user);
		rttr.addFlashAttribute("message","회원가입을 축하합니다.");
		return "redirect:/user/login";
	}
	
	@PostMapping("/login")
	public String login(UserVO user,Model model,HttpServletRequest request) {
		log.info("loginAccess...");
		boolean result=service.login(user);
		if (result) {
			HttpSession session=request.getSession();
			session.setAttribute("id", user.getId());
			model.addAttribute("message","환영합니다");
			model.addAttribute("name",user.getName());
			return "/user/loginSuccess";
		}else {
			model.addAttribute("message","ID와 비밀번호를 확인해주세요.");
			return "/user/login";
		}
	}
		
	@GetMapping({"/userInfo","/modify"})
	public void userInfo(HttpServletRequest request,Model model,UserVO user) {
		log.info("회원정보 페이지로 이동");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		model.addAttribute("user",service.userInfo(id));
	}
	@PostMapping("/modify")
	public String modify(UserVO user,RedirectAttributes rttr) {
		log.info(user);
		boolean result=service.modify(user);
		log.info(result);
		if(result) {
			rttr.addFlashAttribute("message","수정이 성공적으로 완료되었습니다.");
			return "redirect:/user/userInfo";
		}else {
			log.info("수정 실패 에러...");
			return "redirect:/user/userInfo";
		}
	}
	@GetMapping("/delete")
	public String delete(HttpServletRequest request,RedirectAttributes rttr) {
		log.info("삭제 페이지로 이동됨");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		session.invalidate();
		boolean result=service.erase(id);
		if(result) {
			rttr.addFlashAttribute("message","회원탈퇴가 완료되었습니다.");
			return "redirect:/user/login";
		}else {
			rttr.addFlashAttribute("message","탈퇴처리중 오류가 발생하였습니다. 잠시후 다시 시도하여 주세요!");
			return "redirect:/user/userInfo";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpServletRequest request,Model model) {
		log.info("로그아웃이 시도됨");
		HttpSession session=request.getSession();
		session.invalidate();
		model.addAttribute("message","로그아웃 되었습니다.");
		return "/user/login";
	}
	@RequestMapping(value = "check", method = {RequestMethod.GET, RequestMethod.POST})
	public void check() {
		log.info("check페이지로 이동됨.");
	}
	@GetMapping("/overlap")
	public String overlap(@RequestParam("id") String id,Model model) {
		log.info("overlap 컨트롤러 가동"+id);
		boolean result=service.overlap(id);
		log.info("check 값:"+result);
		model.addAttribute("check",result);
		model.addAttribute("id",id);
		return "/user/check";
	}
	@GetMapping("/certifi")
	public void certifi(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		model.addAttribute("id",id);		
	}
	@PostMapping("/certifi")
	public void certifi(UserVO user,Model model) {
		log.info(user);
		boolean result=service.login(user);
		if(result) {
			model.addAttribute("result",result);
		}else {
			model.addAttribute("result",result);
		}
		
//		boolean result=service.login(user);
//		if(result) {
//			rttr.addFlashAttribute("message","인증이 완료되었습니다.");
//			mav.setViewName("/user/modify");
//		}else {
//			rttr.addFlashAttribute("message","비밀번호를 확인하여 주세요.");
//			mav.setViewName("/user/certifi");
//		}
//		return mav;
	}
	
	
}
