package com.csxh.eshop.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ServletSessionUtil {

	// �����ƽ�������EL�����
	public static final String CTX = "ctx";
	public static final String CART = "cart";
	public static final String USER = "user";

	private ServletSessionUtil() {
		// TODO Auto-generated constructor stub
	}

	private HttpSession session;

	// �÷�����session������ʱ������
	public static void create(HttpSession session) {

		ServletSessionUtil context = new ServletSessionUtil();
		context.session = session;
		// �������sessionʵ����һ��������ʵ��contextͨ������ctx�����
		context.session.setAttribute(ServletSessionUtil.CTX, context);

		Log4jUtil.info("session ��ctx��������");
	}

	// �÷�����session������ʱ������
	public static void destroy(HttpSession session) {
		// ����session������������Ķ���ɾ��
		session.removeAttribute(ServletSessionUtil.CTX);
		Log4jUtil.info("session ��ctxȡ������");
	}

	//���¹��߷��������ڿ��������������
	public static boolean isLoggined(HttpServletRequest request) {
		Object o = request.getSession().getAttribute(ServletSessionUtil.USER);
		return o != null;
	}

	@SuppressWarnings("unchecked")
	public static <T> T getCart(HttpServletRequest request, Class<T> clazz) {
		Object o = null;
		// �ж��û��Ƿ��¼
		boolean b = ServletSessionUtil.isLoggined(request);
		if (b) {
			o = request.getSession().getAttribute(ServletSessionUtil.CART);
			//�ж���û�й��ﳵ
			if (o != null) {
				return (T) o;
			} else {
				T cart = null;
				try {
					// ��û�й��ﳵ���򴴽��µ�
					cart = (T) clazz.newInstance();
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getSession().setAttribute(ServletSessionUtil.CART, cart);
				return cart;
			}
		}
		//������������ù��ﳵ
		o = request.getSession().getAttribute(request.getRemoteHost());
		if (o != null) {			
			// �Ѿ������ʹ��ԭ����
			return (T)o;
		} else {
			
			T cart = null;
			try {
				// ��û�й��ﳵ���򴴽��µ�
				cart = (T) clazz.newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//�����ﳵ������������
			request.getSession().setAttribute(request.getRemoteHost(), cart);
			return cart;
		}
	}

	public static <T> boolean loginSuccess(HttpServletRequest request, T user) {
		return loginSuccess(request, user, null);
	}

	public static <T, S> boolean loginSuccess(HttpServletRequest request, T user, Class<S> clazz) {

		// ���ͨ���ˣ����ж��Ƿ���ڹ��ﳵ����
		HttpSession session = request.getSession();
		Object o = session.getAttribute(request.getRemoteHost());
		if (o != null) {

			// ��ʱ�Ѿ������ˣ������ﳵ����ת�浽��user������
			session.setAttribute(ServletSessionUtil.USER, user);
			session.setAttribute(ServletSessionUtil.CART, o);
			// ɾ����ǰ������ip���µĹ��ﳵ
			session.removeAttribute(request.getRemoteHost());
			return true;

		} else {
			// ��¼�ɹ�������û�й���
			// ��ʱ�Ѿ������ˣ������ﳵ����ת�浽��user������
			session.setAttribute(ServletSessionUtil.USER, user);

			try {
				session.setAttribute(ServletSessionUtil.CART, clazz == null ? null : (S) clazz.newInstance());
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return false;
		}

	}

	@SuppressWarnings("unchecked")
	public static <T> T getUser(HttpServletRequest request) {
		return (T) request.getSession().getAttribute(ServletSessionUtil.USER);
	}

	@SuppressWarnings("unchecked")
	public static <T> T get(HttpSession session,String key, Class<T> valueClazz ){
		Object o=session.getAttribute(key);
		if(o!=null){
			return (T)o;
		}else{
			T t=null;
			try {
				t=(T)valueClazz.newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return t;
		}
	}

	@SuppressWarnings("unchecked")
	public static <T> T get(HttpSession session,String key){
		Object o=session.getAttribute(key);
		if(o!=null){
			return (T)o;
		}else{
			return null;
		}
	}
	
	// �����Ƕ��󷽷���������JSPҳ��ȡ�����get����
	
	@SuppressWarnings("unchecked")
	public <T> T getCart(){
		return (T)this.session.getAttribute(ServletSessionUtil.CART);
	}
	
	@SuppressWarnings("unchecked")
	public <T> T getUser(){
		return (T)this.session.getAttribute(ServletSessionUtil.USER);
	}
}
