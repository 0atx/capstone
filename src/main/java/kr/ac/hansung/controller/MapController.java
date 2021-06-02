package kr.ac.hansung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MapController {
	@RequestMapping("/busan_map")
	public String showBusanMap() { 
		
		return "busan_map";
	}
	@RequestMapping("/andong_map")
	public String showAndongMap() { 
		
		return "andong_map";
	}
	@RequestMapping("/gangneung_map")
	public String showGangneungMap() { 
		
		return "gangneung_map";
	}
	@RequestMapping("/jeonju_map")
	public String showJeonjuMap() { 
		
		return "jeonju_map";
	}

}