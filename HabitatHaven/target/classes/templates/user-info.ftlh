<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles.css">
    <title>HabitatHaven</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            text-align: center;
            color: #ff7f50;
            margin: 20px 0;
        }

        h3 {
            color: #ff944d;
            text-align: center;
            margin-bottom: 20px;
            margin-top: 30px;
        }

        .user-info {
            width: 60%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .user-info b {
            color: #ff7f50;
        }

        hr {
            width: 100%;
            border: none;
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }

        .flats {
            width: 80%;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .flat {
            flex: 0 0 calc(30% - 20px);
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            margin-bottom: 20px;
        }

        .flat:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .flat a {
            display: block;
            margin-top: 15px;
            color: #ff944d;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .flat a:hover {
            color: #ff7f50;
        }
    </style>
</head>
<body>
<h1>HabitatHaven</h1>
<div class="user-info">
    <h3>Подробная информация о пользователе</h3>
    <b>Номер телефона:</b> ${user.phoneNumber}<br>
    <b>Email:</b> ${user.email}<br>
    <b>Имя:</b> ${user.name}<br>
</div>
<hr>
<h3>Объявления пользователя ${user.name}</h3>
<div class="flats">
    <#list flats as flat>
        <div class="flat">
            <p>
                <b>${flat.title}</b><br>
                Цена: ${flat.price}<br>
                <a href="/flat/${flat.id?c}">Подробнее...</a>
            </p>
        </div>
    </#list>
</div>
</body>
</html>
