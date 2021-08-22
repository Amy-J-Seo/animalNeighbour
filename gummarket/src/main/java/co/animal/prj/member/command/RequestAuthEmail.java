package co.animal.prj.member.command;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.common.Command;

public class RequestAuthEmail implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String inputedEmail = request.getParameter("email");

		// 인증코드 생성
		String AuthenticationKey = authCodeMaker();

		// mail server 설정
		String host = "smtp.gmail.com";
		String user = "gkwlal3@gmail.com"; // 자신의 구글 계정
		String password = "wprkffid@123";// 자신의 구글 패스워드

		// 메일 받을 주소
		String to_email = inputedEmail;
		System.out.println("inputedEmail : " + inputedEmail);

		// SMTP 서버 정보를 설정한다.
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", host);
		// google - TLS : 587, SSL: 465
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.debug", "true");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		MimeMessage msg = new MimeMessage(session);

		// email 전송
		try {
			msg.setFrom(new InternetAddress(user));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("[개껌장터] 인증번호를 안내 드립니다.", "UTF-8");
			// 메일 내용
			msg.setText("인증번호를 안내 드립니다.\r\n"
					+ "\r\n"
					+ "안녕하세요.개껌장터 입니다.\r\n"
					+ "요청하신 인증번호를 안내 드립니다.\r\n"
					+ "아래번호를 인증번호 입력란에 입력해 주세요.\r\n"
					+ "\r\n"
					+ "인증 번호 :" + AuthenticationKey);

			Transport.send(msg);
			System.out.println("이메일 전송 : " + AuthenticationKey);

			request.setAttribute("AuthenticationKey", AuthenticationKey);

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson gson = new GsonBuilder().create();

		try {
			response.getWriter().print(gson.toJson(AuthenticationKey));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "json";

//		return "login/registerForm";
	}

	private String authCodeMaker() {
		String authCode = null;

		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}

		authCode = temp.toString();
		System.out.println(authCode);

		return authCode;
	}

}
