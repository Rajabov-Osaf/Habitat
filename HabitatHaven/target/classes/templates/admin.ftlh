<!DOCTYPE html>
<html>
<head>
    <title>HabitatHaven Admin Panel</title>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f6d365, #fda085);
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .header {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1000;
            height: 60px;
        }

        .header h1 {
            margin: 0;
        }

        table {
            width: 90%;
            margin-top: 100px;
            background-color: #fff;
            border-collapse: collapse;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #ff944d;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        th:first-child, td:first-child {
            text-align: center;
        }

        form {
            display: inline-block;
        }

        form input[type="submit"] {
            background-color: #ff944d;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 12px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form input[type="submit"]:hover {
            background-color: #ff7f50;
        }

        a {
            text-decoration: none;
            color: #333;
        }

        h3 {
            text-align: center;
            margin-top: 20px;
        }

        /* Добавленные стили для предотвращения перекрытия других элементов */
        .header + * {
            margin-top: 80px; /* Добавляем отступ после фиксированного заголовка */
        }
    </style>
</head>
<body>
<header class="header">
    <h1>EShop - товары со всей Беларуси</h1>
    <div class="user-actions">
        <!-- Тут можно вставить логику для пользовательских действий -->
    </div>
</header>
<header class="header">
    <h4>Панель администратора</h4>
</header>
<table>
    <table>
        <tr>
            <th>Email</th>
            <th>Номер телефона</th>
            <th>Активность</th>
            <th>Роли</th>
            <th>Бан</th>
            <th>Редактирование</th>
            <th>Подробная информация</th>
        </tr>
        <#list users as user>
            <tr>
                <td>${user.email}</td>
                <td>${user.phoneNumber}</td>
                <td><#if user.isActive()>true<#else>false</#if></td>
                <td><#list user.roles as role>${role}</#list></td>
                <td>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Бан">
                    </form>
                </td>
                <td><a href="/admin/user/edit/${user.id}">Редактирование</a></td>
                <td><a href="/user/${user.id}">Подробная информация</a></td>
            </tr>
        <#else>
            <tr><td colspan="7"><h3>Пользователей нет</h3></td></tr>
        </#list>
    </table>
</table>
</body>
</html>
