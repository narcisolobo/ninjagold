package com.nlobo.ninjagold.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class GoldController {
	Random random = new Random();
	
	@GetMapping("/")
	public String index(HttpSession session, Model model) {
		if (session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		
		if (session.getAttribute("activities") == null) {
			session.setAttribute("activities", new ArrayList<String>());
		}
		
		model.addAttribute("gold", session.getAttribute("gold"));
		model.addAttribute("activities", session.getAttribute("activities"));
		return "index.jsp";
	}
	
	@PostMapping("/calculate")
	public String calculate(
			@RequestParam("location") String location,
			HttpSession session) {
		System.out.println(location);
		int gold = (int) session.getAttribute("gold");
		
		if (location.equals("farm")) {
			gold = findGold("farm", 11, 10, true, session);
		}
		
		if (location.equals("cave")) {
			gold = findGold("cave", 6, 5, true, session);
		}
		
		if (location.equals("house")) {
			gold = findGold("house", 4, 2, true, session);
		}
		
		if (location.equals("quest")) {
			gold = quest(session);
			
		}
		
		System.out.println(gold);
		
		session.setAttribute("gold", (int) session.getAttribute("gold") + gold);
		
		
		return "redirect:/";
	}
	
	public int findGold(
			String location,
			int limit,
			int add,
			boolean isEarned,
			HttpSession session) {
		
		int gold = random.nextInt(limit) + add;
		String activity = createActivity(location, gold, isEarned);
		
		@SuppressWarnings("unchecked")
		ArrayList<String> activities = (ArrayList<String>) session.getAttribute("activities");
		activities.add(0, activity);
		session.setAttribute("activities", activities);
		
		if (isEarned) return gold;
		else {
			gold *= -1;
			return gold;
		}
	}
	
	public int quest(HttpSession session) {
		boolean isEarned = random.nextBoolean();
		int gold = findGold("quest", 51, 0, isEarned, session);
		return gold;
	}
	
	public String createActivity(String location, int gold, boolean isEarned) {
		LocalDateTime now = LocalDateTime.now();
		System.out.println("before formatting: " + now);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM d, yyyy 'at' h:m a");
		String formattedDate = now.format(formatter);
		System.out.println("after formatting: " + formattedDate);
		
		String activity = "<p ";
		if (isEarned) activity += "class=\"text-success mb-1\">";
		else activity += "class=\"text-danger mb-1\">";
		if (location.equals("quest")) {
			if (isEarned) {
				activity += "You completed a " + location + " and ";
			} else {
				activity += "You failed a " + location + " and ";
			}
		} else {			
			activity += "You entered a " + location + " and ";
		}
		if (isEarned) activity += "earned ";
		else activity += "lost ";
		activity += gold + " gold. (";
		activity += formattedDate;
		activity += ")</p>";
		
		System.out.println(activity);
		return activity;
	}
	
	@GetMapping("/reset")
	public String reset(HttpSession session) {
		session.setAttribute("gold", 0);
		session.setAttribute("activities", new ArrayList<String>());
		return "redirect:/";
	}
}
