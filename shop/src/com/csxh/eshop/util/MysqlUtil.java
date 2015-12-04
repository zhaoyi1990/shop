package com.csxh.eshop.util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class MysqlUtil {

	static String driver = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/eshop?characterEncoding=gbk";
	static String user = "root";
	static String password = "";

	// ʹ�þ�̬���ʼ����̬����
	static {

		try {
			// �����������ļ��ж�ȡ����
			Properties p = new Properties();
			// �����·����classpath����ȡ�ļ���������ͨ�������������ȡ
			InputStream is = MysqlUtil.class.getClassLoader().getResourceAsStream("mysql.properties");
			p.load(is);
			MysqlUtil.driver = p.getProperty("driver");
			MysqlUtil.url = p.getProperty("url");
			MysqlUtil.user = p.getProperty("user");
			MysqlUtil.password = p.getProperty("password");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// �����ݿ�����
	public static Connection openConnection() throws SQLException, ClassNotFoundException {

		Connection cnn = null;

		// ͨ������������ݿ�������Ķ���
		Class.forName(MysqlUtil.driver);
		// �Ϳ��Ի�ȡ���Ӷ���
		cnn = DriverManager.getConnection(MysqlUtil.url, MysqlUtil.user, MysqlUtil.password);

		return cnn;

	}

	public static int queryTotalRows(String tableName, String pramaryKey) {
		int totalRows = 0;
		String sql = "select count(" + pramaryKey + ") from " + tableName;
		ResultSet rs = null;
		Statement stmt = null;
		Connection cnn = null;
		try {
			cnn = openConnection();
			stmt = cnn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				totalRows = rs.getInt(1);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (cnn != null) {
				cnn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalRows;
	}

	public static int queryTotalRows(String tableName, String pramaryKey, String where) {
		int totalRows = 0;
		where = where.replace("where", "");
		String sql = "select count(" + pramaryKey + ") from " + tableName + " where " + where;
		ResultSet rs = null;
		Statement stmt = null;
		Connection cnn = null;
		try {
			cnn = openConnection();
			stmt = cnn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				totalRows = rs.getInt(1);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// �ÿ��ܹ��ڷ���ʱ��ǰִ�У������Ƿ����쳣������ִ�иÿ��еĴ���
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (cnn != null) {
					cnn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return totalRows;
	}

	// ��ѯ���ݿ��б�ļ�¼
	public static List<Object[]> queryForObjectList(String sql) {

		List<Object[]> objectList = new ArrayList<Object[]>();
		// ִ��SQL����ȡ���
		ResultSet rs = null;
		Connection cnn = null;
		Statement stmt = null;
		try {
			// �����Ӷ���
			cnn = MysqlUtil.openConnection();
			// ����SQL������
			stmt = cnn.createStatement();
			// ִ��SQL���
			rs = stmt.executeQuery(sql);

			// ��rs�ر�֮ǰ�������е����ݷ��뵽objectList��
			// �����ж�һ���м�������
			ResultSetMetaData rsmd = rs.getMetaData();

			int columnCount = rsmd.getColumnCount();

			while (rs.next()) {// ÿһ�е����ݣ�һ���о����е�����

				Object[] objects = new Object[columnCount];
				// ÿһ���Ӧ�����е�����
				for (int column = 0; column < columnCount; column++) {
					objects[column] = rs.getObject(column + 1);// ����column+1�е����ݷ��뵽���ݵĵ�column��
				}

				objectList.add(objects);

			}

			// �ر����ݿ���Դ:rs,stmt,cnn
			// Ϊ��ȷ��������Դ���رգ����뽫�ر���Դ�Ĵ������finally��ִ��
			// rs.close();
			// stmt.close();
			// cnn.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {// �ÿ��ܹ��ڷ���ʱ��ǰִ�У������Ƿ����쳣������ִ�иÿ��еĴ���
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (cnn != null) {
					cnn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// ���ؽ����
		return objectList;

	}

	// ��ѯ���ݿ��б�ļ�¼
	public static Object[] queryForObject(String sql) {
		List<Object[]> objectList = MysqlUtil.queryForObjectList(sql);
		if (objectList.size() > 0) {
			return objectList.get(0);
		} else {
			return null;
		}
	}

	// �����ݿ���в����¼����������SQL��Ҫʹ��ռλ��������format��ռλ������ռλ��ͳһ��'?'��ʾ
	public static boolean insertObject(String sql, Object... values) {// insert
																		// into
																		// �û�
																		// values(?,?,?,?);

		boolean fOk = false;

		Connection cnn = null;
		// ʹ�ô��������������
		PreparedStatement pstmt = null;

		try {
			// �����Ӷ���
			cnn = MysqlUtil.openConnection();
			// ׼������������
			pstmt = cnn.prepareStatement(sql);
			// ����ռλ����Ӧ��ֵ��Ҫ����ֵ�����ͣ�
			for (int i = 0; i < values.length; i++) {
				// Map<Object,Object> map=values[i];
				// //ȡ��i��ռλ��������
				// Object type=map.keySet().iterator().next();//ֻȡ��һ����Ŀ��key
				// //ȡ��i��ռλ�������Ͷ�ֵ��ֵ
				// Object value=map.get(type);

				// �������������ö�Ӧ�ķ���
				if (values[i] instanceof Integer) {
					pstmt.setInt(i + 1, (Integer) values[i]);// �Ѿ�֪����Integer����
				} else if (values[i] instanceof String) {
					pstmt.setString(i + 1, (String) values[i]);
				} else if (values[i].getClass().getName().equals("java.lang.Boolean")) {
					pstmt.setBoolean(i + 1, (Boolean) values[i]);
				} else {
					// throw new Exception("���Ͳ���ʶ");
				}

			}

			// ���úø�ռλ����ֵ�󣬾�ִ��SQL���
			int rs = pstmt.executeUpdate();

			fOk = rs > 0;// ����ɹ�����������Ӱ�������Ҫ����0

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {

				if (pstmt != null) {
					pstmt.close();
				}

				if (cnn != null) {
					cnn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return fOk;

	}

	// �����ݿ������¼--->JavaBean��������JavaBean������Object����
	// ǰ��������1��JavaBean���������ƣ�getXxxx��--->����е�����Ҫһ��,2��JavaBean�������---->�������
	// User username---->��username��
	public static boolean insertObject(Object javaBean, String... excludeFields) {// User---user

		boolean fOk = false;

		// Ҫ��̬����sql���
		StringBuilder sb = new StringBuilder();
		sb.append("insert into ");
		// ͨ������ķ���������ȡ������ƣ�������ƣ������������ƣ�
		String simpleName = javaBean.getClass().getSimpleName();
		char firstChar = simpleName.charAt(0);
		firstChar = java.lang.Character.toLowerCase(firstChar);
		// �����������
		sb.append('`').append(firstChar).append(simpleName.substring(1)).append("`");

		// �������������
		sb.append(" ( ");

		// �������е�getXxxx����������ȡֵ
		List<Method> getMethodList = new ArrayList<Method>();
		// ͨ������ķ�������ȡÿһ�����Ե�����
		Method[] methods = javaBean.getClass().getMethods();
		for (int i = 0; i < methods.length; i++) {
			String mn = methods[i].getName();// ��ȡ��i������������
			// �ж��Ƿ���get����
			if (mn.startsWith("get")) {
				// ����4���ַ����Сд
				firstChar = mn.charAt(3);
				firstChar = java.lang.Character.toLowerCase(firstChar);

				String field = mn.substring(4);
				for (String exclude : excludeFields) {
					if ((firstChar + field).equals(exclude)) {
						field = null;// ������ֶ��Ǳ��ų�����Ϊnull
						break;
					}
				}

				if (field != null) {// �����Ϊnull������Ҫ���������

					// �жϸ÷����Ƿ���ֵ
					Object value = null;
					try {
						value = methods[i].invoke(javaBean);
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if (null != value) {
						// ˵����ֵ�������ֵ��Ҫ����

						// ƴ�ӳɣ�����=��,����ʽ
						sb.append(firstChar);// ƴ�ӳ��������Ƶ�һ���ַ�
						sb.append(field);// ƴ�ӳ��������ƺ�����ַ�
						sb.append(",");

						// �������get�����ķ������
						getMethodList.add(methods[i]);
					}

				}

			} // end if(mn.startsWith("get"))

		} // end for

		// ����where���

		// �����һ������ɾ��
		sb.deleteCharAt(sb.length() - 1);

		sb.append(" )  ");

		// ��󹹽�ֵ���б�
		sb.append("values (");

		// ʹ��ռλ���������Ӧ��ֵ
		for (int i = 0; i < getMethodList.size(); i++) {
			sb.append("?,");
		}

		sb.deleteCharAt(sb.length() - 1);

		sb.append(")");
		Log4jUtil.info("sql="+sb.toString());

		// ʹ�����Ӷ��󴴽�������������������
		Connection cnn = null;
		PreparedStatement ps = null;

		String sql = sb.toString();
		try {

			cnn = MysqlUtil.openConnection();

			ps = cnn.prepareStatement(sql);

			// Ϊÿһ��ռλ�����ö�Ӧ��ֵ��Ҫ����ֵ�����ͣ�
			for (int i = 0; i < getMethodList.size(); i++) {
				Method m = getMethodList.get(i);// ��ȡռλ����Ӧget����
				// ͨ�����䷽��������get������ȡ��Ӧ��ֵ
				Object value = m.invoke(javaBean);
				// if(value instanceof String){
				// ps.setString(i+1, (String)value);
				// }else if (value instanceof Integer){
				// ps.setInt(i+1, (Integer)value);
				// }
				ps.setObject(i + 1, value);// ����ռλ����ֵ
			}
			// fOk=ps.execute();
			int rc = ps.executeUpdate();

			fOk = rc > 0;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {

				if (ps != null) {
					ps.close();
				}
				if (cnn != null) {
					cnn.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return fOk;

	}

	// �����ݿ���и��¼�¼
	// ���JavaBean�����get�������ص�ֵ��Ϊ�գ�������Զ�Ӧ������Ҫ����
	public static boolean updateObject(Object javaBean, String id) {

		boolean fOk = false;

		// ��̬����update���
		StringBuilder sb = new StringBuilder();
		sb.append("update  ");
		// ͨ������ķ���������ȡ������ƣ�������ƣ������������ƣ�
		String simpleName = javaBean.getClass().getSimpleName();
		char firstChar = simpleName.charAt(0);
		firstChar = java.lang.Character.toLowerCase(firstChar);
		// �����������
		sb.append('`').append(firstChar).append(simpleName.substring(1)).append("`");
		// ����set���
		sb.append("  set ");

		// ����������get����
		Map<String, Object> whereField2ValueMap = new HashMap<String, Object>();

		// �������е���������ֵӳ���б�
		List<Map<String, Object>> updateField2ValueMapList = new ArrayList<Map<String, Object>>();
		// ͨ������ķ�������ȡÿһ�����Ե�����
		Method[] methods = javaBean.getClass().getMethods();
		for (int i = 0; i < methods.length; i++) {
			String mn = methods[i].getName();// ��ȡ��i������������
			// �ж��Ƿ���get����
			if (mn.startsWith("get")) {
				// ����4���ַ����Сд
				firstChar = mn.charAt(3);
				firstChar = java.lang.Character.toLowerCase(firstChar);

				// ��ȡ����
				String field = firstChar + mn.substring(4);
				if (field.equals("class")) {
					continue;// ����������һ��ѭ��������ִ�к�������
				}
				// ��ȡ��ֵ
				Object value = null;
				try {
					value = methods[i].invoke(javaBean);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				if (value != null) {// �����Ϊnull������Ҫ���������

					// �жϸ��б��Ƿ�Ϊ��������
					if (field.equals(id)) {// ˵����һ��������-ֵ��
						whereField2ValueMap.put(field, value);// ����������Ϊ����where�����׼��
					} else {
						// ˵����Ҫ���µ���-ֵ����
						sb.append(field);// ��������
						sb.append("=?,");

						// ��������-��ֵӳ�����
						Map<String, Object> field2ValueMap = new HashMap<>();
						field2ValueMap.put(field, value);
						// ������-��ֵӳ���������б���
						updateField2ValueMapList.add(field2ValueMap);
					}

				}

			} // end if(mn.startsWith("get"))

		} // end for

		// ɾ�����Ķ���
		sb.deleteCharAt(sb.length() - 1);

		// ����where���
		sb.append(" where ").append(whereField2ValueMap.keySet().iterator().next());
		sb.append("=?");
		Log4jUtil.info("sql="+sb.toString());

		// ʹ��������������
		Connection cnn = null;
		PreparedStatement ps = null;

		try {
			cnn = MysqlUtil.openConnection();
			ps = cnn.prepareStatement(sb.toString());

			// ����ռλ����ֵ
			int index = 1;
			for (int i = index - 1; i < updateField2ValueMapList.size(); i++, index++) {
				Map<String, Object> field2ValueMap = updateField2ValueMapList.get(i);
				ps.setObject(index, field2ValueMap.values().iterator().next());
			}

			ps.setObject(index, whereField2ValueMap.values().iterator().next());

			int rc = ps.executeUpdate();
			fOk = rc > 0;
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {

				if (ps != null) {
					ps.close();
				}

				if (cnn != null) {
					cnn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return fOk;

	}

	// �����ݿ����ɾ����¼
	public static boolean deleteObject(Object javaBean, String key) {// key=id
																		// --getId,key=uid--getUid
		boolean fOk = false;

		StringBuilder sb = new StringBuilder();
		sb.append("delete from ");
		String simpleName = javaBean.getClass().getSimpleName();
		char firstChar = simpleName.charAt(0);
		firstChar = java.lang.Character.toLowerCase(firstChar);
		sb.append("[");
		sb.append(firstChar).append(simpleName.substring(1));
		sb.append("]");

		// Ѱ��key��Ӧget����,����ȡ��ֵ
		Object value = null;
		Method[] methods = javaBean.getClass().getDeclaredMethods();
		for (Method method : methods) {
			String getMethod = "get" + java.lang.Character.toUpperCase(key.charAt(0)) + key.substring(1);
			if (getMethod.equals(method.getName())) {
				try {
					value = method.invoke(javaBean);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
		}

		if (value != null) {

			// ��ʹ��ռλ��
			if (value instanceof String) {
				sb.append(" where ").append(key).append("='" + value.toString() + "' ");// ��Ϊ�����ֵ���ַ�������Ҫ����һ�Ե�����
			} else {
				sb.append(" where ").append(key).append("=" + value.toString() + " ");// ��Ϊ�������ֵ���ַ�������Ҫ����һ�Ե�����
			}

		}

		Log4jUtil.info("sql="+sb.toString());

		Connection cnn = null;
		Statement stmt = null;

		try {
			cnn = MysqlUtil.openConnection();
			stmt = cnn.createStatement();
			int n = stmt.executeUpdate(sb.toString());
			fOk = n > 0;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				if (stmt != null) {
					stmt.close();
				}
				if (cnn != null) {
					cnn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return fOk;
	}

	// �����ݿ���в�ѯ��¼
	@SuppressWarnings("unused")
	public static <T> List<T> queryForObjectList(Class<T> javaBeanClass, String... wheres) {

		List<T> objectList = new ArrayList<T>();

		// ��̬����SQL���
		StringBuilder sb = new StringBuilder();
		sb.append("select * from ");
		String simpleName = javaBeanClass.getSimpleName();
		char firstChar = simpleName.charAt(0);
		firstChar = java.lang.Character.toLowerCase(firstChar);
		sb.append("`");
		sb.append(firstChar).append(simpleName.substring(1));
		sb.append("`");

		// �ж��Ƿ����������
		if (wheres.length > 0) {

			sb.append(" where  ");
			for (String where : wheres) {
				sb.append(where).append(" and ");
			}

			sb.delete(sb.length() - 5, sb.length());

		}
		Log4jUtil.info("sql="+sb.toString());
		// ���в�ѯ����
		Connection cnn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			cnn = MysqlUtil.openConnection();
			stmt = cnn.createStatement();
			rs = stmt.executeQuery(sb.toString());
			// ͨ������������ȡ���ڲ�ѯ��Ԫ���ݶ���
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount();

			while (rs.next()) {

				// �������������ַ�����1��new 2��class.forName 3��class.newInstance
				T object = null;
				try {
					object = javaBeanClass.newInstance();
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// ÿһ����¼---->һ��javabean����
				// �е�����=javabean.����(setXxxx);
				for (int i = 0; i < columnCount; i++) {
					// ��ȡ�е�����
					String columnName = rsmd.getColumnName(i + 1);
					// ��ȡ�е�ֵ
					Object value = rs.getObject(i + 1);
					// ��ȡ�е�ֵ�����͵�����
					String columnValueClass = rsmd.getColumnClassName(i + 1);

					// �����е�����������JavaBean�����setXxxx����
					String setXxxx = "set" + java.lang.Character.toUpperCase(columnName.charAt(0))
							+ columnName.substring(1);

					Method[] methods = javaBeanClass.getMethods();
					// Ѱ��setXxxx��������������
					for (Method method : methods) {
						if (method.getName().equals(setXxxx)) {
							try {
								method.invoke(object, value);// ʵ�����ǵ���JavaBean�����setXxxx����
							} catch (IllegalAccessException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IllegalArgumentException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

							break;
						}
					} // end for method

				} // end for column

				// ��JavaBean������뷵���б���
				objectList.add(object);

			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (cnn != null) {
					cnn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return objectList;
	}

	// �����ݿ���в�ѯ��¼
	public static <T> T queryForObject(Class<T> javaBeanClass, String... wheres) {
		List<T> list = (List<T>) MysqlUtil.queryForObjectList(javaBeanClass, wheres);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	// ������javabean�����Ʋ�һ�£����Խ�������֮�������ӳ�����
	/*
	 * Customer---->��Ա id------->��ԱID
	 */
	public static boolean insertObject(Object javaBean, Map<String, String> javaBean2TableNameMap,
			String... excludeFileds) {

		boolean fOk = false;

		// Ҫ��̬����sql���
		StringBuilder sb = new StringBuilder();
		sb.append("insert into ");
		// ͨ������ķ���������ȡ������ƣ�������ƣ������������ƣ�
		String simpleName = javaBean.getClass().getSimpleName();
		char firstChar = simpleName.charAt(0);
		firstChar = java.lang.Character.toLowerCase(firstChar);
		String javaBeanName = firstChar + simpleName.substring(1);
		// �����������
		// ���Ȳ�ѯӳ������
		String tableName = javaBean2TableNameMap.get(javaBeanName);
		if (tableName == null) {
			// ˵�����������JavaBean������һ��
			tableName = javaBeanName;
		}
		sb.append('[').append(tableName).append("]");

		// �������������
		sb.append(" ( ");

		// �������е�getXxxx����������ȡֵ
		List<Method> getMethodList = new ArrayList<Method>();
		// ͨ������ķ�������ȡÿһ�����Ե�����
		Method[] methods = javaBean.getClass().getMethods();
		for (int i = 0; i < methods.length; i++) {
			String mn = methods[i].getName();// ��ȡ��i������������
			// �ж��Ƿ���get����
			if (mn.startsWith("get")) {
				// ����4���ַ����Сд
				firstChar = mn.charAt(3);
				firstChar = java.lang.Character.toLowerCase(firstChar);

				String field = mn.substring(4);
				for (String exclude : excludeFileds) {
					if ((firstChar + field).equals(exclude)) {
						field = null;// ������ֶ��Ǳ��ų�����Ϊnull
						break;
					}
				}

				if (field != null) {// �����Ϊnull������Ҫ���������

					// �жϸ÷����Ƿ���ֵ
					Object value = null;
					try {
						value = methods[i].invoke(javaBean);
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if (null != value) {
						// ˵����ֵ�������ֵ��Ҫ����

						// ƴ�ӳɣ�����=��,����ʽ
						String javaBeanFieldName = firstChar + field;// ƴ�ӳ���������
						String tableFieldName = javaBean2TableNameMap.get(javaBeanFieldName);
						if (tableFieldName == null) {
							// ˵��һ��
							tableFieldName = javaBeanFieldName;
						}

						sb.append(tableFieldName);//
						sb.append(",");

						// �������get�����ķ������
						getMethodList.add(methods[i]);
					}

				}

			} // end if(mn.startsWith("get"))

		} // end for

		// ����where���

		// �����һ������ɾ��
		sb.deleteCharAt(sb.length() - 1);

		sb.append(" )  ");

		// ��󹹽�ֵ���б�
		sb.append("values (");

		// ʹ��ռλ���������Ӧ��ֵ
		for (int i = 0; i < getMethodList.size(); i++) {
			sb.append("?,");
		}

		sb.deleteCharAt(sb.length() - 1);

		sb.append(")");
		Log4jUtil.info("sql="+sb.toString());

		// ʹ�����Ӷ��󴴽�������������������
		Connection cnn = null;
		PreparedStatement ps = null;

		String sql = sb.toString();
		try {

			cnn = MysqlUtil.openConnection();

			ps = cnn.prepareStatement(sql);

			// Ϊÿһ��ռλ�����ö�Ӧ��ֵ��Ҫ����ֵ�����ͣ�
			for (int i = 0; i < getMethodList.size(); i++) {
				Method m = getMethodList.get(i);// ��ȡռλ����Ӧget����
				// ͨ�����䷽��������get������ȡ��Ӧ��ֵ
				Object value = m.invoke(javaBean);
				ps.setObject(i + 1, value);// ����ռλ����ֵ
			}
			// fOk=ps.execute();
			int rc = ps.executeUpdate();

			fOk = rc > 0;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {

				if (ps != null) {
					ps.close();
				}
				if (cnn != null) {
					cnn.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return fOk;

	}

	public static void updateSql(String sql) {
		Connection cnn = null;
		Statement stmt = null;

		try {
			cnn = MysqlUtil.openConnection();
			stmt = cnn.createStatement();
			stmt.executeUpdate(sql);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (cnn != null) {
					cnn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
