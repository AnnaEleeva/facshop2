# Быстрый и Умный Интернет-Магазин

Комплекс проектов "Быстрый и Умный Интернет-Магазин" (англ. Fast and Clever e-Shop, сокращ. facshop) является приложением для электронной коммерции, которое содержит в себе несколько веб-приложений и иллюстрирует использование различных Java EE 7 API:
* JavaServer Faces, включая Ajax;
* Контекст и Внедрение Зависимостей для Java EE (Contexts and Dependency Injection (CDI));
* Java API для вэб-служб RESTful (Java API for RESTful Web Services (JAX-RS));
* Java API для сохранности данных (Java Persistence API (JPA));
* Java API для валидации компонентов (Java API for JavaBeans Validation (Bean Validation));
* Корпоративные компоненты (Enterprise JavaBeans (EJB));
* Служба обмена сообщениями Java (Java Message Service (JMS)).

Основные проекты/веб-приложения:
* "Быстрый и Умный Интернет-Магазин" (facshop-store) - является главным веб-приложением, в котором реализован основной функционал комплекса. Имеет два графических интерфейса: основной (просмотр каталога товаров, регистрация нового клиента, добавление товаров в корзину заказов, подтверждение заказа, просмотр статуса заказа) и административный  (управление заказами, категориями, товарами, клиентами, администраторами);
* "Быстрый и Умный Интернет-Магазин" - Обработка и Доставка (facshop-shipment) - является веб-приложением, в котором реализован функционал обработки и доставки заказов после их оплаты. Оно доступно только администраторам;
* "Быстрый и Умный Интернет-Магазин" - Платёжная Служба (facshop-payment) – является веб-службой RESTful, в котором реализован функционал оплаты заказов. Так как это не коммерческий проект, оно не получает никакой реальной кредитной информации или же статус клиента для валидации оплаты. Единственное что делает данное веб-приложение – это проверка на максимальную сумму заказа, которая установлена в размере 30000 рублей.

Подпроекты/jar-файлы:
* События (facshop-events) - Содержит POJO класс, используемый для событий CDI;
* Сущности (facshop-entities) - Содержит в себе все сущности JPA;
* Ресурсы (facshop-resources) - Содержит в себе все ресурсы, используемые веб-приложениями. Включает в себя сообщения, файлы CSS, изображения, файлы JavaScript и составные компоненты JavaServer Faces.

Необходимый набор ПО:
* Java SE Development Kit 8 - http://www.oracle.com/technetwork/java/javase/downloads/index.html
* Сервер приложений GlassFish 4.1 - https://glassfish.java.net/download.html
* Сборщик проектов Maven 3.3.3 - https://maven.apache.org/download.cgi
* (Дополнительно) Интегрированная среда разработки NetBeans 8 - https://netbeans.org/downloads

Для компиляции и запуска вам потребуются:
* В зависимости от операционной системы, поместить каталог glassfish4 в следующую директорию: Windows ОС - C:\, Unix-подобные ОС - ~/
* Запустить сервер приложений GlassFish 4.1, выполнив команду "asadmin start-domain domain1" в директории glassfish4/bin - http://docs.oracle.com/javaee/7/tutorial/usingexamples002.htm
* Запустить сервер JavaDB, выполнив команду "asadmin start-database" в директории glassfish4/bin - http://docs.oracle.com/javaee/7/tutorial/usingexamples004.htm
* Скомпилировать и развернуть веб-приложения, выполнив команду "mvn install" в корневой директории комплекса - http://docs.oracle.com/javaee/7/tutorial/dukes-forest002.htm

Работу данного комплекса веб-приложений можно просмотреть перейдя по ссылке - http://localhost:8080/facshop-store  
* Обычный пользователь - user@example.com, пароль - 1234
* Администратор - admin@example.com, пароль - 1234

Данная работа основана на официальном обучающем примере от компании Oracle - http://docs.oracle.com/javaee/7/tutorial/dukes-forest.htm

За основу взят исходный код от версии Java EE Tutorial 7.0.5 - https://java.net/projects/javaeetutorial/sources/svn/show/branches/javaee-tutorial-7.0.5/examples/case-studies/dukes-forest

Внесён рад исправлений и улучшений, которые, в свою очередь, переданы сообществу проекта The Java EE Tutorial - https://java.net/projects/javaeetutorial/pages/JavaEETutorialHome. Также произведены специфичные изменения.
"# facshop" 
