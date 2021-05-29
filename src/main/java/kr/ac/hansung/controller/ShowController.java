package kr.ac.hansung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShowController {
	@RequestMapping("/show")
	public String showMap() { 
		
		return "show";
	}

}