package com.ogae.web;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * Password Encode Test
 * @author JIN
 *
 */
public class BCryptPasswordEncoderTest {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Test
	public void encodeTest() {
		String password = "admin";
		passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		
		System.out.println(hashedPassword);
		
		boolean isPasswordMatch = passwordEncoder.matches(password, hashedPassword);
		System.out.println(isPasswordMatch);
	}
}
