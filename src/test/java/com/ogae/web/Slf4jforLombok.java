package com.ogae.web;

import org.junit.Test;

import lombok.extern.slf4j.Slf4j;

/**
 * Log Test
 * @author JIN
 *
 */
@Slf4j
public class Slf4jforLombok {
	
	@Test
	public void logTest() {
		String str = "Log Test";
		log.debug("Data: {}", str);
		log.info("Data: {}", str);
		log.warn("Data: {}", str);
		log.error("Data: {}", str);
	}
}
