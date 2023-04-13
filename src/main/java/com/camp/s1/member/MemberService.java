package com.camp.s1.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.util.Pager;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	//IDCheck
	public boolean getMemberIdCheck(MemberDTO memberDTO)throws Exception{
		
		memberDTO = memberDAO.getMemberLogin(memberDTO);
		
		boolean check = true;
		
		if(memberDTO != null) {
			check = false;
		}
		return check;
	}
	
	//EmailCheck
	public boolean getMemberEmailCheck(MemberDTO memberDTO)throws Exception {
		memberDTO = memberDAO.getMemberEmailCheck(memberDTO);
		
		boolean check = true;
		
		if(memberDTO != null) {
			check = false;
		}
		return check;
	}
	
	//Join
	public int setMemberJoin(MemberDTO memberDTO)throws Exception{
		
		int result = memberDAO.setMemberJoin(memberDTO);
		
		for(AddressDTO addressDTO:memberDTO.getAddressDTOs()) {
			addressDTO.setId(memberDTO.getId());
			result = memberDAO.setAddressJoin(addressDTO);
		}
		
		return result;
	}
	
	//Login
	public MemberDTO getMemberLogin(MemberDTO memberDTO, HttpServletResponse response)throws Exception{

		MemberDTO result = memberDAO.getMemberLogin(memberDTO);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result != null && memberDTO.getPw().equals(result.getPw())) {
		
			memberDTO.setPw(null);
			memberDTO.setRoleName(result.getRoleName());
			memberDTO.setAddressDTOs(result.getAddressDTOs());
			return memberDTO;
			
		}else {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 확인하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}
		
	}
	
	//MemberPage
	public MemberDTO getMemberPage(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.getMemberLogin(memberDTO);
	}
	
	//Update
	public int setMemberUpdate(MemberDTO memberDTO, AddressDTO addressDTO)throws Exception {
		
		int result = memberDAO.setMemberUpdate(memberDTO);
		if(addressDTO.getAddress() != null) {
			if(addressDTO.getAddressNum()==null) {
				result=memberDAO.setAddressJoin(addressDTO);
			} else {
				result=memberDAO.setAddressUpdate(addressDTO);
			}
		}
		
		return result;
	}
	
	//roleName 변경
	public int setRoleNameUpdate(MemberDTO memberDTO)throws Exception {
		
		int result = memberDAO.setRoleNameUpdate(memberDTO);
		
		return result;
	}
	
	public int setEachAddressDelete(AddressDTO addressDTO)throws Exception{
		
		return memberDAO.setEachAddressDelete(addressDTO);
	}
	
	//Delete
	public int setMemberDelete(MemberDTO memberDTO)throws Exception{
		
		int result = memberDAO.setMemberDelete(memberDTO);
		
		for(AddressDTO addressDTO:memberDTO.getAddressDTOs()){
			addressDTO.setId(memberDTO.getId());
			result = memberDAO.setAddressDelete(addressDTO);
		}
		
		return result;
	}
	
	//ID찾기
		public MemberDTO findId(HttpServletResponse response, MemberDTO memberDTO)throws Exception{
			
			PrintWriter out = response.getWriter();
			
			MemberDTO id = memberDAO.findId(memberDTO);
			
			if(id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}else {
				return id;
			}
		}
		
				//Email 발송
				public void sendEmail(MemberDTO memberDTO, String div) throws Exception {
					
					final String user = "yd930219@gmail.com"; 
					final String password = "ygbyqagtaczpnpje";
					
				  // SMTP 서버 정보 설정
				  // TLSv1.2 추가하여 신뢰성 확보
				  Properties prop = new Properties();
				  prop.put("mail.smtp.host", "smtp.gmail.com"); 
				  prop.put("mail.smtp.port", 465);
				  prop.put("mail.smtp.auth", "true"); 
				  prop.put("mail.smtp.ssl.enable", "true"); 
				  prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
				  prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

				  Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				              protected PasswordAuthentication getPasswordAuthentication() {
				                    return new PasswordAuthentication(user, password);
				                      }
				                    });
				  try {
				      MimeMessage message = new MimeMessage(session);

				      // 발신자 정보
				      message.setFrom(new InternetAddress(user, "THECAMP"));

				      // 수신자 메일주소
				      message.addRecipient(Message.RecipientType.TO, new InternetAddress(memberDTO.getEmail())); 

				      // 메일 제목
				      message.setSubject(memberDTO.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요"); //메일 제목을 입력

				      // 메일 내용
				      message.setText(memberDTO.getId() + "님의 임시 비밀번호는" + memberDTO.getPw() +"입니다");

				      // 메일 전송
				      Transport.send(message);
				      System.out.println("메일 전송 완료");
				  } catch (Exception e) {
				      e.printStackTrace();
				      System.out.println("메일발송 실패 : " + e);				      
				  }
				}
		

		//pw 찾기
		public MemberDTO findPw(HttpServletResponse response, MemberDTO memberDTO)throws Exception{
			
			response.setContentType("text/html;charset=utf-8");
			MemberDTO check = memberDAO.getMemberLogin(memberDTO);
			PrintWriter out = response.getWriter();

			if(memberDAO.getMemberLogin(memberDTO) == null) {
				 out.println("아이디를 확인해주세요");
				 out.close();
			}else if(!memberDTO.getEmail().equals(check.getEmail())){
				 out.println("잘못된 이메일 입니다");
				 out.close();
			}else {
				//임시 비밀번호 생성
				String pw ="";
				for(int i=0; i<10; i++) {
					pw += (char) ((Math.random() * 26) + 97);		
				}
				memberDTO.setPw(pw);
				System.out.println(pw);
				// 비밀번호 변경
				memberDAO.setMemberPwChange(memberDTO);
				// 비밀번호 변경 메일 발송
				sendEmail(memberDTO, "findPw");
				 out.println("이메일로 임시 비밀번호를 발송하였습니다");
				 
				 out.close();
			}
			return memberDTO;
			
		}
		
			//비밀 번호 변경
		public int setMemberPwChange(MemberDTO memberDTO, String oldPw, HttpServletResponse response)throws Exception{
			PrintWriter out = response.getWriter();
			
			if(oldPw.equals(memberDTO.getPw())){
				
			return memberDAO.setMemberPwChange(memberDTO);
			
			}else {	
				out.println("<script>");
				out.println("alert('기존 비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return 0;
			}
		}
		
		// 카카오 로그인 토큰 발급
		public String getAccessToken (String authorize_code) {
	        String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";

	        try {
	            URL url = new URL(reqURL);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);
	            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=a68e05dc27f7fb4288530cb001c55c40");  //본인이 발급받은 key
	            sb.append("&redirect_uri=http://localhost:80/member/kakaoLogin"); // 본인이 설정해 놓은 경로
	            sb.append("&code=" + authorize_code);
	            bw.write(sb.toString());
	            bw.flush();

	            //    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);

	            br.close();
	            bw.close();
	        } catch (IOException e) {
	           
	            e.printStackTrace();
	        }

	        return access_Token;
	    }
		
		
		// 카카오 로그인 정보 저장
		public KakaoDTO getUserInfo (String access_Token) {

	        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	       
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            	//데이터 꺼내오기
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();

	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);

	        } catch (IOException e) {
	            e.printStackTrace();
	        } 
	        KakaoDTO result = memberDAO.findKakao(userInfo);
	        System.out.println("S :" + result);
	        
	        if(result==null) {
	        	
	        	memberDAO.kakaoLogin(userInfo);
	        	
	        	return memberDAO.findKakao(userInfo);
	        } else {
	        	return result;
	        }   
		}
		
		//회원 리스트
		public List<MemberDTO> getMemberList(Pager pager) throws Exception {
			
			pager.makeRow();
			
			pager.makeNum(memberDAO.getTotalCount(pager));
			List<MemberDTO> ar = memberDAO.getMemberList(pager);
			
			return ar;
		}
	
}