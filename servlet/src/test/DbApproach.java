package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbApproach {
	
	int identifyUser(String id, int pw){
		int dbpw;
		int result=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 1.DB연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			System.out.println("연결성공");

			// 2.SQL전송
			String sql = "select id, password from member where id like ?";
			PreparedStatement pt = con.prepareStatement(sql);

			pt.setString(1, id);

			// 3.SQL결과 검색
			ResultSet rs = pt.executeQuery();
			if (rs.next()) {
				dbpw = rs.getInt("password");
				if(dbpw ==pw)
					result=1;
				else 
					result=2;
			} else 
				result=0;
			
			// 4.DB 연결해제
			con.close();
			System.out.println("연결해제 성공");
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
	} 

}
