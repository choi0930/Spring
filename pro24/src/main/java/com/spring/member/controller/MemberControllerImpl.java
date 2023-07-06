package com.spring.member.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.spring.member.service.MemberService;
import com.spring.member.service.MemberServiceImpl;
import com.spring.member.vo.MemberVO;

public class MemberControllerImpl extends MultiActionController implements MemberController {
	private MemberService memberService;
	public void setMemberService(MemberServiceImpl memberServie) {
		this.memberService = memberServie;
	}
	@Override
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}

	@Override
	public void addMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email1 =request.getParameter("email1");
		String email2=request.getParameter("email2");
		String email3= request.getParameter("email3");
		String email = "";
		if(email3.equals("choose") || email3.equals("self")) {
			email = email1+"@"+email2;
		}else {
			email = email1+"@"+email3;
		}
		MemberVO memberVO = new MemberVO(id, pwd, name, email);
		int result=0;
		result = memberService.addMember(memberVO);
		out.write("<script>");
		out.write("alert('회원가입 완료');");
		out.write("location.href='"+request.getContextPath()+"/member/listMembers.do';");
		out.write("</script>");
		return;	
		
		//ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		
		//return mav;
	}

	@Override
	public ModelAndView removeMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/member/listMembers.do");
		return mav;
	}

	public ModelAndView form(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	public void checkId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		MemberVO memberVO = memberService.selectMemberById(id);
		if(memberVO != null) {
			out.print("no-usable");
		} else {
			out.print("usable");
		}
		return;
	}
	
	
	@Override
	public ModelAndView modForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String id = request.getParameter("id");
		String viewName = getViewName(request);
		MemberVO memberVO = memberService.selectMemberById(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberVO", memberVO);
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@Override
	public void modMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		MemberVO memberVO = new MemberVO();
		bind(request,memberVO);
		memberService.updateMember(memberVO);
		PrintWriter out = response.getWriter();
		out.write("<script>");
		out.write("alert('수정 완료');");
		out.write("location.href='"+request.getContextPath()+"/member/listMembers.do';");
		out.write("</script>");
		return;	
	}
	
	private String getViewName(HttpServletRequest request) {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		System.out.println(contextPath);
		System.out.println(uri);
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		
		int begin = 0;
		if(!((contextPath==null)||("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		
		int end;
		if(uri.indexOf(";")!=-1) {
			end=uri.indexOf(";");
		} else if(uri.indexOf("?")!= -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		String fileName = uri.substring(begin, end);
		System.out.println(fileName);
		if(fileName.indexOf(".")!= -1) {
			fileName = fileName.substring(0,fileName.lastIndexOf("."));
		}
		if(fileName.lastIndexOf("/")!= -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/"), fileName.length());
		}
		System.out.println(fileName);
		return fileName;
	}
}
