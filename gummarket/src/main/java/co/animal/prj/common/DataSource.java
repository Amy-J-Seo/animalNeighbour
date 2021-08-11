package co.animal.prj.common;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class DataSource {
	private static SqlSessionFactory sqlSession;
	
	private DataSource() {}
	
	public static SqlSessionFactory getInstance() {
		try {
			String resource = "/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSession = new SqlSessionFactoryBuilder().build(inputStream);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sqlSession;
	}
}
