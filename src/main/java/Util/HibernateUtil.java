package Util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	public static SessionFactory getSessionFactory() {
		SessionFactory sessionFactory = null;
		Configuration configuration = new Configuration();
		sessionFactory = configuration.configure("hibernate.cfg.xml").buildSessionFactory();
		return sessionFactory;
	}
}
