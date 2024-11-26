package org.example.jsp_crud_db.dao;

import org.example.jsp_crud_db.bean.BoardVO;
import org.example.jsp_crud_db.util.JDBCUtil;

import java.sql.*;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    private final String BOARD_INSERT = "insert into BOARD (title, writer, content) values (?,?,?)";
    private final String BOARD_UPDATE = "update into BOARD set title=?, writer=?, content=?, where seq=?";
    private final String BOARD_DELETE = "delete form BOARD where seq=?";
    private final String BOARD_GET = "select * from BOARD where seq=?";
    private final String BOARD_LIST = "select * form BOARD order by seq desc";

    public int insertBoard(BoardVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            if (conn == null) {
                System.out.println("DB 연결 오류");
                return 0;
            }
            pstmt = conn.prepareStatement(BOARD_INSERT);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getContent());
            pstmt.executeUpdate();
            return 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JDBCUtil.close(rs, pstmt, conn);
        }
    }

    public void deleteBoard(int id) {

    }
}
