package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board_event;
import model.Medicine;

public class EventLikesDao {
	private static EventLikesDao instance = new EventLikesDao();

	private EventLikesDao() {
	}

	public static EventLikesDao getInstance() {
		return instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			// reader.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

		// 이 아이디가 이 게시물을 좋아요 했는지 확인
		public int select(String id, int boardno) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("boardno", boardno);
			return (int) session.selectOne("eventLikesns.select", hm);
		}
		
		// 회원이 게시글 좋아요 클릭
		public void insert(String id, int boardno) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("boardno", boardno);
			session.insert("eventLikesns.insert", hm);
		}
		
		// 회원이 게시글 좋아요 취소
		public void delete(String id, int boardno) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("boardno", boardno);
			session.delete("eventLikesns.delete", hm);	
		}
}