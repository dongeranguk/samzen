package logon.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class LogonDBBean {
	//SingleTon Pattern
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	private LogonDBBean() {
	}
	
	private Connection getConnection() throws Exception {
		return DriverManager.getConnection("jdbc:apache:commons:dbcp:/pool");
	}
	
	//inputPro.jsp에서 회원가입을 할때 사용
	public void insertMember(LogonDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("insert into MEMBERS values(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin1());
			pstmt.setString(5, member.getJumin2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getBlog());
			pstmt.setTimestamp(8, member.getReg_date());
			pstmt.setString(9, member.getZipcode());
			pstmt.setString(10, member.getAddress());
			
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if(conn != null) try { conn.close(); } catch(SQLException ex) {}
		}		
	}
	
	//loginPro.jsp에서 로그온을 시도할때 호출
	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select passwd from MEMBERS where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd))
						x = 1;
				  else 
						x = 0;
			    } else 
						x = -1;
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				if(rs != null) try { rs.close(); } catch(SQLException ex) {}
				if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if(conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
			return x;
				}
		//confirmId.jsp에서 ID를 체크할때 사용
			public int confirmId(String id) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String dbPasswd = "";
				int x = -1;
				
				try {
					conn = getConnection();
					
					pstmt = conn.prepareStatement("select id from MEMBERS where id = ?");
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					if(rs.next())
						x = 1;
					else
						x = -1;
				} catch(Exception ex) {
					ex.printStackTrace();
				} finally {
					if(rs != null) try { rs.close(); } catch(SQLException ex) {}
					if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					if(conn != null) try { conn.close(); } catch(SQLException ex) {}
				}
					return x;
					}
					
					//updateMember.jsp에서 수정폼에 가입된 회원의 정보를 보여줄때 사용
			public LogonDataBean getMember(String id) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				LogonDataBean member = null;
				try {
					conn = getConnection();
					
					pstmt = conn.prepareStatement("select * from MEMBERS where id = ?");
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						member = new LogonDataBean();
						member.setId(rs.getString("id"));
						member.setPasswd(rs.getString("passwd"));
						member.setName(rs.getString("name"));
						member.setJumin1(rs.getString("jumin1"));
						member.setJumin2(rs.getString("jumin2"));
						member.setEmail(rs.getString("email"));
						member.setBlog(rs.getString("blog"));
						member.setReg_date(rs.getTimestamp("reg_date"));
					}
				} catch(Exception ex) {
					ex.printStackTrace();
				} finally {
					if(rs != null) try {rs.close();} catch(SQLException ex) {}
					if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
					if(conn != null) try {conn.close();} catch(SQLException ex) {}
				}
				return member;
			}
			
			public void updateMember(LogonDataBean member) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					conn = getConnection();
					
					pstmt = conn.prepareStatement("update MEMBERS set passwd = ?, name = ?, email = ?, blog = ?, zipcode=?, address=? " + "where id = ?");
					pstmt.setString(1, member.getPasswd());
					pstmt.setString(2, member.getName());
					pstmt.setString(3, member.getEmail());
					pstmt.setString(4, member.getBlog());
					pstmt.setString(5, member.getZipcode());
					pstmt.setString(6, member.getAddress());
					pstmt.setString(7, member.getId());
					
					pstmt.executeUpdate();
				} catch(Exception ex) {
					ex.printStackTrace();
				} finally {
					if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
					if(conn != null) try {conn.close();} catch(SQLException ex) {}
				}
			}
			
			public int deleteMember(String id, String passwd) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String dbpasswd = "";
				int x = -1;
				
				try {
					conn = getConnection();
					
					pstmt = conn.prepareStatement("select passwd from MEMBERS where id =?");
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						dbpasswd = rs.getString("passwd");
						if(dbpasswd.equals(passwd)) {
							pstmt = conn.prepareStatement("delete from MEMBERS where id =?");
							
							pstmt.setString(1, id);
							pstmt.executeUpdate();
							x = 1;
							} else 
								x = 0; //비밀번호 틀림
					}
				} catch(Exception ex) {
					ex.printStackTrace();
				} finally {
					if(rs != null) try {rs.close();} catch(SQLException ex) {}
					if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
					if(conn != null) try {conn.close();} catch(SQLException ex) {}
				}
				return x;
			}
			
			public Vector zipcodeRead(String area3) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				Vector vecList = new Vector();
				
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement("select * from zipcode where area3 like '"+area3+"%'");
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						ZipcodeBean tempZipcode = new ZipcodeBean();
						tempZipcode.setZipcode(rs.getString("zipcode"));
						tempZipcode.setArea1(rs.getString("area1"));
						tempZipcode.setArea2(rs.getString("area2"));
						tempZipcode.setArea3(rs.getString("area3"));
						tempZipcode.setArea4(rs.getString("area4"));
						vecList.addElement(tempZipcode);
					}
					
				}catch(Exception ex) {
					System.out.println("Exception" + ex);
				} finally {
					if(rs != null) try {rs.close();} catch(SQLException e) {}
					if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
					if(conn != null) try {conn.close();} catch(SQLException e) {}
				}
				return vecList;
			}
			
			
			public int findId(String email) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String dbEmail = "";
				int x = -1;
				
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement("select id from MEMBERS where email = ?");
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						dbEmail = rs.getString("email");
						if(dbEmail.equals(email)) {
							pstmt = conn.prepareStatement("select id from MEMBERS where email = ?");
							pstmt.executeQuery();
							rs.getString("id");
							x = 1; //등록된 이메일주소에 맞는 아이디 출력
						} else { 
							x = 0; //등록된 이메일주소가 없을때
						}
					}
				}catch(Exception ex) {
						ex.printStackTrace();
				} finally {
						if(rs != null) try {rs.close();} catch(SQLException ex) {}
						if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
						if(conn != null) try {conn.close();} catch(SQLException ex) {}
				}
				return x;
			}
		}
		
