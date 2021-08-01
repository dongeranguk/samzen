package july28.board.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class IdGenerator {
		
	private static IdGenerator instance = new IdGenerator(); //13~19�� �̱��� ����
	
	public static IdGenerator getInstance() {
		return instance;
	}
	
	private IdGenerator() {}
	
	public int generateNextId(String sequenceName) //sequenceName�� �Ű������� �޾� int�� ������ �����Ѵ�.
			throws IdGenerationFailedException {
		Connection conn = null;
		PreparedStatement pstmtSelect = null;
		ResultSet rs = null;
		PreparedStatement pstmtUpdate = null;
		//select���� update�� 2���� sql���� ����ϹǷ� PreparedStatement 2��
		try {
			conn = ConnectionProvider.getConnection(); //DB�� �����ϱ� ���� ConnectionProvider.getConnection() �޼��� ȣ��
			conn.setAutoCommit(false); //setAutoCommit()�޼��忡 �Ű������� false�� �����ϸ� �ڵ����� commit ���� �ʴ´�.
			pstmtSelect = conn.prepareStatement(
					"select next_value from id_sequence " +
					"where sequence_name = ? for Update"); //������Ʈ�� ���� sequence_name�� ?�� id_sequence���̺��� next_value �÷��� �˻��Ѵ�.
			pstmtSelect.setString(1, sequenceName); //�Ű������� ���� sequenceName�� next_value�÷��� �˻��Ѵ�.
			rs = pstmtSelect.executeQuery(); //������ �������� ResultSetŸ���� rs��ü�� �����Ѵ�.
			rs.next(); // ������ �������� �ִٸ�
			int id = rs.getInt(1); // int���� id��ü�� �����Ѵ�.
			id++; // id���� 1�� ������Ų��.
			
			pstmtUpdate = conn.prepareStatement(
					"update id_sequence set next_value = ? " + 
					"where sequence_name = ?"); // id_sequence���̺��� sequence_name�� next_value �÷��� update�Ѵ�.
			pstmtUpdate.setInt(1, id); // next_value�� ���� 1�� ������Ų id���� �ִ´�.
			pstmtUpdate.setString(2, sequenceName); // �Ű������� ���� sequencename�� �ִ´�.
			pstmtUpdate.executeUpdate(); // ������ �����Ѵ�.
			
			conn.commit(); // ���� �������� commit�Ѵ�.
			
			return id; // id���� �����Ѵ�.
		} catch(SQLException ex) { //�� ���๮�� ����ó��
			JdbcUtil.close(conn);
			throw new IdGenerationFailedException(ex);
		} finally {
			if(conn != null) {
				try {
					conn.setAutoCommit(true);
				} catch(SQLException e) {
				}
				JdbcUtil.close(conn);
			}
		}
	}
}
