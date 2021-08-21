package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CampTipDTO;
import kh.spring.service.CampTipService;

@Controller
public class HomeController {
	
    @Autowired
    private CampTipService service;
	
	@RequestMapping("/")
	public String CampTip() {
		return "home";
	}
	
    @RequestMapping("selectAll")
    public ModelAndView selectAll() throws Exception {
    	List<CampTipDTO> list = service.selectAll();
    	
    	ModelAndView model = new ModelAndView();
    	model.setViewName("CampTip/CampTip");
    	model.addObject("list",list);
    	return model;
    }
	
}