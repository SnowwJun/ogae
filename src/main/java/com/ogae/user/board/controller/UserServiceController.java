package com.ogae.user.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserServiceController {
	
	@GetMapping("/Barbecue.do")
	public String BarbecueView() {
		return "service/Barbecue";
	}
	@GetMapping("/PartyPlaceRental.do")
	public String PartyPlaceRentalView() {
		return "service/PartyPlaceRental";
	}
	@GetMapping("/Dogammenities.do")
	public String DogammenitiesView() {
		return "service/Dogammenities";
	}
	@GetMapping("/CoffeeandTea.do")
	public String CoffeeandTeaView() {
		return "service/CoffeeandTea";
	}
}
