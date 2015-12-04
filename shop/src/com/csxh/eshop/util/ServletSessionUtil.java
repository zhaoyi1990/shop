package com.csxh.eshop.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ServletSessionUtil {

	// 该名称将出现在EL表达中
	public static final String CTX = "ctx";
	public static final String CART = "cart";
	public static final String USER = "user";

	private ServletSessionUtil() {
		// TODO Auto-generated constructor stub
	}

	private HttpSession session;

	// 该方法在session被创建时被调用
	public static void create(HttpSession session) {

		ServletSessionUtil context = new ServletSessionUtil();
		context.session = session;
		// 将传入的session实例与一个上下文实例context通过名称ctx相关联
		context.session.setAttribute(ServletSessionUtil.CTX, context);

		Log4jUtil.info("session 与ctx建立关联");
	}

	// 该方法在session被销毁时被调用
	public static void destroy(HttpSession session) {
		// 将与session相关联的上下文对象删除
		session.removeAttribute(ServletSessionUtil.CTX);
		Log4jUtil.info("session 与ctx取消关联");
	}

	//以下工具方法将用于控制与服务层代码中
	public static boolean isLoggined(HttpServletRequest request) {
		Object o = request.getSession().getAttribute(ServletSessionUtil.USER);
		return o != null;
	}

	@SuppressWarnings("unchecked")
	public static <T> T getCart(HttpServletRequest request, Class<T> clazz) {
		Object o = null;
		// 判断用户是否登录
		boolean b = ServletSessionUtil.isLoggined(request);
		if (b) {
			o = request.getSession().getAttribute(ServletSessionUtil.CART);
			//判断有没有购物车
			if (o != null) {
				return (T) o;
			} else {
				T cart = null;
				try {
					// 还没有购物车，则创建新的
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
		//根据主机名获得购物车
		o = request.getSession().getAttribute(request.getRemoteHost());
		if (o != null) {			
			// 已经购物，则使用原来的
			return (T)o;
		} else {
			
			T cart = null;
			try {
				// 还没有购物车，则创建新的
				cart = (T) clazz.newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//将购物车以主机名存入
			request.getSession().setAttribute(request.getRemoteHost(), cart);
			return cart;
		}
	}

	public static <T> boolean loginSuccess(HttpServletRequest request, T user) {
		return loginSuccess(request, user, null);
	}

	public static <T, S> boolean loginSuccess(HttpServletRequest request, T user, Class<S> clazz) {

		// 如果通过了，则判断是否存在购物车对象
		HttpSession session = request.getSession();
		Object o = session.getAttribute(request.getRemoteHost());
		if (o != null) {

			// 此时已经购物了，将购物车对象转存到以user的名下
			session.setAttribute(ServletSessionUtil.USER, user);
			session.setAttribute(ServletSessionUtil.CART, o);
			// 删除以前保存在ip名下的购物车
			session.removeAttribute(request.getRemoteHost());
			return true;

		} else {
			// 登录成功，但还没有购物
			// 此时已经购物了，将购物车对象转存到以user的名下
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
	
	// 以下是对象方法，用于在JSP页获取对象的get属性
	
	@SuppressWarnings("unchecked")
	public <T> T getCart(){
		return (T)this.session.getAttribute(ServletSessionUtil.CART);
	}
	
	@SuppressWarnings("unchecked")
	public <T> T getUser(){
		return (T)this.session.getAttribute(ServletSessionUtil.USER);
	}
}
