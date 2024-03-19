//package com.ogae.impl;
//
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.mail.javamail.MimeMessagePreparator;
//import org.springframework.stereotype.Service;
//
//import com.ogae.service.SendService;
//import com.ogae.vo.MailVO;
//
//@Service
//public class SendServiceImpl implements SendService {
//	
//	@Autowired
//	private JavaMailSender mailSender;
//
//	@Override
//	public void sendMail(MailVO vo) {
//		MimeMessagePreparator preparator = new MimeMessagePreparator() {
//			
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//				helper.setFrom(new InternetAddress(vo.getFrom()));
//				helper.setTo(new InternetAddress(vo.getTo()));
//				helper.setSubject(vo.getSubject());
//				helper.setText(vo.getContent());
//			}
//		};
//		mailSender.send(preparator);
//	}
//
//}
